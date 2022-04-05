*** Settings ***
Resource          ../resources/keywords/User_right_management_Resources.robot
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Setup admin
    Open RHP
    Set Selenium Speed  ${SELENIUM_SPEED}
    Select admin user