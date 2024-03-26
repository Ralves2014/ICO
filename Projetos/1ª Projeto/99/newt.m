function sol = newt( g, dg, x )
%Implementa o m�todo de Newton-Raphson
% g fun��o uni-vari�vel em estudo (a ser introduzida como handle)
% dg fun��o derivada de g
% x valor inicial escolhido para inicia��o do m�todo

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

