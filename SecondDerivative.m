function [Dh,Ch,Derr, Cerr] = SecondDerivative(fname,a,delta,M2,M3)
% d = Derivative(fname,a,delta,M2);
% fname  a string that names a function f(x) whose derivative
% at x = a is sought. delta is the absolute error associated with
% an f-evaluation and M2 is an estimate of the second derivative
% magnitude near a. d is an approximation to f'(a) and err is an estimate 
% of its absolute error.
%
% Usage:
%     [d,err] =  Derivative(fname,a)   
%     [d,err] =  Derivative(fname,a,delta) 
%     [d,err] =  Derivative(fname,a,delta,M2)
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

hopt = 2*sqrt(delta/M2);   % Compute optimum h
Dh   = (feval(fname,a+hopt) - feval(fname,a))/hopt; 
Derr = 2*sqrt(delta*M2);

hopt = (6 * delta / M3).^(1/3);  % Compute optimum h
Ch   = (feval(fname,a+hopt) - feval(fname,a-hopt))/hopt;
Cerr = ((M3*hopt*hopt)/6)+(2*eps)/hopt;
disp('  Dh           Ch         err1         err2');
fprintf('%.5f    %.5f    %.5f    %.5f \n',Dh,Ch,Derr, Cerr)

