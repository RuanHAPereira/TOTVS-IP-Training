#INCLUDE 'TOTVS.CH'
#INCLUDE 'lib01.prw'

User Function RE003()
    local cAnos  := ''
    local cMeses := ''
    local cDias  := ''
    local nIdade := 0

    cAnos := FwInputBox('Digite aqui há quantos anos você nasceu.', cAnos)

    While !NUMBER(cAnos)
        FwAlertError('Você não digitou um número' , 'Erro!')
        cAnos := FwInputBox('Digite aqui há quantos anos você nasceu.', cAnos)
    End

    cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu aniversário.', cMeses)

    While !NUMBER(cMeses)
        FwAlertError('Você não digitou um número' , 'Erro!')
        cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu aniversário', cMeses)
    End

    cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesversário', cDias)

    While !NUMBER(cDias)
        FwAlertError('Você não digitou um número' , 'Erro!')
        cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesversário', cDias)
    End

    nIdade := ((VAL(cAnos) * 365)+(VAL(cMeses)*30)+VAL(cDias))

    FwAlertSuccess('Fazem ' + CVALTOCHAR(nIdade) + ' dias desde que você nasceu!')
Return
