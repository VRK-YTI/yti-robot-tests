*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot
Resource          ../resources/keywords/Terminology_Resources.robot

Resource          ../resources/variables/test_files.robot

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test case teardown delete terminology
    [Arguments]  ${terminology}
    Test Case Teardown Generic Teardown
    Test Case Setup superuser
    Delete Terminology      ${terminology}
    Close All Browsers

Test case teardown delete Terminologies
    [Arguments]    @{terminology_items}
    Test Case Teardown Generic Teardown
    Test Case Setup superuser
    Delete Terminologies      @{terminology_items}
    Close All Browsers

Test case teardown delete Terminological Dictionary
    [Arguments]    ${terminology}
    Test Case Teardown Generic Teardown
    Test Case Setup superuser
    Delete Terminological Dictionary      @{terminology}
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Setup admin
    Open sanastot
    Set Selenium Speed  ${SELENIUM_SPEED}
    Select admin user

Test Case Setup superuser
    Open sanastot
    Set Selenium Speed  ${SELENIUM_SPEED}
    Select superuser user