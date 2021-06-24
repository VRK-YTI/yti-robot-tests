*** Settings ***
Documentation     Test Suite for datamodel versioning
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
500. Create profile and create new version of profile
    [Documentation]    Create profile and resources and create new version of profile.
    [Tags]    regression    tietomallit    test    500
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Profile    ${MODEL_1}    ${PREFIX_1}
    Select model    ${MODEL_1}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Create New Version    ${PREFIX_4}
    Log To Console    ${ENVIRONMENT_IDENTIFIER}
    ${isDev}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "- ${ENVIRONMENT_IDENTIFIER}")]
    Log To Console    ${isDev}
    Run Keyword If    ${isDev}    Go To    http://uri.suomi.fi/datamodel/ns/${PREFIX_4}${DEV_suffix}
    ...    ELSE    Go To    http://uri.suomi.fi/datamodel/ns/${PREFIX_4}${TEST_suffix}
    Wait Until Page Contains    Testiautomaatiomalli    timeout=30
    Select Model Tab    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/aeghi    timeout=30
    Wait Until Page Contains    Aiempi versio    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/autom    timeout=30
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete Versions    ${MODEL_1}
