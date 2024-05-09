# Otimização de Funções não Lineares 

## Introdução
A otimização de funções não lineares é um campo fundamental na matemática aplicada e na ciência da computação, desempenhando um papel crucial na resolução de uma variedade de problemas complexos. O problema em questão reside na minimização de funções não lineares, um desafio que permeia diversas áreas do conhecimento, desde a modelagem de fenómenos físicos até otimização de parâmetros em aplicações de machine learning.
As funções não lineares podem representar uma ampla diversidade de fenómenos e processos da vida real, muitas vezes caracterizados por comportamentos não triviais e múltiplos mínimos locais. A busca pelo mínimo global neste tipo de funções é frequentemente complicada pela presença desses mínimos locais, tornando o problema de otimização não linear altamente desafiador.
A complexidade destas funções e a presença de múltiplos mínimos locais exigem métodos de otimização eficazes que possam encontrar soluções de forma rápida e precisa. Nesse contexto, os métodos de busca em linha emergem como ferramentas poderosas, explorando eficientemente o espaço de busca para encontrar os mínimos desejados.

## Contextualização Teórica
### Métodos de Busca em Linha
Os métodos de busca em linha são algoritmos que visam responder ao problema anteriormente identificado. Através de várias iterações, procura-se atingir soluções aproximadas 𝑥 ∗ em problemas de minimização ( 𝑚𝑖𝑛𝑥 𝑓(𝑥) = ?).
A partir de um ponto inicial /semente, pretende-se, em cada passo, avançar numa direção de descida, de forma a garantir que o valor seguinte é sempre inferior ao anterior, com o objetivo de atingir o mínimo. Neste trabalho abordar-se-ão alguns métodos de busca diferentes, como o Método de Descida Máxima e o Método de Newton-Raphson. Para além disso, será analisada a utilização das condições de Wolfe.

### Método de Descida Máxima
O Método de Descida Máxima, também conhecido como método do gradiente descendente, é uma abordagem iterativa usada para encontrar o mínimo de uma função. Este método baseia-se na minimização iterativa de uma função, ajustando os parâmetros na direção oposta ao gradiente local.
O gradiente indica a direção de maior inclinação da função, e ao mover-se na direção oposta, procura-se atingir o ponto de mínimo da função. A atualização dos parâmetros ocorre multiplicando o gradiente pela taxa de aprendizagem, controlando assim o tamanho dos passos em cada iteração. Este método revela-se particularmente eficaz em problemas de otimização convexa, proporcionando uma abordagem sistemática para a convergência em direção ao mínimo global.

### Método de Newton-Raphson
O Método de Newton-Raphson é uma técnica iterativa utilizada para encontrar raízes de funções ou extremos (mínimos/máximos). Esta abordagem fundamenta-se na aproximação local da função por uma parábola, utilizando informações da função e da sua segunda derivada (curvatura). Ao determinar o mínimo ou máximo desta parábola, obtém-se uma estimativa mais precisa da solução.
A atualização dos parâmetros leva em consideração tanto o gradiente como a matriz Hessiana da função. Este método permite uma convergência mais rápida em comparação com o Método de Descida Máxima, uma vez que incorpora informações adicionais sobre a curvatura da função. Contudo, o cálculo da matriz Hessiana pode ser computacionalmente exigente, e em alguns casos, a singularidade ou complexidade do problema pode afetar a eficácia do método.
