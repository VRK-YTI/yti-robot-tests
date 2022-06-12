*** Settings ***
Documentation     Test Suite for datamodel versioning
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model   ${DEFAULT_DATAMODEL_PREFIX}_1  ${DEFAULT_DATAMODEL_PREFIX}_2
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
500. Create profile and create new version of profile
    [Documentation]    Create profile and resources and create new version of profile.
    [Tags]    regression    tietomallit    test    500
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX}_1 api
    Select model   ${DEFAULT_DATAMODEL_NAME}

    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab                  ${ATTRIBUTE_TAB}
    Create New Attribute        Testiattribuutti
    Select Tab                  ${ASSOCIATION_TAB}
    Create new association      Testiassosiaatio
    Create New Version          ${DEFAULT_DATAMODEL_PREFIX}_2

    Go To                       http://uri.suomi.fi/datamodel/ns/${DEFAULT_DATAMODEL_PREFIX}_2?env=${ENVIRONMENT_IDENTIFIER}
    Wait Until Page Contains    ${DEFAULT_DATAMODEL_NAME}

    Select Model Tab            ${MODEL_DETAILS_TAB}
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/${DEFAULT_DATAMODEL_PREFIX}_2
    Wait Until Page Contains    Aiempi versio
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/${DEFAULT_DATAMODEL_PREFIX}_1
