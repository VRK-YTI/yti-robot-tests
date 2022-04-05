*** Settings ***
Library               RequestsLibrary
Library               Collections
Library               ../api keywords/common_api_resouces.py

*** Variables ***
${JSON_FILE_FOLDER}=        ${EXECDIR}${/}resources${/}api keywords${/}json files

*** Keywords ***
Create authentication header
    ${headers}=     Create Dictionary   Content-Type    application/json    Authorization    Bearer ${API_KEY}
    [Return]        ${headers}

Create file upload authentication header
    ${headers}=     Create Dictionary   Authorization    Bearer ${API_KEY}
    [Return]        ${headers}