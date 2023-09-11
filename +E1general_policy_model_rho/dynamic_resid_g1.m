function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = E1general_policy_model_rho.dynamic_g1_tt(T, y, x, params, steady_state, it_);
    end
    residual = E1general_policy_model_rho.dynamic_resid(T, y, x, params, steady_state, it_, false);
    g1       = E1general_policy_model_rho.dynamic_g1(T, y, x, params, steady_state, it_, false);

end
