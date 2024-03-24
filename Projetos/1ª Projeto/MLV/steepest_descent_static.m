function [Lista, LNit, Lopt] = steepest_descent_static(f, Nvar, Nmax, errodf, NPontosIniciais, x_values, y_values, lambda)
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

for i=1:NPontosIniciais
    x=(b-a).*rand(Nvar,1)+a;
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

