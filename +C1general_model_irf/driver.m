%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'C1general_model_irf';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('C1general_model_irf.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e_a'};
M_.exo_names_tex(1) = {'e\_a'};
M_.exo_names_long(1) = {'e_a'};
M_.exo_names(2) = {'e_f'};
M_.exo_names_tex(2) = {'e\_f'};
M_.exo_names_long(2) = {'e_f'};
M_.endo_names = cell(20,1);
M_.endo_names_tex = cell(20,1);
M_.endo_names_long = cell(20,1);
M_.endo_names(1) = {'Ft'};
M_.endo_names_tex(1) = {'Ft'};
M_.endo_names_long(1) = {'Ft'};
M_.endo_names(2) = {'ht'};
M_.endo_names_tex(2) = {'ht'};
M_.endo_names_long(2) = {'ht'};
M_.endo_names(3) = {'xi'};
M_.endo_names_tex(3) = {'xi'};
M_.endo_names_long(3) = {'xi'};
M_.endo_names(4) = {'xf'};
M_.endo_names_tex(4) = {'xf'};
M_.endo_names_long(4) = {'xf'};
M_.endo_names(5) = {'xt'};
M_.endo_names_tex(5) = {'xt'};
M_.endo_names_long(5) = {'xt'};
M_.endo_names(6) = {'xt1'};
M_.endo_names_tex(6) = {'xt1'};
M_.endo_names_long(6) = {'xt1'};
M_.endo_names(7) = {'x1'};
M_.endo_names_tex(7) = {'x1'};
M_.endo_names_long(7) = {'x1'};
M_.endo_names(8) = {'pt'};
M_.endo_names_tex(8) = {'pt'};
M_.endo_names_long(8) = {'pt'};
M_.endo_names(9) = {'mt'};
M_.endo_names_tex(9) = {'mt'};
M_.endo_names_long(9) = {'mt'};
M_.endo_names(10) = {'Tt'};
M_.endo_names_tex(10) = {'Tt'};
M_.endo_names_long(10) = {'Tt'};
M_.endo_names(11) = {'lt'};
M_.endo_names_tex(11) = {'lt'};
M_.endo_names_long(11) = {'lt'};
M_.endo_names(12) = {'qt'};
M_.endo_names_tex(12) = {'qt'};
M_.endo_names_long(12) = {'qt'};
M_.endo_names(13) = {'kt'};
M_.endo_names_tex(13) = {'kt'};
M_.endo_names_long(13) = {'kt'};
M_.endo_names(14) = {'it'};
M_.endo_names_tex(14) = {'it'};
M_.endo_names_long(14) = {'it'};
M_.endo_names(15) = {'x2'};
M_.endo_names_tex(15) = {'x2'};
M_.endo_names_long(15) = {'x2'};
M_.endo_names(16) = {'ct'};
M_.endo_names_tex(16) = {'ct'};
M_.endo_names_long(16) = {'ct'};
M_.endo_names(17) = {'At'};
M_.endo_names_tex(17) = {'At'};
M_.endo_names_long(17) = {'At'};
M_.endo_names(18) = {'at'};
M_.endo_names_tex(18) = {'at'};
M_.endo_names_long(18) = {'at'};
M_.endo_names(19) = {'ft'};
M_.endo_names_tex(19) = {'ft'};
M_.endo_names_long(19) = {'ft'};
M_.endo_names(20) = {'rt'};
M_.endo_names_tex(20) = {'rt'};
M_.endo_names_long(20) = {'rt'};
M_.endo_partitions = struct();
M_.param_names = cell(33,1);
M_.param_names_tex = cell(33,1);
M_.param_names_long = cell(33,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'sigma'};
M_.param_names_long(1) = {'sigma'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'epsilon'};
M_.param_names_tex(4) = {'epsilon'};
M_.param_names_long(4) = {'epsilon'};
M_.param_names(5) = {'wf'};
M_.param_names_tex(5) = {'wf'};
M_.param_names_long(5) = {'wf'};
M_.param_names(6) = {'ff'};
M_.param_names_tex(6) = {'ff'};
M_.param_names_long(6) = {'ff'};
M_.param_names(7) = {'fe'};
M_.param_names_tex(7) = {'fe'};
M_.param_names_long(7) = {'fe'};
M_.param_names(8) = {'theta'};
M_.param_names_tex(8) = {'theta'};
M_.param_names_long(8) = {'theta'};
M_.param_names(9) = {'E'};
M_.param_names_tex(9) = {'E'};
M_.param_names_long(9) = {'E'};
M_.param_names(10) = {'xm'};
M_.param_names_tex(10) = {'xm'};
M_.param_names_long(10) = {'xm'};
M_.param_names(11) = {'rho'};
M_.param_names_tex(11) = {'rho'};
M_.param_names_long(11) = {'rho'};
M_.param_names(12) = {'t'};
M_.param_names_tex(12) = {'t'};
M_.param_names_long(12) = {'t'};
M_.param_names(13) = {'Fs'};
M_.param_names_tex(13) = {'Fs'};
M_.param_names_long(13) = {'Fs'};
M_.param_names(14) = {'hs'};
M_.param_names_tex(14) = {'hs'};
M_.param_names_long(14) = {'hs'};
M_.param_names(15) = {'xis'};
M_.param_names_tex(15) = {'xis'};
M_.param_names_long(15) = {'xis'};
M_.param_names(16) = {'xfs'};
M_.param_names_tex(16) = {'xfs'};
M_.param_names_long(16) = {'xfs'};
M_.param_names(17) = {'xts'};
M_.param_names_tex(17) = {'xts'};
M_.param_names_long(17) = {'xts'};
M_.param_names(18) = {'xt1s'};
M_.param_names_tex(18) = {'xt1s'};
M_.param_names_long(18) = {'xt1s'};
M_.param_names(19) = {'x1s'};
M_.param_names_tex(19) = {'x1s'};
M_.param_names_long(19) = {'x1s'};
M_.param_names(20) = {'ps'};
M_.param_names_tex(20) = {'ps'};
M_.param_names_long(20) = {'ps'};
M_.param_names(21) = {'ms'};
M_.param_names_tex(21) = {'ms'};
M_.param_names_long(21) = {'ms'};
M_.param_names(22) = {'Ts'};
M_.param_names_tex(22) = {'Ts'};
M_.param_names_long(22) = {'Ts'};
M_.param_names(23) = {'ls'};
M_.param_names_tex(23) = {'ls'};
M_.param_names_long(23) = {'ls'};
M_.param_names(24) = {'qs'};
M_.param_names_tex(24) = {'qs'};
M_.param_names_long(24) = {'qs'};
M_.param_names(25) = {'ks'};
M_.param_names_tex(25) = {'ks'};
M_.param_names_long(25) = {'ks'};
M_.param_names(26) = {'is'};
M_.param_names_tex(26) = {'is'};
M_.param_names_long(26) = {'is'};
M_.param_names(27) = {'x2s'};
M_.param_names_tex(27) = {'x2s'};
M_.param_names_long(27) = {'x2s'};
M_.param_names(28) = {'cs'};
M_.param_names_tex(28) = {'cs'};
M_.param_names_long(28) = {'cs'};
M_.param_names(29) = {'A'};
M_.param_names_tex(29) = {'A'};
M_.param_names_long(29) = {'A'};
M_.param_names(30) = {'a'};
M_.param_names_tex(30) = {'a'};
M_.param_names_long(30) = {'a'};
M_.param_names(31) = {'rss'};
M_.param_names_tex(31) = {'rss'};
M_.param_names_long(31) = {'rss'};
M_.param_names(32) = {'rho_a'};
M_.param_names_tex(32) = {'rho\_a'};
M_.param_names_long(32) = {'rho_a'};
M_.param_names(33) = {'rho_f'};
M_.param_names_tex(33) = {'rho\_f'};
M_.param_names_long(33) = {'rho_f'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 20;
M_.param_nbr = 33;
M_.orig_endo_nbr = 20;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 20;
M_.eq_nbr = 20;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 6;
 0 7;
 0 8;
 0 9;
 0 10;
 0 11;
 0 12;
 1 13;
 0 14;
 0 15;
 0 16;
 0 17;
 0 18;
 0 19;
 0 20;
 2 21;
 0 22;
 3 23;
 4 24;
 5 25;]';
M_.nstatic = 15;
M_.nfwrd   = 0;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 5;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [24; 10; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'rt' ;
  3 , 'name' , 'Ft' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'x2' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'qt' ;
  12 , 'name' , 'Tt' ;
  13 , 'name' , 'lt' ;
  14 , 'name' , 'mt' ;
  15 , 'name' , 'kt' ;
  16 , 'name' , '16' ;
  17 , 'name' , 'it' ;
  18 , 'name' , 'At' ;
  19 , 'name' , 'at' ;
  20 , 'name' , 'ft' ;
};
M_.mapping.Ft.eqidx = [2 3 4 5 9 10 13 14 ];
M_.mapping.ht.eqidx = [4 5 6 7 9 10 12 13 15 17 ];
M_.mapping.xi.eqidx = [7 9 10 13 ];
M_.mapping.xf.eqidx = [8 9 10 12 ];
M_.mapping.xt.eqidx = [2 9 12 13 14 ];
M_.mapping.xt1.eqidx = [5 10 ];
M_.mapping.x1.eqidx = [2 5 6 7 14 16 ];
M_.mapping.pt.eqidx = [1 14 15 16 ];
M_.mapping.mt.eqidx = [14 15 ];
M_.mapping.Tt.eqidx = [12 15 ];
M_.mapping.lt.eqidx = [11 13 ];
M_.mapping.qt.eqidx = [11 12 13 14 16 ];
M_.mapping.kt.eqidx = [2 11 15 16 ];
M_.mapping.it.eqidx = [17 ];
M_.mapping.x2.eqidx = [6 8 ];
M_.mapping.ct.eqidx = [1 11 ];
M_.mapping.At.eqidx = [3 18 ];
M_.mapping.at.eqidx = [18 19 ];
M_.mapping.ft.eqidx = [4 5 15 20 ];
M_.mapping.rt.eqidx = [1 2 ];
M_.mapping.e_a.eqidx = [19 ];
M_.mapping.e_f.eqidx = [20 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [8 16 18 19 20 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(20, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(33, 1);
M_.endo_trends = struct('deflator', cell(20, 1), 'log_deflator', cell(20, 1), 'growth_factor', cell(20, 1), 'log_growth_factor', cell(20, 1));
M_.NNZDerivatives = [79; -1; -1; ];
M_.static_tmp_nbr = [24; 11; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
set_param_value('alpha',alpha);
set_param_value('epsilon',epsilon);
set_param_value('wf',wf);
set_param_value('ff',ff);
set_param_value('fe',fe);
set_param_value('theta',theta);
set_param_value('E',E);
set_param_value('xm',xm);
set_param_value('rho',rho);
set_param_value('t',t);
set_param_value('Fs',Fs);
set_param_value('hs',hs);
set_param_value('xis',xis);
set_param_value('xfs',xfs);
set_param_value('xts',xts);
set_param_value('xt1s',xt1s);
set_param_value('x1s',x1s);
set_param_value('ps',ps);
set_param_value('ms',ms);
set_param_value('Ts',Ts);
set_param_value('ls',ls);
set_param_value('qs',qs);
set_param_value('ks',ks);
set_param_value('is',is);
set_param_value('x2s',x2s);
set_param_value('cs',cs);
M_.params(29) = 1;
A = M_.params(29);
M_.params(30) = 0;
a = M_.params(30);
M_.params(1) = 2;
sigma = M_.params(1);
M_.params(32) = 0.95;
rho_a = M_.params(32);
M_.params(33) = 0.95;
rho_f = M_.params(33);
M_.params(31) = M_.params(9)/(M_.params(25)*100)*M_.params(4)/(1-M_.params(11))*M_.params(13)^(-1)*(M_.params(17)/M_.params(19))^(M_.params(4)-1);
rss = M_.params(31);
M_.params(2) = 1/(1+M_.params(31));
beta = M_.params(2);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = M_.params(13);
oo_.steady_state(2) = M_.params(14);
oo_.steady_state(3) = M_.params(15);
oo_.steady_state(4) = M_.params(16);
oo_.steady_state(5) = M_.params(17);
oo_.steady_state(6) = M_.params(18);
oo_.steady_state(7) = M_.params(19);
oo_.steady_state(8) = M_.params(20);
oo_.steady_state(9) = M_.params(21);
oo_.steady_state(10) = M_.params(22);
oo_.steady_state(11) = M_.params(23);
oo_.steady_state(12) = M_.params(24);
oo_.steady_state(13) = M_.params(25);
oo_.steady_state(14) = M_.params(26);
oo_.steady_state(15) = M_.params(27);
oo_.steady_state(16) = M_.params(28);
oo_.steady_state(20) = M_.params(31);
oo_.steady_state(17) = M_.params(29);
oo_.steady_state(18) = M_.params(30);
oo_.steady_state(19) = M_.params(6);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
options_.qz_zero_threshold = 1e-25;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1e-5;
M_.Sigma_e(2, 2) = 1e-5;
options_.irf = 30;
options_.nograph = true;
options_.order = 1;
options_.periods = 1000;
var_list_ = {'pt';'ct';'kt';'x1';'x2';'xt1';'it';'mt'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
pt_pos     =   strmatch('pt',var_list_ ,'exact');
ct_pos     =   strmatch('ct', var_list_ ,'exact');
kt_pos     =   strmatch('kt',var_list_ ,'exact');
x1_pos     =   strmatch('x1',var_list_ ,'exact');
x2_pos     =   strmatch('x2',var_list_ ,'exact');
xt1_pos    =   strmatch('xt1',var_list_ ,'exact');
it_pos     =   strmatch('it',var_list_ ,'exact');
variance.pt     =   oo_.var(pt_pos,pt_pos);
variance.ct     =   oo_.var(ct_pos,ct_pos);
variance.kt     =   oo_.var(kt_pos,kt_pos);
variance.x1     =   oo_.var(x1_pos,x1_pos);
variance.x2     =   oo_.var(x2_pos,x2_pos);
variance.xt1    =   oo_.var(xt1_pos,xt1_pos);
variance.it     =   oo_.var(it_pos,it_pos);
save('C1general_model_irf_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('C1general_model_irf_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('C1general_model_irf_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('C1general_model_irf_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('C1general_model_irf_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('C1general_model_irf_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('C1general_model_irf_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
