#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} Altera
    Rotina automatica para alteraÁoo de cadastro de clientes.
    @type  Function
    @author Ruan Pereira
    @since 15/05/2023
    /*/
User Function Altera()

    local aDados := {}
    local nOper  := 4 //? OperaÁao de AlteraÁao
    local lOK    := .T.

    //? Passado o codigo em uma variavel para facilitar a manutenÁao.
    local cCodigo := '00000T'

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    DbSelectArea('SA1')
    DbSetOrder(1)

    //? Caso o programa nao encotnre o registro, e informado.
    if !SA1->(MSSEEK(xFilial('SA1') + cCodigo))
        lOK := .F.
        MsgInfo('Nùo foi encontradoo o registro informado.')
    endif

    //? Se o retorno acima for ignorado/positivo, a operaÁao de alteraÁao sera executada.
    if lOK
        //? InformaÁoes para identificar o registro que sera alterado.
        aAdd(aDados, {'A1_FILIAL',  FwFilial('SA1'), NIL})
        aAdd(aDados, {'A1_COD',     cCodigo, NIL})
        aAdd(aDados, {'A1_LOJA',    '01', NIL})

        //! InformaÁoes que serao alteradas (e a proposta do exercicio).
        aAdd(aDados, {'A1_END',     'AV. TESTE 2', NIL})
        aAdd(aDados, {'A1_TEL',     '888888888', NIL})

        MsExecAuto({|x, y| MATA030(x, y)}, aDados, nOper)
    endif

    if lMsErroAuto
        MostraErro()
    endif

Return 
