# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_executable(mom5_access_cm)

target_include_directories(mom5_access_cm PRIVATE
  $<TARGET_FILE_DIR:ocean_access>
  )

target_link_libraries(mom5_access_cm PRIVATE
  PkgConfig::OASIS3PSMILE
  PkgConfig::OASIS3MCT
  PkgConfig::OASIS3MPEU
  PkgConfig::OASIS3SCRIP
  ocean_access
)

target_sources(mom5_access_cm PRIVATE
  ${SRC_DIR}/access/accesscm_coupler/cpl_netcdf_setup.F90
  ${SRC_DIR}/access/accesscm_coupler/mom_oasis3_interface.F90
  ${SRC_DIR}/access/accesscm_coupler/ocean_solo.F90
)

install(TARGETS mom5_access_cm RUNTIME)