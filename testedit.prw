#INCLUDE "PROTHEUS.CH"
#DEFINE CRLF Chr(13)+Chr(10)
#DEFINE TAB  Chr(09)

/*----------------------------------------------------------------------------------------/
//{Protheus.doc} EditGroup
Edita um TestGroup já existente 

    @type  Function
    @author Caique Lima Fonseca
    @since 05/08/2019
    @version 1.0
    @param cNameGroup, string, nome do TestGroup
    @param cNameCase, string, nome do TestCase
    @param cDir, string, diretório de TestGroup
    @return return, lógico, retorna true quando caso o arquivo seja editado com sucesso

/----------------------------------------------------------------------------------------*/

Function EditGroup(cNameGroup, cNameCase, cDir)

local cTxt          := ""
local lExst         := .F.
local lSuccess      := .F.
local lRet          := .F.
local cExt          := ".PRW"

DEFAULT cDir        := ""
DEFAULT cNameGroup  := ""
DEFAULT cNameCase   := "" 

lExst := ExistDir( cDir )
cDir     := cDir + "\" + cNameGroup + cExt

If lExst
    cTxt := MemoRead( cDir, .F. )
EndIf

cTxt := StrTran( cTxt, "_Super:FWDefaultTestSuite()", "_Super:FWDefaultTestSuite()" + CRLF;
        + TAB + "Self:AddTestCase(" + cNameCase + "():" + cNameCase + "() )" )

lSuccess := MemoWrite( cDir, cTxt )

If lSuccess
    ConOut( "TestGroup concluido com sucesso!" )
    ConOut( "Confira o arquivo: " + cDir )
    lRet := .T.

Else
    ConOut( "Ocorreu um erro ao criar o TestGroup, então o processo foi encerrado." )
    lRet := .F.
EndIf

Return lRet

/*----------------------------------------------------------------------------------------/
//{Protheus.doc} EditSuite
Edita um TestGroup já existente 

    @type  Function
    @author Caique Lima Fonseca
    @since 05/08/2019
    @version 1.0
    @param cNameGroup, string, nome do TestGroup
    @param cNameCase, string, nome do TestCase
    @param cDir, string, diretório de TestGroup
    @return return, lógico, retorna true quando caso o arquivo seja editado com sucesso

/----------------------------------------------------------------------------------------*/

Function EditSuite(cNameSuite, cNameGroup, cDir)

local cTxt          := ""
local lExst         := .F.
local lSuccess      := .F.
local lRet          := .F.
local cExt          := ".PRW"

DEFAULT cNameSuite  := ""
DEFAULT cNameGroup  := ""
DEFAULT cDir        := ""

lExst := ExistDir( cDir )
cDir     := cDir + "\" + cNameSuite + cExt

If lExst
    cTxt := MemoRead( cDir, .F. )
EndIf

cTxt := StrTran( cTxt, "_Super:FWDefaultTestSuite()", "_Super:FWDefaultTestSuite()" + CRLF;
        + TAB + "Self:AddTestSuite(" + cNameGroup + "():" + cNameGroup + "() )" )

lSuccess := MemoWrite( cDir, cTxt )

If lSuccess
    ConOut( "TestSuite concluido com sucesso!" )
    ConOut( "Confira o arquivo: " + cDir )
    lRet := .T.

Else
    ConOut( "Ocorreu um erro ao criar o TestSuite, então o processo foi encerrado." )
    lRet := .F.
EndIf

Return lRet

