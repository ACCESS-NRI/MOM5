# Copyright ACCESS-NRI and contributors. See the top-level LICENSE file for details.

add_library(ocean_access)

target_include_directories(ocean_access PRIVATE
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/include
  ${SRC_DIR}/mom5/ocean_core
)

target_link_libraries(ocean_access
  PUBLIC FMS::fms_r8
  PRIVATE
    GFDLGTracers::gtracers
)

target_compile_definitions(ocean_access PRIVATE ${ACCESS_COMPILE_DEFS})

target_sources(ocean_access PRIVATE
  ${SRC_DIR}/access/shared/gtracer_flux.F90

  ${SRC_DIR}/mom5/ocean_access/auscom_ice.F90
  ${SRC_DIR}/mom5/ocean_access/auscom_ice_parameters.F90

  ${SRC_DIR}/mom5/ocean_bgc/ocean_bgc_restore.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocean_generic_tracer.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocean_ibgc.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocean_pert_co2.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocean_po4_pre.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocmip2_abiotic.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocmip2_biotic.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocmip2_cfc.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocmip2_co2calc.F90
  ${SRC_DIR}/mom5/ocean_bgc/ocmip2_he.F90

  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_diag.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_dynamic_bottom.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_dynamic_free.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_static_bottom.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_static_free.F90
  ${SRC_DIR}/mom5/ocean_blobs/ocean_blob_util.F90

  ${SRC_DIR}/mom5/ocean_core/ocean_advection_velocity.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_barotropic.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_bbc.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_coriolis.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_density.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_domains.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_grids.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_model.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_obc_barotrop.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_obc.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_operators.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_parameters.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_pressure.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_sbc.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_thickness.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_topog.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_types.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_util.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_velocity_advect.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_velocity.F90
  ${SRC_DIR}/mom5/ocean_core/ocean_workspace.F90
  ${SRC_DIR}/mom5/ocean_core/oda_driver.F90

  ${SRC_DIR}/mom5/ocean_csiro_bgc/csiro_bgc.F90

  ${SRC_DIR}/mom5/ocean_diag/ocean_adv_vel_diag.F90
  ${SRC_DIR}/mom5/ocean_diag/ocean_diagnostics.F90
  ${SRC_DIR}/mom5/ocean_diag/ocean_drifters.F90
  ${SRC_DIR}/mom5/ocean_diag/ocean_tracer_diag.F90
  ${SRC_DIR}/mom5/ocean_diag/ocean_tracer_util.F90
  ${SRC_DIR}/mom5/ocean_diag/ocean_velocity_diag.F90

  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/algebraiclength.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/alpha_mnb.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_a.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_b.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_c.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_d.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_ma.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_rf.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/cmue_sg.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/compute_cpsi3.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/compute_rist.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/dissipationeq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/epsbalgebraic.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/fk_craig.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/genericeq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/gotm_lib_version.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/internal_wave.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/ispralength.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/kbalgebraic.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/kbeq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/kpp.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/lengthscaleeq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/potentialml.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/production.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/q2over2eq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/r_ratio.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/tkealgebraic.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/tkeeq.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/turbulence.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/turbulence/variances.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/adv_center.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/convert_fluxes.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/diff_center.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/diff_face.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/eqstate.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/gridinterpol.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/lagrange.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/ode_solvers.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/time.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/tridiagonal_gotm.F90
  ${SRC_DIR}/mom5/ocean_param/gotm-4.0/util/util.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_bihcgrid_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_bihcst_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_bih_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_bihgen_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_bih_tracer.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_lapcgrid_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_lapcst_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_lap_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_lapgen_friction.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_lap_tracer.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_mixdownslope.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_sigma_transport.F90
  ${SRC_DIR}/mom5/ocean_param/lateral/ocean_submesoscale.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysicsA.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysicsB.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysicsC.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_diff.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_flux.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_new.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_skew.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_tensor.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_util.F90
  ${SRC_DIR}/mom5/ocean_param/neutral/ocean_nphysics_util_new.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_increment_eta.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_increment_tracer.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_increment_velocity.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_momentum_source.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_overexchange.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_overflow.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_overflow_OFP.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_rivermix.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_riverspread.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_shortwave_csiro.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_shortwave.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_shortwave_gfdl.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_shortwave_jerlov.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_sponges_eta.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_sponges_tracer.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_sponges_velocity.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_xlandinsert.F90
  ${SRC_DIR}/mom5/ocean_param/sources/ocean_xlandmix.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_convect.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_form_drag.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_chen.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_const.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_gotm.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_kpp_mom4p0.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_kpp_mom4p1.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_kpp_test.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_mix.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_pp.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_tidal.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_tidal_test.F90
  ${SRC_DIR}/mom5/ocean_param/vertical/ocean_vert_util.F90

  ${SRC_DIR}/mom5/ocean_tracers/ocean_age_tracer.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_frazil.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_passive.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_residency.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_residency_integrand.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_residency_meta.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_residency_ml.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_residency_range.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_tempsalt.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_tpm.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_tpm_util.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_tracer_advect.F90
  ${SRC_DIR}/mom5/ocean_tracers/ocean_tracer.F90
  ${SRC_DIR}/mom5/ocean_tracers/transport_matrix.F90

  ${SRC_DIR}/mom5/ocean_wave/ocean_wave.F90
  ${SRC_DIR}/mom5/ocean_wave/ocean_wave_type.F90
)