#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT 1
#DEFINE CENTER 2
#DEFINE RIGHT 3

#DEFINE GENERAL 1
#DEFINE NUMERIC 2
#DEFINE MONETARY 3
#DEFINE DATE_TIME 4

/*/{Protheus.doc} User Function GetCurso
    Relatório em .xls
    @type  Function
    @author Ruan Pereira
    @since 20/04/2023
    /*/
User Function L12Ex03()

    local oExcel := FwMsExcelEx():New()
    local cPath     := GetTempPath()
    local cFile     := "Relatorio_Cursos.xls"
    local aDados    := {}
    local cAlias    := GetNextAlias()
    local aArea     := GetArea()
    local cQuery    := ""
    local cIdCurso  := ""
    local cCurso    := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'ZZA' MODULO 'COM'

    cQuery := "SELECT ZZA.ZZA_COD, ZZA.ZZC_CURSO, ZZD.ZZD_CURSO, ZZD.ZZD_COD, ZZD.ZZD_NOME" + CRLF
    cQuery += "ZZD.ZZD_DTINIC, ZZD.D_E_L_E_T_ AS DEL1, ZZA.D_E_L_E_T_ AS DEL2 FROM " + RetSqlName("ZZA") + " ZZA INNER JOIN " + RetSqlName("ZZD") + CRLF 
    cQuery +=  + " ZZD ON ZZA.ZZC_CODIGO = ZZD.ZZD_CURSO AND ZZD.D_E_L_E_T_ = ZZA.D_E_L_E_T_ WHERE ZZD.D_E_L_E_T_ = ' '"
    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())
    While (cAlias)->(!EoF())
        if cIdCurso != alltrim((cAlias)->(ZZA_COD))
            
            cIdCurso := alltrim((cAlias)->(ZZA_COD))
            cCurso := alltrim((cAlias)->(ZZA_CURSO))

            oExcel:AddWorkSheet(cCurso)

            oExcel:AddTable(cCurso, "Dados do Aluno")

            oExcel:AddColumn(cCurso, "Dados do Aluno", "CODIGO",   LEFT, GENERAL)
            oExcel:AddColumn(cCurso, "Dados do Aluno", "NOME",     LEFT, GENERAL)
            oExcel:AddColumn(cCurso, "Dados do Aluno", "DT. INIC", CENTER, DATE_TIME)
        endif

        aAdd(aDados, alltrim((cAlias)->(ZZD_COD)))
        aAdd(aDados, alltrim((cAlias)->(ZZD_NOME)))
        aAdd(aDados, StoD((cAlias)->(ZZD_DTINIC)))
        
        oExcel:AddRow(cCurso, "Dados do Aluno", aDados)
        (cAlias)->(DbSkip())
        aDados := {}
    enddo

    RestArea(aArea)
    oExcel:Activate()
    oExcel:GetXMLFile(cPath + cFile)

    if ApOleClient("MsExcel")
        oExec := MsExcel():New()
        oExec:WorkBooks:Open(cPath + cFile)
        oExec:SetVisible(.T.)
        oExec:Destroy()
    else
        FwAlertError("Arquivo nao encontrado neste computador", "Excel nao encontrado!")
    endif
    oExcel:DeActivate()

Return 
