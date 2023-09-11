clc
clear all
%% cargando parámetros calibrados y óptimos
dcountry={'PAN';'BRA';'IDN';'PER';'UK'};

%% 1. panamá
%  1.1 tau
load('CNTRY_OPT')

X=D1steady_optimal_function(T.cons(1),T.ff(1),T.wf(1),T.E(1),T.fe(1),T.alpha(1),T.epsilon(1),T.xm(1),T.theta(1),T.tau_star(1),0);

ff=X(1);
wf=X(2);
theta=X(3);
epsilon=X(4);
alpha=X(5);
t=X(6);
rho=X(7);
E=X(8);
fe=X(9);
xm=X(10);
Fs=X(11);
hs=X(12);
xis=X(13);
xfs=X(14);
xts=X(15);
xt1s=X(16);
x1s=X(17);
ps=X(18);
ms=X(19);
Ts=X(20);
ls=X(21);
qs=X(22);
ks=X(23);
is=X(24);
x2s=X(25);
cs=X(26);

save PARAM_PAN_TAU ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%  1.2 rho
load('CNTRY_OPT')

Y=D1steady_optimal_function(T.cons(1),T.ff(1),T.wf(1),T.E(1),T.fe(1),T.alpha(1),T.epsilon(1),T.xm(1),T.theta(1),T.iva(1),T.rho_star(1));

ff=Y(1);
wf=Y(2);
theta=Y(3);
epsilon=Y(4);
alpha=Y(5);
t=Y(6);
rho=Y(7);
E=Y(8);
fe=Y(9);
xm=Y(10);
Fs=Y(11);
hs=Y(12);
xis=Y(13);
xfs=Y(14);
xts=Y(15);
xt1s=Y(16);
x1s=Y(17);
ps=Y(18);
ms=Y(19);
Ts=Y(20);
ls=Y(21);
qs=Y(22);
ks=Y(23);
is=Y(24);
x2s=Y(25);
cs=Y(26);

save PARAM_PAN_RHO ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs
clc
clear all
%% 2. brasil
%  2.1 tau
load('CNTRY_OPT')

X=D1steady_optimal_function(T.cons(2),T.ff(2),T.wf(2),T.E(2),T.fe(2),T.alpha(2),T.epsilon(2),T.xm(2),T.theta(2),T.tau_star(2),0);

ff=X(1);
wf=X(2);
theta=X(3);
epsilon=X(4);
alpha=X(5);
t=X(6);
rho=X(7);
E=X(8);
fe=X(9);
xm=X(10);
Fs=X(11);
hs=X(12);
xis=X(13);
xfs=X(14);
xts=X(15);
xt1s=X(16);
x1s=X(17);
ps=X(18);
ms=X(19);
Ts=X(20);
ls=X(21);
qs=X(22);
ks=X(23);
is=X(24);
x2s=X(25);
cs=X(26);

save PARAM_BRA_TAU ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%  2.2 rho
load('CNTRY_OPT')

Y=D1steady_optimal_function(T.cons(2),T.ff(2),T.wf(2),T.E(2),T.fe(2),T.alpha(2),T.epsilon(2),T.xm(2),T.theta(2),T.iva(2),T.rho_star(2));

ff=Y(1);
wf=Y(2);
theta=Y(3);
epsilon=Y(4);
alpha=Y(5);
t=Y(6);
rho=Y(7);
E=Y(8);
fe=Y(9);
xm=Y(10);
Fs=Y(11);
hs=Y(12);
xis=Y(13);
xfs=Y(14);
xts=Y(15);
xt1s=Y(16);
x1s=Y(17);
ps=Y(18);
ms=Y(19);
Ts=Y(20);
ls=Y(21);
qs=Y(22);
ks=Y(23);
is=Y(24);
x2s=Y(25);
cs=Y(26);

save PARAM_BRA_RHO ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs
clc
clear all
%% 3. indonesia
%  3.1 tau
load('CNTRY_OPT')

X=D1steady_optimal_function(T.cons(3),T.ff(3),T.wf(3),T.E(3),T.fe(3),T.alpha(3),T.epsilon(3),T.xm(3),T.theta(3),T.tau_star(3),0);

ff=X(1);
wf=X(2);
theta=X(3);
epsilon=X(4);
alpha=X(5);
t=X(6);
rho=X(7);
E=X(8);
fe=X(9);
xm=X(10);
Fs=X(11);
hs=X(12);
xis=X(13);
xfs=X(14);
xts=X(15);
xt1s=X(16);
x1s=X(17);
ps=X(18);
ms=X(19);
Ts=X(20);
ls=X(21);
qs=X(22);
ks=X(23);
is=X(24);
x2s=X(25);
cs=X(26);

save PARAM_IDN_TAU ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%  3.2 rho
load('CNTRY_OPT')

Y=D1steady_optimal_function(T.cons(3),T.ff(3),T.wf(3),T.E(3),T.fe(3),T.alpha(3),T.epsilon(3),T.xm(3),T.theta(3),T.iva(3),T.rho_star(3));

ff=Y(1);
wf=Y(2);
theta=Y(3);
epsilon=Y(4);
alpha=Y(5);
t=Y(6);
rho=Y(7);
E=Y(8);
fe=Y(9);
xm=Y(10);
Fs=Y(11);
hs=Y(12);
xis=Y(13);
xfs=Y(14);
xts=Y(15);
xt1s=Y(16);
x1s=Y(17);
ps=Y(18);
ms=Y(19);
Ts=Y(20);
ls=Y(21);
qs=Y(22);
ks=Y(23);
is=Y(24);
x2s=Y(25);
cs=Y(26);

save PARAM_IDN_RHO ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%% 4. perú
%  4.1 tau
load('CNTRY_OPT')

X=D1steady_optimal_function(T.cons(4),T.ff(4),T.wf(4),T.E(4),T.fe(4),T.alpha(4),T.epsilon(4),T.xm(4),T.theta(4),T.tau_star(4),0);

ff=X(1);
wf=X(2);
theta=X(3);
epsilon=X(4);
alpha=X(5);
t=X(6);
rho=X(7);
E=X(8);
fe=X(9);
xm=X(10);
Fs=X(11);
hs=X(12);
xis=X(13);
xfs=X(14);
xts=X(15);
xt1s=X(16);
x1s=X(17);
ps=X(18);
ms=X(19);
Ts=X(20);
ls=X(21);
qs=X(22);
ks=X(23);
is=X(24);
x2s=X(25);
cs=X(26);

save PARAM_PER_TAU ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%  4.2 rho
load('CNTRY_OPT')

Y=D1steady_optimal_function(T.cons(4),T.ff(4),T.wf(4),T.E(4),T.fe(4),T.alpha(4),T.epsilon(4),T.xm(4),T.theta(4),T.iva(4),T.rho_star(4));

ff=Y(1);
wf=Y(2);
theta=Y(3);
epsilon=Y(4);
alpha=Y(5);
t=Y(6);
rho=Y(7);
E=Y(8);
fe=Y(9);
xm=Y(10);
Fs=Y(11);
hs=Y(12);
xis=Y(13);
xfs=Y(14);
xts=Y(15);
xt1s=Y(16);
x1s=Y(17);
ps=Y(18);
ms=Y(19);
Ts=Y(20);
ls=Y(21);
qs=Y(22);
ks=Y(23);
is=Y(24);
x2s=Y(25);
cs=Y(26);

save PARAM_PER_RHO ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%% 5. UK
%  5.1 tau
load('CNTRY_OPT')

X=D1steady_optimal_function(T.cons(5),T.ff(5),T.wf(5),T.E(5),T.fe(5),T.alpha(5),T.epsilon(5),T.xm(5),T.theta(5),T.tau_star(5),0);

ff=X(1);
wf=X(2);
theta=X(3);
epsilon=X(4);
alpha=X(5);
t=X(6);
rho=X(7);
E=X(8);
fe=X(9);
xm=X(10);
Fs=X(11);
hs=X(12);
xis=X(13);
xfs=X(14);
xts=X(15);
xt1s=X(16);
x1s=X(17);
ps=X(18);
ms=X(19);
Ts=X(20);
ls=X(21);
qs=X(22);
ks=X(23);
is=X(24);
x2s=X(25);
cs=X(26);

save PARAM_UK_TAU ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs

clc
clear all
%  5.2 rho
load('CNTRY_OPT')

Y=D1steady_optimal_function(T.cons(5),T.ff(5),T.wf(5),T.E(5),T.fe(5),T.alpha(5),T.epsilon(5),T.xm(5),T.theta(5),T.iva(5),T.rho_star(5));

ff=Y(1);
wf=Y(2);
theta=Y(3);
epsilon=Y(4);
alpha=Y(5);
t=Y(6);
rho=Y(7);
E=Y(8);
fe=Y(9);
xm=Y(10);
Fs=Y(11);
hs=Y(12);
xis=Y(13);
xfs=Y(14);
xts=Y(15);
xt1s=Y(16);
x1s=Y(17);
ps=Y(18);
ms=Y(19);
Ts=Y(20);
ls=Y(21);
qs=Y(22);
ks=Y(23);
is=Y(24);
x2s=Y(25);
cs=Y(26);

save PARAM_UK_RHO ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs









