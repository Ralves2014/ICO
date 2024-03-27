function xopt = minGlobal(Lopt, f)
    % Inicialização com o primeiro ponto ótimo local
    xopt = Lopt(:, 1); 
    
    % Itera sobre os pontos ótimos locais para encontrar o mínimo global
    for i = 2:size(Lopt, 2)
        % Verifica se o valor da função objetivo no ponto atual é menor que o mínimo atual
        if f(xopt) > f(Lopt(:, i))
            xopt = Lopt(:, i); % Atualiza o mínimo global
        end
    end
end

