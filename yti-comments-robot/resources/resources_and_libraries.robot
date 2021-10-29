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

Test Case Setup Reference Data
    [Arguments]    ${codelist}    ${codelist_name}
    Reference Data Setup    ${codelist}    ${codelist_name}
    Test Case Setup Superuser

Test Case Setup Reference Data And Code Without prefLabel
    Reference Data Setup And Code Without prefLabel
    Test Case Setup Superuser

Test Case Teardown Reference Data
    [Arguments]    ${codelist_name}    ${comment_round_name}    ${state}
    Test Case Teardown Generic Teardown

    Reference Data Test Case Setup Superuser
    Reference Data Teardown    ${codelist_name}

    Test Case Setup Superuser
    Delete Comment Round    ${comment_round_name}    ${state}
    Close all browsers

Test Case Setup Terminology
    Test Case Setup Create Terminology
    Close all browsers

    Test Case Setup Superuser

Test Case Teardown Terminology
    [Arguments]    ${comment_round_name}    ${state}
    Test Case Teardown Generic Teardown

    Terminology Test Case Setup
    Delete Terminology      ${VOCABULARY_1}
    Close all browsers

    Test Case Setup Superuser
    Delete Comment Round    ${comment_round_name}    ${state}
    Close all browsers

Test Case Setup Data Vocabularies
    Data Vocabularies Setup
    Test Case Setup Superuser

Test Case Setup Data Vocabularies With New Class
    Data Vocabularies Setup With New Class
    Test Case Setup Superuser

Test Case Teardown Data Vocabularies
    [Arguments]    ${comment_round_name}    ${state}
    Test Case Teardown Generic Teardown

    Delete model ${PREFIX_1} with api

    Test Case Setup Superuser
    Delete Comment Round    ${comment_round_name}    ${state}
    Close all browsers

Terminology Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select admin

Test Case Setup Create Terminology
    Terminology Test Case Setup
    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage