#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function RelPedido
    Função de gerar relatório
    @type  Function
    @author Ruan Pereira
    @since 08/04/2023
/*/
User Function RelPedido()

	Local oReport := CriaReport()
	oReport:PrintDialog()

Return

Static Function CriaReport()

	Local cAlias    := GetNextAlias()
	Local oRel      := TReport():New('RelPedido', 'Relatório de Pedidos de Compra',, { |oRel| Print(oRel, cAlias) }, 'Esse Relatório Imprimirá o Pedido de Compra Selecionado', .F.)
	Local oSection1 := TRSection():New(oRel, 'Cabecalho do Pedido')
	Local oSection2 := TRSection():New(oSection1, 'Itens do Pedido')

	//!Sessão 1
	TRCell():New(oSection1, 'C7_NUM'    , 'SC7', 'Nº PEDIDO'   ,/*PICTURE*/     , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO', 'SC7', 'DT. EMISSÃO' ,'@R 9999/99/99' , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection1, 'C7_FORNECE', 'SC7', 'FORNECEDOR'  ,/*PICTURE*/     , 30 ,,,'LEFT'   , .T., 'LEFT'   ,,, .T.,,, .T.)
	TRCell():New(oSection1, 'C7_LOJA'   , 'SC7', 'LOJA'        ,/*PICTURE*/     , 4  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection1, 'C7_COND'   , 'SC7', 'COND PAG'    ,/*PICTURE*/     , 4  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)

	//!Sessão 2
	TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Nº PRODUTO'  ,/*PICTURE*/     , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection2, 'C7_DESCRI' , 'SC7', 'DESCRIÇÃO'   ,/*PICTURE*/     , 30 ,,,  'LEFT' , .T.,  'LEFT'  ,,, .T.,,, .T.)
	TRCell():New(oSection2, 'C7_QUANT'  , 'SC7', 'QTD. PROD'   ,/*PICTURE*/     , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection2, 'C7_PRECO'  , 'SC7', 'PR. UNIT'    ,/*PICTURE*/     , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)
	TRCell():New(oSection2, 'C7_TOTAL'  , 'SC7', 'VLR TOTAL'   ,/*PICTURE*/     , 8  ,,,'CENTER' , .F., 'CENTER' ,,, .T.,,, .T.)

	//EXERCICIO 4 
	oBreak := TRBreak():New(oSection1, oSection1:Cell('C7_NUM'), '', .T.)
	TRFunction():New(oSection2:Cell('C7_TOTAL'),'VALTOT', 'SUM', oBreak, 'VLR TOTAL',,, .F., .F., .F.) 
	
return oRel

Static Function Print(oRel, cAlias)

	Local oSection1 := oRel:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg   := 0
	Local cQuery    := CriaQuery()

	DbUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/,/*Compat*/, cQuery), cAlias, .T., .T.)

	Count TO nTotReg

	//configurando a regua
	oRel:SetMeter(nTotReg)
	oRel:SetTitle('Relatório de Pedidos de Compra')
	oRel:StartPage()
	
	//Iniciando as sessões
	oSection1:Init()
	oSection2:Init()
	(cAlias)->(DbGoTop())

	//sessão 1
	oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
	oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)
	oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)
	oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)
	oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)
	oSection1:PrintLine()

	// oRel:ThinLine()
	(cAlias)->(DbGoTop())
	While (cAlias)->(!EOF())
		if oRel:Cancel()
			Exit
		endif
		//sessão 2
		oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)
		oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)
		oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)
		oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)
		oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)
		oSection2:PrintLine()
		oRel:IncMeter()
		(cAlias)->(DbSkip())
	enddo
	(cAlias)->(DbCloseArea())
	oSection1:Finish()
	oSection2:Finish()
	oRel:EndPage()

return

Static Function CriaQuery()

	Local cQuery := ''
	cQuery := 'SELECT * FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' ' AND C7_NUM = '" + SC7->C7_NUM + "' "

return cQuery
