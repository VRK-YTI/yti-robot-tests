*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

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
    [Arguments]     ${terminology}
    #Create terminology ${terminology} with api
    Test Case Setup Create Terminology
    Close all browsers

    Test Case Setup Superuser

Test Case Teardown Terminology
    [Arguments]    ${comment_round_name}    ${state}  ${terminology}
    Test Case Teardown Generic Teardown

    #Delete terminology ${terminology} with api
    Open Sanastot
    Select admin
    Delete Terminology      ${VOCABULARY_1}
    Close all browsers

    Test Case Setup Superuser
    Delete Comment Round    ${comment_round_name}    ${state}
    Close all browsers

Test Case Setup Data Vocabularies
    [Arguments]    ${model}     ${prefix}
    Create profile ${model} with prefix ${prefix} api
    Test Case Setup Superuser

Test Case Setup Data Vocabularies With New Class
    [Arguments]    ${model}     ${model_prefix}   ${class_prefix}
    Create profile ${model} with prefix ${model_prefix} api
    Add class ${class_prefix} to model ${model_prefix}

    Test Case Setup Superuser

Test Case Teardown Data Vocabularies
    [Arguments]    ${comment_round_name}    ${state}
    Test Case Teardown Generic Teardown

    Delete model cmts_autom with api

    Test Case Setup Superuser
    Delete Comment Round    ${comment_round_name}    ${state}
    Close all browsers

Test Case Setup Create Terminology
    Open Sanastot
    Select admin
    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage