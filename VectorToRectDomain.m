function X = VectorToRectDomain(x,N)
%VectorToRectDomain Transform "short" vector x (disk domain) to N-by-N array.
%
% X = VectorToRectDomain(x,N)
%
% Input:  a vectors whose elements correspond to a disk domain.
%
% Output: an N-by-N array in which elements outside the disk are NaN.

% Ref.: Computed Tomography: Algorithms, Insight and Just Enough Theory
% P. C. Hansen, J. S. Jorgensen, W. R. B. Lionheart (Eds.)
% Fundamentals of Algorithms, FA18, SIAM, Philadelphia, PA, 2021.

% Code written by: Per Christian Hansen and Jakob Sauer Jorgensen, 2021.

% This file is needed for some of the exercises in the above book, and is
% distributed under the 3-Clause BSD License. A separate license file
% should be provided as part of these files. 
% 
% Copyright 2021 Per Christian Hansen and Jakob Sauer Jorgensen, Technical
% University of Denmark.

h = (N+1)/2;
hh = N/2;
[I,J] = meshgrid(1:N);
M = ( (I-h).^2 + (J-h).^2 > hh^2 );
mask = logical(M(:));
indx = (1:N^2)';
indx(mask) = [];
z = NaN(N^2,1);
z(indx) = x;
X = reshape(z,N,N);