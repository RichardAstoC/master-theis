function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 35);

T(1) = y(21)^(-params(2));
T(2) = (1-params(8))^params(9);
T(3) = params(9)*y(6)^(params(4)/(1-params(4)))*(params(4)-1)*T(2);
T(4) = y(18)^(params(9)-1);
T(5) = T(3)*T(4);
T(6) = y(9)^(params(4)-1);
T(7) = y(12)^(params(4)-1);
T(8) = T(6)/T(7);
T(9) = (1-params(12))/(1-y(30));
T(10) = 1/params(5)*T(9);
T(11) = 1/T(2);
T(12) = y(6)^(-1);
T(13) = (T(9)*T(12)-1)^(-1);
T(14) = params(10)^params(3)/params(7);
T(15) = (y(11)/y(12))^(params(4)-1);
T(16) = 1/(1-y(30));
T(17) = y(7)^(-params(3));
T(18) = y(8)^(params(4)-1);
T(19) = params(3)/(1+params(3)-params(4));
T(20) = T(19)*(1-T(17))^(-1);
T(21) = 1-y(7)^(params(4)-1-params(3));
T(22) = (y(9)/y(10))^(params(4)-1);
T(23) = (y(8)/y(10))^(params(4)-1);
T(24) = (1-y(30))*y(13)*y(17)/params(4);
T(25) = y(6)*T(24);
T(26) = (y(12)/y(10))^(params(4)-1);
T(27) = params(4)/((1-y(30))*y(17));
T(28) = y(18)^params(9);
T(29) = T(2)*(params(4)-1)*(1-y(30))*T(28)/params(4);
T(30) = T(29)^(1-params(4));
T(31) = T(27)*T(30);
T(32) = 1/T(7);
T(33) = params(11)*(y(31)/params(25))^params(39);
T(34) = (y(32)/params(27))^params(40);
T(35) = (y(21)^(1-params(2))-1)/(1-params(2));

end
