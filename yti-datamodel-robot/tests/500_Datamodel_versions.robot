*** Settings ***
Documentation     Test Suite for datamodel versioning
Suite Setup       Test Case Suite Setup Generic Setup
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model    ${PREFIX_1}  ${PREFIX_4}
Test Setup        Test Case Setup Admin
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
500. Create profile and create new version of profile
    [Documentation]    Create profile and resources and create new version of profile.
    [Tags]    regression    tietomallit    test    500
    Create Profile      ${MODEL_1}    ${PREFIX_1}
    Select model        ${MODEL_1}

    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab                  ${ATTRIBUTE_TAB}
    Create New Attribute        Testiattribuutti
    Select Tab                  ${ASSOCIATION_TAB}
    Create new association      Testiassosiaatio
    Create New Version          ${PREFIX_4}

    ${isDev}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "- ${ENVIRONMENT_IDENTIFIER}")]
    Run Keyword If    ${isDev}    Go To    http://uri.suomi.fi/datamodel/ns/${PREFIX_4}${DEV_suffix}
    ...    ELSE    Go To    http://uri.suomi.fi/datamodel/ns/${PREFIX_4}${TEST_suffix}
    Wait Until Page Contains    Testiautomaatiomalli    timeout=30

    Select Model Tab            ${MODEL_DETAILS_TAB}
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/aeghi    timeout=30
    Wait Until Page Contains    Aiempi versio    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/autom    timeout=30
