function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = C1general_model_irf.static_g1_tt(T, y, x, params);
end
g1 = zeros(20, 20);
g1(1,16)=T(35)-params(2)*(1+y(20))*T(35);
g1(1,20)=(-(T(1)*params(2)));
g1(2,1)=(-(T(4)*T(2)*T(25)));
g1(2,5)=(-(T(2)*T(3)*1/y(7)*T(31)));
g1(2,7)=(-(T(2)*T(3)*T(31)*(-y(5))/(y(7)*y(7))));
g1(2,13)=(-(T(4)*T(3)*params(4)/(1-params(11))*(-(params(9)*100))/(y(13)*100*y(13)*100)));
g1(2,20)=1;
g1(3,1)=1;
g1(3,17)=(-(T(5)*1/T(6)*getPowerDeriv(T(5)*y(17)*1/T(6),1-params(4),1)));
g1(4,1)=(-((y(19)-1)*(1-params(12))/(1-params(11))*T(25)*getPowerDeriv(T(3)*(1-params(12))/(1-params(11))-1,(-1),1)));
g1(4,2)=getPowerDeriv(y(2),params(4)-1,1);
g1(4,19)=(-T(7));
g1(5,1)=(-(T(8)*T(10)*T(9)*T(25)));
g1(5,2)=(-(T(8)*(T(26)-y(19)*T(26))));
g1(5,6)=(-(T(8)*T(10)*T(3)*1/y(7)*T(33)));
g1(5,7)=getPowerDeriv(y(7),params(3),1)-T(8)*T(10)*T(3)*T(33)*(-y(6))/(y(7)*y(7));
g1(5,19)=(-(T(8)*(-T(11))));
g1(6,2)=(-y(7));
g1(6,7)=(-y(2));
g1(6,15)=1;
g1(7,2)=(-(T(16)*(T(15)*T(13)*(-T(26))*getPowerDeriv(1-T(11),(-1),1)+T(14)*(-(getPowerDeriv(y(2),params(4)-1-params(3),1))))));
g1(7,3)=T(27);
g1(7,7)=(-(T(14)*T(15)*T(34)));
g1(8,4)=T(29);
g1(8,15)=(-(T(13)*getPowerDeriv(y(15),params(4)-1,1)));
g1(9,1)=(-((1-T(11))*T(12)));
g1(9,2)=(-(T(12)*y(1)*(-T(26))+T(17)*T(26)));
g1(9,3)=(-(y(1)*(1-T(11))*T(27)));
g1(9,4)=(-(T(11)*T(29)));
g1(9,5)=getPowerDeriv(y(5),params(4)-1,1);
g1(10,1)=(-(T(12)*(1-params(11))*(1-T(11))));
g1(10,2)=(-(T(12)*(1-params(11))*y(1)*(-T(26))+T(17)*(1-params(12))*T(26)));
g1(10,3)=(-((1-T(11))*(1-params(11))*y(1)*T(27)));
g1(10,4)=(-((1-params(12))*T(11)*T(29)));
g1(10,6)=getPowerDeriv(y(6),params(4)-1,1);
g1(11,11)=(-1);
g1(11,12)=1;
g1(11,13)=(-1);
g1(11,16)=(-1);
g1(12,2)=(-(T(18)*params(12)*y(12)*T(26)));
g1(12,4)=(-(T(11)*params(12)*y(12)*1/y(5)*T(30)));
g1(12,5)=(-(T(11)*params(12)*y(12)*T(30)*(-y(4))/(y(5)*y(5))));
g1(12,10)=1;
g1(12,12)=(-(T(18)*params(12)*T(11)));
g1(13,1)=(-(T(19)*(1-T(11))*params(11)*y(12)));
g1(13,2)=(-(T(19)*y(1)*params(11)*y(12)*(-T(26))));
g1(13,3)=(-((1-T(11))*y(1)*params(11)*y(12)*1/y(5)*T(28)));
g1(13,5)=(-((1-T(11))*y(1)*params(11)*y(12)*T(28)*(-y(3))/(y(5)*y(5))));
g1(13,11)=1;
g1(13,12)=(-(T(19)*(1-T(11))*params(11)*y(1)));
g1(14,1)=(-((1-params(11))*y(8)*y(12)/params(4)*T(21)));
g1(14,5)=(-(T(20)*(-y(7))/(y(5)*y(5))*T(32)));
g1(14,7)=(-(T(20)*1/y(5)*T(32)));
g1(14,8)=(-(T(21)*y(1)*(1-params(11))*y(12)/params(4)));
g1(14,9)=1;
g1(14,12)=(-(T(21)*y(1)*y(8)*(1-params(11))/params(4)));
g1(15,2)=(-(y(9)*y(19)*T(26)/y(8)));
g1(15,8)=(-((-(y(19)*T(11)*y(9)))/(y(8)*y(8))));
g1(15,9)=(-(y(19)*T(11)/y(8)));
g1(15,10)=(-1);
g1(15,13)=1;
g1(15,19)=(-(T(11)*y(9)/y(8)));
g1(16,7)=(-(T(24)*(-T(34))/(T(16)*T(16))));
g1(16,8)=getPowerDeriv(y(8),params(4),1);
g1(16,12)=(-(1/T(16)*T(23)*(-(params(4)*(1-params(11))))/((1-params(11))*y(12)*(1-params(11))*y(12))));
g1(16,13)=(-(1/T(16)*params(4)/((1-params(11))*y(12))*T(6)*(1-params(11))*(params(4)-1)*getPowerDeriv(y(13),params(9),1)/params(4)*getPowerDeriv(T(22),1-params(4),1)));
g1(17,2)=T(26);
g1(17,14)=1;
g1(18,17)=1;
g1(18,18)=(-exp(y(18)));
g1(19,18)=1-params(32);
g1(20,19)=1-params(33);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
