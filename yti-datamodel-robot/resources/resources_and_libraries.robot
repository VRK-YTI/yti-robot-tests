*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Datamodel_Resources.robot
Resource          ../resources/keywords/Terminologies_Resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Teardown Delete profile
    [Arguments]    ${profile}
    Test Case Teardown Generic Teardown

    Test Case Setup Superuser
    Delete profile          ${profile}
    Close all browsers

Test Case Teardown Delete versions
    [Arguments]    ${version}
    Test Case Teardown Generic Teardown

    Test Case Setup Superuser
    Delete Versions          ${version}
    Close all browsers

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

Terminology Teardown
    Test Case Teardown Generic Teardown
    Terminology Test Case Setup
    Delete Testiautomaatiosanasto
    Close all browsers

Test Case Setup Terminologies
    Terminology Test Case Setup
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    ${VOCABULARY_1}    timeout=60
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatiosanasto")]
    run keyword if    ${vocabulary_exists}    Delete existing terminological vocabulary and create new
    ...    ELSE    Create Testiautomaatiosanasto and import vocabulary

    Click Element with wait    //*[contains(text(), "Etusivu")]
    Create Profile              ${MODEL_1}    ${PREFIX_1}

Test Case Teardown Terminologies
    Test Case Teardown Generic Teardown

    Test Case Setup Admin
    Delete profile    ${MODEL_1}
    Terminology Teardown
