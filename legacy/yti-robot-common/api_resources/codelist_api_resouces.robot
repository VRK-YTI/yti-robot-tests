*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Library               Process
Resource              common_api_resources.robot

*** Keywords ***
Create codelist from ${file type} ${file_path} to ${registery} with api
    ${create_api_point}=  Catenate  ${REFERENCE DATA ENVIRONMENT URL}codelist-intake/api/v1/coderegistries/${registery}/codeschemes/
    ${headers}=     Create file upload authentication header
    ${file_data}=   Get Binary File  ${file_path}
    ${file}=        Create Dictionary  file=${file_data}
    ${data}=        Catenate    format=${file type}&originalCodeSchemeId=&newVersionOfCodeScheme=false&updatingExistingCodeScheme=false
    ${response}=    Post        ${create_api_point}?${data}     headers=${headers}  files=${file}  #data=${json}

Delete codelist ${codelist} from registery ${registery} with api
    [Arguments]
    ${delete_api_point}=  Catenate  ${REFERENCE DATA ENVIRONMENT URL}codelist-intake/api/v1/coderegistries/${registery}/codeschemes
    ${headers}=     Create authentication header
    ${data}=        Catenate    ${codelist}
    ${response}=    Delete      ${delete_api_point}/${data}/  headers=${headers}
    [Return]        ${response}
