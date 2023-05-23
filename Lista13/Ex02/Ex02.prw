#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Escreve
  Escreva um programa para criar um arquivo
  TXT com um texto qualquer e salvar dentro da
  pasta criada no exercício anterior.
  @type  Function
  @author Ruan Pereria
  @since 24/04/2023
  /*/
User Function Escreve()

  //? Definindo a pasta como o Desktop do Windows
  Local cPasta   := 'C:\Exercicios_TOTVS\lista 13 - ex1\'
  //? Definindo nome do arquivo como "TesteArq.txt" 
  Local cArquivo := 'ArquivoLista13.txt'
  //? Instanciando a classe FWFileWriter (Responsável por criar o arquivo e escrever nele)
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.)
    
  //? Verificando se o arquivo já existe na pasta
  if File(cPasta + cArquivo)
    FwAlertInfo('O arquivo já existe na pasta!', 'Atenção')
  else
    //? Caso não consiga criar o arquivo, a mensagem será apresentada
    if !oWriter:Create()
      FwAlertError('Houve um erro ao gerar o arquivo: ' + CRLF + oWriter:Error():Message, 'Atenção')
    else
      //? Escrevendo no arquivo
      oWriter:Write('Olá!' + CRLF + 'Esse é um arquivo demonstrando que consegui realizar esse exercicio!')
        
      //? Fechando o arquivo
      oWriter:Close()
        
      //? Perguntando se o usuário deseja abrir o arquivo criado
      if MsgYesNo('Arquivo gerado com sucesso (' + cPasta + cArquivo + ')!' + CRLF + 'Abrir arquivo?', 'Abrir?')
        ShellExecute('OPEN', cArquivo, '', cPasta, 1)
      endif
    endif
  endif
Return
