*** Settings ***
Library               RequestsLibrary
Resource              common_api_resources.robot

*** Variables ***
${TERMINOLOGY_API_BASE}=                ${TERMINOLOGIES_URL}terminology-api/v2
${DELETE_TERMINOLOGY_API_POINT}=        ${TERMINOLOGY_API_BASE}/terminology
${CREATE_TERMINOLOGY_API_POINT}=        ${TERMINOLOGY_API_BASE}/terminology
${CREATE_TERMI_CONCEPT_API_POINT}=      ${TERMINOLOGY_API_BASE}/concept
${CREATE_TERMI_COLLECTION_API_POINT}=   ${TERMINOLOGY_API_BASE}/collection
${SEARCH_TERMINOLOGIES_API_POINT}=      ${TERMINOLOGY_API_BASE}/frontend/search-terminologies

${DOMAIN_DEMOCRACY}=                    P8
${DOMAIN_HOUSING}=                      P1

${ORGANIZATION_AUTOMATION}=             918448ba-3fc1-4908-aae7-096c8773ca8b
${ORGANIZATION_TEST}=                   9a7362ab-0938-462c-a645-abae08525715

${CONCEPT_ID_DEFAULT}=                  concept-1
${COLLECTION_ID_DEFAULT}=               collection-1

${DRAFT}=                   DRAFT
${VALID}=                   VALID
${SUPERSEDED}=              SUPERSEDED
${RETIRED}=                 RETIRED
${INCOMPLETE}=              INCOMPLETE


*** Keywords ***
Find terminology prefix for ${terminology}
    ${headers}=     Create authentication header
    ${response}=    Get    ${SEARCH_TERMINOLOGIES_API_POINT}    headers=${headers}    params=query=${terminology}&pageSize=50
    ${prefix}=      find prefix from terminology search    ${response.json()}    ${terminology}
    [Return]        ${prefix}

Delete terminology ${terminology} with api
    ${headers}=     Create authentication header
    ${prefix}=      Find terminology prefix for ${terminology}
    ${response}=    Delete    ${DELETE_TERMINOLOGY_API_POINT}/${prefix}    headers=${headers}
    [Return]        ${response}

Create terminology with api
    [Arguments]     ${terminology}
    ...             ${status}=${DRAFT}
    ...             ${domain}=${DOMAIN_HOUSING}
    ...             ${organization}=${ORGANIZATION_AUTOMATION}
    ...             ${prefix}=${terminology}
    ${headers}=     Create authentication header
    ${json}=        build terminology json    ${prefix}    ${terminology}    ${status}    ${organization}    ${domain}
    ${response}=    Post    ${CREATE_TERMINOLOGY_API_POINT}    headers=${headers}    data=${json}
    [Return]        ${response}

Create terminology concept with api
    [Arguments]     ${terminology}
    ...             ${concept}
    ...             ${concept id}=${CONCEPT_ID_DEFAULT}
    ...             ${status}=${DRAFT}
    ...             ${term id}=${EMPTY}
    ${prefix}=      Find terminology prefix for ${terminology}
    ${headers}=     Create authentication header
    ${json}=        build concept json    ${concept id}    ${concept}    ${status}
    ${response}=    Post    ${CREATE_TERMI_CONCEPT_API_POINT}/${prefix}    headers=${headers}    data=${json}
    [Return]        ${response}

Create terminology collection with api
    [Arguments]     ${terminology}
    ...             ${collection}
    ...             ${collection id}
    ...             ${members}
    ${prefix}=      Find terminology prefix for ${terminology}
    ${headers}=     Create authentication header
    ${json}=        build collection json    ${collection id}    ${collection}    ${members}
    ${response}=    Post    ${CREATE_TERMI_COLLECTION_API_POINT}/${prefix}    headers=${headers}    data=${json}
    [Return]        ${response}
