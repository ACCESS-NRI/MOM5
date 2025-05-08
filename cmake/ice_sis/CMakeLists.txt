# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_library(ice_sis)

target_include_directories(ice_sis PRIVATE
  $<TARGET_FILE_DIR:fms_mom5>
  ${SRC_DIR}/shared/include/
)

target_link_libraries(ice_sis PRIVATE fms_mom5)

target_sources(ice_sis PRIVATE
  ${SRC_DIR}/ice_sis/ice_bergs.F90
  ${SRC_DIR}/ice_sis/ice_dyn.F90
  ${SRC_DIR}/ice_sis/ice_grid.F90
  ${SRC_DIR}/ice_sis/ice_model.F90
  ${SRC_DIR}/ice_sis/ice_spec.F90
  ${SRC_DIR}/ice_sis/ice_thm.F90
  ${SRC_DIR}/ice_sis/ice_type.F90
  ${SRC_DIR}/ice_sis/mask.F90
  ${SRC_DIR}/ice_sis/rot.F90
  ${SRC_DIR}/ice_param/ice_albedo.F90
  ${SRC_DIR}/ice_param/ocean_albedo.F90
  ${SRC_DIR}/ice_param/ocean_rough.F90
)