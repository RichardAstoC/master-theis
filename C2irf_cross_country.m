clc
clear all
%% 1. panam�
load PARAM_PAN
dynare C1general_model_irf;

save OC_FLEX_PAN oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_PAN
oo_PAN = oo_;
M_PAN  = M_;
OOPT.MODELS.oo_PAN = oo_PAN;
OOPT.MODELS.M_PAN  = M_PAN;
clear oo_ M_;

%% 2. brasil
load PARAM_BRA
dynare C1general_model_irf;

save OC_FLEX_BRA oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_BRA
oo_BRA = oo_;
M_BRA  = M_;
OOPT.MODELS.oo_BRA = oo_BRA;
OOPT.MODELS.M_BRA  = M_BRA;
clear oo_ M_;

%% 3. indonesia
load PARAM_IDN
dynare C1general_model_irf;

save OC_FLEX_IDN oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_IDN
oo_IDN = oo_;
M_IDN  = M_;
OOPT.MODELS.oo_IDN = oo_IDN;
OOPT.MODELS.M_IDN  = M_IDN;
clear oo_ M_;

%% 4. per�
load PARAM_PER
dynare C1general_model_irf;

save OC_FLEX_PER oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_PER
oo_PER = oo_;
M_PER  = M_;
OOPT.MODELS.oo_PER = oo_PER;
OOPT.MODELS.M_PER  = M_PER;
clear oo_ M_;

%% 5. uk
load PARAM_UK
dynare C1general_model_irf;

save OC_FLEX_UK oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_UK
oo_UK = oo_;
M_UK  = M_;
OOPT.MODELS.oo_UK = oo_UK;
OOPT.MODELS.M_UK  = M_UK;
clear oo_ M_;

%% DYNAMIC GRAPHS::
%VARIABLES DE INTER�S: pt ct kt x1 x2 xt1 it;
OOPT.plot_color={'b' '--b' ':b' 'r' ':m'};
OOPT.NN=15;
OOPT.list_endo={'x1','x2','it','xt1','mt','pt','ct','kt'};%{'pt','ct','kt','x1','x2','xt1','it'};
OOPT.label_variables={'cutoff-informal','cutoff-formal','tasa de informalidad','productividad promedio','masa de firmas','precios','consumo','bien p�blico'};%{'precios','consumo','bien p�blico','cutoff-informal','cutoff-formal','productividad promedio','tasa de informalidad'};
OOPT.type_models={'oo_PAN' 'oo_BRA' 'oo_IDN' 'oo_PER' 'oo_UK'};
OOPT.legend_models= {'panam�' 'brasil' 'indonesia' 'per�' 'uk'};
OOPT.shocks_names={'e_a' 'e_f'};
OOPT.tit_shocks={'tecnol�gico' 'costo fijo formal'};
x2plot_comp(OOPT)