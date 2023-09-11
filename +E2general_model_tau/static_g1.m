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
    T = E2general_model_tau.static_g1_tt(T, y, x, params);
end
g1 = zeros(25, 25);
g1(1,16)=T(39)-params(1)*(1+y(20))*T(39);
g1(1,20)=(-(T(1)*params(1)));
g1(2,1)=(-(T(6)/T(7)*T(4)*T(2)*(params(4)-1)*params(9)*getPowerDeriv(y(1),params(4)/(1-params(4)),1)));
g1(2,4)=(-(T(5)*T(34)/T(7)));
g1(2,7)=(-(T(5)*(-(T(6)*T(38)))/(T(7)*T(7))));
g1(2,13)=(-(T(6)/T(7)*T(3)*getPowerDeriv(y(13),params(9)-1,1)));
g1(2,20)=1;
g1(3,1)=1;
g1(3,17)=(-(T(8)*1/T(2)*T(41)));
g1(3,25)=(-(T(41)*1/T(2)*y(17)*1/params(5)*(-1)/(1-params(11))));
g1(4,1)=(-((y(19)-1)*(1-y(25))/(1-params(11))*T(29)*T(30)));
g1(4,2)=getPowerDeriv(y(2),params(4)-1,1);
g1(4,19)=(-T(10));
g1(4,25)=(-((y(19)-1)*T(30)*T(9)*(-1)/(1-params(11))));
g1(5,1)=(-(T(11)*T(13)*T(12)*T(29)));
g1(5,2)=(-(T(11)*(T(31)-y(19)*T(31))));
g1(5,6)=(-(T(11)*T(13)*T(9)*1/y(7)*T(37)));
g1(5,7)=getPowerDeriv(y(7),params(3),1)-T(11)*T(13)*T(9)*T(37)*(-y(6))/(y(7)*y(7));
g1(5,19)=(-(T(11)*(-T(14))));
g1(6,2)=(-y(7));
g1(6,7)=(-y(2));
g1(6,15)=1;
g1(7,2)=(-(T(7)*(T(18)*T(16)*(-T(31))*getPowerDeriv(1-T(14),(-1),1)+T(17)*(-(getPowerDeriv(y(2),params(4)-1-params(3),1))))));
g1(7,3)=T(32);
g1(7,7)=(-(T(17)*T(18)*T(38)));
g1(8,4)=T(34);
g1(8,15)=(-(T(16)*getPowerDeriv(y(15),params(4)-1,1)));
g1(9,1)=(-((1-T(14))*T(15)));
g1(9,2)=(-(T(15)*y(1)*(-T(31))+T(6)*T(31)));
g1(9,3)=(-(y(1)*(1-T(14))*T(32)));
g1(9,4)=(-(T(14)*T(34)));
g1(9,5)=getPowerDeriv(y(5),params(4)-1,1);
g1(10,1)=(-(T(15)*(1-params(11))*(1-T(14))));
g1(10,2)=(-(T(15)*y(1)*(1-params(11))*(-T(31))+T(6)*(1-y(25))*T(31)));
g1(10,3)=(-((1-T(14))*y(1)*(1-params(11))*T(32)));
g1(10,4)=(-((1-y(25))*T(14)*T(34)));
g1(10,6)=getPowerDeriv(y(6),params(4)-1,1);
g1(10,25)=(-(T(6)*(-T(14))));
g1(11,11)=(-1);
g1(11,12)=1;
g1(11,13)=(-1);
g1(11,16)=(-1);
g1(12,2)=(-(T(19)*y(25)*y(12)*T(31)));
g1(12,4)=(-(T(14)*y(25)*y(12)*1/y(5)*T(35)));
g1(12,5)=(-(T(14)*y(25)*y(12)*T(35)*(-y(4))/(y(5)*y(5))));
g1(12,10)=1;
g1(12,12)=(-(T(19)*y(25)*T(14)));
g1(12,25)=(-(T(19)*T(14)*y(12)));
g1(13,1)=(-(T(20)*(1-T(14))*params(11)*y(12)));
g1(13,2)=(-(T(20)*y(1)*params(11)*y(12)*(-T(31))));
g1(13,3)=(-((1-T(14))*y(1)*params(11)*y(12)*1/y(5)*T(33)));
g1(13,5)=(-((1-T(14))*y(1)*params(11)*y(12)*T(33)*(-y(3))/(y(5)*y(5))));
g1(13,11)=1;
g1(13,12)=(-(T(20)*(1-T(14))*y(1)*params(11)));
g1(14,1)=(-((1-params(11))*y(8)*y(12)/params(4)*T(22)));
g1(14,5)=(-(T(21)*(-y(7))/(y(5)*y(5))*T(36)));
g1(14,7)=(-(T(21)*1/y(5)*T(36)));
g1(14,8)=(-(T(22)*y(1)*(1-params(11))*y(12)/params(4)));
g1(14,9)=1;
g1(14,12)=(-(T(22)*y(1)*y(8)*(1-params(11))/params(4)));
g1(15,2)=(-(y(9)*y(19)*T(31)/y(8)));
g1(15,8)=(-((-(y(19)*T(14)*y(9)))/(y(8)*y(8))));
g1(15,9)=(-(y(19)*T(14)/y(8)));
g1(15,10)=(-1);
g1(15,13)=1;
g1(15,19)=(-(T(14)*y(9)/y(8)));
g1(16,7)=(-(T(25)*(-T(38))/(T(7)*T(7))));
g1(16,8)=getPowerDeriv(y(8),params(4),1);
g1(16,12)=(-(1/T(7)*T(24)*(-(params(4)*(1-params(11))))/((1-params(11))*y(12)*(1-params(11))*y(12))));
g1(16,13)=(-(1/T(7)*params(4)/((1-params(11))*y(12))*T(2)*(params(4)-1)*(1-params(11))*getPowerDeriv(y(13),params(9),1)/params(4)*getPowerDeriv(T(23),1-params(4),1)));
g1(17,2)=T(31);
g1(17,14)=1;
g1(18,17)=1;
g1(18,18)=(-exp(y(18)));
g1(19,18)=1-params(32);
g1(20,19)=1-params(33);
g1(21,13)=(-(T(27)*params(12)*1/params(25)*getPowerDeriv(y(13)/params(25),params(39),1)));
g1(21,15)=(-(T(26)*1/params(27)*getPowerDeriv(y(15)/params(27),params(40),1)));
g1(21,25)=1;
g1(22,16)=T(40);
g1(22,22)=1;
g1(23,16)=T(40);
g1(23,21)=1-params(1);
g1(24,23)=1;
g1(25,21)=(-1);
g1(25,23)=1;
g1(25,24)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
