% el gobierno gasta los impuestos corrientes para proveer instalar capital público para el periodo siguiente.
% las formales que entran en el presente gozan de la contribución de las firmas del día de ayer
@#ifndef pun
  @#define pun = 0
@#endif
@#ifndef rule1
  @#define rule1 = 0
@#endif
@#ifndef rule2
  @#define rule2 = 0
@#endif

@#ifndef lambda
  @#define lambda = 0
@#endif

var
%ecuaciones del modelo

Ft ht xi xf xt xt1 x1 pt mt Tt lt qt kt it x2 ct At at ft rt

%ecuaciones del osr

welf util welfeq welfgap

%var. de políticas

rho
;
%predetermined_variables kt;
varexo e_a e_f;
parameters

beta sigma 

alpha epsilon wf ff fe theta E xm

rhos t

Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs A a rss

rho_a rho_f

welfs utils welfeqs welfgaps

PPHI_C

%funciones de policy
B1
B2 
;

%set_param_value('beta',beta);
%set_param_value('sigma',sigma);
set_param_value('alpha',alpha);
set_param_value('epsilon',epsilon);
set_param_value('wf',wf);
set_param_value('ff',ff);
set_param_value('fe',fe);
set_param_value('theta',theta);
set_param_value('E',E);
set_param_value('xm',xm);
set_param_value('rhos',rho);
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
set_param_value('B1',B1);
set_param_value('B2',B2);

A=1;
a=0;
sigma=2;
rho_a=0.95;
rho_f=0.95;
rss=(E/(ks*100))*(epsilon/(1-rhos))*Fs^(-1)*(xts/x1s)^(epsilon-1);
beta=1/(1+rss);

PPHI_C=0;

welfs =(1/(1-beta))*(((cs)^(1-sigma)-1)/(1-sigma));
utils =(((cs)^(1-sigma)-1)/(1-sigma));
welfeqs =(((1-PPHI_C) * (cs))^(1-sigma)-1)/((1-sigma)*(1-beta));
welfgaps=(welfs - welfeqs);

model;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EL MODELO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1. euler

ct(-1)^(-sigma)=beta*(1+rt(-1))*(ct^(-sigma)*(pt(-1)/pt)); 

rt=(E/(kt*100))*(epsilon/(1-rho))*Ft^(-1)*(xt/x1)^(epsilon-1);

%2. factor: variable auxiliar repetible (para simplificar)

Ft=((1/wf)*((1-t)/(1-rho))*At*(1/(1-theta)^E))^(1-epsilon);

%3. multiplicador de productividad mínima formal respecto a la mínima informal

ht^(epsilon-1)=(ft-1)*(((1-t)/(1-rho))*Ft^(-1)-1)^(-1);

%4. cut-off de productividad mínima de producción de equilibrio (ZCP y FE)

x1^(alpha)=((xm^(alpha))/fe)*(Ft^(-1)*(xt1/x1)^(epsilon-1)*(1/(1-rho))-(1-ht^(-alpha))-ft*ht^(-alpha));

%5. cut-off de productividad mínima formal

x2=ht*x1;

%6. productividad promedio del sector informal

xi^(epsilon-1)=(alpha/(alpha+1-epsilon))*(1-ht^(-alpha))^(-1)*(1-ht^(epsilon-1-alpha))*x1^(epsilon-1);

%7. productividad promedio del sector formal

xf^(epsilon-1)=(alpha/(alpha+1-epsilon))*x2^(epsilon-1);

%8. productividad agregada de la economía

xt^(epsilon-1)=Ft*(1-ht^(-alpha))*xi^(epsilon-1)+ht^(-alpha)*xf^(epsilon-1);

%9. productividad de la firma promedio de la economía: productividad promedio.

xt1^(epsilon-1)=(1-rho)*Ft*(1-ht^(-alpha))*xi^(epsilon-1)+(1-t)*ht^(-alpha)*xf^(epsilon-1);

%10. demanda interna: consumo+inversión de bien público+recursos gastados en castigar a las informales

qt=ct+kt+lt;

%11. recaudación de impuestos

Tt=t*qt*ht^(-alpha)*(xf/xt)^(epsilon-1);

%12. recaudación por castigo de firmas informales

lt=rho*qt*Ft*(1-ht^(-alpha))*(xi/xt)^(epsilon-1);

%13. cantidad de firmas

mt=(pt*qt*(1-rho)/epsilon)*Ft*(x1/xt)^(epsilon-1);

%14. inversión en bien público por parte del gobierno, 
%    el ingreso total proviene del costo fijo que pagan 
%    las formales al gobierno, mientras que las informales
%    pagan a las familias.
%    en equilibrio, el costo de castigo es igual al recaudado por castigar 
%    a las informales.

kt=Tt+(ht^(-alpha)*ft*mt/pt);

%15. precios agregados de equilibrio.

pt^(epsilon)=(epsilon/((1-rho)*qt))*(((epsilon-1)*(1-rho)*((1-theta)^E)*kt^E)/epsilon)^(1-epsilon)*(1/(x1^(epsilon-1)));

%16. tasa de informalidad.

it=1-ht^(-alpha);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHOCKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

At=exp(at);                                                                                                                  
at=rho_a*at(-1)+e_a;
ft=(1-rho_f)*ff+rho_f*ft(-1)+e_f;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCIONES DE POLÍTICA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

@#if pun ==0
rho=rhos*(rt(+1)/rss)^(B1);
@#endif
@#if pun ==1
rho=rhos*(rt(+1)/rss)^(B1);
@#endif

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UTILIDAD CORRIENTE, WELFARE & WELFARE EQUIVALENTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

util = (((ct)^(1-sigma)-1)/(1-sigma));
welf    = (((ct)^(1-sigma)-1)/(1-sigma))+ beta * welf(+1); %
welfeq = (((1-PPHI_C) * (cs))^(1-sigma)-1)/((1-sigma)*(1-beta));
welfgap = (welf - welfeq);

end;

initval;
Ft=Fs;
ht=hs;
xi=xis;
xf=xfs;
xt=xts;
xt1=xt1s;
x1=x1s;
pt=ps;
mt=ms;
Tt=Ts;
lt=ls;
qt=qs;
kt=ks;
it=is;
x2=x2s;
ct=cs;
rt=rss;
% shocks

At=A;                                                                                                                  
at=a;
ft=ff;

%policy
rho=rhos;

util = utils;
welf    = welfs;
welfeq = welfeqs;
welfgap = welfgaps;

end;
steady;
check(qz_zero_threshold=1e-25);

shocks;
var e_a=1e-5;
var e_f=1e-5;
end;

stoch_simul(order=2,pruning,nograph) pt ct kt x1 x2 xt1 it;

@#if pun ==1

   @#if rule1==1
        x_start=[0]'; %(+-) dan distintas direcciones de óptimo
        x_opt_name={'B1',-500,Inf};
        options_.nomoments      = 0;
        options_.nofunctions    = 1;
        options_.nograph        = 1;
        options_.verbosity      = 0;
        options_.noprint        = 1;
        options_.TeX            = 0;
        H0      = 1e-4*eye(length(x_start));        % Initial Hessian 
        crit    = 1e-10;                             % Tolerance
        nit     = 10000;                            % Number of iterations 

        [fhat,x_opt_hat] = csminwel(@E3welfare_objectiveN,x_start,H0,[],crit,nit,x_opt_name);
   @#endif
 @#if rule2==1
        x_start=[0]';
        x_opt_name={'B2',-500,Inf};
        options_.nomoments      = 0;
        options_.nofunctions    = 1;
        options_.nograph        = 1;
        options_.verbosity      = 0;
        options_.noprint        = 1;
        options_.TeX            = 0;
        H0      = 1e-4*eye(length(x_start));        % Initial Hessian 
        crit    = 1e-10;                             % Tolerance
        nit     = 10000;                            % Number of iterations 

        [fhat,x_opt_hat] = csminwel(@E3welfare_objectiveN,x_start,H0,[],crit,nit,x_opt_name);
   @#endif

@#endif


@#if pun==0

@#if lambda==1


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Varianzas
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    pt_pos     =   strmatch('pt',var_list_ ,'exact');
    ct_pos     =   strmatch('ct', var_list_ ,'exact');
    kt_pos     =   strmatch('kt',var_list_ ,'exact');
    x1_pos     =   strmatch('x1',var_list_ ,'exact');
    x2_pos     =   strmatch('x2',var_list_ ,'exact');
    xt1_pos    =   strmatch('xt1',var_list_ ,'exact');
    it_pos     =   strmatch('it',var_list_ ,'exact');

    %read out variances
    variance.pt     =   oo_.var(pt_pos,pt_pos);
    variance.ct     =   oo_.var(ct_pos,ct_pos);
    variance.kt     =   oo_.var(kt_pos,kt_pos);
    variance.x1     =   oo_.var(x1_pos,x1_pos);
    variance.x2     =   oo_.var(x2_pos,x2_pos);
    variance.xt1    =   oo_.var(xt1_pos,xt1_pos);
    variance.it     =   oo_.var(it_pos,it_pos);

%get_consumption
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    options_old=options_;
    options_.nocorr=1;
    options_.noprint=1;
    lambda_unconditional_all=csolve('E5get_consumption_equivalent_unconditional_welfare',0,[],1e-6,1000);
    lambda_conditional_all=csolve('E4get_consumption_equivalent_conditional_welfare',lambda_unconditional_all,[],1e-6,1000);
    options_=options_old;


stoch_simul(order=2,pruning, nograph) pt ct kt x1 x2 xt1 it;

@#endif

@#endif