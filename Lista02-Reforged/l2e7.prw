#INCLUDE "TOTVS.CH"

User Function E7()
    Local HoraInic, HoraFim, Duracao:='' 
    Local A, B := 0

    HoraInic := Val(FwInputBox("Informe a hora de inicio do jogo: " , HoraInic)) 
    HoraFim  := Val(FwInputBox("Informe a hora do termino do jogo: " , HoraFim))

    if (HoraInic >= 0 .and. HoraInic <= 23) .and. (HoraFim >= 0 .and. HoraFim <= 23)
        if HoraFim > HoraInic
            Duracao = HoraFim - HoraInic
            Alert("A duracao do jogo e de: " + Alltrim(str(Duracao) + " Horas"))
        else
           A = HoraFim - 0
           B = 24 - HoraInic
           Duracao = A + B
           Alert("A duracao do jogo e de: " + Alltrim(str(Duracao) + " Horas"))
        endif
    else
        Alert("Hora invalida!")
    endif
return nil
