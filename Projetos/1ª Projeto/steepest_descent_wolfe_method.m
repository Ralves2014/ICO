function d = steepest_descent_wolfe_method(f, Nvar, Nmax, errodf, NPontosIniciais, x_values, y_values)
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
    
    d=1;

    % PARTE 1: CÁLCULO SIMBÓLICO DO VETOR GRADIENTE [IMPLEMENTADO PARA
    % Nvar=1 OU Nvar=2; SE Nvar>2 É NECESSÁRIO EDITAR O CÓDIGO]

    syms a b 'real'   

    if Nvar==1
        v=a;          
    elseif Nvar==2
        v=[a; b];        
    end

    disp(v);

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
        disp(x)
    end

end
