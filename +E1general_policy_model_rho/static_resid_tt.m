function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
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

assert(length(T) >= 27);

T(1) = y(16)^(-params(2));
T(2) = params(9)/(y(13)*100)*params(4)/(1-y(25));
T(3) = y(1)^(-1);
T(4) = (y(5)/y(7))^(params(4)-1);
T(5) = 1/params(5)*(1-params(12))/(1-y(25));
T(6) = (1-params(8))^params(9);
T(7) = (T(3)*(1-params(12))/(1-y(25))-1)^(-1);
T(8) = params(10)^params(3)/params(7);
T(9) = (y(6)/y(7))^(params(4)-1);
T(10) = 1/(1-y(25));
T(11) = y(2)^(-params(3));
T(12) = y(3)^(params(4)-1);
T(13) = params(3)/(1+params(3)-params(4));
T(14) = T(13)*(1-T(11))^(-1);
T(15) = 1-y(2)^(params(4)-1-params(3));
T(16) = y(7)^(params(4)-1);
T(17) = y(4)^(params(4)-1);
T(18) = (y(4)/y(5))^(params(4)-1);
T(19) = (y(3)/y(5))^(params(4)-1);
T(20) = y(1)*(1-y(25))*y(8)*y(12)/params(4);
T(21) = (y(7)/y(5))^(params(4)-1);
T(22) = y(13)^params(9);
T(23) = T(6)*(1-y(25))*(params(4)-1)*T(22)/params(4);
T(24) = T(23)^(1-params(4));
T(25) = params(4)/((1-y(25))*y(12))*T(24);
T(26) = 1/T(16);
T(27) = (y(16)^(1-params(2))-1)/(1-params(2));

end
