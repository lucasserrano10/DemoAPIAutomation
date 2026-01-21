*** Settings ***
Library    RequestsLibrary
Library    RPA.Excel.Files
Resource   ../resources/keywords.robot

*** Test Cases ***
Executar Cenários Definidos no Excel
    Abrir Planilha
    ${cenarios}=    Ler Cenários Ativos
    FOR    ${cenario}    IN    @{cenarios}
        Executar Cenario    ${cenario}
    END
