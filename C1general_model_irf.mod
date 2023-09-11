% el gobierno gasta los impuestos corrientes para proveer instalar capital p�blico para el periodo siguiente.
% las formales que entran en el presente gozan de la contribuci�n de las firmas del d�a de ayer

var

Ft ht xi xf xt xt1 x1 pt mt Tt lt qt kt it x2 ct At at ft rt

;

%predetermined_variables Kt;

varexo e_a e_f;
parameters

sigma beta

alpha epsilon wf ff fe theta E xm

rho t

Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs A a rss

rho_a rho_f

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
%set_param_value('rho_a',rho_a);
%set_param_value('rho_f',rho_f);

A=1;
a=0;
sigma=2;
rho_a=0.95;
rho_f=0.95;
rss=(E/(ks*100))*(epsilon/(1-rho))*Fs^(-1)*(xts/x1s)^(epsilon-1);
beta=1/(1+rss);

model;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EL MODELO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1. euler

ct(-1)^(-sigma)=beta*(1+rt(-1))*(ct^(-sigma)*(pt(-1)/pt)); 

rt=(E/(kt*100))*(epsilon/(1-rho))*Ft^(-1)*(xt/x1)^(epsilon-1);

%2. factor: variable auxiliar repetible (para simplificar)

Ft=((1/wf)*((1-t)/(1-rho))*At*(1/(1-theta)^E))^(1-epsilon);

%3. multiplicador de productividad m�nima formal respecto a la m�nima informal

ht^(epsilon-1)=(ft-1)*(((1-t)/(1-rho))*Ft^(-1)-1)^(-1);

%4. cut-off de productividad m�nima de producci�n de equilibrio (ZCP y FE)

x1^(alpha)=((xm^(alpha))/fe)*(Ft^(-1)*(xt1/x1)^(epsilon-1)*(1/(1-rho))-(1-ht^(-alpha))-ft*ht^(-alpha));

%5. cut-off de productividad m�nima formal

x2=ht*x1;

%6. productividad promedio del sector informal

xi^(epsilon-1)=(alpha/(alpha+1-epsilon))*(1-ht^(-alpha))^(-1)*(1-ht^(epsilon-1-alpha))*x1^(epsilon-1);

%7. productividad promedio del sector formal

xf^(epsilon-1)=(alpha/(alpha+1-epsilon))*x2^(epsilon-1);

%8. productividad agregada de la econom�a

xt^(epsilon-1)=Ft*(1-ht^(-alpha))*xi^(epsilon-1)+ht^(-alpha)*xf^(epsilon-1);

%9. productividad de la firma promedio de la econom�a: productividad promedio.

xt1^(epsilon-1)=(1-rho)*Ft*(1-ht^(-alpha))*xi^(epsilon-1)+(1-t)*ht^(-alpha)*xf^(epsilon-1);

%10. demanda interna: consumo+inversi�n de bien p�blico+recursos gastados en castigar a las informales

qt=ct+kt+lt;

%11. recaudaci�n de impuestos

Tt=t*qt*ht^(-alpha)*(xf/xt)^(epsilon-1);

%12. recaudaci�n por castigo de firmas informales

lt=rho*qt*Ft*(1-ht^(-alpha))*(xi/xt)^(epsilon-1);

%13. cantidad de firmas

mt=(pt*qt*(1-rho)/epsilon)*Ft*(x1/xt)^(epsilon-1);

%14. inversi�n en bien p�blico por parte del gobierno, 
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

end;
steady;
check(qz_zero_threshold=1e-25);

shocks;
var e_a=1e-5;
var e_f=1e-5;
end;

    stoch_simul(order=1,periods=1000,irf = 30, nograph) pt ct kt x1 x2 xt1 it mt;

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


