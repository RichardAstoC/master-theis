function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 79);

T = E1general_model_rho.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(36) = T(2)*(params(4)-1)*params(9)*getPowerDeriv(y(6),params(4)/(1-params(4)),1);
T(37) = T(4)*T(36);
T(38) = getPowerDeriv(y(6),(-1),1);
T(39) = getPowerDeriv(T(9)*T(12)-1,(-1),1);
T(40) = getPowerDeriv(y(7),(-params(3)),1);
T(41) = getPowerDeriv(1-T(17),(-1),1);
T(42) = T(19)*(-T(40))*T(41);
T(43) = (-(getPowerDeriv(y(7),params(4)-1-params(3),1)));
T(44) = getPowerDeriv(y(8),params(4)-1,1);
T(45) = 1/y(10);
T(46) = getPowerDeriv(y(8)/y(10),params(4)-1,1);
T(47) = getPowerDeriv(y(9),params(4)-1,1);
T(48) = getPowerDeriv(y(9)/y(10),params(4)-1,1);
T(49) = T(48)*(-y(9))/(y(10)*y(10));
T(50) = T(46)*(-y(8))/(y(10)*y(10));
T(51) = (-y(12))/(y(10)*y(10));
T(52) = getPowerDeriv(y(12)/y(10),params(4)-1,1);
T(53) = 1/y(12);
T(54) = getPowerDeriv(y(11)/y(12),params(4)-1,1);
T(55) = getPowerDeriv(y(12),params(4)-1,1);
T(56) = (-(T(6)*T(55)))/(T(7)*T(7));
T(57) = (-T(55))/(T(7)*T(7));
T(58) = y(6)*(1-y(30))*y(17)/params(4);
T(59) = y(6)*y(13)*(1-y(30))/params(4);
T(60) = (-(params(4)*(1-y(30))))/((1-y(30))*y(17)*(1-y(30))*y(17));
T(61) = getPowerDeriv(y(18),params(9)-1,1);
T(62) = getPowerDeriv(y(18),params(9),1);
T(63) = T(2)*(params(4)-1)*(1-y(30))*T(62)/params(4);
T(64) = getPowerDeriv(T(29),1-params(4),1);
T(65) = T(63)*T(64);
T(66) = T(27)*T(65);
T(67) = params(11)*1/params(25)*getPowerDeriv(y(31)/params(25),params(39),1);
T(68) = 1/params(27)*getPowerDeriv(y(32)/params(27),params(40),1);
T(69) = getPowerDeriv(y(21),(-params(2)),1);
T(70) = (-(getPowerDeriv(y(21),1-params(2),1)/(1-params(2))));
T(71) = getPowerDeriv(T(10)*y(22)*T(11),1-params(4),1);
T(72) = (1-params(12))/((1-y(30))*(1-y(30)));
T(73) = 1/params(5)*T(72);
T(74) = 1/((1-y(30))*(1-y(30)));
T(75) = y(6)*(-(y(13)*y(17)))/params(4);
T(76) = (-(params(4)*(-y(17))))/((1-y(30))*y(17)*(1-y(30))*y(17));
T(77) = T(28)*T(2)*(-(params(4)-1))/params(4);
T(78) = T(64)*T(77);
T(79) = T(30)*T(76)+T(27)*T(78);

end
