#INCLUDE "PROTHEUS.CH"
#DEFINE CRLF Chr(13)+Chr(10)
#DEFINE TAB  Chr(09)

/*/{Protheus.doc} CreateCase
Cria um novo TestCase

    @type  Function
    @author Caique Mota
    @since 06/08/2019
    @version 1.0
    @param cTestCase, string, variável que cria o TestCase
	@param cNameCase, string, variável que contém o nome do TestCase

/*/
Function CreateCase(cNameCase,cBaseline,cDir,cCnpj,cNomeMun,cCodMun,cUF,cLogin,cPass,cMaxLote,cModelo,cProvedor,cVersao, cSerie, cIE, aCheck)

    Local cTestCase := "" 
	Local cExt		:= ".PRW" 

    DEFAULT cNameCase := ""
	DEFAULT cBaseline := ""
	DEFAULT cCnpj 	  := ""
    DEFAULT cNomeMun  := ""
	DEFAULT cCodMun   := ""
	DEFAULT cUF 	  := ""
	DEFAULT cLogin 	  := ""
	DEFAULT cPass 	  := ""
	DEFAULT cMaxLote  := ""
    DEFAULT cModelo   := ""
    DEFAULT cProvedor := ""
    DEFAULT cVersao   := ""
	DEFAULT aCheck	  := ""

	cTestCase := '#include "PROTHEUS.CH"' + CRLF + CRLF

	cTestCase += '//-------------------------------------------------------------------' + CRLF
	cTestCase += '/*/{Protheus.doc} ' + cNameCase + CRLF
	cTestCase += '@author TSS Automation' + CRLF
	cTestCase += "@Since: " + cValToChar(Day(date())) + "/" + cValToChar(Month(date())) + "/" + cValToChar(Year(date()))  + CRLF 
	cTestCase += "@version: 1.0" + CRLF 
	cTestCase += '/*///-------------------------------------------------------------------' + CRLF + CRLF

	cTestCase += 'CLASS ' + cNameCase + ' from FWDefaultTestCase' + CRLF
	cTestCase += '	DATA cDirTestCase' + CRLF
	cTestCase += '	DATA oHelper' + CRLF
	cTestCase += '	DATA cCNPJ' + CRLF
	cTestCase += '	DATA cCodMun' + CRLF
	cTestCase += '	DATA cCPF' + CRLF
	cTestCase += '	DATA cIE' + CRLF
	cTestCase += '	DATA cEstado' + CRLF + CRLF

	cTestCase += '	DATA cLOGIN' + CRLF
	cTestCase += '	DATA cPASS' + CRLF
	cTestCase += '	DATA cMAXLOTE' + CRLF + CRLF

	cTestCase += '	DATA nTime' + CRLF
	cTestCase += '	DATA nExec' + CRLF
	cTestCase += '	DATA lTimer' + CRLF + CRLF

	cTestCase += '	METHOD SetUpClass()' + CRLF + CRLF

	cTestCase += '	METHOD ' + cNameCase + '() CONSTRUCTOR' + CRLF + CRLF

	cTestCase += '	METHOD NFSE_001()' + CRLF
	cTestCase += '	METHOD NFSE_002()' + CRLF
	cTestCase += '	METHOD NFSE_003()' + CRLF
	cTestCase += '	METHOD NFSE_004()' + CRLF
	cTestCase += '	METHOD NFSE_005()' + CRLF
	cTestCase += '	METHOD NFSE_006()' + CRLF
	cTestCase += '	METHOD NFSE_007()' + CRLF
	cTestCase += '	METHOD NFSE_008()' + CRLF
	cTestCase += '	METHOD NFSE_009()' + CRLF
	cTestCase += '	METHOD NFSE_010()' + CRLF
	cTestCase += '	METHOD NFSE_011()' + CRLF
	cTestCase += '	METHOD NFSE_012()' + CRLF
	cTestCase += '	METHOD NFSE_013()' + CRLF
	cTestCase += '	METHOD NFSE_014()' + CRLF
	cTestCase += '	METHOD NFSE_015()' + CRLF
	cTestCase += '	METHOD NFSE_016()' + CRLF 
	cTestCase += '	METHOD NFSE_017()' + CRLF 
	cTestCase += '	METHOD NFSE_018()' + CRLF 
	cTestCase += '	METHOD NFSE_019()' + CRLF 
	cTestCase += '	METHOD NFSE_020()' + CRLF 
	cTestCase += '	METHOD NFSE_021()' + CRLF 
	cTestCase += '	METHOD NFSE_022()' + CRLF 

	cTestCase += 'ENDCLASS' + CRLF + CRLF

	cTestCase += '//-------------------------------------------------------------------' + CRLF
	cTestCase += '/*/{Protheus.doc} ' + cNameCase + CRLF
	cTestCase += '@author TSS Automation' + CRLF
	cTestCase += "@Since: " + cValToChar(Day(date())) + "/" + cValToChar(Month(date())) + "/" + cValToChar(Year(date()))  + CRLF 
	cTestCase += "@version: 1.0" + CRLF 
	cTestCase += '/*///-------------------------------------------------------------------' + CRLF + CRLF

	cTestCase += 'METHOD ' + cNameCase + '() CLASS ' + cNameCase + CRLF
	cTestCase += '_Super:FWDefaultTestSuite()' + CRLF
	cTestCase += '// Referência dos ARQUIVOS gerados na pasta BASELINE. Exemplo: RootPath\Baseline\TSSNFSE001ABRASF\FISSLEX0100\MT5105259\' + CRLF
	cTestCase += '::cDirTestCase := "' + '\TSSNFSE001' + cModelo + '\' + cProvedor + cVersao + '\' + cUF + cCodMun + '\"' + CRLF
	cTestCase += '// Dados da EMPRESA' + CRLF
	cTestCase += '::cCNPJ     := "' + cCnpj + '"' + CRLF
	cTestCase += '::cCodMun	  := "' + cCodMun + '"' + CRLF
	cTestCase += '::cCPF	  := Space(11)' + CRLF
	cTestCase += '::cIE		  := Padr("' + cIE +  '",18)' + CRLF
	cTestCase += '::cEstado	  := "' + cUF + '"' + CRLF
	cTestCase += '// Dados para CONFIGURAÇÃO da PREFEITURA' + CRLF
	cTestCase += '::cLOGIN    := "' + alltrim(cLogin) + '"' + CRLF
	cTestCase += '::cPASS     := "' + alltrim(cPass) + '"' + CRLF
	cTestCase += '::cMAXLOTE  := "' + cMaxLote + '"' + CRLF
	cTestCase += '// Intervalo de TEMPO entre consultas na prefeitura' + CRLF
	cTestCase += '::nTime     := 10000' + CRLF
	cTestCase += '// Número de consultas na prefeitura' + CRLF
	cTestCase += '::nExec     := 50' + CRLF
	cTestCase += '// CASOS de TESTE' + CRLF
	cTestCase += '::AddTestMethod("NFSE_001",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_002",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_INTERMEDIARIO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_003",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_DEDUCAO_REDUCAO_ISS")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_004",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_DESCONTO_CONDICIONAL_INCONDICIONADO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_005",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_SIMPLES_NACIONAL")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_006",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_ISSRETIDO_IMPOSTOS")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_007",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_TOMADOR_PESSOA_FISICA")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_008",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_ISENÇÃO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_009",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_IMUNE")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_010",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_IMPOSTOS")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_011",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_TRIBUTAÇÃO_FORA_DO_MUNICÍPIO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_012",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXIGIBILIDADE_SUSP_DEC_JUDICIAL")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_013",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXIGIBILIDADE_SUSP_PROC_ADM")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_014",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_PARCELAMENTO_E_CONDIÇÃO_DE_PAGAMENTO")' + CRLF
	cTestCase += '::AddTestMethod("NFSE_015",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXTERIOR")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_016",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_SEM_TOMADOR")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_017",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_COD_OBRA")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_018",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXIG_SUSP_DEC_JUDICIAL")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_019",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXIG_SUSP_PROC_ADM")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_020",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_CARACTERES_ESPECIAIS")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_021",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EMISSAO_MAXLOTE")' + CRLF 
	cTestCase += '::AddTestMethod("NFSE_022",,"NFSE_ÚNICO_' + cUF + '_' + cNomeMun + '_' + cCodMun + '_01_EMISSÃO_EXTERIOR")' + CRLF 

	cTestCase += 'Return' + CRLF + CRLF

	cTestCase += '//-------------------------------------------------------------------' + CRLF
	cTestCase += '/*/{Protheus.doc} ' + cNameCase + CRLF
	cTestCase += '@author TSS Automation' + CRLF
	cTestCase += "@Since: " + cValToChar(Day(date())) + "/" + cValToChar(Month(date())) + "/" + cValToChar(Year(date()))  + CRLF 
	cTestCase += "@version: 1.0" + CRLF 
	cTestCase += '/*///-------------------------------------------------------------------' + CRLF + CRLF

	cTestCase += 'METHOD SetUpClass() CLASS ' + cNameCase + CRLF
	cTestCase += 'Local oHelper		:= FWTestHelper():New()' + CRLF
	cTestCase += 'Self:lTimer := .T.' + CRLF + CRLF
	cTestCase += 'Return oHelper' + CRLF + CRLF

	//NFSE_001 - EMISSÃO
	cTestCase += CreateMethod("001",cNameCase, cSerie, aCheck)
	
	//NFSE_002 - INTERMEDIARIO
	cTestCase += CreateMethod("002",cNameCase, cSerie, aCheck)
	
	//NFSE_003 - DEDUCAO_REDUCAO_ISS
	cTestCase += CreateMethod("003",cNameCase, cSerie, aCheck)
	
	//NFSE_004 - DESCONTO_CONDICIONAL_INCONDICIONADO
	cTestCase += CreateMethod("004",cNameCase, cSerie, aCheck)
	
	//NFSE_005 - SIMPLES_NACIONAL
	cTestCase += CreateMethod("005",cNameCase, cSerie, aCheck)
	
	//NFSE_006 - ISSRETIDO_IMPOSTOS
	cTestCase += CreateMethod("006",cNameCase, cSerie, aCheck)
	
	//NFSE_007 - TOMADOR_PESSOA_FISICA
	cTestCase += CreateMethod("007",cNameCase, cSerie, aCheck)
	
	//NFSE_008 - ISENÇÃO
	cTestCase += CreateMethod("008",cNameCase, cSerie, aCheck)
	
	//NFSE_009 - IMUNE
	cTestCase += CreateMethod("009",cNameCase, cSerie, aCheck)
	
	//NFSE_010 - IMPOSTOS
	cTestCase += CreateMethod("010",cNameCase, cSerie, aCheck)
	
	//NFSE_011 - TRIBUTAÇÃO_FORA_DO_MUNICÍPIO
	cTestCase += CreateMethod("011",cNameCase, cSerie, aCheck)
	
	//NFSE_012 - EXIGIBILIDADE_SUSP_DEC_JUDICIAL
	cTestCase += CreateMethod("012",cNameCase, cSerie, aCheck)
	
	//NFSE_013 - EXIGIBILIDADE_SUSP_PROC_ADM
	cTestCase += CreateMethod("013",cNameCase, cSerie, aCheck)
	
	//NFSE_014 - PARCELAMENTO_E_CONDIÇÃO_DE_PAGAMENTO
	cTestCase += CreateMethod("014",cNameCase, cSerie, aCheck)
	
	//NFSE_015 - EXTERIOR
	cTestCase += CreateMethod("015",cNameCase, cSerie, aCheck)
	
	//NFSE_016 - SEM_TOMADOR
	cTestCase += CreateMethod("016",cNameCase, cSerie, aCheck)
	
	//NFSE_017 - COD_OBRA
	cTestCase += CreateMethod("017",cNameCase, cSerie, aCheck)
	
	//NFSE_018 - CARACTERES_ESPECIAIS
	cTestCase += CreateMethod("020",cNameCase, cSerie, aCheck)
	
	//NFSE_019 - EMISSÃO_EMISSAO_MAXLOTE
	cTestCase += CreateMethod("021",cNameCase, cSerie, aCheck)
	
	//NFSE_020 - SUBSTITUIÇÃO
	cTestCase += CreateMethod("022",cNameCase, cSerie, aCheck)


	lSuccess := MemoWrite( cDir + "\" + cNameCase + cExt, cTestCase )

	If lSuccess
		ConOut( "TestSuite  concluido com sucesso!" )
		ConOut( "Confira o arquivo: " + cDir )
		lRet := .T.

	Else
		ConOut( "Ocorreu um erro ao criar o TestSuite, então o processo foi encerrado." )
		lRet := .F.
	EndIf

Return lRet

/*//-----------------------------------------------------------------------
//{Protheus.doc} CreateSuit
Cria um novo TestSuite

    @type  Function
    @author Caique Mota
    @since 06/08/2019
    @version 1.0
    @param cNameSuite, string, variável que contém o nome do TestSuite
    @param cNameGroup, string, variável que contém o nome do TestGroup
    @param cDir, string, variáve que contém o caminho do diretório de TestSuite

/------------------------------------------------------------------------*/

Function CreateSuit(cNameSuite, cNameGroup, cDir)

	Local cTestSuite := ''
	Local lSuccess 	 := ''
	Local cExt		 := '.PRW'
	Local lRet		 := .F.

	DEFAULT cNameSuite := ''
	DEFAULT cNameGroup := ''
	DEFAULT cDir 	   := ''
 
    cTestSuite := '#include "PROTHEUS.CH"' + CRLF + CRLF

	cTestSuite += '//-------------------------------------------------------------------' + CRLF
	cTestSuite += '/*/{Protheus.doc} ' + cNameSuite + CRLF
	cTestSuite += '@author TSS Automation' + CRLF
	cTestSuite += "@Since: " + cValToChar(Day(date())) + "/" + cValToChar(Month(date())) + "/" + cValToChar(Year(date()))  + CRLF 
	cTestSuite += "@version: 1.0" + CRLF 
	cTestSuite += '/*///-------------------------------------------------------------------' + CRLF + CRLF

    cTestSuite += 'CLASS ' + cNameSuite + ' FROM FWDefaultTestSuite' + CRLF + CRLF

    cTestSuite += '	DATA aParam' + CRLF + CRLF

    cTestSuite += '	METHOD ' + cNameSuite + '() CONSTRUCTOR' + CRLF
    cTestSuite += '	METHOD SetUpSuite()' + CRLF
    cTestSuite += '	METHOD TearDownSuite()' + CRLF + CRLF

    cTestSuite += 'ENDCLASS' + CRLF + CRLF

    cTestSuite += 'METHOD ' + cNameSuite + '() CLASS ' + cNameSuite + CRLF + CRLF

    cTestSuite += '	_Super:FWDefaultTestSuite()' + CRLF + CRLF

    cTestSuite += ' 	Self:AddTestSuite(' + cNameGroup + '():' + cNameGroup + '())' + CRLF + CRLF


    cTestSuite += 'Return' + CRLF + CRLF

    cTestSuite += 'METHOD SetUpSuite() CLASS ' + cNameSuite + CRLF
    cTestSuite += 'Local oHelper		:= FWTestHelper():New()' + CRLF
    cTestSuite += 'Local cURL	  := IIf(GetPvProfString("ADVPR", "WEBSERVICE ", "Error", "appserver.ini")<>"Error", GetPvProfString("ADVPR", "WEBSERVICE "	, "Error", "appserver.ini"),"http://localhost:8080/")' + CRLF + CRLF

    cTestSuite += '//-- Realiza a abertura do ambiente' + CRLF
    cTestSuite += 'tssInitializes( .F. )' + CRLF
    cTestSuite += '__TTSINUSE   := .f.' + CRLF
    cTestSuite += "TcInternal( 12, 'OFF' )" + CRLF
    cTestSuite += '//-- Configurações dos parametros' + CRLF + CRLF

    cTestSuite += '//-- Ativado Classe Auxiliar' + CRLF
    cTestSuite += 'oHelper:Activate()' + CRLF + CRLF

    cTestSuite += 'Conout ("Setup realizado com sucesso!")' + CRLF + CRLF

    cTestSuite += 'Return oHelper' + CRLF + CRLF


    cTestSuite += 'METHOD TearDownSuite() CLASS ' + cNameSuite + CRLF
    cTestSuite += 'Local oHelper		:= FWTestHelper():New()' + CRLF + CRLF

    cTestSuite += '//-- Realiza o fechamento do ambiente' + CRLF
    cTestSuite += 'tssFinish()' + CRLF + CRLF

    cTestSuite += 'Return oHelper' + CRLF

	//cria o arquivo com arquivo no diretório de TestCase
	lSuccess := MemoWrite( cDir + "\" + cNameGroup + cExt, cTestSuite )

	If lSuccess
		ConOut( "TestSuitemeio  concluido com sucesso!" )
		ConOut( "Confira o arquivo: " + cDir )
		lRet := .T.

	Else
		ConOut( "Ocorreu um erro ao criar o TestSuite, então o processo foi encerrado." )
		lRet := .F.
	EndIf

Return lRet


/*//-----------------------------------------------------------------------
//{Protheus.doc} EditGroup
Cria um TestGroup

    @type  Function
    @author Caique Lima Fonseca
    @since 05/08/2019
    @version 1.0
    @param cNameGroup, string, nome do TestGroup
    @param cNameCase, string, nome do TestCase
    @param cDir, string, diretório de TestGroup
    @return return, lógico, retorna true quando caso o arquivo seja editado com sucesso

/---------------------------------------------------------------------------*/

Function CreateGroup(cNameGroup, cNameCase, cDir)

Local cTestGroup    := ""
Local lSuccess		:= ""
Local lRet			:= .F.

DEFAULT cNameGroup  := ""
DEFAULT cNameCase   := ""
DEFAULT cDir       := ""  

cTestGroup := '#include "PROTHEUS.CH"' + CRLF + CRLF

cTestGroup += '//-------------------------------------------------------------------' + CRLF
cTestGroup += '/*/{Protheus.doc} ' + cNameGroup + CRLF
cTestGroup += '@author TSS Automation' + CRLF
cTestGroup += "@Since: " + cValToChar(Day(date())) + "/" + cValToChar(Month(date())) + "/" + cValToChar(Year(date()))  + CRLF 
cTestGroup += "@version: 1.0" + CRLF 
cTestGroup += '/*///-------------------------------------------------------------------' + CRLF + CRLF

cTestGroup += 'CLASS ' + cNameGroup + ' FROM FWDefaultTestSuite' + CRLF + CRLF

cTestGroup += TAB + 'METHOD ' + cNameGroup + '() CONSTRUCTOR' + CRLF + CRLF

cTestGroup += 'ENDCLASS' + CRLF + CRLF

cTestGroup += 'METHOD ' + cNameGroup + '() CLASS ' + cNameGroup + CRLF + CRLF
cTestGroup += TAB + '_Super:FWDefaultTestSuite()' + CRLF
cTestGroup += TAB + 'Self:AddTestCase(' + cNameCase + '():' + cNameCase + '() )' + CRLF + CRLF
	
cTestGroup += 'Return'

//cria o o fonte do TestGroup no devido diretório 
lSuccess := MemoWrite( cDir + "\" + cNameGroup + ".PRW", cTestGroup )

If lSuccess
    ConOut( "TestGroup concluido com sucesso!" )
    ConOut( "Confira o arquivo: " + cDir )
    lRet := .T.

Else
    ConOut( "Ocorreu um erro ao criar o TestGroup, então o processo foi encerrado." )
    lRet := .F.
EndIf

Return lRet



/*//-----------------------------------------------------------------------
//{Protheus.doc} CreateMethod
Cria um novo Método de Emissão

    @type  Function
    @author Caique Mota
    @since 07/08/2019
    @version 1.0
    @param cTestSuite, string, variável que cria o TestSuite
    @param cNameSuite, string, variável que contém o nome do TestSuite
    @param cNameGroup, string, variáve que contém o nome do TestGroup

/------------------------------------------------------------------------*/

Function CreateMethod(cNumMethod, cNameCase, cSerie, aCheck)

	Local cTestMethod := ""

    DEFAULT cNumMethod  := ""
    DEFAULT cNameCase   := ""
    DEFAULT cSerie		:= "" 
	DEFAULT aCheck      := ""
	
	cTestMethod += 'METHOD NFSE_' + cNumMethod + '() CLASS ' + cNameCase + CRLF
	cTestMethod += 'Local aOperacao   := {}' + CRLF
	cTestMethod += 'Local cTest		  := "NFSE_' + cNumMethod + '"' + CRLF
	cTestMethod += 'Local oHelper     := FWTestHelper():New()' + CRLF
	cTestMethod += 'Local oProcess    ' + CRLF
	cTestMethod += 'Local oTSS         := TSSXAUTONFSETestCase():New()' + CRLF
	cTestMethod += 'Local aSubOper	 := {}' + CRLF + CRLF

	cTestMethod += 'oHelper:Activate()' + CRLF
	cTestMethod += '/*' + CRLF
	cTestMethod += '* Vetor aSubOper, determina as operações que serão realizadas para a Nota ' + CRLF
	cTestMethod += '*/' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[1],'.T.','.F.') + ', "SCHEMAX"        }) // Schema' + CRLF
	cTestMethod += 'aAdd(aSubOper, {.T., "REMESSANFSE001" }) // Remessa' + CRLF
	cTestMethod += 'aAdd(aSubOper, {.T., "MONITORX"       }) // Monitor da Remessa' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[2],'.T.','.F.') + ', "TSSCONSRPSNFSE" }) // Consulta RPS' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[3],'.T.','.F.') + ', "RETORNANFSE"    }) // Retorna NFSE' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[4],'.T.','.F.') + ', "CANCELANFSE001" }) // Cancela' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[4],'.T.','.F.') + ', "MONITORX_CAN"   }) // Monitor do Cancelamento' + CRLF
	cTestMethod += 'aAdd(aSubOper, {' + iif(aCheck[5],'.T.','.F.') + ', "GERAARQIMP"	 }) // Gerar arquivo TXT - APENAS para municípios da modalidade TXT' + CRLF
	cTestMethod += 'aAdd(aSubOper, {"' + cSerie + '", "SERIES"    	  }) // Série da Nota' + CRLF + CRLF

	cTestMethod += '/*aAdd(aSubOper, {"NF"    , "SERIES"    }) // Serie da Nota' + CRLF
	cTestMethod += 'aAdd(aSubOper, {"000100", "DOCUMENT"  }) // Numero da Nota*/' + CRLF
	cTestMethod += '' + CRLF
	cTestMethod += '/*' + CRLF
	cTestMethod += '* Vetor aOperacao, deverá ter uma linha para cada Nota Fiscal.' + CRLF
	cTestMethod += '* aOperacao[1,1] = Vetor indicando as Operações p/a 1a Nota. _NFSE_001_NOTA001.xml                      (obrigatório)' + CRLF
	cTestMethod += '* aOperacao[1,2] = Vetor indicando as Operações p/a Substituição da 1a Nota. _NFSE_001_SUBSTNOTA001.XML (não obrigatório)' + CRLF + CRLF
	cTestMethod += '*/' + CRLF
	cTestMethod += 'aAdd(aOperacao, {aSubOper , aSubOper})' + CRLF
	if cNumMethod == '022'	
		cTestMethod += 'aAdd(aOperacao, {aSubOper , aSubOper})' + CRLF
	EndIf
	cTestMethod += 'oProcess := oTSS:AUTNFSE_XXX(cTest, aOperacao,::cCNPJ,::cCPF,::cIE,::cEstado,::cCodMun,::cDirTestCase,::cLOGIN,::cPASS,::cMAXLOTE,::nTime,::nExec)' + CRLF
	cTestMethod += 'If oProcess == Nil .Or. !oProcess:lOk' + CRLF
	cTestMethod += '    oHelper:UTPutError( oProcess:cAssertFailMessage + CHR(10) + oProcess:cMessages)' + CRLF
	cTestMethod += '    oHelper:AssertTrue(.F.,"Erro ao Executar "+cTest)' + CRLF
	cTestMethod += 'Else' + CRLF
	cTestMethod += '    oHelper:AssertTrue(.T.,"Sucesso ao Executar "+cTest )' + CRLF
	cTestMethod += 'EndIF' + CRLF
	cTestMethod += 'oProcess := Nil' + CRLF
	cTestMethod += 'FreeObj(oProcess)' + CRLF
	cTestMethod += 'Return oHelper' + CRLF + CRLF

Return cTestMethod


