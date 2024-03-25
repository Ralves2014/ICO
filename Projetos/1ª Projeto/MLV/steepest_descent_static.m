function [Lista, LNit, Lopt] = steepest_descent_static(f, Nmax, errodf, PontosIniciais, x_values, y_values, lambda)
clc;

syms a b 'real'

v=[a; b]; 
        
S=f(v);

dS=jacobian(S,v); 
                    
df=@(x) double(subs(dS,v,x)');
                           
Lista=[];
LNit=[];
Lopt=[];

a=x_values; b=y_values;

[~, num_points] = size(PontosIniciais);


for i=1:num_points
    x = PontosIniciais(:,i);
    Lista=[Lista, x];
    dfx=df(x);           
    N=1;     
    
    while norm(dfx)>errodf && N<Nmax  
        d = -dfx;
        x=x+lambda*d;  
        Lista=[Lista, x];       
        dfx=df(x);  
        N=N+1;           
    end 
    
    Lopt=[Lopt x];
    LNit=[LNit N];
end