% MÉTODO DE NEWTON-RAPHSON (N-RM)

% ESTE m.FILE IMPLEMENTA O N-RM COM:
% - GERAÇÃO PSEUDO-ALEATÓRIA DE PTOS INICIAIS x_0
% - ESCOLHA DE PASSOS lambda DE ACORDO COM AS CONDIÇÕES DE WOLFE;  RECORRE  
%   AO FICHEIRO "Wolfe.m" ONDE ESTAS CONDIÇÕES ESTÃO IMPLEMENTADAS SEGUNDO 
%   O ALGORITMO 2 (VER FICHEIRO SOBRE ESCOLHA DE PTOS INICIAIS E PASSOS).

% ESTE m.FILE PERMITE A EXISTÊNCIA DE PARÂMETROS A AJUSTAR, O QUE O TORNA +  
% FUNCIONAL; ESSES PARÂMETROS SÃO a, b E c DA FUNÇÃO OBJETIVO E OUTROS RE
% LATIVOS ÀS CONDIÇÕES DE PARAGEM, AO Nº (NPontosIniciais) DE PTOS INICIAIS
% x_0, ETC...

% ESTE M.file RECORRE A 3 m.FILES: 
% - "nivelGraficos.m", "graficosLineSearch.m", "mean.m" E AINDA "Wolfe.m". 

% APENAS SÃO INDICADAS AS LINHAS DE CÓDIGO QUE NÃO FAZEM PARTE DOS FICHEI-
% ROS ANTERIORMENTE FORNECIDOS.

clc
clear

% PARTE 1: DEFINIÇÃO DA FUNÇÃO OBJETIVO, DAS MATRIZES JACOBIANA (A SUBSTI-
%          TUIR O CÁLCULO SIMBÓLICO DO VETOR GRADIENTE PRESENTE NOS FICHEI-
%          ROS ANTERIORES) E HESSINA E DO Nº DE VARIÁVEIS

a=0.2;
b=1.9;
c=1.5;

f=@(x) (x(1)^2-100)*(x(1)^2-81)+(x(2)^2-25)*(x(2)^2-16)-a*cos(x(1)-b)*cos(x(2)-c);

df=@(x) [4*x(1)^3-362*x(1)+a*sin(x(1)-b)*cos(x(2)-c);4*x(2)^3-82*x(2)+a*cos(x(1)-b)*sin(x(2)-c)];

d2f=@(x) [12*x(1)^2-362+a*cos(x(1)-b)*cos(x(2)-c), -a*sin(x(1)-b)*sin(x(2)-c);... 
          -a*sin(x(1)-b)*sin(x(2)-c), 12*x(2)^2-82+a*cos(x(1)-b)*cos(x(2)-c)];

 Nvar=2;     

 
 % PARTE 2: DEFINIÇÃO DOS PARÂMETROS PARA OS CRITÉRIOS/CONDIÇÕES DE PARAGEM

Nmax=100; 
errodf=1e-2;  


% PARTE 3: DESIGNAÇÃO DOS OUTPUTS ARQUIVOS (ESSENCIAIS AO TRATAMENTO GRÁF.)

Lista=[];    
LNit=[];       
Lopt=[];     


% PARTE 4: Nº DE PTOS INICIAIS E INTERVALO PARA SELEÇÃO DOS PTOS INICIAIS

NPontosIniciais=10; 

a=[-15;-10]; b=[15;10];  



% PARTE 5: IMPLEMENTAÇÃO DO MÉTODO N-RM (PROCESSO ITERATIVO)
%          (TAL COMO NO FICH. "descidaMaximaV1aula.m", NÃO SE USOU (-)Novo
%          PARA QUE NÃO FOSSE NECESSÁRIO O CÓDIGO DE RETOMA DAS DESIGNAÇÕES
%          INICIAIS, COMO FEITO NOS FICHEIROS "descidaMaximaV3.m" e "desci-
%          daMaximaWolfe.m"; PODEMOS OPTAR POR QUALQUER UMA DAS FORMAS)

for i=1:NPontosIniciais
    x=(b-a).*rand(Nvar,1)+a; 
    lambda=1;                 
    Lista=[Lista, x];       
    dfx=df(x);               
    N=1;
    
    while norm(dfx)>errodf && N<Nmax               
    d2fx=d2f(x);
    d=-inv(d2fx)*dfx;           % CARATERIZAÇÃO DA DIREÇÃO DE BUSCA do N-RM
    [lambda,]=Wolfe(x,f,df,d,1);  
    x=x+lambda*d;             
    Lista=[Lista, x];        
    dfx=df(x);               
    N=N+1;                  
    end 
    
    Lopt=[Lopt, x];
    LNit=[LNit, N];
end


% PARTE 6: OBTENÇÃO DO MÍNIMO GLOBAL

xopt=Lopt(:,1); 

for i=2:NPontosIniciais
    if f(xopt)>f(Lopt(:,i)); 
        xopt=Lopt(:,i);      
    end
end
        

% PARTE 7: DEFINIÇÃO E EXIBIÇÃO DOS OUTPUTS (SÃO EXIBIDOS NA COMMAND WINDOW
%          PORQUE NÃO É COLOCADO ";" NO FINAL, EMBORA SEM LEGENDA)

xoptimo=xopt        
foptimo=f(xopt)    
dffinal=df(xopt)    
NIterMean=mean(LNit)   
HessianFinal=d2f(xopt)  %%% EXIBIÇÃO DA HESSIANA NO PONTO ÓPTIMO
D2=det(HessianFinal)    %%% EXIBIÇÃO DO 2º MENOR PRINCIPAL



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