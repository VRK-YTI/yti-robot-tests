*** Settings ***
Library   SeleniumLibrary
Library   ScreenCapLibrary
Library   OperatingSystem
Library   String
Resource  ../resources/selenium keywords/models/terminology/search page.robot
Resource  ../resources/selenium keywords/models/terminology/concept page.robot
Resource  ../resources/selenium keywords/models/terminology/terminology page.robot
Resource  ../resources/selenium keywords/models/terminology/terminology_create_dialog.robot
Resource  ../resources/selenium keywords/models/eduuni.robot
Resource  ../resources/selenium keywords/models/navigation bar.robot
Resource  ../resources/api keywords/terminology_api_resouces.robot
Resource  ../resources/variables/${ENVIRONMENT}/urls.robot

*** Keywords ***
Setup test Case
    ${test case id}=    Fetch From Left     ${TEST NAME}        .
    Set default terminology variables       ${test case id}
    Set Selenium Timeout                    ${SELENIUM_DEFAULT_TIMEOUT}
    Open Browser with Settings
    IF  '${RECORD}' == 'True'
        Start video recording      name=${TEST NAME}
    END   

Teardown test Case
    Print console logs
    IF  '${RECORD}' == 'True'
        Stop video recording
        Run keyword If test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}.webm
    END   
    Close all browsers

Teardown test Case delete terminology ${terminology}
    Teardown test Case
    Delete terminology ${terminology} with api
