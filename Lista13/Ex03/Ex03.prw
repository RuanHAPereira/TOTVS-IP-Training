#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function LeTxt
  Desenvolva um programa para ler o texto do
  arquivo criado no exercício anterior e
  apresentá-lo em uma mensagem para o usuário.
  @type  Function
  @author Ruan Pereira
  @since 24/04/2023
  /*/
User Function LeTxt()

  //? Definindo a pasta onde o arquivo está
  Local cPasta    := 'C:\Exercicios_TOTVS\lista 13 - ex1\'
  //? Definindo nome do arquivo que será lido 
  Local cArquivo  := 'arquivolista13.txt'
  //? Instanciando a classe FWFileReader (Responsável por ler o arquivo)
  Local oArq      := FWFileReader():New(cPasta + cArquivo)
  Local cTxtLinha := ''
 
  //? Verificando de se o arquivo pode ser aberto
  if oArq:Open()
    //? Verificando se é o fim do arquivo. Se não for, entra no if
    if !oArq:EoF()
      //? Fazendo a leitura enquanto houverem linhas a serem lidas
      while (oArq:HasLine())
          //? Capturando o texto da linha atual
          cTxtLinha += oArq:GetLine(.T.)
      enddo
    endif
     
    //? Fechando o arquivo (Isso indica o fim do processamento)
    oArq:Close()
  endif
  //? Apresentando texto do arquivo em uma mensagem
  FwALertInfo(cTxtLinha, 'Conteúdo do arquivo:')
Return
