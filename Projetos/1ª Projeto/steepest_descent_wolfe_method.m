function steepest_descent_wolfe_method(f, Nvar, Nmax, errodf, NPontosIniciais, x_values, y_values)
    % MÉTODO DE DECIDA MÁXIMA C/WOLFE (SDM- STEEPEST DESCENT METHOD)
    
    % ESTE m.FILE IMPLEMENTA O SDM PARA FUNÇÕES OBJETIVO f DEFINIDAS COMO FUNC-
    % TION-HANDLE f=@(x) ATRAVÉS DE UMA EXPRESSÃO NAS SUAS VARIÁVEIS x(i); ES-
    % TAS VARIÁVEIS x(i)COMPOÊM A VARIÁVEL x DA FUNÇÃO f), SENDO x TRATADA A
    % NÍVEL DO MATLAB COMO UM VETOR COLUNA [x(1);x(2);...].
    
    % ESTE m.FILE IMPLEMENTA O SDM COM:
    % - ESCOLHA DE PASSOS lambda DE ACORDO COM AS CONDIÇÕES DE WOLFE;  RECORRE  
    %   AO FICHEIRO "Wolfe.m" ONDE ESTAS CONDIÇÕES ESTÃO IMPLEMENTADAS SEGUNDO 
    %   O ALGORITMO 2 (VER FICHEIRO SOBRE ESCOLHA DE PTOS INICIAIS E PASSOS).
    
    % ESTE M.file RECORRE A 3 m.FILES: 
    % - "nivelGraficos.m", "graficosLineSearch.m", "mean.m" E AINDA "Wolfe.m". 
    
    % PARTE 1: CÁLCULO SIMBÓLICO DO VETOR GRADIENTE [IMPLEMENTADO PARA
    % Nvar=1 OU Nvar=2; SE Nvar>2 É NECESSÁRIO EDITAR O CÓDIGO]

    syms a b 'real'   

    if Nvar==1
        v=a;          
    elseif Nvar==2
        v=[a; b];        
    end

    S=f(v);           
    dS=jacobian(S,v); 
    df=@(x) double(subs(dS,v,x)'); 

    % PARTE 2: DESIGNAÇÃO DOS OUTPUTS ARQUIVOS, ESSENCIAIS
    % AO TRATAMENTO GRÁFICO

    Lista=[];
    LNit=[];
    Lopt=[];

    % PARTE 3: INTERVALO PARA SELEÇÃO DOS PTOS INICIAIS
    
    a=x_values; b=y_values; 

    % PARTE 4: IMPLEMENTAÇÃO DO MÉTODO SDM (PROCESSO ITERATIVO)
    
    for i=1:NPontosIniciais
        x=(b-a).*rand(Nvar,1)+a; 
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
    Nmean=mean(LNit)


    % PARTE 9: EXIBIÇÃO DOS GRÁFICOS COM RECURSO A OUTROS m.FILES

     close all
     
     if Nvar==2 
     nivelGraficos(f,a(1),b(1),a(2),b(2))       
     
     hold on
     
     graficosLineSearch(Lista,LNit,Lopt)  
     
     hold off
    
        elseif Nvar==1
    
     graficosLineSearchNvar1(f,Lista,LNit,Lopt)
    
     hold on
    
     fplot(f,[a(1),b(1)])
    
     hold off
    
     end
     

end
