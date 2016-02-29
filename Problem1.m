% Complexe root
close all; clc

complex_root1 = 0;
P_1 = zeros(100, 1);

for n=1: 100
    a1 = rand(1, 1);
    b1 = rand(1, 1);
    c1 = rand(1, 1);
    Delta = (b1.^2) - (4*a1.*c1);
    for i=100
        if Delta < 0
            complex_root1 = complex_root1 + 1; end
    sprintf('Monte Carlo Estimation of P_1(100) = %.3f \n', P_1(100))
    end
    P_1(n) = complex_root1/(n);
    
end
sprintf('complex root = %d \n', complex_root1)
sprintf('Monte Carlo Estimation of P_1(100) = %.3f \n', P_1(100))

% 
% complex_root2= 0;
% P_2 = zeros(100,1);
% 
% for n=1:100
%     a2 = randn(1, 100);
%     b2 = randn(1, 100);
%     c2 = randn(1, 100);
%     Delta2 = b1.^2 + 4*a1.*c1;
%     if(Delta2 < 0)
%         complex_root2 = complex_root2 + 1;
% 
%     end
%     P_2(n) = complex_root2/(n*100);  
% end
% sprintf('Monte Carlo Estimation of P_2(100) = %.3f', P_2(100))
