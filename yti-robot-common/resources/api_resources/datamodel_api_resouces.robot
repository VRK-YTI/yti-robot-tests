*** Settings ***
Library               RequestsLibrary

*** Variables ***
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