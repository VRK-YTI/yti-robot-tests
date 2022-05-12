*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Datamodel_Resources.robot

Library           ScreenCapLibrary

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Run Keyword If Test Failed      Log error window messages
    Close All Browsers
    Run Keyword If    '${RECORD}' == 'True'      Stop video recording
    run keyword if test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}

Test Case Teardown Delete model
    [Arguments]    @{models}
    Test Case Teardown Generic Teardown

    FOR    ${model}    IN    @{models}
        Delete model ${model} with api
    END

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Setup Generic Setup
    Set Selenium Timeout    ${SELENIUM_DEFAULT_TIMEOUT}
    Run Keyword If    '${RECORD}' == 'True'      Start video recording      name=${TEST NAME}
    Open Tietomallit
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Setup ${user}
    Test Case Setup Generic Setup
    run keyword         Select ${user} user

Test Case setup create profile
    [Arguments]         ${model}    ${prefix}   ${user}=Admin
    run keyword         Test Case Setup ${user}
    Create profile ${model} with prefix ${prefix} api

Test case setup create vocabulary
    [Arguments]             ${model}    ${prefix}   ${user}=Admin
    run keyword             Test Case Setup ${user}
    Create vocabulary ${model} with prefix ${prefix} api

Test Case Setup Terminologies
    [Arguments]     ${model}    ${prefix}   ${terminology}   ${user}=Admin
    Create terminology ${terminology} with api
    Test Case setup create profile  ${model}    ${prefix}   ${user}

Test Case Teardown Terminologies
    [Arguments]    ${terminology}   @{models}
    Test Case Teardown Delete model       @{models}

    Delete terminology ${terminology} with api
