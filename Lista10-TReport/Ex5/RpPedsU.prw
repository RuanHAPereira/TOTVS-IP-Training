#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function RpPeds
    Função de gerar relatório
    @type  Function
    @author Ruan Pereira
    @since 08/04/2023
/*/
User Function RpPeds()

	Local oReport := GeraReport()
	oReport:PrintDialog()

Return

Static Function GeraReport()

	Local cAlias := GetNextAlias()
	Local oRel := TReport():New('RpPedido', 'Relatório de Pedidos de Compra',, { |oRel| Imprime(oRel, cAlias) }, 'Esse Relatório Imprimirá os Pedidos de Compra', .F.)
	Local oSection1 := TRSection():New(oRel, 'Cabecalho do Pedido')
	Local oSection2 := TRSection():New(oRel, 'Itens do Pedido')

	//!Sessão 1
	TRCell():New(oSection1, 'C7_NUM'    , 'SC7', 'Nº PEDIDO'   ,/*PICTURE*/     , 100 ,,, 'LEFT', .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO', 'SC7', 'DT. EMISSÃO' ,'@R 9999/99/99' , 100 ,,, 'LEFT', .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'C7_FORNECE', 'SC7', 'FORNECEDOR'  ,/*PICTURE*/     , 100 ,,, 'LEFT', .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'C7_LOJA'   , 'SC7', 'LOJA'        ,/*PICTURE*/     , 100 ,,, 'LEFT', .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'C7_COND'   , 'SC7', 'COND PAG'    ,/*PICTURE*/     , 100 ,,, 'LEFT', .F., 'LEFT' ,,, .F.,,, .T.)

	//!Sessão 2
	TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Nº PRODUTO',, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .F.)
	TRCell():New(oSection2, 'C7_DESCRI' , 'SC7', 'DESCRIÇÃO' ,,30,,,  'LEFT', .T.,  'LEFT', , ,  .T., , , .F.)
	TRCell():New(oSection2, 'C7_QUANT'  , 'SC7', 'QTD. PROD' ,, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .F.)
	TRCell():New(oSection2, 'C7_PRECO'  , 'SC7', 'PR. UNIT'  ,, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .F.)
	TRCell():New(oSection2, 'C7_TOTAL'  , 'SC7', 'VLR TOTAL' ,, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .F.)
	oBreak := TRBreak():New(oSection2, oSection1:Cell('C7_NUM'), "", .T.)
	TRFunction():New(oSection2:Cell('C7_TOTAL'), 'VALTOT', 'SUM', oBreak, "Valor Total")

return oRel

Static Function Imprime(oRel, cAlias)

	Local oSection1 := oRel:Section(1)
	Local oSection2 := oRel:Section(2)
	Local nTotReg   := 0
	Local cQuery    := GeraQuery()
	Local cUltPedi  := ''

	DbUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/,/*Compat*/, cQuery), cAlias, .T., .T.)

	Count TO nTotReg

	//configurando a regua
	oRel:SetMeter(nTotReg)
	oRel:SetTitle('Pedidos de Compra')
	oRel:StartPage()
    oSection1:ForceLineStyle()
    oRel:PageTotalInLine(.F.)

	//Iniciando as sessões
	
	(cAlias)->(DbGoTop())
	While (cAlias)->(!EOF())
		if oRel:Cancel()
			Exit
		endif
		if (cAlias)->C7_NUM != cUltPedi
            oSection1:Init()
			//sessão 1
			oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
			oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)
			oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)
			oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)
			oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)
			//printa a sessão
            cUltPedi := (cAlias)->C7_NUM
			oSection1:PrintLine()
			// oRel:ThinLine()
			oSection1:Finish()
           
            oSection2:Finish()
			
		endif
		
		//inicia a sessão 2
		 oSection2:Init()
		//sessão 2
		oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)
		oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)
		oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)
		oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)
		oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)
		oSection2:PrintLine()
        oRel:ThinLine()
		oRel:IncMeter()
		(cAlias)->(DbSkip())
	enddo
	(cAlias)->(DbCloseArea())
	// oSection1:Finish()
	
	oRel:EndPage()

return

Static Function GeraQuery()

	Local cQuery := ''
	cQuery := 'SELECT * FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' '"

return cQuery
