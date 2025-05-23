# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_executable(mom5_access_om)

target_include_directories(mom5_access_om PRIVATE
  $<TARGET_FILE_DIR:ocean_access>
)

target_link_libraries(mom5_access_om PRIVATE
  libaccessom2::accessom2
  ocean_access
)

target_compile_definitions(mom5_access_om PRIVATE ${ACCESS_COMPILE_DEFS})

target_sources(mom5_access_om PRIVATE
  ${SRC_DIR}/access/accessom_coupler/cpl_netcdf_setup.F90
  ${SRC_DIR}/access/accessom_coupler/mom_oasis3_interface.F90
  ${SRC_DIR}/access/accessom_coupler/ocean_solo.F90
)

install(TARGETS mom5_access_om RUNTIME)