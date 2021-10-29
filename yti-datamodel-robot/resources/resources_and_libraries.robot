*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot
#Resource          ../../yti-codelist-robot/resources/keywords/Terminologies_resources.robot

Resource          ../resources/keywords/Datamodel_Resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Teardown Delete model
    [Arguments]    @{models}
    Test Case Teardown Generic Teardown

    FOR    ${model}    IN    @{models}
        Delete model ${model} with api
    END

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Suite Setup Generic Setup
    Log  generic suite setup

Test Case Setup Generic Setup
    Open Tietomallit
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Setup datamodel user
    Test Case Setup Generic Setup
    Select datamodel user

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser

Terminology Test Case Setup
    Open sanastot
    Set Selenium Speed          ${SELENIUM_SPEED}
    Select admin

Test Case Setup Terminologies
    Terminology Test Case Setup
    Create Testiautomaatiosanasto and import vocabulary

Test Case Teardown Terminologies
    [Arguments]    @{models}
    Test Case Teardown Delete model       @{models}

    #Terminology Test Case Setup
    #Delete Testiautomaatiosanasto
    #Close all browsers
    #Delete terminology 111 with api
