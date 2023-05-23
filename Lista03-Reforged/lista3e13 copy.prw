#INCLUDE "TOTVS.CH"

User Function DiaSemana()
    Local aSemana := {"Domingo","Segunda","Terca","Quarta","Quinta","Sexta","Sabado"}
    Local nNum    := Val(FwInputBox("Digite um numero correspondente ao dia da semana desejado: "))

    if nNum < 1 .or. nNum > 7 
        FwAlertInfo("Valor invalido!!")
    else
        FwAlertInfo(aSemana[nNum])
    endif 
Return 
