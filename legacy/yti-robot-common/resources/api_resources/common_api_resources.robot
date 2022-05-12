*** Settings ***
Library               RequestsLibrary

*** Variables ***
${API_KEY}=                 ${EMPTY}
${JSON_FILE_FOLDER}=        ${EXECDIR}${/}..${/}yti-robot-common${/}resources${/}${/}api_resources${/}json_files

*** Keywords ***
Create authentication header
    ${headers}=     Create Dictionary   Content-Type    application/json    Authorization    Bearer ${API_KEY}
    [Return]        ${headers}

Create file upload authentication header
    ${headers}=     Create Dictionary   Authorization    Bearer ${API_KEY}
    [Return]        ${headers}