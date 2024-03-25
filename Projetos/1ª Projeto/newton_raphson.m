function [Lista, LNit, Lopt] = newton_raphson(f, Nvar, Nmax, errodf, NPontosIniciais, x_values, y_values, pontos_iniciais)
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


    for i = 1:NPontosIniciais
        x = pontos_iniciais(:, i);
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

    % PARTE 7: OBTENÇÃO DO MÍNIMO GLOBAL

    xopt=Lopt(:,1); 
    
    for i=2:NPontosIniciais
        if f(xopt)>f(Lopt(:,i)); 
            xopt=Lopt(:,i);      
        end
    end

    % PARTE 8: DEFINIÇÃO E EXIBIÇÃO DOS OUTPUTS (SÃO EXIBIDOS NA COMMAND
    % WINDOW PORQUE NÃO É COLOCADO ";" NO FINAL, EMBORA SEM LEGENDA)(PARA
    % OBTER LEGENDA COLOCAR PARTE 9 DO FICHEIRO "descidaMaximaV1aula.m")
    
    xoptimo=xopt        
    foptimo=f(xopt)    
    dffinal=df(xopt)    
    NIterMean=mean(LNit)


    disp(xoptimo);                    % EXIBIÇÃO DO (OUTPUT) PTO ÓPTIMO xoptimo
    disp('xoptimo:');                 % EXIBIR PTO ÓPTIMO LEGENDADO 'xoptimo'
    
    disp(foptimo);                  % EXIBIÇÃO DO (OUTPUT) VALOR ÓPTIMO foptimo
    disp('foptimo:');               % EXIBIR VALOR ÓPTIMO LEGENDADA 'foptimo'         
    
    disp(dffinal);       % EXIBIÇÃO DO (OUTPUT) GRADIENTE NO PTO ÓPTIMO dffinal
    disp('dffinal:');    % EXIBIR GRADIENTE NO PTO ÓPTIMO LEGENDADO 'dffinal'       
    
    disp('NIterMean:');  % EXIBIR Nº MÉDIO DE ITERAÇ. LEGENDADO 'NIterMean'
    disp(NIterMean);     % EXIBIÇÃO DO (OUTPUT) Nº MÉDIO DE ITERAÇÕES NIterMean
    


    % PARTE 9: EXIBIÇÃO DOS GRÁFICOS COM RECURSO A OUTROS m.FILES
    
    close all

    nivelGraficos(f,x_values(1),y_values(1),x_values(2),y_values(2))

    hold on

    graficosLineSearch(Lista,LNit,Lopt)

    hold off


end
