#INCLUDE "TOTVS.CH"

User Function l5e01()
    Local aSemana := {"Domingo","Segunda-feira","Terca-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sabado"}
    Local nNum    := Val(FwInputBox("Digite um numero correspondente ao dia da semana desejado: "))

    if nNum < 1 .or. nNum > 7 
        FwAlertInfo("Valor invalido!!")
    else
        FwAlertInfo(aSemana[nNum])
    endif 
Return 
