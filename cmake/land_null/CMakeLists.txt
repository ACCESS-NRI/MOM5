# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_library(land_null)

target_include_directories(land_null PRIVATE
  $<TARGET_FILE_DIR:fms_mom5>
)

target_link_libraries(land_null PRIVATE fms_mom5)

target_sources(land_null PRIVATE
  ${SRC_DIR}/land_null/land_model.F90
  ${SRC_DIR}/land_param/climap_albedo.F90
)