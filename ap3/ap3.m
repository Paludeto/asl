% Neste exercício você irá fazer uma função no MATLAB, denominada EnPot, que calcula a energia e a potencia de um sinal.
% Os parâmetros de entrada da função EnPot são variáveis simbólicas f e T, que  representam o sinal e o período avaliado.
% A função EnPot deverá retornar como parâmetros de saída o cômputo da energia e a potência do sinal, 
% bem como a análise do tipo de sinal (se energia, potência ou indefinido), valor médio, eficaz e a variância.
% O valor da energia deve ser um valor numérico armazenado na variável Ex;
% O valor da potencia deve ser um valor numérico armazenado na variável Px;
% A variável tipo conterá uma string com a descrição do tipo do sinal avaliado: 'Potencia' para sinal do tipo potência; 
% 'Energia' para sinal do tipo energia; 'Indefinido' para sinal que não se enquadrar em nenhum dos casos anteriores.
% A variável Media deve armazenar o valor médio do sinal, caso o valor seja infinito definir como not a number.
% A variável RMS deve armazenar o valor eficaz do sinal, caso a potência seja infinita definir como not a number.
% A variável VarTempo deve armazenar a variância do sinal para sinais do tipo energia, caso o sinal seja do tipo potência deve-se retornar not a number.

function [Ex] = EnPot(f,T)
    
    % Variável simbólica t
    syms t

    Ex = int(abs(f)^2, t, -inf, inf);

    disp(Ex);

end 

syms t
f = exp(-abs(t));

EnPot(f, inf)