%% 1.1 CALCULANDO LOS VALORES ÓPTIMOS DE LA RPTA DE POLÍTICA rho k
clc
clear all

dcountry={'PAN';'BRA';'IDN';'PER';'UK'};

B1df=[];

for i=4
% tau optimal rule:: partimos de rho_star=0 y tau_star=t*

cntry=dcountry{i,1};
params=strcat('PARAM_',cntry,'_RHO');

load(params)

B1=0;
B2=0;
if  i==3
    
    disp('PAN | UK')
    B1df(i)=NaN;
    
else

    dynare E1general_policy_model_rho -Dpun=1 -Drule1=1;

    B1df(i)=B1;

    % tau lambda rule Ct
    if i==4
        
    dynare E1general_policy_model_rho -Dpun=0 -Dlambda=1;

     lambdarr_u=lambda_unconditional_all;
     lambdarr_c=lambda_conditional_all;
     
     sigmarr_pt=variance.pt;
     sigmarr_ct=variance.ct;
     sigmarr_kt=variance.kt;
     sigmarr_x1t=variance.x1;
     sigmarr_x2t=variance.x2;
     sigmarr_xt1=variance.xt1;
     sigmarr_it=variance.it;
     Brr=B1;
     
     save SIGMA_RHO_R_PER Brr lambdarr_u lambdarr_c sigmarr_pt sigmarr_ct sigmarr_kt sigmarr_x1t sigmarr_x2t sigmarr_xt1 sigmarr_it

     save OC_FLEX_PER_RHO_R oo_ M_;
     
    end
end
end

%%
B1_rho=transpose(B1df);
E6policy_rho_values=table(dcountry,B1_rho);

E6policy_rho_values.Properties.VariableNames("dcountry") = "country";
E6policy_rho_values.Properties.VariableNames("B1_rho") = "rRCoef";

%% DYNAMIC GRAPHS
%cargo datos para graficar irfs
load OC_FLEX_PER_RHO_R
oo_osrrr = oo_;
M_osrrr = M_;
OOPT.MODELS.oo_osrrr = oo_osrrr;
OOPT.MODELS.M_osrrr  = M_osrrr;

clear oo_ M_;

%cargo datos para graficar irfs
load OC_FLEX_PER_RHO
oo_osrper = oo_;
M_osrper  = M_;
OOPT.MODELS.oo_osrper = oo_osrper;
OOPT.MODELS.M_osrper  = M_osrper;

clear oo_ M_;

%VARIABLES DE INTERÉS: Ct Yt phi_it phi_ft Iit ni nf Kt; %Ct no se mueve
OOPT.plot_color={'b' 'r'};
OOPT.NN=15;
OOPT.list_endo={'pt','ct','kt','x1','x2','xt1','it'};
OOPT.label_variables={'precios','consumo','bien público','cutoff-informal','cutoff-formal','productividad promedio','tasa de informalidad'};
OOPT.type_models={'oo_osrrr' 'oo_osrper'};
OOPT.legend_models= {'rho-r' 'optimal'};
OOPT.shocks_names={'e_a' 'e_f'};
OOPT.tit_shocks={'tecnológico' 'costo de entrada formal'};
x2plot_comp(OOPT)
