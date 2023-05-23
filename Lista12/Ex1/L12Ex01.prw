#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

#DEFINE LEFT 1
#DEFINE CENTER 2
#DEFINE RIGHT 3

#DEFINE GENERAL 1

/*/{Protheus.doc} User Function L12E01
    Função para criação de planilha em XLS do Excel
    @type  Function
    @author Ruan Pereira
    @since 20/04/2023
    /*/
User Function L12E01()

    local oExcel := FwMsExcelEx():New()
    local cPath     := GetTempPath()
    local cFile     := "Planilha_Fornec.xls"
    local aDados    := {}
    local cAlias    := "SA2"
    local aArea     := GetArea()
    local cCGC      := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    oExcel:AddWorkSheet("Fornecedores")

    oExcel:AddTable("Fornecedores", "Dados dos Fornecedores")

    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "CODIGO",   LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "NOME",     LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "LOJA",     CENTER, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "CPF/CNPJ", CENTER, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "ENDERECO", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "BAIRRO",   LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "CIDADE",   LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Dados dos Fornecedores", "UF",       LEFT, GENERAL)

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EoF())
        
        aAdd(aDados, alltrim((cAlias)->(A2_COD)))
        aAdd(aDados, alltrim((cAlias)->(A2_NOME)))
        aAdd(aDados, alltrim((cAlias)->(A2_LOJA)))
        cCGC := alltrim((cAlias)->(A2_CGC))
        
        if len(cCGC) == 14
            cCGC := TRANSFORM(ALLTRIM(cCGC), "@R 99.999.999/9999-99")
            aAdd(aDados, cCGC)
            
        elseif len(cCGC) == 11
            cCGC := TRANSFORM(ALLTRIM(cCGC), "@R 999.999.999/99")
            aAdd(aDados, cCGC)
            
        elseif Empty(cCGC)
            aAdd(aDados, "Sem info")
        endif
        aAdd(aDados, alltrim((cAlias)->(A2_END)))
        aAdd(aDados, alltrim((cAlias)->(A2_BAIRRO)))
        aAdd(aDados, alltrim((cAlias)->(A2_MUN)))
        aAdd(aDados, alltrim((cAlias)->(A2_EST)))
        oExcel:AddRow("Fornecedores", "Dados dos Fornecedores", aDados)
        aDados := {}
        (cAlias)->(DbSkip())
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

    FwAlertSuccess("Arquivo gerado com sucesso.", "Concluido!")
    oExcel:DeActivate()

Return 
