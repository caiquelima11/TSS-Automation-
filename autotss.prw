#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} autotss
  Monta a tela
  @type  Function
  @author Caique Lima Fonseca
  @since 21/05/2019
  @version 1.0
/*/

main Function autotss()

Local oDlg, oButton, oSchema, oConsRps, oRetNfse, oCanc, oTxt, oBaseline, oCases, oGroup, oSuite, oModelo, oProvedor, oVersao, oUF, oCodmun, oCnpj, oLogin, oPass, oRemessa, oAdmEmpresa, oPfx, oMaxLote, oNomeMun, oSerie, oIE
Local aCheck        := Array(5,.F.)
Local cPathBaseline	:= "Path Baseline:"
Local cPathCases		:= "Path TestCase:"
Local cPathGroup		:= "Path TestGroup:"
Local cPathSuite		:= "Path TestSuite:"
Local cTxtModelo    := "Modelo:"
Local cTxtProvedor  := "Provedor:"
Local cTxtVersao    := "Versao:"
Local cTxtUf        := "UF:"
Local cTxtCodmun    := "Cod. Municipio:"
Local cTxtCnpj      := "CNPJ:"
Local cTxtLogin     := "Login:"
Local cTxtPass      := "Password:"
Local cTxtMaxLote   := "Max. Lote:"
Local cTxtNomeMun   := "Nome Mun:"
Local cTxtRemessa   := "XML REMESSA:"
Local cTxtAdm       := "XML ADMEMPRESA:"
Local cTxtPfx       := "XML CFGNFSECERTPFX"
Local cTxtSerie     := "Série RPS"
Local cVersion      := "v1.0.1"
Local cTitle        := "AUTO TSS - " + cVersion 
Local cTxtIE           := "IE"

Private cBaseline		  := space(300)
Private cCases			  := space(300)
Private cGroup			  := space(300)
Private cSuite			  := space(300)
Private cModelo       := space(300)
Private cProvedor     := space(30)
Private cVersao       := space(4)
Private cUF           := space(2)
Private cCodmun       := space(7)
Private cCnpj         := space(14)
Private cLogin        := space(100)
Private cPass         := space(100)
Private cMaxLote      := space(3)
Private cNomeMun      := space(30)
Private cRemessa      := space(300)
Private cAdmEmpresas  := space(300)
Private cPfx          := space(300)
Private cSerie        := space(5)
Private cIE           := space(18)

DEFINE DIALOG oDlg TITLE cTitle FROM 200,510 TO 705,900 PIXEL

  oBaseline := TSay():New(17,05,{|| cPathBaseline },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oBaseline := TGet():Create( oDlg,{ |u| if(PCount()>0, cBaseline := Alltrim(u), cBaseline) },15,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cBaseline,,,2,, )
  oBaseline:bHelp := {||    ShowHelpCpo("Baseline",{"Informe aqui o diretórtio local da pasta baseline." + CRLF + "Ex.: C:\TOTVS\TSS3.0\baseline:"},2,,)}

  oCases := TSay():New(32,05,{|| cPathCases },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oCases := TGet():Create( oDlg,{ |u| if(PCount()>0, cCases := Alltrim(u), cCases) },30,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCases,,,2,, )
  oCases:bHelp := {||    ShowHelpCpo("TestCase",{"Informe aqui o diretórtio local da pasta Cases." + CRLF + "Ex.: C:\FONTES\TESTES\SIGATSS\Scripts AdvPR\Cases:"},2,,)}

  oSuite := TSay():New(47,05,{|| cPathSuite },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oSuite := TGet():Create( oDlg,{ |u| if(PCount()>0, cSuite := Alltrim(u), cSuite) },45,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cSuite,,,2,, )
  oSuite:bHelp := {||    ShowHelpCpo("TestSuite",{"Informe aqui o diretórtio local da pasta Suite." + CRLF + "Ex.: C:\FONTES\TESTES\SIGATSS\Scripts AdvPR\Suite:"},2,,)}

  oGroup := TSay():New(62,05,{|| cPathGroup },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oGroup := TGet():Create( oDlg,{ |u| if(PCount()>0, cGroup := Alltrim(u), cGroup) },60,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cGroup,,,2,, )
  oGroup:bHelp := {||    ShowHelpCpo("TestGroup",{"Informe aqui o diretórtio local da pasta Cases." + CRLF + "Ex.: C:\FONTES\TESTES\SIGATSS\Scripts AdvPR\Group:"},2,,)}

  oModelo := TSay():New(77,05,{|| cTxtModelo },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oModelo := TGet():Create( oDlg,{ |u| if(PCount()>0, cModelo := Alltrim(u), cModelo) },75,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cModelo,,,2,, )
  oModelo:bHelp := {||    ShowHelpCpo("Modelo",{"Informe aqui o nome do modelo do município." + CRLF + "Ex.: ABRASF"},2,,)}

  oProvedor := TSay():New(92,05,{|| cTxtProvedor },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oProvedor := TGet():Create( oDlg,{ |u| if(PCount()>0, cProvedor := Alltrim(u),cProvedor) },90,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cProvedor,,,2,, )
  oProvedor:bHelp := {||    ShowHelpCpo("Provedor",{"Informe aqui o nome do provedor do município." + CRLF + "Ex.: WEBISS"},2,,)}

  oVersao := TSay():New(107,05,{|| cTxtVersao },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oVersao := TGet():Create( oDlg,{ |u| if(PCount()>0, cVersao := Alltrim(u),cVersao) },105,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cVersao,,,2,, )
  oVersao:bHelp := {||    ShowHelpCpo("Versão",{"Informe aqui a versão do layout deste município, ela não pode ter pontos e deve ter tamanho 4(preencha com zeros à esquerda)." + CRLF + "Ex.: 0201"},2,,)}

  oCodmun := TSay():New(122,05,{|| cTxtCodmun },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oCodmun := TGet():Create( oDlg,{ |u| if(PCount()>0, cCodmun := Alltrim(u), cCodmun) },120,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCodmun,,,2,, )
  oCodmun:bHelp := {||    ShowHelpCpo("Codmun",{"Informe aqui o Código IBGE do município." + CRLF + "Ex.: 3550308"},2,,)}

  oUF := TSay():New(137,05,{|| cTxtUf },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oUF := TGet():Create( oDlg,{ |u| if(PCount()>0, cUF := Alltrim(u), cUF) },135,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cUF,,,2,, )

  oCnpj := TSay():New(152,05,{|| cTxtCnpj },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oCnpj := TGet():Create( oDlg,{ |u| if(PCount()>0, cCnpj := Alltrim(u), cCnpj) },150,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCnpj,,,2,, )

  oLogin := TSay():New(167,05,{|| cTxtLogin },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oLogin := TGet():Create( oDlg,{ |u| if(PCount()>0, cLogin := Alltrim(u), cLogin) },165,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cLogin,,,2,, )

  oPass := TSay():New(182,05,{|| cTxtPass },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oPass := TGet():Create( oDlg,{ |u| if(PCount()>0, cPass := Alltrim(u), cPass) },180,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cPass,,,2,, )

  oMaxLote := TSay():New(197,05,{|| cTxtMaxLote },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oMaxLote := TGet():Create( oDlg,{ |u| if(PCount()>0, cMaxLote := Alltrim(u), cMaxLote) },195,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cMaxLote,,,2,, )

  oNomeMun := TSay():New(212,05,{|| cTxtNomeMun },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oNomeMun := TGet():Create( oDlg,{ |u| if(PCount()>0, cNomeMun := Alltrim(u), cNomeMun) },210,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNomeMun,,,2,, )

  oSerie     := TSay():New(227,05,{|| cTxtSerie },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oSerie     := TGet():Create( oDlg,{ |u| if(PCount()>0, cSerie := Alltrim(u), cSerie) },225,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNomeMun,,,2,, )

  oIE     := TSay():New(242,05,{|| cTxtIE },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oIE     := TGet():Create( oDlg,{ |u| if(PCount()>0, cIE := Alltrim(u), cIE) },240,47,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNomeMun,,,2,, )

  oSchema  := TCheckBox():New(15,120,'Schema',			  {||aCheck[1]},oDlg,100,210,,	{|| aCheck[1] := !aCheck[1]},,,,,,.T.,,,)
  oConsRps := TCheckBox():New(27,120,'Consulta RPS',	{||aCheck[2]},oDlg,100,210,,	{|| aCheck[2] := !aCheck[2]},,,,,,.T.,,,)
  oRetNfse := TCheckBox():New(39,120,'Retorna NFS-e',	{||aCheck[3]},oDlg,100,210,,	{|| aCheck[3] := !aCheck[3]},,,,,,.T.,,,)
  oCanc    := TCheckBox():New(51,120,'Cancelamento',	{||aCheck[4]},oDlg,100,210,,	{|| aCheck[4] := !aCheck[4]},,,,,,.T.,,,)
  oTxt     := TCheckBox():New(63,120,'Município TXT',	{||aCheck[5]},oDlg,100,210,,	{|| aCheck[4] := !aCheck[5]},,,,,,.T.,,,)
  
  oRemessa := TSay():New(085,120,{|| cTxtRemessa },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oRemessa := TGet():Create( oDlg,{|| cRemessa },093,120,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cPass,,,2,, )
	oButton  := TButton():New(093,181,'...',oDlg,{ |u| if(PCount()>0, cRemessa := cGetFile("*.xml|*.xml","Selecione o arquivo XML - Método REMESSANFSE001",0,"",.T.,GETF_LOCALHARD), cRemessa) },10,10,,,,.T.)

  oAdmEmpresa := TSay():New(110,120,{|| cTxtAdm },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oAdmEmpresa := TGet():Create( oDlg,{|| cAdmEmpresas },118,120,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cPass,,,2,, )
	oButton     := TButton():New(118,181,'...',oDlg,{ |u| if(PCount()>0, cAdmEmpresas := cGetFile("*.xml|*.xml","Selecione o arquivo XML - Método ADMEMPRESAS",0,"",.T.,GETF_LOCALHARD), cAdmEmpresas) },10,10,,,,.T.)

  oPfx     := TSay():New(135,120,{|| cTxtPfx },oDlg,,,,,,.T.,,CLR_WHITE,200,20)
  oPfx     := TGet():Create( oDlg,{|| cPfx },143,120,60,05,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cPass,,,2,, )
	oButton  := TButton():New(143,181,'...',oDlg,{ |u| if(PCount()>0, cPfx := cGetFile("*.xml|*.xml","Selecione o arquivo XML - Método CFGNFSECERTPFX",0,"",.T.,GETF_LOCALHARD), cPfx) },10,10,,,,.T.)

	oButton  := TButton():New(225,130,'Gerar',oDlg,{ || testgenarate(alltrim(cBaseline), alltrim(cCases), alltrim(cGroup), alltrim(cSuite), alltrim(cModelo), alltrim(cProvedor), alltrim(cVersao), alltrim(cUF), alltrim(cCodmun), alltrim(cCnpj), alltrim(cLogin), alltrim(cPass), alltrim(cMaxLote), alltrim(cNomeMun), alltrim(cRemessa), alltrim(cAdmEmpresas), alltrim(cPfx), alltrim(cSerie), alltrim(cIe), aCheck) },60,12,,,,.T.)
  oButton  := TButton():New(240,130,'Cancelar',oDlg,{ || oDlg:end() },60,12,,,,.T.)

ACTIVATE DIALOG oDlg CENTERED

//oBrowse:Refresh(.T.)

Return 
