
% Problem P1.5.1 (p.57)

% Modified Derivative function based on author's solution

function [d, derr, c, cerr] = Derivative21(fname, a, delta, M2, M3)
% d = Derivative(fname,a,delta,M2);
% fname  a string that names a function f(x) whose derivative
% at x = a is sought. delta is the absolute error associated with
% an f-evaluation.
% M2 is an estimate of the second derivative, and M3 is of the third
% derivative magnitude near a. 
% d is an approximation to f'(a) and err is an estimate 
% of its absolute error.
%
% Usage:
%     [d,err] =  Derivative(fname, a)   
%     [d,err] =  Derivative(fname, a, delta) 
%     [d,err] =  Derivative(fname, a, delta, M2)
%     [d,err] =  Derivative(fname, a, delta, M2, M3)

% setup default value

if nargin <= 4
    M3 = 1;
elseif nargin <= 3
   M2 = 1;
end

if nargin == 2
   delta = eps;
end
% Compute optimum h and divided difference
hopt = 2*sqrt(delta/M2);
d   = (feval(fname,a+hopt) - feval(fname,a))/hopt;
derr = 2*sqrt(delta*M2);

hopt = (6 * delta / M3).^(1/3);
c = (feval(fname, a+hopt) - feval(fname, a-hopt))/(2*hopt);
cerr = (M3/6) *((6*delta)/M3)^(2/3) + (M3/3) * (6*delta/M3)^(1/3);