% Problem P1_3_2
%
clc

disp('  n     P_1(n)     P_2(n) ')
disp('--------------------------')
for n=100:100:800
   
        % Uniformly distributed:
   a = rand(n,3);
       % we have complex roots if the discriminant:
       % (a(i,2)^2 - 4*a(i,1)*a(i,3))<0
   P_1 = sum(a(:,2).^2 < 4*a(:,1).*a(:,3))/n;
   
        % Normally distributed:
   a = randn(n,3);
   P_2 = sum(a(:,2).^2 < 4*a(:,1).*a(:,3))/n;

   fprintf('%4d    %.4f    %.4f \n',n,P_1,P_2)
end
