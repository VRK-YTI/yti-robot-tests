*** Settings ***
Documentation     Test Suite for datamodel versioning
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model    ${PREFIX_1}  ${PREFIX_4}
Test Setup        Test Case setup create profile     ${MODEL_1}   ${PREFIX_1}
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
500. Create profile and create new version of profile
    [Documentation]    Create profile and resources and create new version of profile.
    [Tags]    regression    tietomallit    test    500
    Select model        ${MODEL_1}

    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab                  ${ATTRIBUTE_TAB}
    Create New Attribute        Testiattribuutti
    Select Tab                  ${ASSOCIATION_TAB}
    Create new association      Testiassosiaatio
    Create New Version          ${PREFIX_4}

    Go To    http://uri.suomi.fi/datamodel/ns/${PREFIX_4}?env=${ENVIRONMENT_IDENTIFIER}
    Wait Until Page Contains    Testiautomaatiomalli    timeout=30

    Select Model Tab            ${MODEL_DETAILS_TAB}
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/aeghi    timeout=30
    Wait Until Page Contains    Aiempi versio    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/autom    timeout=30
