#INCLUDE "TOTVS.CH"

User Function RE39()
    local aNomes    := {'Tam�ris','Pintor','ED','Dani','Giu','Gabriela','Ruan','Quirino','Jo�o','Gustav�o',;
                        'Natan','Steph','Henrique','Lucas','F�bio','Muriel', 'Vinicius'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , LEN(aNomes))

    FwAlertSuccess('E o ganhador (OU N�O) � o(a): ' + aNomes[nSort])

Return

// 39 - Fa�a um programa que realiza o sorteio de um
// nome. Os nomes contidos no programa devem os
// nomes dos participantes da trilha de capacita��o
// do Projeto Start II.
