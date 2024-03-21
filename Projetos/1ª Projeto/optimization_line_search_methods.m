function optimization_line_search_methods()
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
    Nmax = getNmax()
    NPontosIniciais = getNPontosIniciais() 
    a = [-11;-11]; b = [7;7];
    Nvar=2;

    % LISTA DE FUNÇOES OBJETIVO QUE VAO SER TESTADAS
    r = @(x) 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
    g = @(x) x(1)*(x(1) + 3)*(x(1) - 3)*(x(1) - 5) + x(2)*(x(2) + 3)*(x(2) - 3)*(x(2) - 5);
    f = @(x) ((x(1))^2 - 100)*((x(1))^2 - 61) + ((x(2))^2 - 25)*((x(2))^2 - 16) - 15*cos(x(1)-(7/5))*cos(x(2)-(9/2));

    % Supostamente tens de ter o gradiente calculado
    % Chamas cada um dos metodos

    % Newton(errodf, Nmax, ...)
    
    
   
   

    

   
    
    

end

function N = getNmax()
    N = randi([35,50]);
end

function Npi = getNPontosIniciais()
    Npi = randi([8,13]);
end

function [dfx1,dfx2] = calcular_derivada(of)
    % Definir a função simbólica para x1 e x2
    syms x1 x2

    % Calcular as derivadas parciais de f em relação a x1 e x2
    dfx1 = diff(of([x1; x2]), x1);
    dfx2 = diff(of([x1; x2]), x2);

end