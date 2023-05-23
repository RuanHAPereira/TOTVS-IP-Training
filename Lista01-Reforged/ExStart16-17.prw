#INCLUDE "TOTVS.CH"

User Function RE1617()

    local nAva1    := 0
    local nAva2    := 0
    local nMedia   := 0
    local cChoice  := "S"

        while cChoice == 'S'
        
            nAva1 := FwInputBox('Digite a nota da primeira avaliação: ')
                nAva1 := val(nAva1)

            while (nAva1 < 0) .OR. (nAva1 > 10)
                FwAlertError('NOTA INVÁLIDA.')

                nAva1 := FwInputBox('Digite a nota da primeira avaliação: ')
                    nAva1 := val(nAva1)
            enddo 
    
            nAva2 := FwInputBox('Digite a nota da segunda avaliação: ')
                nAva2 := val(nAva2)

            while (nAva2 < 0) .OR. (nAva2 > 10)
                FwAlertError('NOTA INVÁLIDA')

                nAva2 := FwInputBox('Digite a nota da segunda avaliação: ')
                    nAva2 := val(nAva2)
            enddo 

            nMedia := (nAva1 + nAva2) / 2

            FwAlertInfo('A média entre essas avaliações é: ' + cValToChar(nMedia))

            cChoice := FwInputBox('NOVO CÁLCULO (S/N)? ' , cChoice)

        enddo 

        FwAlertInfo('Médias calculadas com Sucesso! ')
Return

// 16 - Escreva um algoritmo para ler as notas da 1a e
// 2a avaliações de um aluno, calcule e imprima a média
// desse aluno. Só devem ser aceitos valores válidos
// durante a leitura (0 a 10) para cada nota.
// • 17 - Acrescente uma mensagem 'NOVO CÁLCULO
// (S/N)?' ao final do exercício anterior. Se for
// respondido 'S' deve retornar e executar um novo
// cálculo, caso contrário deverá encerrar o
// algoritmo.
