# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_library(fms_mom5)

target_include_directories(fms_mom5 PRIVATE
  ${SRC_DIR}/shared/include
  ${SRC_DIR}/shared/mosaic
  ${SRC_DIR}/shared/drifters
  ${SRC_DIR}/shared/fms
  ${SRC_DIR}/shared/mpp/include
)

target_link_libraries(fms_mom5 PUBLIC
  NetCDF::NetCDF_C
  NetCDF::NetCDF_Fortran
  MPI::MPI_Fortran
)

target_sources(fms_mom5 PRIVATE
  ${SRC_DIR}/shared/amip_interp/amip_interp.F90

  ${SRC_DIR}/shared/astronomy/astronomy.F90

  ${SRC_DIR}/shared/axis_utils/axis_utils.F90

  ${SRC_DIR}/shared/block_control/block_control.F90

  ${SRC_DIR}/shared/column_diagnostics/column_diagnostics.F90

  ${SRC_DIR}/shared/constants/constants.F90

  ${SRC_DIR}/shared/coupler/atmos_ocean_fluxes.F90
  ${SRC_DIR}/shared/coupler/coupler_types.F90
  ${SRC_DIR}/shared/coupler/ensemble_manager.F90

  ${SRC_DIR}/shared/data_override/data_override.F90

  ${SRC_DIR}/shared/diag_manager/diag_axis.F90
  ${SRC_DIR}/shared/diag_manager/diag_data.F90
  ${SRC_DIR}/shared/diag_manager/diag_grid.F90
  ${SRC_DIR}/shared/diag_manager/diag_manager.F90
  ${SRC_DIR}/shared/diag_manager/diag_manifest.F90
  ${SRC_DIR}/shared/diag_manager/diag_output.F90
  ${SRC_DIR}/shared/diag_manager/diag_table.F90
  ${SRC_DIR}/shared/diag_manager/diag_util.F90

  ${SRC_DIR}/shared/drifters/cloud_interpolator.F90
  ${SRC_DIR}/shared/drifters/drifters_comm.F90
  ${SRC_DIR}/shared/drifters/drifters_core.F90
  ${SRC_DIR}/shared/drifters/drifters.F90
  ${SRC_DIR}/shared/drifters/drifters_input.F90
  ${SRC_DIR}/shared/drifters/drifters_io.F90
  ${SRC_DIR}/shared/drifters/quicksort.F90

  ${SRC_DIR}/shared/exchange/stock_constants.F90
  ${SRC_DIR}/shared/exchange/test_xgrid.F90
  ${SRC_DIR}/shared/exchange/xgrid.F90

  ${SRC_DIR}/shared/fft/fft99.F90
  ${SRC_DIR}/shared/fft/fft.F90

  ${SRC_DIR}/shared/field_manager/field_manager.F90
  ${SRC_DIR}/shared/field_manager/fm_util.F90

  ${SRC_DIR}/shared/fms/fms.F90
  ${SRC_DIR}/shared/fms/fms_io.F90
  ${SRC_DIR}/shared/fms/test_fms_io.F90
  ${SRC_DIR}/shared/fms/test_unstructured_fms_io.F90

  ${SRC_DIR}/shared/horiz_interp/horiz_interp_bicubic.F90
  ${SRC_DIR}/shared/horiz_interp/horiz_interp_bilinear.F90
  ${SRC_DIR}/shared/horiz_interp/horiz_interp_conserve.F90
  ${SRC_DIR}/shared/horiz_interp/horiz_interp.F90
  ${SRC_DIR}/shared/horiz_interp/horiz_interp_spherical.F90
  ${SRC_DIR}/shared/horiz_interp/horiz_interp_type.F90
  ${SRC_DIR}/shared/horiz_interp/test_horiz_interp.F90

  ${SRC_DIR}/shared/interpolator/interpolator.F90

  ${SRC_DIR}/shared/memutils/memuse.c
  ${SRC_DIR}/shared/memutils/memutils.F90

  ${SRC_DIR}/shared/mosaic/create_xgrid.c
  ${SRC_DIR}/shared/mosaic/gradient.F90
  ${SRC_DIR}/shared/mosaic/gradient_c2l.c
  ${SRC_DIR}/shared/mosaic/grid.F90
  ${SRC_DIR}/shared/mosaic/interp.c
  ${SRC_DIR}/shared/mosaic/mosaic.F90
  ${SRC_DIR}/shared/mosaic/mosaic_util.c
  ${SRC_DIR}/shared/mosaic/read_mosaic.c

  ${SRC_DIR}/shared/mpp/affinity.c
  ${SRC_DIR}/shared/mpp/mpp_data.F90
  ${SRC_DIR}/shared/mpp/mpp_domains.F90
  ${SRC_DIR}/shared/mpp/mpp_efp.F90
  ${SRC_DIR}/shared/mpp/mpp.F90
  ${SRC_DIR}/shared/mpp/mpp_io.F90
  ${SRC_DIR}/shared/mpp/mpp_memutils.F90
  ${SRC_DIR}/shared/mpp/mpp_parameter.F90
  ${SRC_DIR}/shared/mpp/mpp_pset.F90
  ${SRC_DIR}/shared/mpp/mpp_utilities.F90
  ${SRC_DIR}/shared/mpp/nsclock.c
  ${SRC_DIR}/shared/mpp/test_mpp_domains.F90
  ${SRC_DIR}/shared/mpp/test_mpp.F90
  ${SRC_DIR}/shared/mpp/test_mpp_io.F90
  ${SRC_DIR}/shared/mpp/test_mpp_pset.F90
  ${SRC_DIR}/shared/mpp/threadloc.c

  ${SRC_DIR}/shared/oda_tools/oda_core_ecda.F90
  ${SRC_DIR}/shared/oda_tools/oda_core.F90
  ${SRC_DIR}/shared/oda_tools/oda_types.F90
  ${SRC_DIR}/shared/oda_tools/write_ocean_data.F90
  ${SRC_DIR}/shared/oda_tools/xbt_drop_rate_adjust.f90

  ${SRC_DIR}/shared/platform/platform.F90

  ${SRC_DIR}/shared/random_numbers/MersenneTwister.F90
  ${SRC_DIR}/shared/random_numbers/random_numbers.F90

  ${SRC_DIR}/shared/sat_vapor_pres/sat_vapor_pres.F90
  ${SRC_DIR}/shared/sat_vapor_pres/sat_vapor_pres_k.F90

  ${SRC_DIR}/shared/station_data/station_data.F90

  ${SRC_DIR}/shared/time_interp/time_interp_external.F90
  ${SRC_DIR}/shared/time_interp/time_interp.F90

  ${SRC_DIR}/shared/time_manager/get_cal_time.F90
  ${SRC_DIR}/shared/time_manager/time_manager.F90

  ${SRC_DIR}/shared/topography/gaussian_topog.F90
  ${SRC_DIR}/shared/topography/topography.F90

  ${SRC_DIR}/shared/tracer_manager/tracer_manager.F90

  ${SRC_DIR}/shared/tridiagonal/tridiagonal.F90
)