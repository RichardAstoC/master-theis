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

assert(length(T) >= 24);

T(1) = y(21)^(-params(1));
T(2) = params(9)/(y(18)*100)*params(4)/(1-params(11));
T(3) = y(6)^(-1);
T(4) = (y(10)/y(12))^(params(4)-1);
T(5) = 1/params(5)*(1-params(12))/(1-params(11));
T(6) = (1-params(8))^params(9);
T(7) = (T(3)*(1-params(12))/(1-params(11))-1)^(-1);
T(8) = params(10)^params(3)/params(7);
T(9) = (y(11)/y(12))^(params(4)-1);
T(10) = 1/(1-params(11));
T(11) = y(7)^(-params(3));
T(12) = y(8)^(params(4)-1);
T(13) = params(3)/(1+params(3)-params(4));
T(14) = T(13)*(1-T(11))^(-1);
T(15) = 1-y(7)^(params(4)-1-params(3));
T(16) = y(12)^(params(4)-1);
T(17) = y(9)^(params(4)-1);
T(18) = (y(9)/y(10))^(params(4)-1);
T(19) = (y(8)/y(10))^(params(4)-1);
T(20) = y(6)*(1-params(11))*y(13)*y(17)/params(4);
T(21) = (y(12)/y(10))^(params(4)-1);
T(22) = T(6)*(1-params(11))*(params(4)-1)*y(18)^params(9)/params(4);
T(23) = T(22)^(1-params(4));
T(24) = params(4)/((1-params(11))*y(17))*T(23);

end
