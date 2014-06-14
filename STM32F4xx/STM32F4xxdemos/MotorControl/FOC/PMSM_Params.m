Params.p = (2);
Params.L = (1.4e-3);
Params.R = (0.6);
Params.J = (1.1e-5);
Params.Lambda = (0.034182*1.0/Params.p);
Params.F = (1e-4);
Params.k = (0.05);
Params.h = (1/10000);
Params.T = (1/20000);
Params.V = (15);
Params.Encoder_Gain = (2*pi/1600*Params.p);
Params.Theta_Zero = (30*pi/180);
Params.wmax = (2500/60*2*pi);
Params.Imax = 1; % Params.V/Params.R; <- source is limited to 1A
save('Parameters','Params')