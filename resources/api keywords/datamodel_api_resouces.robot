*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Resource              common_api_resources.robot

*** Variables ***
${DELETE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/api/v1/model
${CREATE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/api/v1/model
${organisation}=     9a7362ab-0938-462c-a645-abae08525715
${service}=          P1

*** Keywords ***
Create profile ${model} with prefix ${prefix} with api
    ${headers}=     Create authentication header
    ${json}=        Create datamodel json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_profile_create.json
    ...             ${model}
    ...             ${prefix}
    ${response}=    Put         ${CREATE_MODEL_API_POINT}     headers=${headers}  data=${json}
    [Return]        ${response}

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
    set to dictionary    ${json["@context"]}                    ${prefix}=http://uri.suomi.fi/datamodel/ns/${prefix}#
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}
