*** Settings ***
Library    Collections

*** Keywords ***
Ler Cenarios Do Excel
    # Carrega o workbook
    ${wb}=    Evaluate    __import__('openpyxl').load_workbook('data/cenarios_demo.xlsx')    modules=openpyxl
    
    # CORREÇÃO: Acessa a planilha ativa diretamente
    ${sheet}=    Set Variable    ${wb.active}
    
    ${rows}=    Create List
    
    # Sintaxe moderna de FOR (Robot 3.1+)
    FOR    ${row}    IN    @{sheet.iter_rows(min_row=2, values_only=True)}
        ${dict_row}=    Create Dictionary    CENARIO=${row}[0]    EXECUTAR=${row}[1]
        Append To List    ${rows}    ${dict_row}
    END
    
    RETURN      ${rows}