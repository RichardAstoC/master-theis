function x1MGRAPHS1(input_mat1, input_mat2, input_mat3, input_mat4, input_mat5, name)
 
load(input_mat1)
oo_CK1 = oo_;
M_CK1  = M_;
OOPT.MODELS.oo_CK1 = oo_CK1;
OOPT.MODELS.M_CK1  = M_CK1;
clear oo_ M_;

load(input_mat2)
oo_CK2 = oo_;
M_CK2  = M_;
OOPT.MODELS.oo_CK2 = oo_CK2;
OOPT.MODELS.M_CK2  = M_CK2;
clear oo_ M_;

load(input_mat3)
oo_CK3 = oo_;
M_CK3  = M_;
OOPT.MODELS.oo_CK3 = oo_CK3;
OOPT.MODELS.M_CK3  = M_CK3;
clear oo_ M_;

load(input_mat4)
oo_CK4 = oo_;
M_CK4  = M_;
OOPT.MODELS.oo_CK4 = oo_CK4;
OOPT.MODELS.M_CK4  = M_CK4;
clear oo_ M_;

load(input_mat5)
oo_CK5 = oo_;
M_CK5  = M_;
OOPT.MODELS.oo_CK5 = oo_CK5;
OOPT.MODELS.M_CK5  = M_CK5;
clear oo_ M_;

%% Make graphs - Model Common Knowledge
OOPT.plot_color={'k' ':m' '--b'  'g' 'c'};
OOPT.NN=15;
OOPT.list_endo={'Yt' 'yti' 'ytf' 'Ct' 'Gt' 'Iit' 'Fft' 'pt' 't1'};
OOPT.label_variables={'Producto' 'Producto informal' 'Producto formal' 'Consumo' 'Gasto Gobierno' 'Tamaño sector informal' 'Tamaño sector formal' 'Precios' '\tau'};
OOPT.type_models={'oo_CK1' 'oo_CK2' 'oo_CK3' 'oo_CK4' 'oo_CK5'};
OOPT.legend_models= {'No-OSR' 'NOOSR-Y' 'OSR-Y' 'OSR-Yi' 'OSR-Yf'};

% OOPT.shocks_names={'eps_psi'};
% OOPT.tit_shocks={'Capital flows Shock '};
% plot_comp(OOPT)
% eval(['print -depsc2 ' name '_psi;']);

OOPT.shocks_names={'e_a'};
OOPT.tit_shocks={'Choque de productividad'};
x2plot_comp(OOPT)
eval(['print -depsc2 ' name '_a;']);

OOPT.shocks_names={'e_f'};
OOPT.tit_shocks={'Choque de costos de entrada'};
x2plot_comp(OOPT)
eval(['print -depsc2 ' name '_a;']);


end