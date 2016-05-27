
% Homework #2
% Problem 2 part a

x0 = 0; 
x1 = 1; 
x2 = 2;

x_1 = 0.25;
x_2 = 0.75;

[appx1, exact1, error1] = QuadInterp('exp', x0, x1, x2, x_1);

[appx2, exact2, error2] = QuadInterp('exp', x0, x1, x2, x_2);

fprintf(' x       appx      exact       error \n')
fprintf(' %3.3f    %3.3f      %3.3f      %3.3f \n', x_1, appx1, exact1, abs(error1))
fprintf(' %3.3f    %3.3f      %3.3f      %3.3f \n', x_2, appx2, exact2, abs(error2))

