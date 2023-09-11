function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = E1general_model_rho.static_g1_tt(T, y, x, params);
    end
    residual = E1general_model_rho.static_resid(T, y, x, params, false);
    g1       = E1general_model_rho.static_g1(T, y, x, params, false);

end
