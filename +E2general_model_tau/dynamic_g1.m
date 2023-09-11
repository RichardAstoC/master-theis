function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = E2general_model_tau.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(25, 35);
g1(1,1)=(-(params(1)*(1+y(5))*T(1)*1/y(13)));
g1(1,13)=(-(params(1)*(1+y(5))*T(1)*(-y(1))/(y(13)*y(13))));
g1(1,2)=getPowerDeriv(y(2),(-params(2)),1);
g1(1,21)=(-(params(1)*(1+y(5))*y(1)/y(13)*T(64)));
g1(1,5)=(-(params(1)*T(1)*y(1)/y(13)));
g1(2,6)=(-(T(8)*T(35)));
g1(2,9)=(-(T(5)*T(45)/T(7)));
g1(2,12)=(-(T(5)*T(54)));
g1(2,18)=(-(T(8)*T(3)*T(57)));
g1(2,25)=1;
g1(3,6)=1;
g1(3,22)=(-(T(10)*T(11)*T(66)));
g1(3,30)=(-(T(66)*T(11)*y(22)*T(67)));
g1(4,6)=(-((y(24)-1)*T(9)*T(36)*T(37)));
g1(4,7)=getPowerDeriv(y(7),params(4)-1,1);
g1(4,24)=(-T(13));
g1(4,30)=(-((y(24)-1)*T(37)*T(68)));
g1(5,6)=(-(T(14)*T(16)*T(15)*T(36)));
g1(5,7)=(-(T(14)*(T(38)-y(24)*T(38))));
g1(5,11)=(-(T(14)*T(16)*T(12)*T(51)*T(52)));
g1(5,12)=getPowerDeriv(y(12),params(3),1)-T(14)*T(16)*T(12)*T(52)*(-y(11))/(y(12)*y(12));
g1(5,24)=(-(T(14)*(-T(17))));
g1(6,7)=(-y(12));
g1(6,12)=(-y(7));
g1(6,20)=1;
g1(7,7)=(-(T(7)*(T(21)*T(40)+T(20)*T(41))));
g1(7,8)=T(42);
g1(7,12)=(-(T(20)*T(21)*T(53)));
g1(8,9)=T(45);
g1(8,20)=(-(T(19)*getPowerDeriv(y(20),params(4)-1,1)));
g1(9,6)=(-((1-T(17))*T(18)));
g1(9,7)=(-(T(18)*y(6)*(-T(38))+T(6)*T(38)));
g1(9,8)=(-(y(6)*(1-T(17))*T(42)));
g1(9,9)=(-(T(17)*T(45)));
g1(9,10)=getPowerDeriv(y(10),params(4)-1,1);
g1(10,6)=(-(T(18)*(1-params(11))*(1-T(17))));
g1(10,7)=(-(T(18)*y(6)*(1-params(11))*(-T(38))+T(6)*(1-y(30))*T(38)));
g1(10,8)=(-((1-T(17))*y(6)*(1-params(11))*T(42)));
g1(10,9)=(-((1-y(30))*T(17)*T(45)));
g1(10,11)=getPowerDeriv(y(11),params(4)-1,1);
g1(10,30)=(-(T(6)*(-T(17))));
g1(11,16)=(-1);
g1(11,17)=1;
g1(11,18)=(-1);
g1(11,21)=(-1);
g1(12,7)=(-(T(22)*y(30)*y(17)*T(38)));
g1(12,9)=(-(T(17)*y(30)*y(17)*T(43)*T(46)));
g1(12,10)=(-(T(17)*y(30)*y(17)*T(47)));
g1(12,15)=1;
g1(12,17)=(-(T(22)*y(30)*T(17)));
g1(12,30)=(-(T(22)*T(17)*y(17)));
g1(13,6)=(-(T(23)*(1-T(17))*params(11)*y(17)));
g1(13,7)=(-(T(23)*y(6)*params(11)*y(17)*(-T(38))));
g1(13,8)=(-((1-T(17))*y(6)*params(11)*y(17)*T(43)*T(44)));
g1(13,10)=(-((1-T(17))*y(6)*params(11)*y(17)*T(48)));
g1(13,16)=1;
g1(13,17)=(-(T(23)*(1-T(17))*y(6)*params(11)));
g1(14,6)=(-(T(24)*T(26)));
g1(14,10)=(-(T(25)*T(49)*T(50)));
g1(14,12)=(-(T(25)*T(43)*T(50)));
g1(14,13)=(-(T(26)*T(55)));
g1(14,14)=1;
g1(14,17)=(-(T(26)*T(56)));
g1(15,7)=(-(y(14)*y(24)*T(38)/y(13)));
g1(15,13)=(-((-(y(24)*T(17)*y(14)))/(y(13)*y(13))));
g1(15,14)=(-(y(24)*T(17)/y(13)));
g1(15,15)=(-1);
g1(15,18)=1;
g1(15,24)=(-(T(17)*y(14)/y(13)));
g1(16,12)=(-(T(29)*(-T(53))/(T(7)*T(7))));
g1(16,13)=getPowerDeriv(y(13),params(4),1);
g1(16,17)=(-(T(30)*T(28)*(-(params(4)*(1-params(11))))/((1-params(11))*y(17)*(1-params(11))*y(17))));
g1(16,18)=(-(T(30)*T(61)));
g1(17,7)=T(38);
g1(17,19)=1;
g1(18,22)=1;
g1(18,23)=(-exp(y(23)));
g1(19,3)=(-params(32));
g1(19,23)=1;
g1(19,34)=(-1);
g1(20,4)=(-params(33));
g1(20,24)=1;
g1(20,35)=(-1);
g1(21,31)=(-(T(32)*T(62)));
g1(21,32)=(-(T(31)*T(63)));
g1(21,30)=1;
g1(22,21)=T(65);
g1(22,27)=1;
g1(23,21)=T(65);
g1(23,26)=1;
g1(23,33)=(-params(1));
g1(24,28)=1;
g1(25,26)=(-1);
g1(25,28)=1;
g1(25,29)=1;

end
