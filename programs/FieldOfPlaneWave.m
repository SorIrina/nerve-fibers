c = 3e10; %%% speed of light
k_0 = 1;
w0 = k_0 * c;

bound_x = 12;
bound_y = 12;
    
step_x = 0.01 * bound_x;
step_y = 0.01 * bound_y;
[x, y] = meshgrid([- bound_x :step_x: bound_x],[- bound_y :step_y: bound_y]);

rho   = sqrt(x.^2 + y.^2);
phi1   = atan(abs(y)./ abs(x));
phi    = (phi1).* (x>0).* (y>0); 
phi    = phi + (pi - phi1).* (x<=0).* (y>0); 
phi    = phi + (pi + phi1).* (x<=0).* (y<=0); 
phi    = phi + (2*pi - phi1).* (x>0).* (y<=0);

N_max = 2;
m = [-N_max:1:N_max];



E_z_plane_wave = 0;
for im = 1:size(m,2)
    E_z_plane_wave = E_z_plane_wave + (-1i)^m(im) * besselj(m(im), k_0 * rho).* exp(- 1i * m(im) * phi);
end

% pcolorReImModule(x, 'x', y, 'y', E_z_plane_wave, 'E_z')


t = [0:0.01:5] * 2 * pi / w0;
E_z_plane_wave0 = exp(- 1i * k_0 * x);
pcolorReImModule(x, 'x', y, 'y', E_z_plane_wave0, 'E_z')
% videoReal(t, w0, x, 'x / a_2', y, 'y', E_z_plane_wave0, 'E_z')

% t = [0:0.01:5] * 2 * pi / w0;
% videoReal(t, w0, x, 'x / a_2', y, 'y', E_z_plane_wave, 'E_z')