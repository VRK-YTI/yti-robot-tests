*** Settings ***
Library               RequestsLibrary

*** Variables ***
${API_KEY}=                 eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlYmU5NDhhNi00MmRhLTdjNGItNDIxZS1kZTlmZjBkZGMwYmEiLCJleHAiOjE2NTExODYyOTAsImlhdCI6MTYzNTQ2MTQ5MH0.uP3o5jgqMsmzRcVhJviwln7vC4JC2FA4XEIsLHzfeZzvGQK1gQB5DpfXfTCADsSNbS8Jn4OoG5pYdg4zhi153w
${JSON_FILE_FOLDER}=        ${EXECDIR}${/}json_files${/}

*** Keywords ***
Create authentication header
    ${headers}=     Create Dictionary   Content-Type    application/json    Authorization    Bearer ${API_KEY}
    [Return]        ${headers}