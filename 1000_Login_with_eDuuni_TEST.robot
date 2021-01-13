*** Settings ***
Documentation     Test Suite for eDuuni login to TEST Environment
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/eDuuni_login_resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
1000. Open Reference Data tool with eDuuni login in TEST env
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    1000    test_control
    [Setup]    Open Tool    ${REFERENCE_DATA_ENVIRONMENT_URL_TEST}
    Wait Until Page Contains    Etusivu    timeout=30
    Wait Until Page Contains    Hae koodistoja    timeout=30
    Wait Until Page Contains    Rajaa tietoalueella    timeout=30

1001. Open Comments tool with eDuuni login in TEST env
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    1000    test_control
    [Setup]    Open Tool    ${COMMENTS_ENVIRONMENT_URL_TEST}
    Wait Until Page Contains    Etusivu    timeout=30
    Wait Until Page Contains    Rajaa hakutuloksia    timeout=30

1002. Open Data Vocabularies tool with eDuuni login in TEST env
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    1000    test_control
    [Setup]    Open Tool    ${DATA_VOCABULRIES_ENVIRONMENT_URL_TEST}
    Wait Until Page Contains    Etusivu    timeout=30
    Wait Until Page Contains    Hae tietomalleja    timeout=30
    Wait Until Page Contains    Rajaa tietoalueella    timeout=30

1003. Open Terminologies tool with eDuuni login in TEST env
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    1000    test_control
    [Setup]    Open Tool    ${TERMINOLOGIES_ENVIRONMENT_URL_TEST}
    Wait Until Page Contains    Etusivu    timeout=30
    Wait Until Page Contains    Hae sanastoja    timeout=30
    Wait Until Page Contains    Rajaa tietoalueella    timeout=30

1004. Open Group Management tool with eDuuni login in TEST env
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    1000    test_control
    [Setup]    Open Tool    ${GROUPMANAGEMENT_ENVIRONMENT_URL_TEST}
    Wait Until Page Contains    Etusivu    timeout=30
    Wait Until Page Contains    Organisaatiot    timeout=30
