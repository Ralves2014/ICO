function [minimos_locais, minimizantes_locais] = minimosMinimizantesLocais(Lopt, f)
    % Inicializa as variáveis
    minimos_locais = [];
    minimizantes_locais = [];

    % Avalia a função nos pontos finais e identifica os mínimos locais
    for i = 1:size(Lopt, 2)
        ponto = Lopt(:, i);
        valor = f(ponto);
        
        % Verifica se é um mínimo local comparando com os pontos vizinhos
        if i > 1 && i < size(Lopt, 2)
            if valor < f(Lopt(:, i-1)) && valor < f(Lopt(:, i+1))
                minimos_locais = [minimos_locais ponto];
                minimizantes_locais = [minimizantes_locais valor];
            end
        end
    end
end
 