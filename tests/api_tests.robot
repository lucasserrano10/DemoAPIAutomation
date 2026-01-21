*** Settings ***
Library    Collections
Resource   ../resources/keywords.robot

*** Test Cases ***
Executar Cenarios Definidos
    ${rows}=    Ler Cenarios Do Excel    
    FOR    ${row}    IN    @{rows}
        Run Keyword If    '${row}[EXECUTAR]' == 'YES'    Rodar Cenário    ${row}[CENARIO]
    END
*** Keywords ***
Rodar Cenário
    [Arguments]    ${cenario}
    Log    Rodando cenário: ${cenario}
