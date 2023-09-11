function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = E1general_policy_model_rho.static_resid_tt(T, y, x, params);
end
residual = zeros(25, 1);
lhs = T(1);
rhs = T(1)*params(1)*(1+y(20));
residual(1) = lhs - rhs;
lhs = y(20);
rhs = T(2)*T(3)*T(4);
residual(2) = lhs - rhs;
lhs = y(1);
rhs = (T(5)*y(17)*1/T(6))^(1-params(4));
residual(3) = lhs - rhs;
lhs = y(2)^(params(4)-1);
rhs = (y(19)-1)*T(7);
residual(4) = lhs - rhs;
lhs = y(7)^params(3);
rhs = T(8)*(T(3)*T(9)*T(10)-(1-T(11))-y(19)*T(11));
residual(5) = lhs - rhs;
lhs = y(15);
rhs = y(7)*y(2);
residual(6) = lhs - rhs;
lhs = T(12);
rhs = T(14)*T(15)*T(16);
residual(7) = lhs - rhs;
lhs = T(17);
rhs = T(13)*y(15)^(params(4)-1);
residual(8) = lhs - rhs;
lhs = y(5)^(params(4)-1);
rhs = T(12)*y(1)*(1-T(11))+T(11)*T(17);
residual(9) = lhs - rhs;
lhs = y(6)^(params(4)-1);
rhs = T(12)*(1-T(11))*(1-y(25))*y(1)+T(17)*(1-params(12))*T(11);
residual(10) = lhs - rhs;
lhs = y(12);
rhs = y(16)+y(13)+y(11);
residual(11) = lhs - rhs;
lhs = y(10);
rhs = T(11)*params(12)*y(12)*T(18);
residual(12) = lhs - rhs;
lhs = y(11);
rhs = (1-T(11))*y(1)*y(25)*y(12)*T(19);
residual(13) = lhs - rhs;
lhs = y(9);
rhs = T(20)*T(21);
residual(14) = lhs - rhs;
lhs = y(13);
rhs = y(10)+y(19)*T(11)*y(9)/y(8);
residual(15) = lhs - rhs;
lhs = y(8)^params(4);
rhs = T(25)*T(26);
residual(16) = lhs - rhs;
lhs = y(14);
rhs = 1-T(11);
residual(17) = lhs - rhs;
lhs = y(17);
rhs = exp(y(18));
residual(18) = lhs - rhs;
lhs = y(18);
rhs = y(18)*params(32)+x(1);
residual(19) = lhs - rhs;
lhs = y(19);
rhs = (1-params(33))*params(6)+y(19)*params(33)+x(2);
residual(20) = lhs - rhs;
lhs = y(25);
rhs = params(11)*(y(16)/params(28))^params(39);
residual(21) = lhs - rhs;
lhs = y(22);
rhs = T(27);
residual(22) = lhs - rhs;
lhs = y(21);
rhs = T(27)+params(1)*y(21);
residual(23) = lhs - rhs;
lhs = y(23);
rhs = ((params(28)*(1-params(38)))^(1-params(2))-1)/((1-params(2))*(1-params(1)));
residual(24) = lhs - rhs;
lhs = y(24);
rhs = y(21)-y(23);
residual(25) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
