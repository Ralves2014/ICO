function [Lista, LNit, Lopt] = newton_raphson(f, Nvar, Nmax, errodf, NPontosIniciais, x_values, y_values, lambda)
    clc;

    syms a b 'real'

    v = [a; b]; 
        
    S = f(v);

    dS = jacobian(S, v); 
    d2S = jacobian(dS(:), v);
    
    df = matlabFunction(dS, 'Vars', {a, b});
    d2f = matlabFunction(d2S, 'Vars', {a, b});
                           
    Lista = [];
    LNit = [];
    Lopt = [];

    a = x_values;
    b = y_values;

    for i = 1:NPontosIniciais
        x = (b - a) .* rand(Nvar, 1) + a;
        Lista = [Lista, x];   
        dfx = df(x(1), x(2));           
        N = 1;     

        while norm(dfx) > errodf && N < Nmax  
            d = -inv(d2f(x(1), x(2))) * dfx';
            x = x + lambda * d;  
            Lista = [Lista, x];       
            dfx = df(x(1), x(2));  
            N = N + 1;           
        end 

        Lopt = [Lopt x];
        LNit = [LNit N];
    end 
end