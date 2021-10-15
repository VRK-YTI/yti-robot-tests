*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Data_Vocabularies_resources.robot
Resource          ../resources/keywords/Generic_resources.robot
Resource          ../resources/keywords/Reference_Data_resources.robot
Resource          ../resources/keywords/Terminologies_resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Suite Setup Generic Setup
    Log  Genericc suite setup

Test Case Setup Generic Setup
    Open Comments
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser