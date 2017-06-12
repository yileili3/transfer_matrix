# Transfer matrix

Transfer matrix is a MATLAB library for optical analysis of thin films. 

* **Optial modeling:** Transfer matrices is used to model the optics of thin films. Reflectance, transmittance, and absorption can be calculated. 
* **Multi-layer analysis:** The analysis of multi-layer structures, including the presence of substrate and superstrate, can be easily implemented by the multiplication of individual matrices.
* **Deriving dielectric function and refractive index:** A fitting procedure can be used with the transfer matrix to derive the material optical functions including the dielectric function and refractive index.

## Examples
```matlab
eps0= 8.85e-12; % vacuum permittivity
mu0= 4*pi*1e-7; % vacuum permeability
d= 100e-9; % thickness
lambda= 1e-6; % wavelength
n1= 1.5; % refractive index of thin layer
n0= 1; % refractive index of superstrate
ns= 1; % refractive index of substrate
Y0= sqrt(eps0/mu0)*n0*cos(0);
Ys= sqrt(eps0/mu0)*ns*cos(0);

M= propM_TE(n1, d, lambda, 0);
r= (Y0*M(1,1)+ Y0*Ys*M(1,2)- M(2,1)- Ys*M(2,2))/(Y0*M(1,1)+ Y0*Ys*M(1,2)+ M(2,1)+ Ys*M(2,2));
t= (2*Y0)/(Y0*M(1,1)+ Y0*Ys*M(1,2)+ M(2,1)+ Ys*M(2,2));

R= abs(r)^2; % reflectance
T= real(ns)/n0*abs(t)^2; % transmittance
A= 1- abs(r)^2- abs(t)^2*ns/n0; % Absorbance
```
This example calculates the reflectance \(_R_\), reflectivity \(_r_\), transmittance \(_T_\), transmission coefficient \(_t_\), and absorbance \(_A_\) for a free-standing 10 nm thick SiO<sub>2</sub> layer.