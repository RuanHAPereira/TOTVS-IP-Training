#INCLUDE "TOTVS.CH"

User Function RE39()
    local aNomes    := {'Tamíris','Pintor','ED','Dani','Giu','Gabriela','Ruan','Quirino','João','Gustavão',;
                        'Natan','Steph','Henrique','Lucas','Fábio','Muriel', 'Vinicius'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , LEN(aNomes))

    FwAlertSuccess('E o ganhador (OU NÃO) é o(a): ' + aNomes[nSort])

Return

// 39 - Faça um programa que realiza o sorteio de um
// nome. Os nomes contidos no programa devem os
// nomes dos participantes da trilha de capacitação
// do Projeto Start II.
