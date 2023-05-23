#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 16/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function E2()
    Local nDist:= ''
    Local nTempo:= ''
    Local nVel:= ''
    Local Litros_Usados:= 0

    nVel   := Val(FwInputBox("Informe a velocidade na qual viajou, em quilometro/hora: " + nVel))
    nTempo := Val(FwInputBox("Agora informe o tempo gasto nesta viagem, em horas: " + nTempo ))

    FwAlertInfo("Vamos calcular a distancia percorrida!!")

    nDist := nTempo * nVel
    Alert("A distancia percorrida foi de: " + ALLTRIM(Str(nDist)) + "Km")

    FwAlertInfo("Agora vamos calcular a quantidade de combustivel utilizado na viagem, considerando que seu veiculo consuma 12 km por litro!!")

    Litros_Usados := nDist / 12
    Alert("A quantidade de combustivel utilizado na viagem foi de: " + AllTRIM(STR(Litros_Usados)) + " litros")

    FwAlertInfo("Veja os parametros da sua viagem!")
    FwAlertInfo("Voce viajou à " + Alltrim(str(nVel)) + "Km/h" + CRLF + "Com o tempo de " + alltrim(str(nTempo));
     + "horas" + CRLF + "A distancia foi de " + alltrim(str(nDist)) + "KM" + CRLF + "E com o consumo de " + Alltrim(str(Litros_Usados)) + "litros")
Return
