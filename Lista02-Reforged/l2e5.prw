#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author Ruan Henrique
    @since 16/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function E5()
    Local nDol  := ''
    Local nCot  := ''
    Local nReal := ''

    nCot := Val(FwInputBox("Qual a cotacao do dolar?" + nCot))
    nDol := Val(FwInputBox("Informe o valor a ser convertido de dolar para real: " + nDol))

    nReal := nDol / nCot
    Alert("O valor convertido em reais é de: " + Alltrim(str(nReal)) + "reais")

Return
