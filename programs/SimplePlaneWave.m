c = 3e10; %%% speed of light
k_0 = 1;
w0 = k_0 * c;

bound_x = 12;
bound_y = 12;

step_x = 0.01 * bound_x;
step_y = 0.01 * bound_y;
[x, y] = meshgrid([- bound_x :step_x: bound_x],[- bound_y :step_y: bound_y]);

E_z_plane_wave0 = exp(- 1i * k_0 * x);
pcolorReImModule(x, 'x', y, 'y', E_z_plane_wave0, 'E_z')

t = [0:0.01:5] * 2 * pi / w0;
videoReal(t, w0, x, 'x / a_2', y, 'y', E_z_plane_wave0, 'E_z')
