*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot
Resource          ../resources/keywords/Terminology_Resources.robot
Resource          ../resources/keywords/CSV_creation.robot

Resource          ../resources/variables/test_files.robot

*** Keywords ***
Test Case Generic Suite setup
    Delete csv folder

Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Run Keyword If Test Failed      Log error window messages
    Close All Browsers

Test case teardown delete terminology
    [Arguments]  ${terminology}
    Test Case Teardown Generic Teardown
    Delete terminology ${terminology} with api

Test case teardown delete Terminologies
    [Arguments]    @{terminology_items}
    Test Case Teardown Generic Teardown
    FOR    ${terminology_item}    IN    @{terminology_items}
        Delete terminology ${terminology_item} with api
    END

Test case teardown delete Terminological Dictionary
    [Arguments]    ${terminology}
    Test Case Teardown Generic Teardown
    FOR    ${terminology_item}    IN    @{terminology_items}
        Delete terminology ${terminology_item} with api
    END

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