function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 80);

T = E2general_model_tau.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(69) = getPowerDeriv(y(9),params(4)-1,2);
T(70) = getPowerDeriv(y(12),params(4)-1,2);
T(71) = getPowerDeriv(T(10)*y(22)*T(11),1-params(4),2);
T(72) = getPowerDeriv(y(6),(-1),2);
T(73) = getPowerDeriv(T(9)*T(12)-1,(-1),2);
T(74) = getPowerDeriv(y(7),(-params(3)),2);
T(75) = getPowerDeriv(y(11)/y(12),params(4)-1,2);
T(76) = getPowerDeriv(y(8),params(4)-1,2);
T(77) = getPowerDeriv(y(9)/y(10),params(4)-1,2);
T(78) = getPowerDeriv(y(8)/y(10),params(4)-1,2);
T(79) = getPowerDeriv(y(12)/y(10),params(4)-1,2);
T(80) = (-(getPowerDeriv(y(21),1-params(2),2)/(1-params(2))));

end
