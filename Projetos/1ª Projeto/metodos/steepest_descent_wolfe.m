function [Lista, LNit, Lopt] = steepest_descent_wolfe(f, Nmax, errodf, PontosIniciais, x_values, y_values)
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
        d=-dfx;               
        beta0=.1;      
        lambda=Wolfe(x,f,df,d,beta0);    % O PASSO lambda CONFORME AS
                                         % CONDIÇÕES DE WOLFE, SEGUNDO 
                                         % O FICHEIRO Wolfe.m
        xNovo=x+lambda*d;
        dfxNovo=df(xNovo);
        Lista=[Lista, xNovo];
        N=2;
        
        while norm(dfxNovo)>errodf && N<Nmax 
        dNovo=-dfxNovo;       
        
        beta0=lambda*(dfx'*d)/(dfxNovo'*dNovo); % CÁLCULO DE beta0 PARA INICIAR 
                                                % O ALGORITMO 2 (VER FICHEIRO 
                                                % C/ ESCOLHA DE PTOS INICIAIS E
                                                % PASSOS) SEGUNDO É USUAL NO
                                                % SDM (TEM FÓRMULA ESPECÍFICA)

        lambda=Wolfe(xNovo,f,df,dNovo,beta0);   % OBTENÇÃO DO NOVO PASSO lambda 
                                                % CONFORME AS CONDIÇÕES DE WOL- 
                                                % FE (FICHEIRO "Wolfe.m") PARA 
                                                % VALORES ATUALIZADOS DA VARIÁ-
                                                % VEL E DA DIREÇÃO DE BUSCA
        xNovo=xNovo+lambda*dNovo;
     
        Lista=[Lista, xNovo];
        N=N+1;          
    
        x=xNovo;
        dfx=dfxNovo;
        d=dNovo;                   
        dfxNovo=df(xNovo);             
        end 
        
        LNit=[LNit, N];             
        Lopt=[Lopt, xNovo];         
end