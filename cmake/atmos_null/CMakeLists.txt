# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_library(atmos_null STATIC)

target_include_directories(atmos_null PRIVATE
  $<TARGET_FILE_DIR:fms_mom5>
  ${SRC_DIR}/shared/include/
  ${SRC_DIR}/atmos_param/cosp
)

target_link_libraries(atmos_null PRIVATE fms_mom5)

target_sources(atmos_null PRIVATE
  ${SRC_DIR}/atmos_null/atmos_model.F90
  ${SRC_DIR}/atmos_null/atmos_tracer_driver.F90
  ${SRC_DIR}/atmos_param/diag_integral/diag_integral.F90
  ${SRC_DIR}/atmos_param/monin_obukhov/monin_obukhov.F90
  ${SRC_DIR}/atmos_param/monin_obukhov/monin_obukhov_kernel.F90
)