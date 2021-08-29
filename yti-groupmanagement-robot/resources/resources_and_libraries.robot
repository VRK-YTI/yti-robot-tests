*** Settings ***
Resource          ../resources/keywords/User_right_management_Resources.robot

Resource          ../resources/variables/test_files.robot

Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers
