*** Settings ***
Documentation     Test Suite for eDuuni login
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/eDuuni_login_resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
800. Open Reference Data tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800    prod
    [Setup]    Open Tool    ${REFERENCE_DATA_ENVIRONMENT_URL}
    Wait Until Page Contains    Etusivu    timeout=20

801. Open Comments tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800    prod
    [Setup]    Open Tool    ${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains    Etusivu    timeout=20

802. Open Data Vocabularies tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800    prod
    [Setup]    Open Tool    ${DATA_VOCABULRIES_ENVIRONMENT_URL}
    Wait Until Page Contains    Etusivu    timeout=20

803. Open Terminologies tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800    prod
    [Setup]    Open Tool    ${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait Until Page Contains    Etusivu    timeout=20

804. Open Group Management tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800    prod
    [Setup]    Open Tool    ${GROUPMANAGEMENT_ENVIRONMENT_URL}
    Wait Until Page Contains    Etusivu    timeout=20
