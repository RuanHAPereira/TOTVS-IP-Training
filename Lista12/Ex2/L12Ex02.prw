#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE VERMELHO #FF0000

#DEFINE LEFT 1
#DEFINE CENTER 2
#DEFINE RIGHT 3

#DEFINE GENERAL 1
#DEFINE NUMERIC 2
#DEFINE MONETARY 3
#DEFINE DATETIME 4

/*/{Protheus.doc} User Function L12Ex02
    Função para criação de planilha em XLS do Excel
    @type  Function
    @author Ruan Pereira
    @since 20/04/2023
    /*/
User Function L12Ex02()

    local oExcel := FwMsExcelEx():New()
    local cPath     := GetTempPath()
    local cFile     := "Relatorio_Produtos.xls"
    local aDados    := {}
    local cAlias    := GetNextAlias()
    local aArea     := GetArea()
    local cQuery    := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ AS DEL FROM " + RetSqlName("SB1")

    TCQUERY cQuery ALIAS &(cAlias) NEW

    oExcel:AddWorkSheet("Produtos")

    oExcel:AddTable("Produtos", "Dados dos Produtos")

    oExcel:AddColumn("Produtos", "Dados dos Produtos", "CODIGO",    LEFT, GENERAL)
    oExcel:AddColumn("Produtos", "Dados dos Produtos", "DESCRICAO", LEFT, GENERAL)
    oExcel:AddColumn("Produtos", "Dados dos Produtos", "TIPO",      LEFT, GENERAL)
    oExcel:AddColumn("Produtos", "Dados dos Produtos", "U.M.",      LEFT, GENERAL)
    oExcel:AddColumn("Produtos", "Dados dos Produtos", "PRECO",     RIGHT, MONETARY)
    oExcel:SetCelFrColor('VERMELHO')

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EoF())
        
        aAdd(aDados, alltrim((cAlias)->(B1_COD)))
        aAdd(aDados, alltrim((cAlias)->(B1_DESC)))
        aAdd(aDados, alltrim((cAlias)->(B1_TIPO)))
        aAdd(aDados, alltrim((cAlias)->(B1_UM)))
        aAdd(aDados, (cAlias)->(B1_PRV1))

        if (cAlias)->(DEL) == "*"
            oExcel:AddRow("Produtos", "Dados dos Produtos", aDados, {1, 2, 3, 4, 5})
        else
            oExcel:AddRow("Produtos", "Dados dos Produtos", aDados)
        endif
        aDados := {}
        (cAlias)->(DbSkip())
    End do

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
