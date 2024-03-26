function [ output_args ] = exercicio( input_args )

% ESTE m.FILE SERVE DE APOIO E EXEMPLIFICA��O AOS EXERC�CIOS 5 E 6
% (RESOLU��O MANUSCRITA DE DIA 21/FEV., n�o s�o do Trabalho 1)

syms a b c;

f=exp(a-b)+exp(b-a)+exp(a^2)+c^2

% OBTEN��O DO VETOR GRADIENTE
g=[diff(f,a);diff(f,b);diff(f,c)]

% OBTEN��O DA MATRIZ HESSIANA
H=[diff(g(1),a) diff(g(1),b) diff(g(1),c);
    diff(g(2),a) diff(g(2),b) diff(g(2),c);
    diff(g(3),a) diff(g(3),b) diff(g(3),c)]

% C�LCULO DOS PTOS CR�TICOS; PARA OBTER AS EXPRESS�ES FAZER CORRER AS ANTE-
% RIORES PREVIAMENTE
[a,b,c]=solve('exp(a-b)-exp(b-a)+2*a*exp(a^2)=0','exp(b-a)-exp(a-b)=0','2*c=0')

% C�LCULO DA MATRIZ HESSIANA NOS PTOS CR�TICOS
F=eval(H)

% C�LCULO DOS VALORES PR�PRIOS DA MATRIZ F; EM M OBTEMOS A MATRIZ
% M-lambdaI E EM D ESTA MATRIZ M "DIAGONALIZADA" ONDE S�O VIS�VEIS OS VALO-
% RES PR�PRIOS COMO OS ELEMENTOS DA DIAGONAL PRINCIPAL 
[M,D]=eig(F)
end

