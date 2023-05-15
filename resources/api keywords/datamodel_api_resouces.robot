*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Resource              common_api_resources.robot

*** Variables ***
${DELETE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/model
${CREATE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/model

${LANGUAGE_FI}=                 fi
${LANGUAGE_SV}=                 sv
${LANGUAGE_EN}=                 en

${AUTOMATION_ORGANIZATION}=     918448ba-3fc1-4908-aae7-096c8773ca8b
${TESTING_ORGANIZATION}=        9a7362ab-0938-462c-a645-abae08525715
${HOUSING_SERVICE}=             P1
${DEMOCRACY_SERVICE}=           P8

${DRAFT}=                    DRAFT
${VALID}=                    VALID
${SUPERSEDED}=               SUPERSEDED
${RETIRED}=                  RETIRED
${INCOMPLETE}=               INCOMPLETE
${INVALID}=                  INVALID

${PROFILE}=                  PROFILE
${LIBRARY}=                  LIBRARY

${DEFAULT_STATUS}=           ${DRAFT}
${DEFAULT_TYPE}=             ${PROFILE}
&{DEFAULT_DESCRIPTION}=      &{EMPTY}
@{DEFAULT_LANGUAGES}=        ${LANGUAGE_FI}
@{DEFAULT_ORGANIZATIONS}=    ${AUTOMATION_ORGANIZATION}
@{DEFAULT_SERVICES}=         ${HOUSING_SERVICE}


*** Keywords ***
Create datamodel with api
    [Arguments]
    ...  ${prefix}
    ...  ${labels}
    ...  ${descriptions}=&{DEFAULT_DESCRIPTION}
    ...  ${services}=${DEFAULT_SERVICES}
    ...  ${organizations}=${DEFAULT_ORGANIZATIONs}
    ...  ${languages}=${DEFAULT_LANGUAGES}
    ...  ${status}=${DEFAULT_STATUS}
    ...  ${type}=${DEFAULT_TYPE}
    ${headers}=     Create authentication header
    ${json}=        Create datamodel json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_profile_create.json
    ...             labels=${labels}
    ...             prefix=${prefix}
    ...             descriptions=${descriptions}
    ...             services=${services}
    ...             organizations=${organizations}
    ...             languages=${languages}
    ...             status=${status}
    ...             type=${type}
    ${response}=    Put         ${CREATE_MODEL_API_POINT}     headers=${headers}  data=${json}
    [Return]        ${response}

Delete model ${model} with api
    ${headers}=     Create authentication header
    ${response}=    Delete      ${DELETE_MODEL_API_POINT}/${model}  headers=${headers}
    [Return]        ${response}

Create datamodel json from file
    [Arguments]     
    ...  ${file}
    ...  ${prefix}
    ...  ${languages}
    ...  ${status}
    ...  ${type}
    ...  ${labels}
    ...  ${descriptions}
    ...  ${services}
    ...  ${organizations}
    ${json_string}=      Get File    ${file}
    ${json}=             evaluate       json.loads('''${json_string}''')    json
    set to dictionary    ${json}        id=http://uri.suomi.fi/datamodel/ns/${prefix}
    set to dictionary    ${json}        description=${descriptions}
    set to dictionary    ${json}        label=${labels}
    set to dictionary    ${json}        prefix=${prefix}
    set to dictionary    ${json}        status=${status}
    set to dictionary    ${json}        type=${type}
    set to dictionary    ${json}        groups=${services}
    set to dictionary    ${json}        languages=${languages}
    set to dictionary    ${json}        organizations=${organizations}

    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}
