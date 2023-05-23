#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaArq
  Escreva um programa que criar� uma pasta
  com o nome �Lista 13� no rootpath
  (protheus_data) e copiar� o arquivo do
  exerc�cio 2 para essa pasta.
  @type  Function
  @author Ruan Pereira
  @since 24/04/2023
  /*/
User Function CopyFold()

  Local cPastaOrig := 'C:\Exercicios_TOTVS\lista 13 - ex1\' //? Pasta onde os arquivos est�o inicialmente - Origem
  Local cPastaDest := '\' //? Pasta onde os arquivos ser�o salvos (dentro da protheus_data) - Destino

  //? Pegando os dados de todos os arquivos existentes dentro da pasta de origem
  Local aArquivos  := Directory(cPastaOrig + 'ArquivoLista13.txt' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
  Local nI         := 0

  if LEN(aArquivos) > 0
    for nI := 3 to LEN(aArquivos)
      //? Copiando os arquivos da pasta de origem para a pasta de destino. 
      if !CpyT2S(cPastaOrig + aArquivos[nI][1], cPastaDest)      
        MsgStop('Houve um erro ao excluir o arquivo ' + aArquivos[nI][1])
      endif
    next
    FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Conclu�do!')
  else
    FwAlertInfo('Apasta n�o contem nenhum arquivo!', 'Aten��o!')
  endif
Return
