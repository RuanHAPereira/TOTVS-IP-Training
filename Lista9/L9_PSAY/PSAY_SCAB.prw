#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAY_SCAB
    Exercicio sobre PSAY, relatorio de produtos SEM CABEÇALHO
    @type  Function
    @author Ruan Pereira
    @since 04/04/2023
/*/
User Function PSAY_SCAB()

	Local cTitle      := 'Produtos Cadastrados'
	Private cNomeRel  := 'PSAY_SCAB'
	Private cAlias    := 'SB1'
	Private cNomeProg := 'PSAY_SCAB'
	Private cDesc1    := 'Ex 01 - Relatorio sem cabecalho'
	Private cSize     := 'M'
	Private aReturn   := {'Zebrado', 1, 'Administracao', 1, 2, '', '', 1}
    Private m_pag	  := 1
 
	cNomeRel := SetPrint(cAlias, cNomeProg, '', @cTitle, cDesc1, , , .F.,, .T., cSize,, .F.)

	SetDefault(aReturn, cAlias)

	RptStatus({|| Print()}, cTitle, 'Gerando Relatorio...')

Return

Static Function Print()

	Local nLine  := 8
	Local cPreco := ''
    Local nCont  := 0

    Cabec("Produtos Cadastrados", '', '',, cSize)

	DbSelectArea('SB1')

	SB1->(DbSetOrder(1))

	while !EOF()
        nCont++
		if Empty(SB1->B1_PRV1)
			cPreco := 'R$0,00'
		else
			cPreco := 'R$' + STRTRAN(STR(SB1->B1_PRV1, 7,2), ".", ",")
		endif
		if !Empty(Alltrim(SB1->B1_COD))
			@ ++nLine, 06 PSAY PADR('Codigo: ', 14) + Alltrim(SB1->B1_COD)
			@ ++nLine, 06 PSAY PADR('Descricao: ', 14) + Alltrim(SB1->B1_DESC)
			@ ++nLine, 06 PSAY PADR('Un. Medida: ', 14) + Alltrim(SB1->B1_UM)
			@ ++nLine, 06 PSAY PADR('Preco: ', 14) + cPreco
			@ ++nLine, 06 PSAY PADR('Armazem: ', 14) + Alltrim(SB1->B1_LOCPAD)
			@ ++nLine, 03 PSAY REPLICATE( "-", 30)
		endif
        if nCont == 8
            nCont := 0
            nLine := 0
        endif 
		SB1->(DbSkip())
	enddo

	SET DEVICE TO SCREEN

	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomeRel)
	endif

	MS_FLUSH()

return
