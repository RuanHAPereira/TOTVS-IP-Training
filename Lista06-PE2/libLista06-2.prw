#INCLUDE 'TOTVS.CH'

User Function ValTipEn()

    Local aArea     := GetArea()
    Local lRet      := .T.
    Local _nPosTES  := aScan(aHeader,{|x| Alltrim(x[2]) == "C7_TES"})

    DO CASE
        CASE Empty(aCols[n,_nPosTES])
        FwAlertError('Tipo de entrada n�o preenchido!!', 'Aten��o!')
        lRet := .f.
    END CASE

    RestArea(aArea)

Return lRet

User Function MsgBotao()
    MSGALERT('Bot�o acionado com sucesso', 'Sucesso!')
Return

User Function BotCadPro()

    Local cAlias  := 'SB1'
    Local cTitulo := 'Cadastro de Produtos'
    Local lVldExc := .T.
    Local lVldAlt := .T.

    DbSelectArea(cAlias)
    DbSetOrder(1)

    AxCadastro(cAlias, cTitulo, lVldExc, lVldAlt)
Return
