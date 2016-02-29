
% dot3(x,y) function

function s = dot3(x,y)
   
   % Pre:
   %    x,y = column vectors of the same length
   %
   % Post:
   %    s = 3-digit representation of x'*y
   
      s = Represent(0);              
      
      for i=1:length(x)
         xi = Represent(x(i));       
         yi = Represent(y(i));       
         product = Float(xi,yi,'*');       
         s = Float(s,product,'+');        
      end