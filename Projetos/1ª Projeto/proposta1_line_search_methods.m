function proposta1_line_search_methods()
    % NESTE m.FILE IREMOS:
    % - EXPLORAR OS MÉTODOS DE BUSCA EM LINHA MENCIONADOS(MÉTODO DE DESCIDA
    %   MAXIMA, MÉTODO DE NEWTON-RAPHSON E O MÉTODO DE DESCIDA MAXIMA COM
    %   WOLFE) ; APLICANDO-OS A DIVERSAS FUNÇÕES.
    % - REALIZAR UMA ANÁLISE COMPARATIVA DE DESEMPENHO ENTRE ESSES MÉTODOS,
    %   CONSIDERANDO TANTO OS CASOS EM QUE SÃO APLICADAS 
    % - COMPREENDER COMO CADA ALGORITMO SE COMPORTA PERANTE DIFERENTES
    %   TIPOLOGIAS DE FUNÇÃO.

    % ATRIBUIÇAO DE VALORES A VARIAVEIS COMUNS
    errodf = 15e-2;
    Nmax = randi(35,50);
    NPontosIniciais = randi(8,13); 
    a = [-11;-11]; b = [7;7];
    Nvar=2;

    % LISTA DE FUNÇOES OBJETIVO QUE VAO SER TESTADAS
    
    % Supostamente tens de ter o gradiente calculado
    % Chamas cada um dos metodos

    % Newton(errodf, Nmax, ...)
    
    
   
   

    

   
    
    

end

function [dfx1,dfx2] = calcular_derivada(of)
    % Definir a função simbólica para x1 e x2
    syms x1 x2

    % Calcular as derivadas parciais de f em relação a x1 e x2
    dfx1 = diff(of([x1; x2]), x1);
    dfx2 = diff(of([x1; x2]), x2);

end