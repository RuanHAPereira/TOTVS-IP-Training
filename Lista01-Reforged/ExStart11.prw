#INCLUDE 'TOTVS.CH'

User Function RE11()
    Local cA := ''
    Local cB := ''
    Local cC := ''

    cA := FwInputBox('Insira o tamanho do lado A do triângulo', cA)
        cA := VAL(cA)

    cB := FwInputBox('Insira o tamanho do lado B do triângulo', cB)
        cB := VAL(cB)

    cC := FwInputBox('Insira o tamanho do lado C do triângulo', cC)
        cC := VAL(cC)

    if cA >= cB + cC .OR. cB >= cA + cC .OR. cC >= cA + cB
        FwAlertInfo('Os valores inseridos não formam um triângulo.')
    else
        FwAlertInfo('Os valores inseridos formam um triângulo.')
    endif

Return

/*11 - Ler 3 valores, cada um representando as
 medidas dos lados de um triângulo e escrever se
 formam ou não um triângulo. OBS: para formar um
 triângulo, o valor de cada lado deve ser menor que
 a soma dos outros 2 lados. */
