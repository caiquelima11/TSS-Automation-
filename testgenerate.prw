#INCLUDE "PROTHEUS.CH"
#DEFINE CRLF Chr(13)+Chr(10)
#DEFINE TAB  Chr(09)

/*----------------------------------------------------------------------------------------/
//{Protheus.doc} testgenerate
Chama as fuções tesponsáveis por criar e editar os casos de teste 

    @type  Function
    @author Caique Lima Fonseca
    @since 05/08/2019
    @version 1.0
    @param cNameGroup, string, nome do TestGroup
    @return return, lógico, 

/----------------------------------------------------------------------------------------*/

Function testgenarate(cBaseline, cCases, cGroup, cSuite, cModelo, cProvedor, cVersao, cUF, cCodmun, cCnpj, cLogin, cPass, cMaxLote, cNomeMun, cRemessa, cAdmEmpresas, cPfx, cSerie, cIE, aCheck)

Local aRet    := {}
Local lRet    := ""
Local cExt    := ".PRW"
Local cNewDir := cBaseline + '\TSSNFSE001' + cModelo + '\' + cProvedor + cVersao + '\' + cUf + cCodMun
Local lExstS  := ""
Local lExstG  := ""

Default cBaseline    := ""
Default cCases	     := ""
Default cGroup	     := ""
Default cSuite	     := ""
Default cModelo      := "" 
Default cProvedor    := "" 
Default cVersao      := "" 
Default cUF          := "" 
Default cCodmun      := "" 
Default cCnpj        := "" 
Default cLogin       := "" 
Default cPass        := "" 
Default cMaxLote     := "" 
Default cNomeMun     := "" 
Default cRemessa     := "" 
Default cAdmEmpresas := ""
Default cPfx         := ""
Default cIE          := ""

Private  aName   := autogetname(cModelo, cProvedor, cVersao, cUf, cCodmun) //[1] Suite - [2] Group - [3] Case

lExstG := File( cGroup + "\" + aName[2] + cExt,,.T. )

//Verifica se já existe o testegroup, se não existir chama a função que cria
If lExstG
  lRet := EditGroup( aName[2], aName[3], cGroup )
  aadd( aRet,lRet )
Else
  lRet := CreateGroup( aName[2], aName[3], cGroup )
  aadd( aRet,lRet )
EndIf

//Verifica se já existe o TestSuite, se não existir chama a função que cria
lExstS := File( cSuite + "\" + aName[1] + cExt,,.T. )

If lExstS .and. !lExstG
  lRet := EditSuite( aName[1], aName[2], cSuite )
  aadd( aRet,lRet )
ElseIf (!lExstS .and. lExstG) .or. (!lExstS .and. !lExstG)
  lRet := CreateSuite( aName[1], aName[2], cSuite )
  aadd( aRet,lRet )
EndIf
//Não foi necessário alterar ou criar um test case, neste caso retoro True para alimentar o array da mensagem de sucesso
lRet := .T.
aadd( aRet,lRet )

//Cria o TestCase
lRet := CreateCase( aName[3], cBaseline, cCases, cCnpj, cNomeMun, cCodMun, cUF, cLogin, cPass, cMaxLote, cModelo, cProvedor, cVersao, cSerie, cIE, aCheck )
aadd( aRet,lRet )

//Cria o diretório do caso de test na baseline
If ExistDir( cBaseline + '\TSSNFSE001' + cModelo )
  If ExistDir( cBaseline + '\TSSNFSE001' + cModelo + '\' + cProvedor  + cVersao )
    MakeDir( cBaseline + '\TSSNFSE001' + cModelo + '\' + cProvedor  + cVersao + '\' + cUf + cCodMun, nil, .T. )
  EndIf
Else
  MakeDir( cBaseline + '\TSSNFSE001' + cModelo, nil, .F. )
  MakeDir( cBaseline + '\TSSNFSE001' + cModelo + '\' + cProvedor + cVersao, nil, .F.  )
  MakeDir( cNewDir, nil, .F. )
EndIf 

//gera os XML's na baseline
geraxml( cRemessa, cAdmEmpresas, cPfx, cNewDir )

//Retorna os status do processo 
If len(aRet) == 3 
  Aviso('PARABÉNS - Município ' + cNomeMun + ' automatizado!' ,'Confira os resultados da criação do caso de teste:' + CRLF + CRLF + 'TestGroup: ' + iif(aRet[1],'Criado com sucesso!','Não foi criado') + CRLF +  'TestSuit: ' + iif(aRet[2],'Criado com sucesso!','Não foi criado') + CRLF + 'TestCase: ' + iif(aRet[3],'Criado com sucesso!','Não foi criado'),{'Fechar'},2)
Else
  Aviso('Que pena :( - Município ' + cNomeMun + ' não foi autommatizado!' ,'Ocorreu um problema no monitoramento dos processos, confira manualmente se o TestGroup, testSuite e TestCase foram criados com sucesso.',{'Fechar'},2)
EndIf

Return 

/*-----------------------------------------------------------------
//{Protheus.doc} autogetname
  Monta a nomenclatura dos TestSuit, TestGroup e TestCase
  @type  Function
  @author Caique Lima Fonseca
  @since 21/05/2019
  @version 1.0
/-----------------------------------------------------------------*/

Function autogetname(cModelo, cProvedor, cVersao, cUf, cCodmun)

Private aName := {}  

Default cModelo   := ""
Default cProvedor := ""
Default cVersao   := ""
Default cUf       := ""
Default cCodmun   := ""

AAdd(aName,"TSSNFSE001" + cModelo + "TestSuite")
AAdd(aName,"TSSNFSE001" + cModelo + cProvedor + cVersao + "TestGroup")
AAdd(aName,"TSSNFSE001" + cModelo + cProvedor + cVersao + cUf + cCodmun + "TestCase")

Return aName

/*-----------------------------------------------------------------
//{Protheus.doc} geraxml
  Gera um xml para cada remessa de acordo com cada testcase
  @type  Function
  @author Caique Lima Fonseca
  @since 21/05/2019
  @version 1.0
/-----------------------------------------------------------------*/

Function geraxml( cRemessa, cAdmEmpresas, cPfx, cNewDir )

Local lRet    := ''
Local cXml    := MemoRead( cRemessa, .F. )
Local cNewXml := ''
Local oHelper := FWTestHelper():New()
Local lExst   := ExistDir( cNewDir, nil, .F.)

Default cRemessa      := ''
Default cAdmEmpresas  := ''
Default cPfx          := ''
Default cNewDir       := ''

If lExst
  CHMOD( cRemessa, 2 )
  _CopyFile( cRemessa, cNewDir + '\' + '_NFSE_001_NOTA001.xml', nil, .F. )

  CHMOD( cAdmEmpresas, 2 )
  _CopyFile( cAdmEmpresas, cNewDir + '\' + '01_ADMEMPRESAS.xml', nil, .F. )

  CHMOD( cPfx, 2 )
  _CopyFile( cPfx, cNewDir + '\' + '02_CFGNFSECERTPFX.xml', nil, .F. )
Else
  ConOut( 'Erro: Arquivos xml não foram criados na baseline.')
EndIf

oXml := XmlParser(cXml,"_",'','')

MemoWrite( cNewDir + '\_NFSE_002_NOTA001.xml', cXml )

//NFSE_002 - INTERMEDIARIO
MemoWrite( cNewDir + '\_NFSE_002_NOTA001.xml', cXml )

//NFSE_003 - DEDUCAO_REDUCAO_ISS
MemoWrite( cNewDir + '\_NFSE_003_NOTA001.xml', cXml )

//NFSE_004 - DESCONTO_CONDICIONAL_INCONDICIONADO
MemoWrite( cNewDir + '\_NFSE_004_NOTA001.xml', cXml )

//NFSE_005 - SIMPLES_NACIONAL
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/PRESTADOR/SIMPNAC" ,'1', .F. )
MemoWrite( cNewDir + '\_NFSE_005_NOTA001.xml', cXml )

//NFSE_006 - ISSRETIDO_IMPOSTOS
MemoWrite( cNewDir + '\_NFSE_006_NOTA001.xml', cXml )

//NFSE_007 - TOMADOR_PESSOA_FISICA
MemoWrite( cNewDir + '\_NFSE_007_NOTA001.xml', cXml )

//NFSE_008 - ISENÇÃO
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'1', .F. )
MemoWrite( cNewDir + '\_NFSE_008_NOTA001.xml', cXml )

//NFSE_009 - IMUNE
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'3', .F. )
MemoWrite( cNewDir + '\_NFSE_009_NOTA001.xml', cXml )

//NFSE_010 - IMPOSTOS
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'1', .F. )
MemoWrite( cNewDir + '\_NFSE_010_NOTA001.xml', cXml )

//NFSE_011 - TRIBUTAÇÃO_FORA_DO_MUNICÍPIO
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'2', .F. )
MemoWrite( cNewDir + '\_NFSE_011_NOTA001.xml', cXml )

//NFSE_012 - EXIGIBILIDADE_SUSP_DEC_JUDICIAL
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'4', .F. )
MemoWrite( cNewDir + '\_NFSE_012_NOTA001.xml', cXml )

//NFSE_013 - EXIGIBILIDADE_SUSP_PROC_ADM
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/IDENTIFICACAO/TIPOTRIB" ,'12', .F. )
MemoWrite( cNewDir + '\_NFSE_013_NOTA001.xml', cXml )

//NFSE_014 - PARCELAMENTO_E_CONDIÇÃO_DE_PAGAMENTO
MemoWrite( cNewDir + '\_NFSE_014_NOTA001.xml', cXml )

//NFSE_015 - EXTERIOR
MemoWrite( cNewDir + '\_NFSE_015_NOTA001.xml', cXml )

//NFSE_016 - SEM_TOMADOR
MemoWrite( cNewDir + '\_NFSE_016_NOTA001.xml', cXml )

//NFSE_017 - COD_OBRA
MemoWrite( cNewDir + '\_NFSE_017_NOTA001.xml', cXml )

//NFSE_018 - CARACTERES_ESPECIAIS
cNewXml := oHelper:UTXMLReplace( cXml,"RPS/SERVICOS/SERVICO/DISCR" ,'TESTE CARACTERES ESPECIAIS !@#$%¨&*º~~^´[/?', .F. )
MemoWrite( cNewDir + '\_NFSE_020_NOTA001.xml', cXml )

//NFSE_019 - EMISSÃO_EMISSAO_MAXLOTE
MemoWrite( cNewDir + '\_NFSE_021_NOTA001.xml', cXml )

//NFSE_019 - EMISSÃO_EMISSAO_MAXLOTE
MemoWrite( cNewDir + '\_NFSE_021_NOTA002.xml', cXml )

//NFSE_020 - SUBSTITUIÇÃO
MemoWrite( cNewDir + '\_NFSE_022_NOTA001.xml', cXml )

//NFSE_020 - SUBSTITUIÇÃO
MemoWrite( cNewDir + '\_NFSE_022_SUBSTNOTA001.xml', cXml )

Return lRet