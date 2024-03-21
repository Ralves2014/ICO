function sol = bisec( g, a, b )
%Implementa o método da Bissecção
% g função uni-variável em estudo (a ser introduzida como handle)
% [a,b] intervalo escolhido para iniciação do método
ga = feval (g, a);   % fa é o valor de f em x=a
gb = feval (g, b); 
if (sign(ga) == sign(gb))
    '"Fraquinha" aplicação do método !!'
    'Nos extremos do intervalo [a,b] a função tem o mesmo sinal.'
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

