%% 0. 
clc
clear all
all_data=xlsread('z_datos_oficiales.xlsx');
dim=size(all_data);

%%paíces
country={'PANAMA';'BRASIL';'INDONESIA';'PERU';'UK'};
E=0.35;

    i=4; %perú
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
    
    % yti y nti
    
    factorx=((1/wf)*((1-t)/(1-rho))*(1/(1-theta)^E));
    yi=factorx^(1-epsilon)*((1-H2^(-alpha))/(H2^(-alpha)))*xi/xf;
    ni=(1/(1-theta)^E)*factorx^(-epsilon)*((1-H2^(-alpha))/(H2^(-alpha)))*xi/xf;
    
    % guardando parámetros y valores de estado estacionario (re-etiquetados, conforme a los del dynare)
    Fs=factor;
    hs=H2;
    xis=xi^(1/(epsilon-1))*x1;
    xfs=xf^(1/(epsilon-1))*x1;
    xts=xt^(1/(epsilon-1))*x1;
    xt1s=xt1^(1/(epsilon-1))*x1;
    x1s=x1;
    ps=p;
    ms=m;
    Ts=T;
    ls=l2;
    qs=Q;
    ks=k3;
    is=1-H2^(-alpha);
    x2s=x2;
    cs=Tc;
    
    save PARAM_PER ff wf theta epsilon alpha t rho E fe xm Fs hs xis xfs xts xt1s x1s ps ms Ts ls qs ks is x2s cs
    
    %% plot beneficios perú
    x=xm:0.01:1.5;
    pi_i=((1-rho)/epsilon)*((epsilon)/((epsilon-1)*(1-rho)*((1-theta)*k3)^(E)))^(1-epsilon)*(Q/p^(-epsilon))*x.^(epsilon-1)-1;
    pi_f=((1-t)/epsilon)*((epsilon*wf)/((epsilon-1)*(1-t)*(k3)^(E)))^(1-epsilon)*(Q/p^(-epsilon))*x.^(epsilon-1)-ff;
    
    figure
    
    a1=plot(x,pi_i,'b');
    
    hold on
    
    a2=plot(x,pi_f,'r');
    a3=yline(0);
    a4=xline(x1,'--bs');
    a5=xline(x2,'--rs');
    
    t1='Beneficios en los cut-off';
    t2='$\pi$($\varphi$)';
    t3='$\varphi$';

    title(t1,'interpreter','latex')
    ylabel(t2,'interpreter','latex')
    xlabel(t3,'interpreter','latex')
    %country={'PANAMA';'BRASIL';'INDONESIA';'PERU';'UK'}
    legend([a1 a2 a4 a5],'informal','formal','cut-off informal','cut-off formal')
    hold off

    %% plot ZCP y FE perú
    x=xm:0.01:1.5;
    rf1=(factor^(-1))*(xt)*epsilon/(1-rho);
    rf2=epsilon*(xt/xt1)*(fe*(x./xm).^(alpha)+(1-H2^(-alpha))+H2^(-alpha)*ff);
    
    figure
    
    a1=plot(x,rf2,'r');
    a2=yline(rf1,'b');
    a3=xline(x1,'--bs');
    a4=xline(x2,'--rs');
    
    t1='Unicidad del cut-off';
    t2='r($\varphi$)';
    t3='$\varphi$';

    title(t1,'interpreter','latex')
    ylabel(t2,'interpreter','latex')
    xlabel(t3,'interpreter','latex')
    %country={'PANAMA';'BRASIL';'INDONESIA';'PERU';'UK'}
    legend([a1 a2 a3 a4],'ZCP','FE','cut-off informal','cut-off formal')