function tipo = tipoConvergencia(dffinal, errodf, Nmax)
    if norm(dffinal) < errodf
        tipo = 'Convergência para um mínimo global';
    elseif Nmax <= 0
        tipo = 'Falha na convergência (número máximo de iterações atingido)';
    else
        tipo = 'Convergência para um mínimo local';
    end
end
