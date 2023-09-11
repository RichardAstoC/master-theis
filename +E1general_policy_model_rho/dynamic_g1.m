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
    T = E1general_policy_model_rho.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(25, 33);
g1(1,1)=(-(params(1)*(1+y(5))*T(1)*1/y(13)));
g1(1,13)=(-(params(1)*(1+y(5))*T(1)*(-y(1))/(y(13)*y(13))));
g1(1,2)=getPowerDeriv(y(2),(-params(2)),1);
g1(1,21)=(-(params(1)*(1+y(5))*y(1)/y(13)*T(62)));
g1(1,5)=(-(params(1)*T(1)*y(1)/y(13)));
g1(2,6)=(-(T(4)*T(2)*T(32)));
g1(2,10)=(-(T(2)*T(3)*T(43)*T(44)));
g1(2,12)=(-(T(2)*T(3)*T(50)));
g1(2,18)=(-(T(4)*T(3)*T(56)));
g1(2,25)=1;
g1(2,30)=(-(T(4)*T(3)*T(65)));
g1(3,6)=1;
g1(3,22)=(-(T(6)*T(8)*T(64)));
g1(3,30)=(-(T(64)*T(8)*y(22)*T(67)));
g1(4,6)=(-((y(24)-1)*T(5)*T(32)*T(33)));
g1(4,7)=getPowerDeriv(y(7),params(4)-1,1);
g1(4,24)=(-T(9));
g1(4,30)=(-((y(24)-1)*T(33)*T(3)*T(66)));
g1(5,6)=(-(T(10)*T(12)*T(11)*T(32)));
g1(5,7)=(-(T(10)*(T(34)-y(24)*T(34))));
g1(5,11)=(-(T(10)*T(12)*T(3)*T(43)*T(49)));
g1(5,12)=getPowerDeriv(y(12),params(3),1)-T(10)*T(12)*T(3)*T(49)*(-y(11))/(y(12)*y(12));
g1(5,24)=(-(T(10)*(-T(13))));
g1(5,30)=(-(T(10)*T(3)*T(11)*T(68)));
g1(6,7)=(-y(12));
g1(6,12)=(-y(7));
g1(6,20)=1;
g1(7,7)=(-(T(18)*(T(17)*T(36)+T(16)*T(37))));
g1(7,8)=T(38);
g1(7,12)=(-(T(16)*T(17)*T(51)));
g1(8,9)=T(41);
g1(8,20)=(-(T(15)*getPowerDeriv(y(20),params(4)-1,1)));
g1(9,6)=(-((1-T(13))*T(14)));
g1(9,7)=(-(T(14)*y(6)*(-T(34))+T(19)*T(34)));
g1(9,8)=(-(y(6)*(1-T(13))*T(38)));
g1(9,9)=(-(T(13)*T(41)));
g1(9,10)=getPowerDeriv(y(10),params(4)-1,1);
g1(10,6)=(-(T(14)*(1-y(30))*(1-T(13))));
g1(10,7)=(-(T(14)*(1-y(30))*y(6)*(-T(34))+T(19)*(1-params(12))*T(34)));
g1(10,8)=(-((1-T(13))*(1-y(30))*y(6)*T(38)));
g1(10,9)=(-((1-params(12))*T(13)*T(41)));
g1(10,11)=getPowerDeriv(y(11),params(4)-1,1);
g1(10,30)=(-(T(14)*(1-T(13))*(-y(6))));
g1(11,16)=(-1);
g1(11,17)=1;
g1(11,18)=(-1);
g1(11,21)=(-1);
g1(12,7)=(-(T(20)*params(12)*y(17)*T(34)));
g1(12,9)=(-(T(13)*params(12)*y(17)*T(39)*T(42)));
g1(12,10)=(-(T(13)*params(12)*y(17)*T(45)));
g1(12,15)=1;
g1(12,17)=(-(T(20)*params(12)*T(13)));
g1(13,6)=(-(T(21)*(1-T(13))*y(30)*y(17)));
g1(13,7)=(-(T(21)*y(6)*y(30)*y(17)*(-T(34))));
g1(13,8)=(-((1-T(13))*y(6)*y(30)*y(17)*T(39)*T(40)));
g1(13,10)=(-((1-T(13))*y(6)*y(30)*y(17)*T(46)));
g1(13,16)=1;
g1(13,17)=(-(T(21)*(1-T(13))*y(30)*y(6)));
g1(13,30)=(-(T(21)*(1-T(13))*y(6)*y(17)));
g1(14,6)=(-(T(22)*T(24)));
g1(14,10)=(-(T(23)*T(47)*T(48)));
g1(14,12)=(-(T(23)*T(39)*T(48)));
g1(14,13)=(-(T(24)*T(53)));
g1(14,14)=1;
g1(14,17)=(-(T(24)*T(54)));
g1(14,30)=(-(T(24)*T(69)));
g1(15,7)=(-(y(14)*y(24)*T(34)/y(13)));
g1(15,13)=(-((-(y(24)*T(13)*y(14)))/(y(13)*y(13))));
g1(15,14)=(-(y(24)*T(13)/y(13)));
g1(15,15)=(-1);
g1(15,18)=1;
g1(15,24)=(-(T(13)*y(14)/y(13)));
g1(16,12)=(-(T(29)*T(52)));
g1(16,13)=getPowerDeriv(y(13),params(4),1);
g1(16,17)=(-(T(30)*T(28)*T(55)));
g1(16,18)=(-(T(30)*T(61)));
g1(16,30)=(-(T(30)*T(73)));
g1(17,7)=T(34);
g1(17,19)=1;
g1(18,22)=1;
g1(18,23)=(-exp(y(23)));
g1(19,3)=(-params(32));
g1(19,23)=1;
g1(19,32)=(-1);
g1(20,4)=(-params(33));
g1(20,24)=1;
g1(20,33)=(-1);
g1(21,21)=(-(params(11)*1/params(28)*getPowerDeriv(y(21)/params(28),params(39),1)));
g1(21,30)=1;
g1(22,21)=T(63);
g1(22,27)=1;
g1(23,21)=T(63);
g1(23,26)=1;
g1(23,31)=(-params(1));
g1(24,28)=1;
g1(25,26)=(-1);
g1(25,28)=1;
g1(25,29)=1;

end
