#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Desenvolva um programa que criará um
  diretório chamado “Lista 13 – Ex1” na pasta
  temporária do Windows.
  @type  Function
  @author Ruan Pereira
  @since 24/04/2023
  /*/
User Function CriaPasta()

  Local cCaminho   := 'C:\Exercicios_TOTVS\' //? Endereço onde a pasta será criada
  Local cNomePasta := 'Lista 13 - Ex1' //? Nome da pasta que será criada

  //? Verificando se a pasta já existe
  if !ExistDir(cCaminho + cNomePasta)
    //? Criando a pasta
    if MakeDir(cCaminho + cNomePasta) == 0
      //? Chamando a função que criará um arquivo de texto dentro da pasta criada.
      if ExistBlock('Escreve')
        ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
      endif
      if ExistBlock('EscrCSV')
        ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
      endif
    else
      FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
    endif
  else
    if ExistBlock('Escreve')
      ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
    endif
    if ExistBlock('EscrCSV')
      ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
    endif
  endif
Return
