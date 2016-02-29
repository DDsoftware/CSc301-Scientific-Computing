% Script for Histogram
%
% plots a histogram of the error when dot3 is applied
% to 100 random inner products of length 5.
   
   err = zeros(100,1);
   for k = 1:100
       x = randn(5,1);
       y = randn(5,1);
       p = x'*y;    % dot product
       err(k) = p - Convert(dot3(x,y));
   end
   hist(err,20)
   title('histogram of error')
   xlabel('error')
   ylabel('number of bin')