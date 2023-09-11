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

assert(length(T) >= 65);

T = E2general_policy_model_tau.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(32) = getPowerDeriv(y(6),(-1),1);
T(33) = getPowerDeriv(T(3)*T(5)-1,(-1),1);
T(34) = getPowerDeriv(y(7),(-params(3)),1);
T(35) = getPowerDeriv(1-T(13),(-1),1);
T(36) = T(15)*(-T(34))*T(35);
T(37) = (-(getPowerDeriv(y(7),params(4)-1-params(3),1)));
T(38) = getPowerDeriv(y(8),params(4)-1,1);
T(39) = 1/y(10);
T(40) = getPowerDeriv(y(8)/y(10),params(4)-1,1);
T(41) = getPowerDeriv(y(9),params(4)-1,1);
T(42) = getPowerDeriv(y(9)/y(10),params(4)-1,1);
T(43) = 1/y(12);
T(44) = getPowerDeriv(y(10)/y(12),params(4)-1,1);
T(45) = T(42)*(-y(9))/(y(10)*y(10));
T(46) = T(40)*(-y(8))/(y(10)*y(10));
T(47) = (-y(12))/(y(10)*y(10));
T(48) = getPowerDeriv(y(12)/y(10),params(4)-1,1);
T(49) = getPowerDeriv(y(11)/y(12),params(4)-1,1);
T(50) = T(44)*(-y(10))/(y(12)*y(12));
T(51) = getPowerDeriv(y(12),params(4)-1,1);
T(52) = y(6)*(1-params(11))*y(17)/params(4);
T(53) = y(6)*y(13)*(1-params(11))/params(4);
T(54) = params(4)/(1-params(11))*(-(params(9)*100))/(y(18)*100*y(18)*100);
T(55) = T(7)*(1-params(11))*(params(4)-1)*getPowerDeriv(y(18),params(9),1)/params(4);
T(56) = getPowerDeriv(T(25),1-params(4),1);
T(57) = T(55)*T(56);
T(58) = params(4)/((1-params(11))*y(17))*T(57);
T(59) = params(12)*1/params(25)*getPowerDeriv(y(31)/params(25),params(39),1);
T(60) = 1/params(27)*getPowerDeriv(y(32)/params(27),params(40),1);
T(61) = getPowerDeriv(y(21),(-params(2)),1);
T(62) = (-(getPowerDeriv(y(21),1-params(2),1)/(1-params(2))));
T(63) = getPowerDeriv(T(6)*y(22)*T(8),1-params(4),1);
T(64) = 1/params(5)*(-1)/(1-params(11));
T(65) = T(3)*(-1)/(1-params(11));

end
