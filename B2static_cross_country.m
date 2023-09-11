clc
clear all
%% estáticas?
dcountry={'PAN';'BRA';'IDN';'PER';'UK'};

countrydf=[];
costofodf=[];
salariofodf=[];
pmgkdf=[];
costofedf=[];
alphadf=[];
epsilondf=[];
xmdf=[];
thetadf=[];
t_stardf=[];
r_stardf=[];
ivadf=[];
consumodf=[];
for i=1:5
%i=4;    
cntry=dcountry{i,1};
params=strcat('PARAM_',cntry);
% 1. cargando parámetros para perú
load(params);
tau_star=B1tau_static_exercise_function(cntry,alpha,epsilon,wf,ff,fe,theta,rho,E,xm,ms);
rho_star=B1punisher_static_exercise_function(cntry,alpha,epsilon,wf,ff,fe,theta,t,E,xm,ms);

%countrydf(i)=cntry;
costofodf(i)=ff;
salariofodf(i)=wf;
pmgkdf(i)=E;
costofedf(i)=fe;
alphadf(i)=alpha;
epsilondf(i)=epsilon;
xmdf(i)=xm;
thetadf(i)=theta;
t_stardf(i)=tau_star;
r_stardf(i)=rho_star;
ivadf(i)=t;
consumodf(i)=cs;
end

%%  
country={'PAN';'BRA';'IDN';'PER';'UK'};
ff=transpose(costofodf);
wf=transpose(salariofodf);
E=transpose(pmgkdf);
fe=transpose(costofedf);
alpha=transpose(alphadf);
epsilon=transpose(epsilondf);
xm=transpose(xmdf);
theta=transpose(thetadf);
tau_star=transpose(t_stardf);
rho_star=transpose(r_stardf);
iva=transpose(ivadf);
cons=transpose(consumodf);
T=table(country,ff,wf,E,fe,alpha,epsilon,xm,theta,tau_star,rho_star,iva,cons);
%% guardando los parámetros con tau y rho óptimos
save CNTRY_OPT T