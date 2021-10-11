*** Settings ***
Resource          ../resources/keywords/Generic_resources.robot
Resource          ../resources/keywords/Extension_resources.robot
Resource          ../resources/keywords/Terminologies_resources.robot

Resource          ../resources/variables/test_files.robot

Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Setup Generic Setup
    Open Koodistot
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Suite Setup Generic Setup
    Log  generic suite setup

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser

Test Case Setup Terminologies
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Terminologies
    Terminology Teardown
    Remove codelist teardown    automobiili

Test Case Teardown concept for code list from Terminologies
    Terminology Teardown
    Remove codelist teardown    tutkija

Test Case Teardown Code with concept
    Terminology Teardown
    Remove codelist teardown    ${CODE_LIST_8}

Terminology Setup
    Test Case Setup Create Testiautomaatiosanasto

Terminology Teardown
    Print console logs
    Delete Testiautomaatiosanasto

Terminology Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Terminology Select user

Test Case Setup Create Testiautomaatiosanasto
    Terminology Test Case Setup
    Input Text with wait        ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}      timeout=60
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatiosanasto")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new
    ...    ELSE    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage

Remove codelist teardown
    [Arguments]  @{codelist}
    Test Case Teardown Generic Teardown
    Test Case Setup Generic Setup
    Remove list of codes    @{codelist}
    Close all browsers

Remove codelist with extensions teardown
    [Arguments]  @{codelist}
    Test Case Teardown Generic Teardown
    Test Case Setup Generic Setup
    Remove code lists with extensions    @{codelist}
    Close all browsers