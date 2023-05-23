#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 21/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function DiaSemana()
    Local nSemana := [1,2,3,4,5,6,7]

    nSemana := Val(FwInputBox("Digite um numero correspondente ao dia da semana desejado: " + nSemana))

    Do case
        case nSemana = 1
            FwAlertInfo("Domingo")
        case nSemana = 2
            FwAlertInfo("Segunda")
        case nSemana = 3
            FwAlertInfo("Terca")
        case nSemana = 4
            FwAlertInfo("Quarta")
        case nSemana = 5
            FwAlertInfo("Quinta")
        case nSemana = 6
            FwAlertInfo("Sexta")
        case nSemana = 7
            FwAlertInfo("Sabado")
        otherwise
            Alert("Numero nao correspondente")
    endcase
Return 
