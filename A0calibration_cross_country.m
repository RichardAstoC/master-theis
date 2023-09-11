%% 0. 
clc
clear all
all_data=xlsread('z_datos_oficiales.xlsx');
dim=size(all_data);
% matrices
xmdf=[];
thetadf=[];
f_fidf=[];
wf_widf=[];
ivadf=[];
alphadf=[];
epsilondf=[];
promediodf=[];
rankingdf=[];
%%paíces
country={'PANAMA';'BRASIL';'INDONESIA';'PERU';'UK'};
E=0.35;
% 1. TARGETS A CALIBRAR, EXCEPTO Tc, para cada país
for i=1:5

%i=6;
    t=all_data(i,1);
    Tg=all_data(i,2);
    Ty=all_data(i,3);
    Tn=all_data(i,4);
    Tc=all_data(i,5);
    Ti=all_data(i,6);
    fe=all_data(i,7);
    alpha=all_data(i,8);
    epsilon=all_data(i,9);
    rho=all_data(i,10);
    
    % estacionario
    laT=(rho*Ty/(1+Ty-rho*Ty))*(Tg+Tc);
    QT=(Tc+Tg+laT);
    TT=t*QT/(1+Ty);
    
    %syms alphax
    %qns=[alphax==(QT/(Tg-TT))*((1-rho)/epsilon)*(Ty/(1+Ty))*((1-Ti)/(1-((1-Ti)^(-1/alphax))^(epsilon-1-alphax)))*(alphax+1-epsilon)*(1+((1-Ti)^(-1/alphax))^(epsilon-1)*(((1-t)/(1-rho))*((((1-Ti)^(-1/alphax))^(alphax+1-epsilon)-1)/Ty)-1))]
    %SOL=vpasolve(qns,alphax);
    %alpha=double(SOL.alphax);
    %calibrados
    wf=((1-t)/(1-rho))*Tn/Ty;
    H=(1-Ti)^(-1/alpha);
    gti=(1/Tn)*Ty^(epsilon/(epsilon-1))*(H^(alpha+1-epsilon)-1)^(-1/(epsilon-1));
    theta=1-gti^(1/E);
    ff=1+H^(epsilon-1)*(((1-t)/(1-rho))*((H^(alpha+1-epsilon)-1)/Ty)-1);
    
    xmax=((H^(alpha+1-epsilon)-1)/H^(alpha+1-epsilon))^(1/alpha)*(alpha/(alpha+1-epsilon))^(1/alpha)*(((1-t)+(1-rho)*Ty)/((1-rho)*Ty))^(1/alpha)*(ff*H^(-alpha)+(1-H^(-alpha)))^(-1/alpha);
    %xm=((Tg-Tt)/Q)^(1/alpha)*((1+Ty)/Ty)^(1/alpha)*((1-H^(epsilon-1-alpha))/H^(-alpha))^(1/alpha)*(epsilon/(ff*(1-rho)))^(1/alpha)*(alpha/(alpha+1-epsilon))^(1/alpha);
    xm=0.5*xmax;
    %estado estacionario
    H2=(ff-1)^(1/(epsilon-1))*(((1-t)/(1-rho))*(wf*((1-rho)/(1-t))*(1-theta)^E)^(1-epsilon)-1)^(-1/(epsilon-1));
    xi=(alpha/(alpha+1-epsilon))*(1-H2^(-alpha))^(-1)*(1-H2^(epsilon-1-alpha));
    xf=(alpha/(alpha+1-epsilon))*H2^(epsilon-1);
    factor=((1/wf)*((1-t)/(1-rho))*(1/(1-theta)^E))^(1-epsilon);
    xt=(alpha/(alpha+1-epsilon))*(factor*(1-H2^(epsilon-1-alpha))+H2^(epsilon-1-alpha));
    xt1=(alpha/(alpha+1-epsilon))*((1-rho)*factor*(1-H2^(epsilon-1-alpha))+(1-t)*H2^(epsilon-1-alpha));
    factor2=(factor^(-1)*xt1/(1-rho))-(1-H2^(-alpha))-H2^(-alpha)*ff;
    x1=xm*(factor2/fe)^(1/alpha);
    x2=H2*x1;
    rf1=(factor^(-1))*(xt)*epsilon/(1-rho);
    rf2=epsilon*(xt/xt1)*(fe*(x1/xm)^(alpha)+(1-H2^(-alpha))+H2^(-alpha)*ff);
    
    %
    a1=t*H2^(-alpha)*(xf/xt)+H2^(-alpha)*ff*(1-rho)*(1/(epsilon*xt))*(factor)+rho*factor*(1-H2^(-alpha))*(xi/xt);
    Q=(1/(1-a1))*Tc;
    kt=(t*H2^(-alpha)*(xf/xt)+H2^(-alpha)*ff*(1-rho)*(1/(epsilon*xt))*(factor))*Q;
    l2=rho*factor*(1-H2^(-alpha))*(xi/xt)*Q;
    T=t*Q*H2^(-alpha)*xf/xt;
    
    p=(epsilon/(Q*(1-rho)))^(1/(epsilon))*(((epsilon-1)*(1-rho)*((1-theta)*kt)^E)/(epsilon))^((1-epsilon)/epsilon)*x1^((1-epsilon)/epsilon);
    m=(p*Q/epsilon)*factor*(1-rho)*(1/xt);
    
    k3=T+(H2^(-alpha)*ff*m/p);
    
    Qt=(epsilon/((1-rho)*p^(epsilon)))*(((epsilon-1)*(1-rho)*((1-theta)*k3)^E)/(epsilon))^(1-epsilon)*x1^(1-epsilon);
    
    %beneficios
    
    pi_ii=((1-rho)/epsilon)*((epsilon)/((epsilon-1)*(1-rho)*((1-theta)*k3)^(E)))^(1-epsilon)*(Q/p^(-epsilon))*x1^(epsilon-1)-1;
    pi_f=((1-t)/epsilon)*((epsilon*wf)/((epsilon-1)*(1-t)*(k3)^(E)))^(1-epsilon)*(Q/p^(-epsilon))*x2^(epsilon-1)-ff;
    pi_if=((1-rho)/epsilon)*((epsilon)/((epsilon-1)*(1-rho)*((1-theta)*k3)^(E)))^(1-epsilon)*(Q/p^(-epsilon))*x2^(epsilon-1)-1;
    
    % guardando parámetros
    
    xmdf(i)=xm;
    thetadf(i)=theta;
    f_fidf(i)=ff;
    wf_widf(i)=wf;
    ivadf(i)=t;
    alphadf(i)=alpha;
    epsilondf(i)=epsilon;
    promediodf(i)=xt1^(1/(epsilon-1))*x1;
    rankingdf(i)=fe;
    
    if abs(rf1-rf2)<1e-14  && abs(pi_ii)<1e-14 &&  abs(pi_f-pi_if)<1e-13
        
        disp('perfectamente equilibrado')
        
    else
        disp('perfectamente des-equilibrado')
    end

end

%%  
xmt=transpose(xmdf);
theta=transpose(thetadf);
f_fi=transpose(f_fidf);
wf_wi=transpose(wf_widf);
epsilon=transpose(epsilondf);
alpha=transpose(alphadf);
iva=transpose(ivadf);
media=transpose(promediodf);
fee=transpose(rankingdf);

T=table(country,iva,fee,f_fi,theta,wf_wi,epsilon,alpha,media);

A=table2latex(T) ;

%% plot productividad
figure

x=xmt(1):0.01:1.5;

cum1=1-(xmt(1)./x).^(alpha(1));
cum2=1-(xmt(2)./x).^(alpha(2));
cum3=1-(xmt(3)./x).^(alpha(3));
cum4=1-(xmt(4)./x).^(alpha(4));
cum5=1-(xmt(5)./x).^(alpha(5));

plot(x,cum1,'r')
hold on

plot(x,cum2,'--r')
hold on

plot(x,cum3,'--b')
hold on

plot(x,cum4,':r')
hold on

plot(x,cum5,'b')

a1=xline(media(1),'r');
a2=xline(media(2),'--r');
a3=xline(media(3),'--b');
a4=xline(media(4),':r');
a5=xline(media(5),'b');

t1='diferencia cross-country: $\frac{f_{f}}{f_{i}}$, $\frac{w_{f}}{w_{i}}$, $\theta$, $\epsilon$ y $\alpha$';
t2='productividad: $\varphi$';
t3='G($\varphi$)';

title(t1,'interpreter','latex')
xlabel(t2,'interpreter','latex')
ylabel(t3,'interpreter','latex')
%country={'PANAMA';'BRASIL';'INDONESIA';'PERU';'UK'}
legend([a3 a2 a4 a1 a5],'IDN','BRA','PER','PAN','UK')