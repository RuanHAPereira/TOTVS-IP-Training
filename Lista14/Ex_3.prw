#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} ByeForn
    Rotina automatica para exclusao de fornecedores
    @type  Function
    @author Ruan Pereria
    @since 15/05/2023
    /*/
User Function Excluir()

    local aDados := {}
    local nOper  := 5 //? Operaçao de exclusao
    local lOK    := .T.

    //? Passado o codigo em uma variavel para facilitar a manutençao
    local cCodigo   := 'F00009'
    local cLoja     := ''

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    DbSelectArea('SA2')
    DbSetOrder(1)

    //? Caso o programa nao encotnre o registro, e informado.
    if !SA2->(MSSEEK(xFilial('SA2') + cCodigo))
        lOK := .F.
        MsgInfo('Nao foi encontradoo o registro informado.')
    else
        //? Atribui em uma variavel por conta de um ponto de entrada que randomiza a loja do fornecedor.
        cLoja := SA2->A2_LOJA
    endif

    //? Se o retorno acima for ignorado/positivo, a operaçao de alteraçao sera executada.
    if lOK
        //? Informaçoes para identificar o registro do fornecedor que sera excluido.
        aAdd(aDados, {'A2_COD',     cCodigo,    NIL})
        aAdd(aDados, {'A2_LOJA',    cLoja,      NIL})

        MsExecAuto({|x, y| MATA020(x, y)}, aDados, nOper)
    endif

    if lMsErroAuto
        MostraErro()
    endif

Return 
