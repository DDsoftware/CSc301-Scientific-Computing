

% Generalized Derivative function 

function [Dh, Dh_err, Ch, Ch_err] = Derivative2(fname, a, delta, M2, M3)
% Dh = Derivative(fname,a,delta,M2);
% fname:  a string that names a function f(x) whose derivative
% a: is sought. 
% delta: is the absolute error associated with an f-evaluation.
% M2: is an estimate of the second derivative, and M3 is of the third
%    derivative magnitude near a. 
% Dh , Ch are approximations to f'(a)
% Dh_err and Ch_err are estimates of absolute errors.
%
% Usage:
%     [d,err] =  Derivative(fname, a)   
%     [d,err] =  Derivative(fname, a, delta) 
%     [d,err] =  Derivative(fname, a, delta, M2)
%     [d,err] =  Derivative(fname, a, delta, M2, M3)

if nargin == 4
   
   % second derivative bound is 1.
   M3 = 1000;
end

if nargin == 3
   % set second derivative bound to 1.
   M2 = 100;
end
if nargin == 2
   
   % set delta to eps.
   delta = eps;
end

% compute Dh and error in Dh
hopt = 2*sqrt(delta/M2);

Dh  = (feval(fname,a+hopt) - feval(fname,a))/hopt;
Dh_err = 2*sqrt(delta*M2);

% compute Ch and errror in Ch
hopt = (6 * delta / M3).^(1/3);
Ch = (feval(fname, a+hopt) - feval(fname, a-hopt))/(2*hopt);
Ch_err = (M3/6) *((6*delta)/M3)^(2/3) + (M3/3) * (6*delta/M3)^(1/3);

% compare and choose better approximation
if Ch_err < Dh_err
    fprintf('\n Derivative of f at a is Ch = %.5f \n', Ch);

else
    fprintf('\n Derivative of f at a is Dh = %.5f \n', Dh);
end