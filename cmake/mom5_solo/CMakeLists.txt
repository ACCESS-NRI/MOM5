# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_executable(mom5_solo ${SRC_DIR}/mom5/drivers/ocean_solo.F90)

target_include_directories(mom5_solo PRIVATE
  $<TARGET_FILE_DIR:fms_mom5>
  $<TARGET_FILE_DIR:ocean>
)

target_link_libraries(mom5_solo PRIVATE
  ocean
)

install(TARGETS mom5_solo RUNTIME)