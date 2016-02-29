% Homework #2
% Problem 2 part a

x0 = 0;
x1= 0.5; 
x = 0.25;

[appx, exact, error] = LinearInterp('exp', x0, x1, x);
fprintf(' x       appx      exact       error \n')
fprintf(' %3.3f    %3.3f      %3.3f      %3.3f \n', x, appx, exact, abs(error))

