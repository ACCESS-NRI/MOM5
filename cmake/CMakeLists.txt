# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

cmake_minimum_required(VERSION 3.18)

#[==============================================================================[
#                         Basic project definition                              #
#]==============================================================================]

project(MOM5
        DESCRIPTION "Modular Ocean Model 5"
        HOMEPAGE_URL https://github.com/ACCESS-NRI/MOM5
        LANGUAGES C Fortran)

#[==============================================================================[
#                                 Options                                       #
#]==============================================================================]

# CMake build type
if(NOT CMAKE_BUILD_TYPE MATCHES "^(Debug|Release|RelWithDebInfo)$")
  message(STATUS "Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE
      "RelWithDebInfo"
      CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo")
endif()

# MOM5 build types
set(MOM5_TYPE "MOM5_SOLO" CACHE STRING "Build type of the model")

set(ALLOWED_TYPES MOM5_SOLO MOM5_SIS MOM5_ACCESS_CM MOM5_ACCESS_OM MOM5_ACCESS_ESM MOM5_ACCESS_OM_BGC)
if(NOT MOM5_TYPE IN_LIST ALLOWED_TYPES)
  message(FATAL_ERROR "${MOM5_TYPE} is not a valid build type. Allowed types are: ${ALLOWED_TYPES}")
endif()
message(STATUS "Build type = ${MOM5_TYPE}")

# Build options
option(MOM5_USE_NETCDF3    "Use netCDF3 rather than netCDF4. Only relevant for MOM5_TYPEs that use internal FMS"  OFF)
option(MOM5_DETERMINISTIC  "Deterministic build"  OFF)

message(STATUS "Build options")
message(STATUS "  - MOM5_USE_NETCDF3    ${MOM5_USE_NETCDF3}")
message(STATUS "  - MOM5_DETERMINISTIC  ${MOM5_DETERMINISTIC}" )

#[==============================================================================[
#                           Project configuration                               #
#]==============================================================================]

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})
include(CheckFortranCompilerFlag)

# Fortran compiler flags
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
  set(CMAKE_Fortran_FLAGS                 "${CMAKE_Fortran_FLAGS} -fno-alias -safe-cray-ptr -fpe0 -ftz -assume byterecl -i4 -r8 -nowarn -check noarg_temp_created -assume nobuffered_io -convert big_endian -grecord-gcc-switches -fp-model precise -fp-model source -align all")
  if (MOM5_DETERMINISTIC)
    set(CMAKE_Fortran_FLAGS_RELEASE       "-g0 -O0 -mavx2 -debug none -check none")
  else()
    set(CMAKE_Fortran_FLAGS_RELEASE       "-g3 -O2 -mavx2 -debug all -check none -traceback")
  endif()
  set(CMAKE_Fortran_FLAGS_RELWITHDEBINFO  "${CMAKE_Fortran_FLAGS_RELEASE} -g")
  set(CMAKE_Fortran_FLAGS_DEBUG           "-g3 -O0 -debug all -check -check noarg_temp_created -check nopointer -warn -warn noerrors -ftrapuv -traceback")
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
  set(CMAKE_Fortran_FLAGS                 "${CMAKE_Fortran_FLAGS} -fcray-pointer -fdefault-real-8 -ffree-line-length-none -fno-range-check -Waliasing -Wampersand -Warray-bounds -Wcharacter-truncation -Wconversion -Wline-truncation -Wintrinsics-std -Wsurprising -Wno-tabs -Wunderflow -Wunused-parameter -Wintrinsic-shadow -Wno-align-commons")
  check_fortran_compiler_flag("-fallow-invalid-boz" _boz_flag)
  check_fortran_compiler_flag("-fallow-argument-mismatch" _argmis_flag)
  if(_boz_flag)
    set(CMAKE_Fortran_FLAGS               "${CMAKE_Fortran_FLAGS} -fallow-invalid-boz" )
  endif()
  if(_argmis_flag)
    set(CMAKE_Fortran_FLAGS               "${CMAKE_Fortran_FLAGS} -fallow-argument-mismatch" )
  endif()
  set(CMAKE_Fortran_FLAGS_RELEASE         "-O2")
  set(CMAKE_Fortran_FLAGS_RELWITHDEBINFO  "${CMAKE_Fortran_FLAGS_RELEASE} -g")
  set(CMAKE_Fortran_FLAGS_DEBUG           "-O0 -g -W -fbounds-check")
else ()
  message(WARNING "Fortran compiler with ID ${CMAKE_Fortran_COMPILER_ID} will be used with CMake default options")
endif()

# C compiler flags
if(CMAKE_C_COMPILER_ID STREQUAL "IntelLLVM")
  set(CMAKE_C_FLAGS                 "${CMAKE_C_FLAGS} -fp-model precise")
  if (MOM5_DETERMINISTIC)
    set(CMAKE_C_FLAGS_RELEASE       "-O0 -debug none -mavx2")
  else()
    set(CMAKE_C_FLAGS_RELEASE       "-O2 -debug minimal -mavx2")
  endif()
  set(CMAKE_C_FLAGS_RELWITHDEBINFO  "${CMAKE_C_FLAGS_RELEASE} -g")
  set(CMAKE_C_FLAGS_DEBUG           "-O0 -g -ftrapuv -traceback")
elseif(CMAKE_C_COMPILER_ID STREQUAL "Intel")
  set(CMAKE_C_FLAGS                 "${CMAKE_C_FLAGS} -fp-model precise -fp-model source")
  if (MOM5_DETERMINISTIC)
    set(CMAKE_C_FLAGS_RELEASE       "-O0 -debug none -mavx2")
  else()
    set(CMAKE_C_FLAGS_RELEASE       "-O2 -debug minimal -mavx2")
  endif()
  set(CMAKE_C_FLAGS_RELWITHDEBINFO  "${CMAKE_C_FLAGS_RELEASE} -g")
  set(CMAKE_C_FLAGS_DEBUG           "-O0 -g -ftrapuv -traceback")
elseif(CMAKE_C_COMPILER_ID STREQUAL "GNU")
  set(CMAKE_C_FLAGS_RELEASE         "-O2")
  set(CMAKE_C_FLAGS_RELWITHDEBINFO  "${CMAKE_C_FLAGS_RELEASE} -g")
  set(CMAKE_C_FLAGS_DEBUG           "-O0 -g")
else ()
  message(WARNING "C compiler with ID ${CMAKE_C_COMPILER_ID} will be used with CMake default options")
endif()

#[==============================================================================[
#                              External packages                                #
#]==============================================================================]

find_package(MPI REQUIRED COMPONENTS Fortran)

if (MOM5_TYPE MATCHES "MOM5_ACCESS")
  # External FMS, provides NetCDF interface
  find_package(fms COMPONENTS R8 REQUIRED)
  find_package(GFDLGTracers REQUIRED)
else()
  # Internal FMS, requires NetCDF
  find_package(NetCDF 4.7.3 REQUIRED Fortran)
endif()

if (MOM5_TYPE STREQUAL "MOM5_ACCESS_OM" OR
  MOM5_TYPE STREQUAL "MOM5_ACCESS_OM_BGC")
  find_package(libaccessom2 REQUIRED)
endif()

if (MOM5_TYPE STREQUAL "MOM5_ACCESS_ESM" OR
  MOM5_TYPE STREQUAL "MOM5_ACCESS_CM")
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(OASIS3MCT REQUIRED IMPORTED_TARGET "oasis3-mct")
  pkg_check_modules(OASIS3MPEU REQUIRED IMPORTED_TARGET "oasis3-mpeu")
  pkg_check_modules(OASIS3PSMILE REQUIRED IMPORTED_TARGET "oasis3-psmile.MPI1")
  pkg_check_modules(OASIS3SCRIP REQUIRED IMPORTED_TARGET "oasis3-scrip")
endif()

#[==============================================================================[
#                             Main definitions                                  #
#]==============================================================================]

set(SRC_DIR "${CMAKE_SOURCE_DIR}/../src")

add_compile_definitions(use_netCDF use_libMPI __IFC)

if (MOM5_USE_NETCDF3)
  add_compile_definitions(use_netCDF3)
else ()
  add_compile_definitions(use_netCDF4)
endif()

if (MOM5_TYPE STREQUAL "MOM5_ACCESS_OM")
  set(ACCESS_COMPILE_DEFS ACCESS_OM USE_OCEAN_BGC)
elseif (MOM5_TYPE STREQUAL "MOM5_ACCESS_OM_BGC")
  set(ACCESS_COMPILE_DEFS ACCESS_OM CSIRO_BGC)
elseif (MOM5_TYPE STREQUAL "MOM5_ACCESS_ESM")
  set(ACCESS_COMPILE_DEFS ACCESS_CM USE_OCEAN_BGC)
elseif (MOM5_TYPE STREQUAL "MOM5_ACCESS_CM")
  set(ACCESS_COMPILE_DEFS ACCESS_CM)
else()
  add_compile_definitions(USE_OCEAN_BGC ENABLE_ODA SPMD LAND_BND_TRACERS)
endif()

if (MOM5_TYPE STREQUAL "MOM5_SOLO")
  add_subdirectory(fms_mom5)
  add_subdirectory(ocean)
  add_subdirectory(mom5_solo)
elseif (MOM5_TYPE STREQUAL "MOM5_SIS")
  add_subdirectory(fms_mom5)
  add_subdirectory(ocean)
  add_subdirectory(ice_sis)
  add_subdirectory(atmos_null)
  add_subdirectory(land_null)
  add_subdirectory(mom5_sis)
elseif (MOM5_TYPE STREQUAL "MOM5_ACCESS_OM" OR
  MOM5_TYPE STREQUAL "MOM5_ACCESS_OM_BGC")
  add_subdirectory(ocean_access)
  add_subdirectory(mom5_access_om)
elseif (MOM5_TYPE STREQUAL "MOM5_ACCESS_ESM" OR
  MOM5_TYPE STREQUAL "MOM5_ACCESS_CM")
  add_subdirectory(ocean_access)
  add_subdirectory(mom5_access_cm)
endif()
