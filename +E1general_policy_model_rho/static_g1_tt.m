function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 42);

T = E1general_policy_model_rho.static_resid_tt(T, y, x, params);

T(28) = getPowerDeriv(y(1),(-1),1);
T(29) = getPowerDeriv(T(3)*(1-params(12))/(1-y(25))-1,(-1),1);
T(30) = getPowerDeriv(y(2),(-params(3)),1);
T(31) = getPowerDeriv(y(3),params(4)-1,1);
T(32) = getPowerDeriv(y(3)/y(5),params(4)-1,1);
T(33) = getPowerDeriv(y(4),params(4)-1,1);
T(34) = getPowerDeriv(y(4)/y(5),params(4)-1,1);
T(35) = getPowerDeriv(y(5)/y(7),params(4)-1,1);
T(36) = getPowerDeriv(y(7)/y(5),params(4)-1,1);
T(37) = getPowerDeriv(y(6)/y(7),params(4)-1,1);
T(38) = getPowerDeriv(y(7),params(4)-1,1);
T(39) = getPowerDeriv(T(23),1-params(4),1);
T(40) = getPowerDeriv(y(16),(-params(2)),1);
T(41) = (-(getPowerDeriv(y(16),1-params(2),1)/(1-params(2))));
T(42) = getPowerDeriv(T(5)*y(17)*1/T(6),1-params(4),1);

end
