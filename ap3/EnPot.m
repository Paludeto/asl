function [Ex, Px, Tipo, Media, RMS, VarTempo] = EnPot(f, T)

    syms t

    % Calcula energia e potência simbólica
    Ex_sym = int(abs(f)^2, t, -inf, inf);
    Px_sym = limit((1/(2*T))*int(abs(f)^2, t, -T, T), T, inf);

    % Avalia o tipo de sinal
    if isfinite(Ex_sym) && Ex_sym > 0 && (isinf(Px_sym) || Px_sym == 0)
        Tipo = 'Energia';
    elseif isfinite(Px_sym) && Px_sym > 0 && isinf(Ex_sym)
        Tipo = 'Potencia';
    else
        Tipo = 'Indefinido';
    end

    % Valores numéricos para energia e potência
    Ex = double(Ex_sym);
    Px = double(Px_sym);

    % Média do sinal
    Media_sym = limit((1/(2*T))*int(f, t, -T, T), T, inf);
    Media = double(Media_sym);
    if ~isfinite(Media)
        Media = NaN;
    end

    % Valor eficaz (RMS)
    if isfinite(Px) && Px > 0
        RMS = sqrt(Px);
    else
        RMS = NaN;
    end

    % Variância temporal
    if strcmp(Tipo, 'Energia')
        tm_sym = (1/Ex_sym)*int(t*abs(f)^2, t, -inf, inf);
        tm = double(tm_sym);
        VarTempo_sym = (1/Ex_sym)*int((t - tm)^2 * abs(f)^2, t, -inf, inf);
        VarTempo = double(VarTempo_sym);
    else
        VarTempo = NaN;
    end

end