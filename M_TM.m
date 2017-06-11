function [ M ] = M_TM( n, d, lambda, theta )
% propagation matrix for TM wave
% n is the refractive index of the thin film
% d is the thickness of the thin film
% lambda is the wavelength
% theta is the incidence angle

eps0 = 8.85e-12; % vacuum permittivity
mu0 = 4*pi*1e-7; % vacuum permeability
h = n*d/cos(theta);
Y = sqrt(eps0/mu0)*n/cos(theta);
k = 2*pi/lambda;

M = [cos(k*h) 1j*(1/Y)*sin(k*h);
     1j*Y*sin(k*h) cos(k*h)];
end