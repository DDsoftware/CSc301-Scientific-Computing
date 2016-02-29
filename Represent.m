function f = Represent(x)
% f = Represent(x)
% Yields a 3-digit mantissa floating point representation of f:
%
%    f.mSignBit   mantissa sign bit (0 if x>=0, 1 otherwise)
%    f.m          mantissa (= f.m(1)/10 + f.m(2)/100 + f.m(3)/1000)
%    f.eSignBit   the exponent sign bit (0 if exponent nonnegative, 1 otherwise)
%    f.e          the exponent (-9<=f.e<=9)
%
% If x is out side of [-.999*10^9,.999*10^9], f.m is set to inf.
% If x is in the range [-.100*10^-9,.100*10^-9] f is the representation of zero
% in which both sign bits are 0, e is zero, and m = [0 0 0].

f = struct('mantissaSign',0,'mantissa',[0 0 0],'ExponentSign',0,'Exponent',0);

if abs(x)<.100*10^-9 
   % Underflow. Return 0
   return
end

if x>.999*10^9
   % Overflow. Return inf
   f.mantissa = inf;
   return
end
if x<-.999*10^9
   % Overflow. Return -inf
   f.mantissaSign = 1;
   f.mantissa = inf;
   return
end
  
% Set the mantissa sign bit
if x>0
   f.mantissaSign = 0;
else
   f.mantissaSign = 1;
end

% Determine m and e so .1 <= m < 1 and abs(x) = m*10^e 
mantissa = abs(x); Exponent = 0;
while mantissa >= 1,  mantissa = mantissa/10; Exponent = Exponent+1; end
while mantissa < 1/10,mantissa = 10*mantissa; Exponent = Exponent-1; end

% Determine nearest integer to 1000m 
z = round(1000*mantissa);
% Set the mantissa  
f.mantissa(1) = floor(z/100);
f.mantissa(2) = floor((z - f.mantissa(1)*100)/10);
f.mantissa(3) = z - f.mantissa(1)*100 - f.mantissa(2)*10;
% Set the exponent and its sign bit.
if Exponent>=0
   f.ExponentSign = 0;
   f.Exponent = Exponent;
else
   f.ExponentSign = 1;
   f.Exponent = -Exponent;
end