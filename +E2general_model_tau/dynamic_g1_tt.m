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

assert(length(T) >= 68);

T = E2general_model_tau.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(34) = T(2)*(params(4)-1)*params(9)*getPowerDeriv(y(6),params(4)/(1-params(4)),1);
T(35) = T(4)*T(34);
T(36) = getPowerDeriv(y(6),(-1),1);
T(37) = getPowerDeriv(T(9)*T(12)-1,(-1),1);
T(38) = getPowerDeriv(y(7),(-params(3)),1);
T(39) = getPowerDeriv(1-T(17),(-1),1);
T(40) = T(19)*(-T(38))*T(39);
T(41) = (-(getPowerDeriv(y(7),params(4)-1-params(3),1)));
T(42) = getPowerDeriv(y(8),params(4)-1,1);
T(43) = 1/y(10);
T(44) = getPowerDeriv(y(8)/y(10),params(4)-1,1);
T(45) = getPowerDeriv(y(9),params(4)-1,1);
T(46) = getPowerDeriv(y(9)/y(10),params(4)-1,1);
T(47) = T(46)*(-y(9))/(y(10)*y(10));
T(48) = T(44)*(-y(8))/(y(10)*y(10));
T(49) = (-y(12))/(y(10)*y(10));
T(50) = getPowerDeriv(y(12)/y(10),params(4)-1,1);
T(51) = 1/y(12);
T(52) = getPowerDeriv(y(11)/y(12),params(4)-1,1);
T(53) = getPowerDeriv(y(12),params(4)-1,1);
T(54) = (-(T(6)*T(53)))/(T(7)*T(7));
T(55) = y(6)*(1-params(11))*y(17)/params(4);
T(56) = y(6)*y(13)*(1-params(11))/params(4);
T(57) = getPowerDeriv(y(18),params(9)-1,1);
T(58) = T(2)*(params(4)-1)*(1-params(11))*getPowerDeriv(y(18),params(9),1)/params(4);
T(59) = getPowerDeriv(T(27),1-params(4),1);
T(60) = T(58)*T(59);
T(61) = params(4)/((1-params(11))*y(17))*T(60);
T(62) = params(12)*1/params(25)*getPowerDeriv(y(31)/params(25),params(39),1);
T(63) = 1/params(27)*getPowerDeriv(y(32)/params(27),params(40),1);
T(64) = getPowerDeriv(y(21),(-params(2)),1);
T(65) = (-(getPowerDeriv(y(21),1-params(2),1)/(1-params(2))));
T(66) = getPowerDeriv(T(10)*y(22)*T(11),1-params(4),1);
T(67) = 1/params(5)*(-1)/(1-params(11));
T(68) = T(12)*(-1)/(1-params(11));

end
