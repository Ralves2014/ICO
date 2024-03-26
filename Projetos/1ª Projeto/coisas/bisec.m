function sol = bisec( g, a, b )
%Implementa o m�todo da Bissec��o
% g fun��o uni-vari�vel em estudo (a ser introduzida como handle)
% [a,b] intervalo escolhido para inicia��o do m�todo
ga = feval (g, a);   % fa � o valor de f em x=a
gb = feval (g, b); 
if (sign(ga) == sign(gb))
    '"Fraquinha" aplica��o do m�todo !!'
    'Nos extremos do intervalo [a,b] a fun��o tem o mesmo sinal.'
    sol = 0;
    return
end
format long
while (abs (b-a) > 1e-6);   
    c = (a + b) / 2;
    gc = feval (g, c);
    [a, c, b; ga, gc, gb]; 
    if (gc == 0)
        sol = c;
        return
    elseif ( sign (gc) == sign (ga))
        a = c;
        fa = gc;
    elseif (sign (gc) == sign (gb))
        b = c;
        gb = gc;
    end
end
sol=0.5*(a+b);
end

