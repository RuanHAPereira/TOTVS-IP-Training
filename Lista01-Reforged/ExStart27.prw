#INCLUDE 'TOTVS.CH'

User Function RE27()

    local nCont      := 1
    local nJ         := 1
    local cResult    := ''
    local cLinha     := ''

    For nCont := 1 to 10
        cLinha := ''
        cLinha += ALLTRIM(STR(nCont)) + ', '
        For nJ := 1 to 10
            if nJ < 10
                cLinha += ALLTRIM(STR(nJ)) + ' '

            else
                cLinha += ALLTRIM(STR(nJ)) + '. '   

            endif    
        NEXT
        cResult += cLinha + CRLF  
    NEXT        

    FwAlertInfo('Resultado:' + CRLF + cResult)

Return

// 27 - Escreva um algoritmo que imprima as seguintes
// sequências de números:
// o (1, 1 2 3 4 5 6 7 8 9 10)
// o (2, 1 2 3 4 5 6 7 8 9 10)
// o (3, 1 2 3 4 5 6 7 8 9 10)
// o (4, 1 2 3 4 5 6 7 8 9 10)
// e assim sucessivamente, até que o primeiro número
// (antes da vírgula), também chegue a 10.
// Obs: Utilize laço de repetição para o
// preenchimento dos números antes e depois da
// vírgula.

