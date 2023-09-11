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

assert(length(T) >= 34);

T = C1general_model_irf.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(25) = getPowerDeriv(y(6),(-1),1);
T(26) = getPowerDeriv(y(7),(-params(3)),1);
T(27) = getPowerDeriv(y(8),params(4)-1,1);
T(28) = getPowerDeriv(y(8)/y(10),params(4)-1,1);
T(29) = getPowerDeriv(y(9),params(4)-1,1);
T(30) = getPowerDeriv(y(9)/y(10),params(4)-1,1);
T(31) = getPowerDeriv(y(10)/y(12),params(4)-1,1);
T(32) = getPowerDeriv(y(12)/y(10),params(4)-1,1);
T(33) = getPowerDeriv(y(11)/y(12),params(4)-1,1);
T(34) = getPowerDeriv(y(12),params(4)-1,1);

end
