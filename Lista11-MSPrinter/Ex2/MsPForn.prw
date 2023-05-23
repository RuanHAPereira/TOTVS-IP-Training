/*2 � Adicione um bot�o � tela de Cadastro de
Fornecedores. A fun��o desse bot�o ser� imprimir
os dados do fornecedor selecionado.
Voc� mesmo determinar� quais s�o os campos que
devem ser impressos.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function MsPForn
    Relat�rio MsPForn
    @type  Function
    @author Ruan Pereira
    @since 14/04/2023
    /*/
User Function MsPForn() //? fun��o de usuario para montar a regua de processamento 

    Local cAlias := BuscaSQL()
    if !Empty(cAlias)
        
	    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relat�rio...', .F.)
    else    
        FwAlertError('Nenhum Registro encontrado!', 'Aten��o')
    endif

Return 

Static Function BuscaSQL() //? fun��o estatica para realizar uma busca no SQL

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

Static Function MontaRel(cAlias) //? Fun��o estatica para montar relatorio

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

    oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., ' ', .T., /*TR*/, @oPrint, ' ', /*LServer*/, /*Compat*/, /*RAW*/, .T., /*QtdC�pias*/)
    oPrint:cPathPDF := cPath
    oPrint:SetPortrait() //!Deixa a orienta��o como retrato.
    oPrint:SetPaperSize(9) //!Seleciona o tamanho da folha de papel.
    oPrint:StartPage() //!Come�a a p�gina para impress�o.
    Cabecalho()
    Print(cAlias)
    oPrint:EndPage() //!Finaliza a p�gina para impress�o.
    oPrint:Preview() //!Mostra o relat�rio

Return

Static Function Cabecalho() //? fun��o que monta o cabe�alho

    //! Caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')
    //!Criando uma linha
    oPrint:Line(50, 15, 50, 580, PRETO, '-6')
    oPrint:Say(35, 20, 'Empresa / Filial : ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SMO->MO_FILIAL), oFont14, /*LargText*/, PRETO)
    oPrint:Say(70, 220, 'Cadastros de Fornecedores ', oFont16, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 20, 'C�DIGO'    , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 100, 'NOME'      , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 200, 'N. FANTASIA' , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 300, 'CIDADE'   , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 400, 'UF'   , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 450, 'CNPJ'   , oFont12, /*LargText*/, PRETO)
    nLinha += 5
    oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')
    nLinha += 20

Return

Static Function Print(cAlias) //? Fun��o de impressao do relatorio

    Local cString := ''
    Private nCor  := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(A2_COD)), oFont10,, nCor)
        //? Copiando o Descri��o do produto para a vari�vel cString
        cString  := AllTrim((cAlias)->(A2_NOME))
        BreakLine(cString, 20, 100) //!Fun��o que verifica se h� necessidade de quebra de linha
        cString  := AllTrim((cAlias)->(A2_NREDUZ))
        BreakLine(cString, 20, 200) //!Fun��o que verifica se h� necessidade de quebra de linha
        cString  := AllTrim((cAlias)->(A2_MUN)) //!Cidade
        BreakLine(cString, 15, 300)
        oPrint:Say(nLinha, 400, Alltrim((cAlias)->(A2_EST)), oFont10, , nCor)
        oPrint:Say(nLinha, 450, Alltrim((cAlias)->(A2_CGC)), oFont10, , nCor)
        nLinha += 30
        IncProc()
Return

Static Function BreakLine(cString, nQtdCarac, nCol) //? fun��o para quebras de linha 

    Local cTxtLinha  := ''
    Local lQuebra    := .F.
    Local nQtdLinhas := MLCount(cString, nQtdCarac, /*Tabula��o*/, .F.)
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
        //? Encerrando a p�gina atual
        oPrint:EndPage()
        //? Iniciando uma nova p�gina
        oPrint:StartPage()
        nLinha := 105
        
        Cabecalho()
    endif

Return
