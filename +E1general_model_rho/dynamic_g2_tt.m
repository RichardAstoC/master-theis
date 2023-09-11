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

assert(length(T) >= 93);

T = E1general_model_rho.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(80) = getPowerDeriv(y(9),params(4)-1,2);
T(81) = getPowerDeriv(y(12),params(4)-1,2);
T(82) = getPowerDeriv(T(10)*y(22)*T(11),1-params(4),2);
T(83) = (-((1-params(12))*((-(1-y(30)))-(1-y(30)))))/((1-y(30))*(1-y(30))*(1-y(30))*(1-y(30)));
T(84) = getPowerDeriv(y(6),(-1),2);
T(85) = getPowerDeriv(T(9)*T(12)-1,(-1),2);
T(86) = getPowerDeriv(y(7),(-params(3)),2);
T(87) = getPowerDeriv(y(11)/y(12),params(4)-1,2);
T(88) = getPowerDeriv(y(8),params(4)-1,2);
T(89) = getPowerDeriv(y(9)/y(10),params(4)-1,2);
T(90) = getPowerDeriv(y(8)/y(10),params(4)-1,2);
T(91) = getPowerDeriv(y(12)/y(10),params(4)-1,2);
T(92) = getPowerDeriv(T(29),1-params(4),2);
T(93) = (-(getPowerDeriv(y(21),1-params(2),2)/(1-params(2))));

end
