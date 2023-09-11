%% 1.1 CALCULANDO LOS VALORES ÓPTIMOS DE LA RPTA DE POLÍTICA tau k
clc
clear all

dcountry={'PAN';'BRA';'IDN';'PER';'UK'};

B1df=[];

for i=1:5
% tau optimal rule:: partimos de rho_star=0 y tau_star=t*

cntry=dcountry{i,1};
params=strcat('PARAM_',cntry,'_TAU');

load(params)

B1=0;
B2=0;

if i==1 || i==5
    
    disp('PAN | UK')
    B1df(i)=NaN;
    
else
    dynare E2general_policy_model_tau -Dtau=1 -Drule1=1;

    B1df(i)=B1;

    % tau lambda rule Ct
    if i==4
        
    dynare E2general_policy_model_tau -Dtau=0 -Dlambda=1;

     lambdatk_u=lambda_unconditional_all;
     lambdatk_c=lambda_conditional_all;
     
     sigmatk_pt=variance.pt;
     sigmatk_ct=variance.ct;
     sigmatk_kt=variance.kt;
     sigmatk_x1t=variance.x1;
     sigmatk_x2t=variance.x2;
     sigmatk_xt1=variance.xt1;
     sigmatk_it=variance.it;
     Btk=B1;
     
     save SIGMA_TAU_K_PER Btk lambdatk_u lambdatk_c sigmatk_pt sigmatk_ct sigmatk_kt sigmatk_x1t sigmatk_x2t sigmatk_xt1 sigmatk_it

     save OC_FLEX_PER_TAU_K oo_ M_;
     
    end
end
end


%% 1.2 CALCULANDO LOS VALORES ÓPTIMOS DE LA RPTA DE POLÍTICA tau x2 (cut-off formal)

dcountry={'PAN';'BRA';'IDN';'PER';'UK'};

B2df=[];

for i=1:5
% tau optimal rule:: partimos de rho_star=rho* y tau_star=t

cntry=dcountry{i,1};
params=strcat('PARAM_',cntry,'_TAU');

load(params)

B1=0;
B2=0;

if i==1
    
    disp('PAN')
    B2df(i)=NaN;
    
else
    dynare E2general_policy_model_tau -Dtau=1 -Drule2=1;

    B2df(i)=B2;

    % tau lambda rule Ct
    if i==4
        
    dynare E2general_policy_model_tau -Dtau=0 -Dlambda=1;

     lambdatx_u=lambda_unconditional_all;
     lambdatx_c=lambda_conditional_all;
     
     sigmatx_pt=variance.pt;
     sigmatx_ct=variance.ct;
     sigmatx_kt=variance.kt;
     sigmatx_x1t=variance.x1;
     sigmatx_x2t=variance.x2;
     sigmatx_xt1=variance.xt1;
     sigmatx_it=variance.it;
     Btx=B2;
     
     save SIGMA_TAU_X2_PER Btx lambdatx_u lambdatx_c sigmatx_pt sigmatx_ct sigmatx_kt sigmatx_x1t sigmatx_x2t sigmatx_xt1 sigmatx_it

     save OC_FLEX_PER_TAU_X2 oo_ M_;
     
    end
end
end

%%
B1_tau=transpose(B1df);
B2_tau=transpose(B2df);
E6policy_tau_values=table(dcountry,B1_tau,B2_tau);

E6policy_tau_values.Properties.VariableNames("dcountry") = "country";
E6policy_tau_values.Properties.VariableNames("B1_tau") = "tKCoef";
E6policy_tau_values.Properties.VariableNames("B2_tau") = "tFCCoef";

%% DYNAMIC GRAPHS
%cargo datos para graficar irfs
load OC_FLEX_PER_TAU_K
oo_osrtk = oo_;
M_osrtk = M_;
OOPT.MODELS.oo_osrtk = oo_osrtk;
OOPT.MODELS.M_osrtk  = M_osrtk;

clear oo_ M_;
%cargo datos para graficar irfs
load OC_FLEX_PER_TAU_X2
oo_osrtx = oo_;
M_osrtx  = M_;
OOPT.MODELS.oo_osrtx = oo_osrtx;
OOPT.MODELS.M_osrtx  = M_osrtx;

clear oo_ M_;

%cargo datos para graficar irfs
load OC_FLEX_PER_TAU
oo_osrper = oo_;
M_osrper  = M_;
OOPT.MODELS.oo_osrper = oo_osrper;
OOPT.MODELS.M_osrper  = M_osrper;

clear oo_ M_;

%VARIABLES DE INTERÉS: Ct Yt phi_it phi_ft Iit ni nf Kt; %Ct no se mueve
OOPT.plot_color={'b' '--b' 'r'};
OOPT.NN=15;
OOPT.list_endo={'pt','ct','kt','x1','x2','xt1','it'};
OOPT.label_variables={'precios','consumo','bien público','cutoff-informal','cutoff-formal','productividad promedio','tasa de informalidad'};
OOPT.type_models={'oo_osrtk' 'oo_osrtx' 'oo_osrper'};
OOPT.legend_models= {'tau-k' 'tau-x' 'optimal'};
OOPT.shocks_names={'e_a' 'e_f'};
OOPT.tit_shocks={'tecnológico' 'costo de entrada formal'};
x2plot_comp(OOPT)
