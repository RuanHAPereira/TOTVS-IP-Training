#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'


/*/{Protheus.doc} User Function PrintForn
   Relatório utilizando TReport 
    @type  Function
    @author Ruan Pereira
    @since 10/04/2023
/*/
User Function PrintForn()

	Local oReport := CriaReport()
	oReport:PrintDialog()

Return

Static Function CriaReport()

	Local cAlias   := GetNextAlias()
	Local oRel     := TReport():New('PrintForn', 'Relatorio de Fornecedor',, { |oRel| Print(oRel, cAlias) }, 'Relatorio do Cadastro do Fornecedor Selecionado', .F.)
	Local oSection := TRSection():New(oRel, 'Cadastro de Fornecedor')

	TRCell():New(oSection, 'A2_COD'    , 'SA2', 'CÓDIGO'        ,/*PICTURE*/   , 8 ,,,'CENTER' , .F., 'CENTER', , , .T., , , .T.)
	TRCell():New(oSection, 'A2_LOJA'   , 'SA2', 'LOJA'          ,/*PICTURE*/   , 4 ,,,'CENTER' , .F., 'CENTER', , , .T., , , .T.)
	TRCell():New(oSection, 'A2_NOME'   , 'SA2', 'RAZÃO SOCIAL'  ,/*PICTURE*/   , 30,,,'LEFT'   , .T., 'LEFT'  , , , .T., , , .T.)
	TRCell():New(oSection, 'A2_END'    , 'SA2', 'ENDEREÇO'      ,/*PICTURE*/   , 30,,,'LEFT'   , .T., 'LEFT'  , , , .T., , , .T.)
	TRCell():New(oSection, 'A2_BAIRRO' , 'SA2', 'BAIRRO'        ,/*PICTURE*/   , 20,,,'LEFT'   , .T., 'LEFT'  , , , .T., , , .T.)
	TRCell():New(oSection, 'A2_MUN'    , 'SA2', 'CIDADE'        ,/*PICTURE*/   , 20,,,'LEFT'   , .T., 'LEFT'  , , , .T., , , .T.)
	TRCell():New(oSection, 'A2_EST'    , 'SA2', 'UF'            ,/*PICTURE*/   , 4 ,,,'CENTER' , .F., 'CENTER', , , .T., , , .T.)
	TRCell():New(oSection, 'A2_CEP'    , 'SA2', 'CEP'           ,'@E 99999-999', 11,,,'CENTER' , .F., 'CENTER', , , .T., , , .T.)
	TRCell():New(oSection, 'A2_TEL'    , 'SA2', 'TELEFONE'      ,/*PICTURE*/   , 11,,,'LEFT'   , .T., 'LEFT'  , , , .T., , , .T.)

return oRel

Static Function Print(oRel, cAlias)

	Local oSection := oRel:Section(1)
	Local nTotReg  := 0
	Local cQuery   := SelecQuery()

	DbUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/,/*Compat*/, cQuery), cAlias, .T., .T.)

	Count TO nTotReg

	oRel:SetMeter(nTotReg)
	oRel:SetTitle('Relatório de fornecedor')
	oRel:StartPage()
	oSection:Init()

	(cAlias)->(DbGoTop())

	oSection:Cell('A2_COD'):SetValue((cAlias)->A2_COD)
	oSection:Cell('A2_LOJA'):SetValue((cAlias)->A2_LOJA)
	oSection:Cell('A2_NOME'):SetValue((cAlias)->A2_NOME)
	oSection:Cell('A2_END'):SetValue((cAlias)->A2_END)
	oSection:Cell('A2_BAIRRO'):SetValue((cAlias)->A2_BAIRRO)
	oSection:Cell('A2_MUN'):SetValue((cAlias)->A2_MUN)
	oSection:Cell('A2_EST'):SetValue((cAlias)->A2_EST)
	oSection:Cell('A2_CEP'):SetValue((cAlias)->A2_CEP)
	oSection:Cell('A2_TEL'):SetValue((cAlias)->A2_TEL)
	oSection:PrintLine()
	oRel:ThinLine()
	oRel:IncMeter()

	(cAlias)->(DbCloseArea())

	oSection:Finish()
	oRel:EndPage()

return

Static Function SelecQuery()

	Local cQuery := ''

	cQuery := 'SELECT * FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' ' AND A2_COD = '" + SA2->A2_COD + "' "

return cQuery
