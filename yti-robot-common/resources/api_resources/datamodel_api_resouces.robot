*** Settings ***
Library               RequestsLibrary

*** Variables ***
${API_KEY}=     eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlYmU5NDhhNi00MmRhLTdjNGItNDIxZS1kZTlmZjBkZGMwYmEiLCJleHAiOjE2NTExODYyOTAsImlhdCI6MTYzNTQ2MTQ5MH0.uP3o5jgqMsmzRcVhJviwln7vC4JC2FA4XEIsLHzfeZzvGQK1gQB5DpfXfTCADsSNbS8Jn4OoG5pYdg4zhi153w
#${DELETE_MODEL_API_POINT}=     ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/model?id=
${DELETE_MODEL_API_POINT}=      ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/model
${CREATE_PROFILE_API_POINT}=    ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/profileCreator



*** Keywords ***
Create profile ${profile} with prefix ${prefix} api
    ${headers}=     Create authentication header
    ${data}=        Catenate    label=${profile}&lang=fi&langList=fi+en+sv&prefix=${prefix}&serviceList=P1
    ${response}=    Get         ${CREATE_PROFILE_API_POINT}?${data}     headers=${headers}
    [Return]        ${response}

Delete model ${model} with api
    ${headers}=     Create authentication header
    ${data}=        Catenate     id=http:%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2F${model}
    ${response}=    Delete      ${DELETE_MODEL_API_POINT}?${data}  headers=${headers}
    [Return]        ${response}


Create authentication header
    ${headers}=     Create Dictionary   Content-Type    application/json    Authorization    Bearer ${API_KEY}
    [Return]        ${headers}