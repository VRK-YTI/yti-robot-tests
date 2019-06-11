*** Settings ***
Documentation     Test Suite for eDuuni login
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/eDuuni_login_resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
800. Open tool with eDuuni login
    [Documentation]    Verifies that tool frontpage is opened correctly with eDuuni login.
    [Tags]    800
    [Setup]    Test Case Setup
    Wait Until Page Contains    Etusivu    timeout=20
