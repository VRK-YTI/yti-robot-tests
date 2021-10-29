*** Settings ***
Library               RequestsLibrary

*** Variables ***
${API_KEY}=     eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlYmU5NDhhNi00MmRhLTdjNGItNDIxZS1kZTlmZjBkZGMwYmEiLCJleHAiOjE2NTExODYyOTAsImlhdCI6MTYzNTQ2MTQ5MH0.uP3o5jgqMsmzRcVhJviwln7vC4JC2FA4XEIsLHzfeZzvGQK1gQB5DpfXfTCADsSNbS8Jn4OoG5pYdg4zhi153w
${DELETE_MODEL_API_POINT}=      ${TERMINOLOGIES_ENVIRONMENT_URL}/api/v1/frontend/vocabulary

*** Keywords ***
Delete terminology ${prefix} with api
    ${headers}=     Create authentication header
    ${data}=        Catenate     id=http:%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2F${prefix}
    ${response}=    Delete      ${DELETE_MODEL_API_POINT}?${data}  headers=${headers}
    [Return]        ${response}
