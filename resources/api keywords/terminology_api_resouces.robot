*** Settings ***
Library               RequestsLibrary
Resource              common_api_resources.robot

*** Variables ***
${DELETE_TERMINOLOGY_API_POINT}=        ${TERMINOLOGIES_URL}/terminology-api/api/v1/frontend/vocabulary
${CREATE_TERMINOLOGY_API_POINT}=        ${TERMINOLOGIES_URL}/terminology-api/api/v1/frontend/vocabulary
${CREATE_TERMI_CONCEPT_API_POINT}=      ${TERMINOLOGIES_URL}/terminology-api/api/v1/frontend/modify
${GET_TERMINOLOGY_GRAPHS_API_POINT}     ${TERMINOLOGIES_URL}/terminology-api/api/v1/frontend/graphs
${template_graph_id}=                   61cf6bde-46e6-40bb-b465-9b2c66bf4ad8

${DOMAIN_DEMOCRACY}=                    9f69e282-b4d9-3cc0-a0d2-e7ccd861266a
${DOMAIN_HOUSING}=                      9ba19f8d-d688-39cc-b620-ebb7875e6e9b

${ORGANIZATION_AUTOMATION}=             918448ba-3fc1-4908-aae7-096c8773ca8b
${ORGANIZATION_TEST}=                   9a7362ab-0938-462c-a645-abae08525715

${TERM_ID}=                             bf5f88cb-3a33-498e-b8eb-1c9807973e88
${CONCEPT_ID_DEFAULT}=                  04bb2206-ba9e-4007-920d-f57ed0d4bcef
${COLLECTION_ID_DEFAULT}=               85de7936-174a-4b68-8b35-8a2b0ebbd6fd

${DRAFT}=                   DRAFT
${VALID}=                   VALID
${SUPERSEDED}=              SUPERSEDED
${RETIRED}=                 RETIRED
${INCOMPLETE}=              INCOMPLETE

*** Keywords ***
Find terminology id for ${terminology} with api
    ${headers}=     Create authentication header
    ${response}=    Get      ${GET_TERMINOLOGY_GRAPHS_API_POINT}  headers=${headers}
    @{graphs_ids}=  parse terminology urls with value  ${response.json()}  ${terminology}
    [Return]  @{graphs_ids}

Delete terminology ${terminology} with api
    ${headers}=     Create authentication header
    @{graphs_ids}=  Find terminology id for ${terminology} with api
    FOR    ${graphs_id}    IN    @{graphs_ids}
        ${data}=        Catenate    graphId=${graphs_id}
        ${response}=    Delete      ${DELETE_TERMINOLOGY_API_POINT}?${data}  headers=${headers}
    END
    [Return]        ${response}

Create terminology with api
    [Arguments]     ${terminology}
    ...             ${status}=${DRAFT}
    ...             ${domain}=${DOMAIN_HOUSING}
    ...             ${organization}=${ORGANIZATION_AUTOMATION}
    ...             ${prefix}=${terminology}

    Set tags        Create terminology with api
    ${uuid}         Evaluate    uuid.uuid4()    modules=uuid
    ${graph_id}=    Catenate
    ...             ${uuid}
    ${headers}=     Create authentication header
    ${data}=        Catenate
    ...             templateGraphId=${template_graph_id}
    ...             &prefix=${prefix}
    ${json}=        Create terminology json from file
    ...             ${JSON_FILE_FOLDER}${/}terminology_create.json
    ...             ${terminology}
    ...             ${graph_id}
    ...             ${template_graph_id}
    ...             ${status}
    ...             ${domain}
    ...             ${organization}
    ${response}=    Post        ${CREATE_TERMINOLOGY_API_POINT}?${data}    headers=${headers}  data=${json}
    [Return]        ${response}

Create terminology collection with api  
    [Arguments]     ${terminology}
    ...             ${collection}
    ...             ${collection id}
    ...             ${members}
    Set tags        Create collection with api
    ${headers}=     Create authentication header
    @{graphs_ids}=  Find terminology id for ${terminology} with api
    FOR    ${graphs_id}    IN    @{graphs_ids}
        ${json}=        Create collection json from file
        ...             ${JSON_FILE_FOLDER}${/}terminology_collections_create.json
        ...             ${graphs_id}
        ...             ${collection}
        ...             ${collection id}
        ...             ${members}
        ${response}=    Post        ${CREATE_TERMI_CONCEPT_API_POINT}   headers=${headers}  data=${json}
    END
    [Return]        ${response}

Create terminology concept with api  
    [Arguments]     ${terminology}
    ...             ${concept}
    ...             ${concept id}=${CONCEPT_ID_DEFAULT}
    ...             ${status}=${DRAFT}
    ...             ${term id}=${TERM_ID}

    Set tags        Create concept with api
    ${headers}=     Create authentication header
    
    @{graphs_ids}=  Find terminology id for ${terminology} with api
    FOR    ${graphs_id}    IN    @{graphs_ids}
        ${json}=        Create concept json from file
        ...             ${JSON_FILE_FOLDER}${/}terminology_concept_create.json
        ...             ${graphs_id}
        ...             ${concept}
        ...             ${concept id}
        ...             ${status}
        ...             ${term id}
        ${response}=    Post        ${CREATE_TERMI_CONCEPT_API_POINT}   headers=${headers}  data=${json}
    END
    [Return]        ${response}

Create terminology json from file
    [Arguments]         ${file}     
    ...                 ${terminology}      
    ...                 ${graph_id}     
    ...                 ${template_graph_id}  
    ...                 ${status}
    ...                 ${domain}
    ...                 ${organization}

    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json}                                    id=${graph_id}
    set to dictionary    ${json["type"]["graph"]}                   id=${template_graph_id}
    set to dictionary    ${json["properties"]["prefLabel"][0]}      value=${terminology}
    set to dictionary    ${json["properties"]["status"][0]}         value=${status}
    set to dictionary    ${json["references"]["contributor"][0]}    id=${organization}
    set to dictionary    ${json["references"]["inGroup"][0]}        id=${domain}
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}

Create concept json from file
    [Arguments]         ${file}
    ...                 ${graphs_id}
    ...                 ${concept}
    ...                 ${concept id}
    ...                 ${status}
    ...                 ${term id}

    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')      json
    set to dictionary    ${json["save"][1]}                                    id=${concept id}
    set to dictionary    ${json["save"][0]}                                    id=${term id}
    set to dictionary    ${json["save"][1]["references"]["prefLabelXl"][0]}    id=${term id}
    set to dictionary    ${json["save"][1]["references"]["prefLabelXl"][0]["type"]["graph"]}    id=${graphs_id}
    set to dictionary    ${json["save"][0]["type"]["graph"]}                   id=${graphs_id}
    set to dictionary    ${json["save"][1]["type"]["graph"]}                   id=${graphs_id}
    set to dictionary    ${json["save"][0]["properties"]["prefLabel"][0]}      value=${concept}
    set to dictionary    ${json["save"][0]["properties"]["status"][0]}         value=${status}
    set to dictionary    ${json["save"][1]["properties"]["status"][0]}         value=${status}
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}

Create collection json from file
    [Arguments]         ${file}
    ...                 ${graphs_id}
    ...                 ${collection}
    ...                 ${collection id}
    ...                 ${members}

    ${json_string}=      Get File    ${file}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json["save"][0]}                                    id=${collection id}
    set to dictionary    ${json["save"][0]["type"]["graph"]}                   id=${graphs_id}
    set to dictionary    ${json["save"][0]["properties"]["prefLabel"][0]}      value=${collection}
    FOR  ${member}  IN  @{members}
        ${new_member}=       Evaluate   {"id": "${member}","type": {"id": "Concept","graph": {"id": "${graphs_id}"},"uri": ""}}
        Append To List       ${json["save"][0]["references"]["member"]}     ${new_member}
    END
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}