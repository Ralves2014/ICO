function nivelGraficos(f,a,b,c,d)

% ESTE m.FILE CRIA 2 REPRESENTA��ES GR�FICAS PARA FUN��ES f DE 2 VARI�VEIS
% x E y. CONCRETAMENTE OS SEUS OUTPUTS S�O:
% - GR�FICO (TRIDIMENSIONAL) DA FUN��O f NUM INTERVALO INDICADO [a,b]*[c,d]
% - REPRESENTA��O DAS CURVAS DE N�VEL DA FUN��O f NO MESMO INTERVALO
% - REPRESENTA��O GR�FICA DO SIM�TRICO DO VETOR GRADIENTE DE f SOBRE AS
%   CURVAS DE N�VEL DE f

% NENHUM DESTES INPUTS f, a, b, c, d � AQUI EXPLICITADO, VISTO QUE A
% VANTAGEM DESTE m.FILE � SERVIR DE SUPORTE GEN�RICO NA EXECU��O DE OUTROS
% m.FILES; S�O ESTES �LTIMOS QUE V�O "PEDIR" EXPLICITA��O DOS INPUTS f, a,
% b, c E d (OU J� OS T�M DEFINIDOS COM ESTAS MESMAS DESIGNA��ES/LETRAS).

% QUANDO NECESS�RIOS, OS ELEMENTOS f, a, b, c, d V�O SER DADOS COMO INPUTS
% DA SEGUINTE FORMA:
% - A FUN��O f � DEFINIDA COMO FUNCTION-HANDLE f=@(x) [O QUE PERMITE UMA
%   ESCRITA MAIS SIMPLES E O SEU USO INDIRETO NOUTRAS FUN��ES] ATRAV�S DE
%   UMA EXPRESS�O NAS 2 VARI�VEIS x(1) E x(2) [RESPETIVAMENTE x E y],
%   VARI�VEIS ESTAS QUE COMPO�M A VARI�VEL x DA FUN��O f; A VARI�VEL x DE f
%   � TRATADA A N�VEL DO MATLAB COMO UMA MATRIZ [x(1),x(2)]
% - O INTERVALO [a,b]*[c,d]


% PARTE 1: SCHEDULE DO INTERVALO I=[a,b]x[c,d] ONDE VARIAM x E y

h=5e-2;       % INCREMENTO h=5x10^(-2) QUE DETERMINA O N� DE DIVIS�ES EM I 
x=a:h:b;      % PARTI��O DA VARI�VEL x: DE a AT� b COM O INCREMENTO h
y=c:h:d;      % PARTI��O DA VARI�VEL y: DE c AT� d COM O MESMO INCREMENTO h


% PARTE 2: CRIA��O DE GRELHA NO EIXO DOS XX (X-EIXO) E EIXO DOS YY (Y-EIXO)

[X,Y]=meshgrid(x,y);   % COMANDO meshgrid E IDENTIFIC. DE X COM x E Y COM y


% PARTE 3: DEFINI��O DO Z-EIXO COMO O DE REPRESENTA��O DOS VALORES DE f 

for i=1:length(y)            % INDEXA��O por i DOS VALORES DE y, AT� AO SEU 
                             % N� M�XIMO length(y)
    for j=1:length(x)        % DADA A INDEXA��O ANTERIOR, SEGUE A INDEXA��O 
                             % POR j DOS VALORES DE x, AT� length(x)
        v=[X(i,j),Y(i,j)];   % CONSTRU��O (COMO MATRIZ) DO VETOR v DE COOR-
                             % DENADAS x E y
        Z(i,j)=f(v);         % Z-EIXO ONDE S�O REPRESENTADAS AS IMAGENS POR 
                             % f DOS VETORES v (MATRIZES)
    end
end


% PARTE 4: DEFINI��O DO VETOR GRADIENTE COMO MATRIZ [d1,d2]

[d1,d2]=gradient(Z, h);  % COMANDO gradient PARA C�LCULO DO GRADIENTE NUM�-
                         % RICO, ONDE d1 E d2 S�O, RESPETIVAMENTE, AS DERI-
                         % VADAS PARCIAIS EM ORDEM A x E A y, E � INDICADO
                         % O MESMO INCREMENTO h PARA Z=f(x,y)=f(v)


% PARTE 5: OUTPUT "GR�FICO TRIDIMENSIONAL DA FUN��O f"

meshc(X,Y,Z)        % COMANDO meshc PARA OBTER O GR�FICO DE f     

figure              % COMANDO figure A INDICAR A EXIBI��O DO GR�FICO DE f


% PARTE 6: OUTPUT "CURVAS DE N�VEL DA FUN��O f"
 
contour(X,Y,Z,'ShowText','on') % COMANDO contour PARA CURVAS DE N�VEL, ONDE
                               % 'ShowText' INDICA QUE Z � INTERPRETADO CO-
                               % MO ALTURAS EM RELA��O AO XY-PLANO E 'on' 
                               % TRANSFORMA A INFORMA��O MATRICIAL DOS VE-
                               % TORES v EM LISTAS

hold on     % COMANDO hold on PARA QUE ESTE OUTPUT E O SEGUINTE SEJAM DADOS
            % NA MESMA FIGURA, OU SEJA, RETEM ESTE OUTPUT, QUE N�O � ENT�O 
            % SUBSTITUIDO PELO PR�XIMO OUTPUT
           

% PARTE 7: OUTPUT "REPRESENTA��O GR�FICA DO SIM�TRICO DO GRADIENTE"

quiver(X,Y,-d1,-d2) % COMANDO quiver PARA DESENHAR NO SISTEMA DE EIXOS XOY,
                    % COMO SETAS, O CAMPO DE VETORES SIM�TRICO DO GRADIENTE 
                    % E ONDE -d1 E -d2 S�O AS COORDENADAS A REPRESENTAR

% N�O � NECESS�R. O COMANDO hold off PQ A hold on APENAS SE SEGUIU 1 OUTPUT

% NO FINAL DEVEMOS CORRER O m.FILE PARA VERIFICAR SE PEDE OS INPUTS
% PRETENDIDOS



