# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_executable(mom5_sis)

target_include_directories(mom5_sis PRIVATE
  $<TARGET_FILE_DIR:fms_mom5>
  $<TARGET_FILE_DIR:ocean>
  $<TARGET_FILE_DIR:ice_sis>
  $<TARGET_FILE_DIR:atmos_null>
  $<TARGET_FILE_DIR:land_null>
)

target_link_libraries(mom5_sis PRIVATE
  ocean
  ice_sis
  atmos_null
  land_null
)

target_sources(mom5_sis PRIVATE
  ${SRC_DIR}/coupler/coupler_main.F90
  ${SRC_DIR}/coupler/flux_exchange.F90
  ${SRC_DIR}/coupler/surface_flux.F90
)

install(TARGETS mom5_sis RUNTIME)