  function x = Convert(f)
% x = Convert(f)
% f is a is a representation of a 3-digit floating point number. (For details
% type help represent. x is the value of v.

% Overflow situations
if (f.mantissa == inf) & (f.mantissaSign==0)
   x = inf;
   return
end
if (f.mantissa == inf) & (f.mantissaSign==1)
   x = -inf;
   return
end

% Mantissa value
mValue = (100*f.mantissa(1) + 10*f.mantissa(2) + f.mantissa(3))/1000;
if f.mantissaSign==1
   mValue = -mValue;
end

% Exponent value
eValue = f.Exponent;
if f.ExponentSign==1
   eValue = -eValue;
end

x = mValue * 10^eValue;