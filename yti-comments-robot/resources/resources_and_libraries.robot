*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Generic_resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***

*** Keywords ***
Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Setup Generic Setup
    Open Comments
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin user

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser user

Test Case Setup Reference Data
    [Arguments]    ${codelist}
    Create codelist from Excel ${codelist} to test with api
    Test Case Setup Superuser

Test Case Teardown Reference Data
    [Arguments]  ${codelist}  ${comment_round_name}
    Test Case Teardown Generic Teardown
    Delete codelist ${codelist} from registery test with api
    Delete comment ${comment_round_name} with api

Test Case Setup Terminology
    [Arguments]     ${terminology}
    Create terminology ${terminology} with api
    Test Case Setup Superuser

Test Case Teardown Terminology
    [Arguments]    ${comment_round_name}  ${terminology}
    Test Case Teardown Generic Teardown

    Delete terminology ${terminology} with api
    Delete comment ${comment_round_name} with api

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
    [Arguments]    ${comment_round_name}
    Test Case Teardown Generic Teardown

    Delete model cmts_autom with api
    Delete comment ${comment_round_name} with api
