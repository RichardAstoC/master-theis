function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = C1general_model_irf.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(20, 1);
lhs = y(2)^(-params(1));
rhs = params(2)*(1+y(5))*T(1)*y(1)/y(13);
residual(1) = lhs - rhs;
lhs = y(25);
rhs = T(2)*T(3)*T(4);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = (T(5)*y(22)*1/T(6))^(1-params(4));
residual(3) = lhs - rhs;
lhs = y(7)^(params(4)-1);
rhs = (y(24)-1)*T(7);
residual(4) = lhs - rhs;
lhs = y(12)^params(3);
rhs = T(8)*(T(3)*T(9)*T(10)-(1-T(11))-y(24)*T(11));
residual(5) = lhs - rhs;
lhs = y(20);
rhs = y(12)*y(7);
residual(6) = lhs - rhs;
lhs = T(12);
rhs = T(14)*T(15)*T(16);
residual(7) = lhs - rhs;
lhs = T(17);
rhs = T(13)*y(20)^(params(4)-1);
residual(8) = lhs - rhs;
lhs = y(10)^(params(4)-1);
rhs = T(12)*y(6)*(1-T(11))+T(11)*T(17);
residual(9) = lhs - rhs;
lhs = y(11)^(params(4)-1);
rhs = T(12)*(1-T(11))*(1-params(11))*y(6)+T(17)*(1-params(12))*T(11);
residual(10) = lhs - rhs;
lhs = y(17);
rhs = y(21)+y(18)+y(16);
residual(11) = lhs - rhs;
lhs = y(15);
rhs = T(11)*params(12)*y(17)*T(18);
residual(12) = lhs - rhs;
lhs = y(16);
rhs = (1-T(11))*y(6)*params(11)*y(17)*T(19);
residual(13) = lhs - rhs;
lhs = y(14);
rhs = T(20)*T(21);
residual(14) = lhs - rhs;
lhs = y(18);
rhs = y(15)+y(24)*T(11)*y(14)/y(13);
residual(15) = lhs - rhs;
lhs = y(13)^params(4);
rhs = T(24)*1/T(16);
residual(16) = lhs - rhs;
lhs = y(19);
rhs = 1-T(11);
residual(17) = lhs - rhs;
lhs = y(22);
rhs = exp(y(23));
residual(18) = lhs - rhs;
lhs = y(23);
rhs = params(32)*y(3)+x(it_, 1);
residual(19) = lhs - rhs;
lhs = y(24);
rhs = (1-params(33))*params(6)+params(33)*y(4)+x(it_, 2);
residual(20) = lhs - rhs;

end
