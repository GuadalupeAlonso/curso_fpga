clear; close all; clc;

% Ingresar lista de valores y nombres
x = 0:15;
values = atand(2.^(-x));
% values = [-1.5, -1, 0, 1, 1.5, 2];

for i = 1:numel(values)
    temp1 = float2fixed(nbits,b,values(i));
    temp2 = fixed2float(nbits,b,temp1);
    fprintf("%2d : angulo_o = %2d'b%s; //%30.25f\n",i-1,nbits,temp1,temp2);
end

% Conversion de flotante a punto fijo con truncamiento
function R = float2fixed(nbits,b,value)
    aux = value*(2^b);
    aux2 = fix(aux);    
    r = dec2bin(aux2,nbits);
    R = r(end-nbits+1:end);
end

% Conversion de punto fijo a punto flotante
function R = fixed2float(nbits,b,value)
    detector = str2double(value(1));
    aux = bin2dec(value) - detector*2^(nbits);
    R = aux/(2^b);
end

