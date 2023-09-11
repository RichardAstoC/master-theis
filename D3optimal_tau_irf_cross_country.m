clc
clear all
%% 1. panamá
load PARAM_PAN_TAU
dynare C1general_model_irf;

save OC_FLEX_PAN_TAU oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_PAN_TAU
oo_PAN = oo_;
M_PAN  = M_;
OOPT.MODELS.oo_PAN = oo_PAN;
OOPT.MODELS.M_PAN  = M_PAN;
clear oo_ M_;

%% 2. brasil
load PARAM_BRA_TAU
dynare C1general_model_irf;

save OC_FLEX_BRA_TAU oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_BRA_TAU
oo_BRA = oo_;
M_BRA  = M_;
OOPT.MODELS.oo_BRA = oo_BRA;
OOPT.MODELS.M_BRA  = M_BRA;
clear oo_ M_;

%% 3. indonesia
load PARAM_IDN_TAU
dynare C1general_model_irf;

save OC_FLEX_IDN_TAU oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_IDN_TAU
oo_IDN = oo_;
M_IDN  = M_;
OOPT.MODELS.oo_IDN = oo_IDN;
OOPT.MODELS.M_IDN  = M_IDN;
clear oo_ M_;

%% 4. perú
load PARAM_PER_TAU
dynare C1general_model_irf;

save OC_FLEX_PER_TAU oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_PER_TAU
oo_PER = oo_;
M_PER  = M_;
OOPT.MODELS.oo_PER = oo_PER;
OOPT.MODELS.M_PER  = M_PER;
clear oo_ M_;

%% 5. uk
load PARAM_UK_TAU
dynare C1general_model_irf;

save OC_FLEX_UK_TAU oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_UK_TAU
oo_UK = oo_;
M_UK  = M_;
OOPT.MODELS.oo_UK = oo_UK;
OOPT.MODELS.M_UK  = M_UK;
clear oo_ M_;

%% DYNAMIC GRAPHS::
%VARIABLES DE INTERÉS: pt ct kt x1 x2 xt1 it;
OOPT.plot_color={'b' '--b' ':b' 'r' ':m'};
OOPT.NN=15;
OOPT.list_endo={'pt','ct','kt','x1','x2','xt1','it'};
OOPT.label_variables={'precios','consumo','bien público','cutoff-informal','cutoff-formal','productividad promedio','tasa de informalidad'};
OOPT.type_models={'oo_PAN' 'oo_BRA' 'oo_IDN' 'oo_PER' 'oo_UK'};
OOPT.legend_models= {'panamá' 'brasil' 'indonesia' 'perú' 'uk'};
OOPT.shocks_names={'e_a' 'e_f'};
OOPT.tit_shocks={'tecnológico' 'costo fijo formal'};
x2plot_comp(OOPT)