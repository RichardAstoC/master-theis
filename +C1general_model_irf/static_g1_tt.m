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

assert(length(T) >= 35);

T = C1general_model_irf.static_resid_tt(T, y, x, params);

T(25) = getPowerDeriv(y(1),(-1),1);
T(26) = getPowerDeriv(y(2),(-params(3)),1);
T(27) = getPowerDeriv(y(3),params(4)-1,1);
T(28) = getPowerDeriv(y(3)/y(5),params(4)-1,1);
T(29) = getPowerDeriv(y(4),params(4)-1,1);
T(30) = getPowerDeriv(y(4)/y(5),params(4)-1,1);
T(31) = getPowerDeriv(y(5)/y(7),params(4)-1,1);
T(32) = getPowerDeriv(y(7)/y(5),params(4)-1,1);
T(33) = getPowerDeriv(y(6)/y(7),params(4)-1,1);
T(34) = getPowerDeriv(y(7),params(4)-1,1);
T(35) = getPowerDeriv(y(16),(-params(1)),1);

end
