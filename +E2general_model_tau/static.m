function [residual, g1, g2, g3] = static(y, x, params)
    T = NaN(41, 1);
    if nargout <= 1
        residual = E2general_model_tau.static_resid(T, y, x, params, true);
    elseif nargout == 2
        [residual, g1] = E2general_model_tau.static_resid_g1(T, y, x, params, true);
    elseif nargout == 3
        [residual, g1, g2] = E2general_model_tau.static_resid_g1_g2(T, y, x, params, true);
    else
        [residual, g1, g2, g3] = E2general_model_tau.static_resid_g1_g2_g3(T, y, x, params, true);
    end
end