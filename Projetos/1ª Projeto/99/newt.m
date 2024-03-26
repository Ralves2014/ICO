function sol = newt( g, dg, x )
%Implementa o método de Newton-Raphson
% g função uni-variável em estudo (a ser introduzida como handle)
% dg função derivada de g
% x valor inicial escolhido para iniciação do método

tol = 1e-6;
gx = feval(g,x);
format long
while (abs(gx) > tol)
    gp = feval(dg,x);
    x = x - gx / gp;
    gx = feval(g,x);
    [x, gx]
    pause
end
sol = x;
end

