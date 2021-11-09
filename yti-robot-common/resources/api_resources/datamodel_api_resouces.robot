*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Resource              common_api_resources.robot

*** Variables ***
${DELETE_MODEL_API_POINT}=      ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/model
${CREATE_MODEL_API_POINT}=      ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/model
${CREATE_CLASS_API_POINT}=      ${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/class
${organisation}=     9a7362ab-0938-462c-a645-abae08525715
${service}=          P1

*** Keywords ***
Create profile ${model} with prefix ${prefix} api
    ${headers}=     Create authentication header
    ${json}=        Create datamodel json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_profile_create.json
    ...             ${model}
    ...             ${prefix}
    ${response}=    Put         ${CREATE_MODEL_API_POINT}     headers=${headers}  data=${json}
    [Return]        ${response}

Create vocabulary ${model} with prefix ${prefix} api
    ${headers}=     Create authentication header
    ${json}=        Create datamodel json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_vocabulary_create.json
    ...             ${model}
    ...             ${prefix}
    ${response}=    Put         ${CREATE_MODEL_API_POINT}     headers=${headers}  data=${json}
    [Return]        ${response}

Add class ${prefix} to model ${model}
    ${headers}=     Create authentication header
    ${json}=        Create class add json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_create_class.json
    ...             ${model}
    ...             ${prefix}
    ${data}=        catenate
    ...             id=http:%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2F${model}%23${prefix}
    ...             &model=http:%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2F${model}
    ${response}=    Put          ${CREATE_CLASS_API_POINT}?${data}     headers=${headers}   data=${json}

Delete model ${model} with api
    ${headers}=     Create authentication header
    ${data}=        Catenate    id=http:%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2F${model}
    ${response}=    Delete      ${DELETE_MODEL_API_POINT}?${data}  headers=${headers}
    [Return]        ${response}

Create datamodel json from file
    [Arguments]     ${file}     ${model}    ${prefix}
    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json["@graph"]}                      @id=http://uri.suomi.fi/datamodel/ns/${prefix}
    set to dictionary    ${json["@graph"]["contributor"][0]}    @id=urn:uuid:${organisation}
    set to dictionary    ${json["@graph"]["isPartOf"][0]}       identifier=${service}
    set to dictionary    ${json["@graph"]}                      preferredXMLNamespaceName=http://uri.suomi.fi/datamodel/ns/${prefix}#
    set to dictionary    ${json["@graph"]}                      preferredXMLNamespacePrefix=${prefix}
    set to dictionary    ${json["@graph"]["label"]}             fi=${model}
    set to dictionary    ${json["@graph"]["comment"]}           fi=${model}
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}

Create class add json from file
    [Arguments]     ${file}     ${model}    ${prefix}
    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json["@graph"]}                      @id=http://uri.suomi.fi/datamodel/ns/${model}#${prefix}
    set to dictionary    ${json["@graph"]}                      @isDefinedBy=http://uri.suomi.fi/datamodel/ns/${model}
    set to dictionary    ${json["@graph"]["name"]}              @fi=${prefix}
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}