*** Keywords ***
Abrir Planilha
    Open Workbook    data/cenarios_demo.xlsx

Ler Cenários Ativos
    ${rows}=    Read Worksheet As Table    header=True
    ${ativos}=    Create List
    FOR    ${row}    IN    @{rows}
        IF    '${row}[Executar]' == 'YES'
            Append To List    ${ativos}    ${row}[Cenario]
        END
    END
    [Return]    ${ativos}

Executar Cenario
    [Arguments]    ${cenario}
    IF    '${cenario}' == 'HealthCheck API'
        Health Check API
    ELSE IF    '${cenario}' == 'Orders API'
        Orders API
    END

Health Check API
    Create Session    api    https://httpbin.org
    ${resp}=    GET    api    /status/200
    Should Be Equal As Integers    ${resp.status_code}    200

Orders API
    Create Session    api    https://httpbin.org
    ${resp}=    GET    api    /status/200
    Should Be Equal As Integers    ${resp.status_code}    200
