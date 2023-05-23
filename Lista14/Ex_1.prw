#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} CadastCli
    Rotina automatica para cadastro de clientes.
    @type  Function
    @author Ruan Pereira
    @since 15/05/2023
    /*/
User Function CadastCli()

    local aDados := {}
    local nOper  := 3 //? Operaçao de Inclusao
    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    aAdd(aDados, {'A1_FILIAL',  FwFilial('SA1'), NIL})
    aAdd(aDados, {'A1_COD',     '00000T', NIL})
    aAdd(aDados, {'A1_LOJA',    '01', NIL})
    aAdd(aDados, {'A1_NOME',    'TESTE', NIL})
    aAdd(aDados, {'A1_NREDUZ',  'TEST', NIL})
    aAdd(aDados, {'A1_END',     'AV. TESTE', NIL})
    aAdd(aDados, {'A1_TIPO',    'F', NIL})
    aAdd(aDados, {'A1_MUN',     'TESTEY', NIL})
    aAdd(aDados, {'A1_EST',     'SP', NIL})
    aAdd(aDados, {'A1_TEL',     '99999999', NIL})

    MsExecAuto({|x, y| MATA030(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif

Return 
