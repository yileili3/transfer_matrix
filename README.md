# Transfer matrix

Transfer matrix is a standard tool for the optical analysis of thin films. This library implements the transfer matricies in MATLAB and closely follows the book by Eugene Hecht (*Optics*, 4th ed., Chapter 9, Section 7). The libirary provides the basis to implementing customized codes for specific tasks.

* **Optial modeling:** A transfer matrix relates the electromagnetic fields at the two boundaries of a thin film. Reflectance, transmittance, and absorption of a thin film can be derived from the corresponding transfer matrix (see example below). 
* **Multi-layer analysis:** The analysis of multi-layer structures, including the presence of substrate and superstrate, can be easily implemented by the multiplication of individual matrices.
* **Deriving dielectric function and refractive index:** A fitting procedure such as `lsqnonlin` in MATLAB can be used with the transfer matrix to derive the material optical functions including the dielectric function and refractive index.

## Examples
This example calculates the reflectance \(_R_\), reflectivity \(_r_\), transmittance \(_T_\), transmission coefficient \(_t_\), and absorbance \(_A_\) for a free-standing 100 nm thick SiO<sub>2</sub> layer.
```matlab
eps0= 8.85e-12; % vacuum permittivity
mu0= 4*pi*1e-7; % vacuum permeability
d= 100e-9; % thickness
lambda= 1e-6; % wavelength
n1= 1.5; % refractive index of thin layer
n0= 1; % refractive index of superstrate, in this case vacuum
ns= 1; % refractive index of substrate, in this case vacuum
Y0= sqrt(eps0/mu0)*n0*cos(0);
Ys= sqrt(eps0/mu0)*ns*cos(0);

M= M_TE(n1, d, lambda, 0);
r= (Y0*M(1,1)+ Y0*Ys*M(1,2)- M(2,1)- Ys*M(2,2))/(Y0*M(1,1)+ Y0*Ys*M(1,2)+ M(2,1)+ Ys*M(2,2));
t= (2*Y0)/(Y0*M(1,1)+ Y0*Ys*M(1,2)+ M(2,1)+ Ys*M(2,2));

R= abs(r)^2; % reflectance
T= real(ns)/n0*abs(t)^2; % transmittance
A= 1- abs(r)^2- abs(t)^2*real(ns)/n0; % Absorbance
```

For multilayers, simply multiply the transfer matricies of the layers as in the example below.
```matlab
M = M1 * M2;
```
