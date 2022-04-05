*** Settings ***
Library   SeleniumLibrary
Library   ScreenCapLibrary
Library   OperatingSystem
Library   String
Resource  resources\\selenium keywords\\models\\terminology\\search page.robot
Resource  resources\\selenium keywords\\models\\eduuni.robot
Resource  resources\\api keywords\\terminology_api_resouces.robot
Resource  resources\\variables\\${ENVIRONMENT}\\urls.robot

*** Keywords ***
Setup test Case
    ${test case id}=    Fetch From Left     ${TEST NAME}        .
    Set default terminology variables       ${test case id}
    Set Selenium Timeout                    ${SELENIUM_DEFAULT_TIMEOUT}
    Open Browser with Settings
    Run Keyword If          '${RECORD}' == 'True'      Start video recording      name=${TEST NAME}

Teardown test Case
    Run keyword and ignore error    Print console logs
    Run Keyword If                  '${RECORD}' == 'True'      Stop video recording
    Run keyword If test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}
    Close all browsers

Teardown test Case delete terminology
    [Arguments]  ${terminology}
    Teardown test Case
    Delete terminology ${terminology} with api
