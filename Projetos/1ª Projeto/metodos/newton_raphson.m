function [Lista, LNit, Lopt] = newton_raphson(f, Nmax, errodf, PontosIniciais, x_values, y_values)
    clc;

    syms a b 'real'

    v=[a;b];
        
    S = f(v);

    dS = jacobian(S, v); 
    d2S = jacobian(dS(:), v);
        
    df = @(x) double(subs(dS, v, x)');
    
    d2f = @(x) double(subs(d2S, v, x)');
                           
    Lista = [];
    LNit = [];
    Lopt = [];

    a=x_values; b=y_values;

    [~, num_points] = size(PontosIniciais);


 for i=1:num_points
    x = PontosIniciais(:,i);
        Lista = [Lista, x];   
        dfx = df(x);   
        N = 1;     

        while norm(dfx) > errodf && N < Nmax  
            d = -inv(d2f(x)) * dfx;
            beta0 = 1; % No método de Newton-Raphson, pode ser simplesmente 1
            
            lambda = Wolfe(x, f, df, d, beta0); % Calculando o passo lambda
            
            x = x + lambda * d;  
            Lista = [Lista, x];       
            dfx = df(x);
            N = N + 1;           
        end 

        Lopt = [Lopt x];
        LNit = [LNit N];
end 

