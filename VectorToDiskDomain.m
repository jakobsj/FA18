function x = VectorToDiskDomain(x)
%VectorToDiskDomain Remove elements of x corresp. to pixels outside disk.
%
% x = MatrixToDiskDomain(x)
%
% Input:  x vector corresponding to an N-by-N domain.
%
% Output: x vector corresponding to those pixels inside a disc that just
%         fits the N-by-N domain.

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

% Get the image dimension.
N = sqrt(length(x));
if N-round(N) ~= 0, error('Illegal no. of elements in x'), end

% Create the logical mask that removes columns corresponding to pixels
% outside the disk.
h = (N+1)/2;
hh = N/2;
[I,J] = meshgrid(1:N);
M = ( (I-h).^2 + (J-h).^2 > hh^2 );
cmask = logical(M(:));

% Remove the unwanted columns.
x(cmask) = [];

end

