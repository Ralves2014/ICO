function [ output_args ] = exercicio( input_args )

% ESTE m.FILE SERVE DE APOIO E EXEMPLIFICAÇÃO AOS EXERCÍCIOS 5 E 6
% (RESOLUÇÃO MANUSCRITA DE DIA 21/FEV., não são do Trabalho 1)

syms a b c;

f=exp(a-b)+exp(b-a)+exp(a^2)+c^2

% OBTENÇÃO DO VETOR GRADIENTE
g=[diff(f,a);diff(f,b);diff(f,c)]

% OBTENÇÃO DA MATRIZ HESSIANA
H=[diff(g(1),a) diff(g(1),b) diff(g(1),c);
    diff(g(2),a) diff(g(2),b) diff(g(2),c);
    diff(g(3),a) diff(g(3),b) diff(g(3),c)]

% CÁLCULO DOS PTOS CRÍTICOS; PARA OBTER AS EXPRESSÕES FAZER CORRER AS ANTE-
% RIORES PREVIAMENTE
[a,b,c]=solve('exp(a-b)-exp(b-a)+2*a*exp(a^2)=0','exp(b-a)-exp(a-b)=0','2*c=0')

% CÁLCULO DA MATRIZ HESSIANA NOS PTOS CRÍTICOS
F=eval(H)

% CÁLCULO DOS VALORES PRÓPRIOS DA MATRIZ F; EM M OBTEMOS A MATRIZ
% M-lambdaI E EM D ESTA MATRIZ M "DIAGONALIZADA" ONDE SÃO VISÍVEIS OS VALO-
% RES PRÓPRIOS COMO OS ELEMENTOS DA DIAGONAL PRINCIPAL 
[M,D]=eig(F)
end

