#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Escreve
  Escreva um programa para criar um arquivo
  TXT com um texto qualquer e salvar dentro da
  pasta criada no exerc�cio anterior.
  @type  Function
  @author Ruan Pereria
  @since 24/04/2023
  /*/
User Function Escreve()

  //? Definindo a pasta como o Desktop do Windows
  Local cPasta   := 'C:\Exercicios_TOTVS\lista 13 - ex1\'
  //? Definindo nome do arquivo como "TesteArq.txt" 
  Local cArquivo := 'ArquivoLista13.txt'
  //? Instanciando a classe FWFileWriter (Respons�vel por criar o arquivo e escrever nele)
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.)
    
  //? Verificando se o arquivo j� existe na pasta
  if File(cPasta + cArquivo)
    FwAlertInfo('O arquivo j� existe na pasta!', 'Aten��o')
  else
    //? Caso n�o consiga criar o arquivo, a mensagem ser� apresentada
    if !oWriter:Create()
      FwAlertError('Houve um erro ao gerar o arquivo: ' + CRLF + oWriter:Error():Message, 'Aten��o')
    else
      //? Escrevendo no arquivo
      oWriter:Write('Ol�!' + CRLF + 'Esse � um arquivo demonstrando que consegui realizar esse exercicio!')
        
      //? Fechando o arquivo
      oWriter:Close()
        
      //? Perguntando se o usu�rio deseja abrir o arquivo criado
      if MsgYesNo('Arquivo gerado com sucesso (' + cPasta + cArquivo + ')!' + CRLF + 'Abrir arquivo?', 'Abrir?')
        ShellExecute('OPEN', cArquivo, '', cPasta, 1)
      endif
    endif
  endif
Return
