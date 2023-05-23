#include "TOTVS.CH"

User Function E3()
    Local nDist:= ''
    Local nTempo:= ''
    Local nVel:= ''
    Local Litros_Usados:= 0
    Local nKM := ''

    nVel   := Val(FwInputBox("Informe a velocidade na qual viajou, em quilometro/hora: " + nVel))
    nTempo := Val(FwInputBox("Agora informe o tempo gasto nesta viagem, em horas: " + nTempo ))

    FwAlertInfo("Vamos calcular a distancia percorrida!!")

    nDist := nTempo * nVel
    Alert("A distancia percorrida foi de: " + ALLTRIM(Str(nDist)) + "Km")

    FwAlertInfo("Agora vamos calcular a quantidade de combustivel utilizado na viagem!! A seguir informe o consumo medio do seu veiculo")

    nKM := Val(FwInputBox("Informe quantos quilometros seu veiculo percorre por litro de combustivel!" + nKM))
    Litros_Usados := nDist / nKM
    Alert("A quantidade de combustivel utilizado na viagem foi de: " + AllTRIM(STR(Litros_Usados)) + " litros")

    FwAlertInfo("Veja os parametros da sua viagem!")
    FwAlertInfo("Voce viajou à " + Alltrim(str(nVel)) + "Km/h" + CRLF + "Com o tempo de " + alltrim(str(nTempo));
     + "horas" + CRLF + "A distancia foi de " + alltrim(str(nDist)) + "KM" + CRLF + "E com o consumo de " + Alltrim(str(Litros_Usados)) + "litros")
Return 
