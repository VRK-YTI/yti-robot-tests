*** Settings ***
Library               RequestsLibrary

*** Variables ***
${DELETE_TERMINOLOGY_API_POINT}=      ${TERMINOLOGIES_ENVIRONMENT_URL}terminology-api/api/v1/frontend/vocabulary
${CREATE_TERMINOLOGY_API_POINT}=      ${TERMINOLOGIES_ENVIRONMENT_URL}terminology-api/api/v1/frontend/vocabulary
${template_graph_id}=                 61cf6bde-46e6-40bb-b465-9b2c66bf4ad8


*** Keywords ***
Delete terminology ${terminology} with api
    ${headers}=     Create authentication header
    ${data}=        Catenate    graphId=${CREATED GRAPH ID}
    ${response}=    Delete      ${DELETE_TERMINOLOGY_API_POINT}?${data}  headers=${headers}
    [Return]        ${response}

Create terminology ${terminology} with api
    ${graph_id}=    Catenate
    ...             9db140ac-5f1b-44b5-a408-0c42ff712128
    ${headers}=     Create authentication header
    ${data}=        Catenate
    ...             templateGraphId=${template_graph_id}
    ...             &prefix=${terminology}
    ${json}=        Create terminology json from file
    ...             ${EXECDIR}\\json_files\\terminology_create.json
    ...             ${terminology}
    ...             ${graph_id}
    ...             ${template_graph_id}
    ${response}=    Post        ${CREATE_TERMINOLOGY_API_POINT}?${data}    headers=${headers}  data=${json}
    set global variable  ${CREATED GRAPH ID}  ${response.json()}
    [Return]        ${response}

Create terminology json from file
    [Arguments]     ${file}     ${terminology}      ${graph_id}     ${template_graph_id}
    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json}                                id=${graph_id}
    set to dictionary    ${json["type"]["graph"]}               id=${template_graph_id}
    set to dictionary    ${json["properties"]["prefLabel"][0]}  value=${terminology}
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}
