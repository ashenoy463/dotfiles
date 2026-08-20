" Vim syntax file
" Language: Quantum Espresso
" Maintainer: Leandro Seixas Rocha <seixasle@gmail.com>
" Last Change: 2015 Dec 12

if exists("b:current_syntax")
  finish
endif

" Comment
syntax keyword espressoTODO contained TODO FIXME XXX NOTE
syntax match espressoComment '!.*$'

" Integer with +,- or nothing in front
syntax match espressoNumber '\d\+'
syntax match espressoNumber '[-+]\d\+'

" Floating number
syntax match espressoNumber '\d\+.\d*'
syntax match espressoNumber '[-+]\d\+.\d*'
syntax match espressoNumber '[-+]\=\d[[:digit:]]*[dD][\-+]\=\d\+'
syntax match espressoNumber '\d[[:digit:]]*[dD][\-+]\=\d\+'
syntax match espressoNumber '[-+]\=\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'
syntax match espressoNumber '\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'

" String
syntax region espressoString start="'" end="'"

" Boolean value (.true. /.false.)
syntax match espressoBoolean '\.[tT][rR][uU][eE]\.'
syntax match espressoBoolean '\.[fF][aA][lL][sS][eE]\.'

" CONTROL namelist
syntax keyword espressoNameDesc CONTROL SYSTEM ELECTRONS IONS CELL skipwhite
"    espressoString
syntax keyword espressoKey calculation prefix title verbosity nextgroup=espressoString skipwhite
syntax keyword espressoKey restart_mode pseudo_dir outdir wfcdir disk_io nextgroup=espressoString skipwhite
"    espressoBoolean
syntax keyword espressoKey tstress tprnfor lkpoint_dir wf_collect nextgroup=espressoBoolean skipwhite
syntax keyword espressoKey tefield dipfield lelfield lorbm lberry lfcpopt nextgroup=espressoBoolean skipwhite
"    espressoNumber
syntax keyword espressoKey etot_conv_thr forc_conv_thr dt max_seconds nstep nextgroup=espressoNumber skipwhite
syntax keyword espressoKey iprint nberrycyc gdir nppstr nextgroup=espressoNumber skipwhite

" SYSTEM namelist
syntax keyword espressoKey ibrav nat ntyp nspin nbnd tot_charge tot_magnetization report use_all_frac Hubbard_U Hubbard_J0 Hubbard_alpha Hubbard_beta nextgroup=espressoNumber skipwhite
syntax keyword espressoKey ecutwfc ecutrho degauss ecutfock exx_fraction screening_parameter one_atom_occupations q2sigma qcutz ecfixed ecutvcut nextgroup=espressoNumber skipwhite
syntax keyword espressoKey lda_plus_u_kind edir emaxpos eamp lambda london_s6 london_rcut fixed_magnetization x_gamma_extrapolation nqx1 nqx2 nqx3 nextgroup=espressoNumber skipwhite
syntax keyword espressoKey nosym noinv force_symmorphic lda_plus_u noncolin lspinorb london nosym_evc no_t_rev space_group uniqueb origin_choice rhombohedral nextgroup=espressoBoolean skipwhite
syntax keyword espressoKey occupations smearing input_dft exxdiv_treatment U_projection_type constrained_magnetization starting_magnetization angle1 angle2 nextgroup=espressoString skipwhite
syntax keyword espressoKey starting_ns_eigenvalue Hubbard_J eopreg assume_isolated esm_bc esm_w esm_efield esm_nfit fcp_mu vdw_corr london_c6 xdm1 xdm2 nextgroup=espressoString skipwhite
syntax keyword espressoKey nr1 nr2 nr3 nr1s nr2s nr3s starting_spin_angle nextgroup=espressoNumber skipwhite
 
" ELECTRONS namelist
syntax keyword espressoKey electron_maxstep conv_thr mixing_beta mixing_ndim diago_david_ndim efield nextgroup=espressoNumber skipwhite
syntax keyword espressoKey mixing_mode diagonalization startingpot startingwfc tqr efield_cart nextgroup=espressoString skipwhite
syntax keyword espressoKey diago_full_acc adaptive_thr conv_thr_init conv_thr_multi scf_must_converge diago_thr_init diago_cg_maxiter mixing_fixed_ns nextgroup=espressoBoolean skipwhite

" IONS namelist
syntax keyword espressoKey ion_dynamics ion_positions phase_space pot_extrapolation wfc_extrapolation nextgroup=espressoString skipwhite
syntax keyword espressoKey bfgs_ndim trut_radius_max trust_radius_ini remove_grid_rot upscale trust_radius_max trust_radius_min w_1 w_2 nextgroup=espressoNumber skipwhite
syntax keyword espressoKey ion_temperature tempw tolp nraise delta_t refold_pos nextgroup=espressoString skipwhite

" CELL namelist
syntax keyword espressoKey cell_dynamics cell_dofree nextgroup=espressoString skipwhite
syntax keyword espressoKey press cell_factor press_conv_thr wmass nextgroup=espressoNumber skipwhite

" CONSTRAINTS card
"syntax keyword espressoKey 

syntax region espressoNamelist start="&" end="/" fold transparent contains=espressoNumber,espressoKey,espressoString,espressoBoolean,espressoComment

let b:current_syntax = "espresso"

hi def link espressoNamelist    PreProc
hi def link espressoKey         Statement
hi def link espressoNumber      Constant
hi def link espressoString      Type
hi def link espressoBoolean     PreProc
hi def link espressoComment     Comment

