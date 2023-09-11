function [rho_star]= B1punisher_static_exercise_function(cntry,alpha,epsilon,wf,ff,fe,theta,t,E,xm,ms)

%params=strcat('PARAM_',cntry);
% 1. cargando parámetros para perú
%load(params)
% 2. bucle para la estática comparativa de tau

welfare=[];
informalidad=[];
impuesto=[];
capital=[];
x=[];


set=0:0.0001:1;

dim=size(set);

country=cntry;

for i=1:dim(2)
    
    rho=set(i);
    
    %disp(['rho= ',num2str(rho)])
    
    factor=((1/wf)*((1-t)/(1-rho))*(1/(1-theta)^E))^(1-epsilon);
    H2=(ff-1)^(1/(epsilon-1))*(((1-t)/(1-rho))*factor^(-1)-1)^(-1/(epsilon-1));
    
    if ((1-t)/(1-rho))*factor^(-1)-1>0 && H2>1
        
    disp(['rho= ', num2str(rho),' | ','H2= ', num2str(H2)])
    
    xi=(alpha/(alpha+1-epsilon))*(1-H2^(-alpha))^(-1)*(1-H2^(epsilon-1-alpha));
    xf=(alpha/(alpha+1-epsilon))*H2^(epsilon-1);
    
    xt=(alpha/(alpha+1-epsilon))*(factor*(1-H2^(epsilon-1-alpha))+H2^(epsilon-1-alpha));
    xt1=(alpha/(alpha+1-epsilon))*((1-rho)*factor*(1-H2^(epsilon-1-alpha))+(1-t)*H2^(epsilon-1-alpha));
    
    pi_prom=(factor^(-1)*xt1/(1-rho))-(1-H2^(-alpha))-H2^(-alpha)*ff;
    x1=xm*(pi_prom/fe)^(1/alpha);
    x2=H2*x1;
    
    %
    
    rf1=(factor^(-1))*(xt)*epsilon/(1-rho);
    rf2=epsilon*(xt/xt1)*(fe*(x1/xm)^(alpha)+(1-H2^(-alpha))+H2^(-alpha)*ff);
    
    % variables auxiliares
    a1=t*H2^(-alpha)*(xf/xt)+H2^(-alpha)*ff*(1-rho)*(1/(epsilon*xt))*(factor)+rho*factor*(1-H2^(-alpha))*(xi/xt);
    a2=a1-rho*factor*(1-H2^(-alpha))*(xi/xt);
    a3=(1/epsilon)*(epsilon/(1-rho))^(1/epsilon)*(((epsilon-1)*(1-rho)*((1-theta))^E)/(epsilon))^((1-epsilon)/epsilon)*(1-rho)*factor*(1/(xt*x1^((epsilon-1)/epsilon)));
    a4=(1-a1)^((1-E)*((epsilon-1)/epsilon))*a2^(E*((epsilon-1)/epsilon))*ms/a3;
    
    % resultados
    
    consumo=a4^(epsilon/((1-E)*(epsilon-1)));
    demanda=(1/(1-a1))*consumo;
    capit=a2*demanda;
    impuest=t*H2^(-alpha)*(xf/xt)*demanda;
    lambda=rho*factor*(1-H2^(-alpha))*(xi/xt)*demanda;
    
    % welfare, tasa de informalidad, impuestos y capital
    rss=(E/(capit*100))*(epsilon/(1-rho))*factor^(-1)*xt;
    beta=1/(1+rss);
    sigma=2;
    uc=((consumo^(1-sigma)-1)/(1-sigma));
    uk=((capit^(1-sigma)-1)/(1-sigma));
    welfare(i)=(1/(1-beta))*(uc);
    informalidad(i)=1-H2^(-alpha);
    impuesto(i)=impuest;
    capital(i)=capit;
    
    x(i)=rho;
    
    else
       continue 
    end
    
end
%% rango positivo
x1=x(find(x));
l=size(x1);
l1=l(2)-25;
x2=x1([1:l1]);

% welfare
w1=welfare(find(x));
w2=w1([1:l1]);

%impuesto

tau1=impuesto(find(x));
tau2=tau1([1:l1]);

%impuesto

cap1=capital(find(x));
cap2=tau1([1:l1]);

%impuesto

inf1=informalidad(find(x));
inf2=inf1([1:l1]);

%% plot

figure

subplot(2,2,1);
plot(x2,w2,'r--')

xlabel('castigo')
name=strcat(cntry,' - ',' welfare');
title(name)

subplot(2,2,2);
plot(x2,tau2,'b--')

xlabel('castigo')
title('recaudación')

subplot(2,2,3);
plot(x2,cap2,'b')

xlabel('castigo')
title('capital')

subplot(2,2,4);
plot(x2,inf2,'r')
xlabel('castigo')
title('tasa de informalidad')

%% calculando el valor óptimo de rho
maximun=find(w2==max(w2));
rho_star=x2(maximun);
end






