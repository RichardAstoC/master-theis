clc
clear all
%% cargando datos de lambdas y sigmas
load('SIGMA_RHO_R_PER');
load('SIGMA_TAU_K_PER');
load('SIGMA_TAU_X2_PER');
%% creando una tabla de datos.
policy=transpose({'rho_r','tau_k','tau_x'});
coef=transpose([round(Brr,2),round(Btk,2),round(Btx,2)]);
lambda_cx100=transpose([round(lambdarr_c*100,3),round(lambdatk_c*100,3),round(lambdatx_c*100,3)]);
lambda_ux100=transpose([round(lambdarr_u*100,2),round(lambdatk_u*100,2),round(lambdatx_u*100,2)]);
sigma_pt_ct=transpose([round((sigmarr_pt/sigmarr_ct)^(0.5),2),round((sigmatk_pt/sigmatk_ct)^(0.5),2),round((sigmatx_pt/sigmatx_ct)^(0.5),2)]);
sigma_it_ct=transpose([round((sigmarr_it/sigmarr_ct)^(0.5),2),round((sigmatk_it/sigmatk_ct)^(0.5),2),round((sigmatx_it/sigmatx_ct)^(0.5),2)]);
sigma_xt1_ct=transpose([round((sigmarr_xt1/sigmarr_ct)^(0.5),2),round((sigmatk_xt1/sigmatk_ct)^(0.5),2),round((sigmatx_xt1/sigmatx_ct)^(0.5),2)]);

summary_per=table(policy,coef,lambda_cx100,lambda_ux100,sigma_pt_ct,sigma_it_ct,sigma_xt1_ct)
A=table2latex(summary_per) ;