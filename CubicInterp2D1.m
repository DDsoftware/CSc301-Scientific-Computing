function z = CubicInterp2D1(x,y,a,b,n,c,d,m,fA)
%
%  n,m:      integers >=2
%  x,a,b:    scalars that satisfy a<=x<\=b 
%  y,c,d:    scalars that satisfy c<=y<=d
%  fA:       an n-by-m matrix with the property that
%              fA(i,j) = f(a+(i-1)(b-a)/(n-1),c+(j-1)(d-c)/(m-1))
%              for some function f(.,.). 
% Post:
%    z:        cubically interpolated value for f(x,y).
%   
% Determine where in the grid the point is located.

hx = (b-a)/(n-1);
i  = max([1 ceil((x-a)/hx)]);
hy = (d-c)/(m-1);
j  = max([1 ceil((y-c)/hy)]); 
% Adjust for edge effects
if (1 < i)&&(i < n-1)
   % not on an edge
   ivals = (i-1):(i+2);
elseif 1==i
   ivals = 1:4;  % on left edge
else
   ivals = n-3:n; % on right edge
end 
if (1 < j)&&(j < m-1)
   jvals = (j-1):(j+2); % not on an edge
elseif 1==j
   jvals = 1:4; % on bottom edge
else
   jvals = m-3:m; % on top edge
end 
% Determine coordinates of the grid points.   
xvals = c + (ivals-1)*hx;  
yvals = c + (jvals-1)*hy; 
z = Small2D(x,y,xvals',yvals',fA(ivals,jvals));

