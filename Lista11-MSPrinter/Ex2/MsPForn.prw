/*2 – Adicione um botão à tela de Cadastro de
Fornecedores. A função desse botão será imprimir
os dados do fornecedor selecionado.
Você mesmo determinará quais são os campos que
devem ser impressos.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function MsPForn
    Relatório MsPForn
    @type  Function
    @author Ruan Pereira
    @since 14/04/2023
    /*/
User Function MsPForn() //? função de usuario para montar a regua de processamento 

    Local cAlias := BuscaSQL()
    if !Empty(cAlias)
        
	    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relatório...', .F.)
    else    
        FwAlertError('Nenhum Registro encontrado!', 'Atenção')
    endif

Return 

Static Function BuscaSQL() //? função estatica para realizar uma busca no SQL

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''

    //! Busca no SQL
    cQuery += 'SELECT A2_COD, A2_NOME, A2_NREDUZ, A2_MUN, A2_EST, A2_CGC' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE A2_COD = '" + Alltrim(SA2->A2_COD) + " ' AND D_E_L_E_T_= ' '" + CRLF
    TCQUERY cQuery ALIAS (cAlias) NEW
    
    (cAlias)->(DbGoTop())
    if (cAlias)->(EOF())
       cAlias := '' 
    endif
    
    RestArea(aArea)

Return cAlias

Static Function MontaRel(cAlias) //? Função estatica para montar relatorio

    Local cPath := GetTempPath()
    Local cArquivo := 'CadastroFornec.pdf'

    Private nLinha  := 105
    Private nColIni := 20
    Private nColFim := 820
    Private oPrint
    Private oFont10 := TFont():New('Arial', /*Compat*/, 10, /*Compat*/, .F. /*Negrito*/, /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F./*Sublinhado*/, .F./*Italico*/)
    Private oFont12 := TFont():New('Arial', /*Compat*/, 12, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont14 := TFont():New('Arial', /*Compat*/, 14, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont16 := TFont():New('Arial', /*Compat*/, 16, /*Compat*/, .T., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .T., .F.)

    oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., ' ', .T., /*TR*/, @oPrint, ' ', /*LServer*/, /*Compat*/, /*RAW*/, .T., /*QtdCópias*/)
    oPrint:cPathPDF := cPath
    oPrint:SetPortrait() //!Deixa a orientação como retrato.
    oPrint:SetPaperSize(9) //!Seleciona o tamanho da folha de papel.
    oPrint:StartPage() //!Começa a página para impressão.
    Cabecalho()
    Print(cAlias)
    oPrint:EndPage() //!Finaliza a página para impressão.
    oPrint:Preview() //!Mostra o relatório

Return

Static Function Cabecalho() //? função que monta o cabeçalho

    //! Caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')
    //!Criando uma linha
    oPrint:Line(50, 15, 50, 580, PRETO, '-6')
    oPrint:Say(35, 20, 'Empresa / Filial : ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SMO->MO_FILIAL), oFont14, /*LargText*/, PRETO)
    oPrint:Say(70, 220, 'Cadastros de Fornecedores ', oFont16, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 20, 'CÓDIGO'    , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 100, 'NOME'      , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 200, 'N. FANTASIA' , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 300, 'CIDADE'   , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 400, 'UF'   , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 450, 'CNPJ'   , oFont12, /*LargText*/, PRETO)
    nLinha += 5
    oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')
    nLinha += 20

Return

Static Function Print(cAlias) //? Função de impressao do relatorio

    Local cString := ''
    Private nCor  := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(A2_COD)), oFont10,, nCor)
        //? Copiando o Descrição do produto para a variável cString
        cString  := AllTrim((cAlias)->(A2_NOME))
        BreakLine(cString, 20, 100) //!Função que verifica se há necessidade de quebra de linha
        cString  := AllTrim((cAlias)->(A2_NREDUZ))
        BreakLine(cString, 20, 200) //!Função que verifica se há necessidade de quebra de linha
        cString  := AllTrim((cAlias)->(A2_MUN)) //!Cidade
        BreakLine(cString, 15, 300)
        oPrint:Say(nLinha, 400, Alltrim((cAlias)->(A2_EST)), oFont10, , nCor)
        oPrint:Say(nLinha, 450, Alltrim((cAlias)->(A2_CGC)), oFont10, , nCor)
        nLinha += 30
        IncProc()
Return

Static Function BreakLine(cString, nQtdCarac, nCol) //? função para quebras de linha 

    Local cTxtLinha  := ''
    Local lQuebra    := .F.
    Local nQtdLinhas := MLCount(cString, nQtdCarac, /*Tabulação*/, .F.)
    Local nI         := 0

    If nQtdLinhas > 1
        lQuebra    := .T.
            For nI := 1 to nQtdLinhas
                cTxtLinha := MemoLine(cString, nQtdCarac, nI)
                oPrint:Say(nLinha, nCol, cTxtLinha, oFont10,, nCor)
                nLinha += 10
            Next
    Else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    Endif
    If lQuebra   
        nLinha -= nQtdLinhas * 10
    Endif
Return

Static Function BreakPage()

    if nLinha > MAX_LINE
        //? Encerrando a página atual
        oPrint:EndPage()
        //? Iniciando uma nova página
        oPrint:StartPage()
        nLinha := 105
        
        Cabecalho()
    endif

Return
