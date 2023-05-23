#INCLUDE "TOTVS.CH"

User Function E9()
   Local nMes := 0
   Local cMes :=''

   nMes := Val(FwInputBox("Digite um numero de 1 a 12 para escolher um mes: "))
   cMes := MesExtenso(cMes)

   if nMes == 2
        FwAlertInfo("O mes de " + cMes + " tem 28 dias (29 dias se for bissexto).")
    elseif nMes == 4 .or. nMes == 6 .or. nMes == 9 .or. nMes == 11
        FwAlertInfo("O mes de " + cMes + " tem 30 dias.")
    else
        FwAlertInfo("O mes de " + cMes + " tem 31 dias")
    endif 
Return 
