#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE003()
    local cAnos  := ''
    local cMeses := ''
    local cDias  := ''
    local nIdade := 0

    cAnos := FwInputBox('Digite aqui h� quantos anos voc� nasceu.', cAnos)

    While !NUMBER(cAnos)
        FwAlertError('Voc� n�o digitou um n�mero' , 'Erro!')
        cAnos := FwInputBox('Digite aqui h� quantos anos voc� nasceu.', cAnos)
    End

    cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu anivers�rio.', cMeses)

    While !NUMBER(cMeses)
        FwAlertError('Voc� n�o digitou um n�mero' , 'Erro!')
        cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu anivers�rio', cMeses)
    End

    cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesvers�rio', cDias)

    While !NUMBER(cDias)
        FwAlertError('Voc� n�o digitou um n�mero' , 'Erro!')
        cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesvers�rio', cDias)
    End

    nIdade := ((VAL(cAnos) * 365)+(VAL(cMeses)*30)+VAL(cDias))

    FwAlertSuccess('Fazem ' + CVALTOCHAR(nIdade) + ' dias desde que voc� nasceu!')
Return
