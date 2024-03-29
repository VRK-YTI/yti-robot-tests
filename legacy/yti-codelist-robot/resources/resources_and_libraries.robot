*** Settings ***
Resource          ../resources/keywords/Generic_resources.robot
Resource          ../resources/keywords/Extension_resources.robot
Resource          ../resources/keywords/Terminologies_resources.robot
Resource          ../resources/keywords/CSV_creation.robot
Resource          ../resources/keywords/excel_creation.robot

Resource          ../../yti-robot-common/resources/resources_and_libraries.robot
Library           ScreenCapLibrary

*** Keywords ***
Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Generic Suite setup
    Set Selenium Timeout    ${SELENIUM_DEFAULT_TIMEOUT}
    Delete csv folder

Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Run Keyword If Test Failed      Log error window messages
    Close All Browsers

    IF  '${RECORD}' == 'True'
        Stop video recording
        Run keyword If test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}_*.webm
    END   

Test Case Setup Generic Setup
    Run Keyword If          '${RECORD}' == 'True'      Start video recording      name=${TEST NAME}
    Open Koodistot
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin user

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser user

Test Case Setup Terminologies
    [Arguments]     ${terminology}
    Create terminology ${terminology} with api
    Test Case Setup Superuser

Test Case Teardown Terminologies
    [Arguments]     @{codelists}
    Test Case Teardown Generic Teardown
    Delete terminology Testiautomaatiosanasto with api
    Remove codelist teardown    @{codelists}

Remove codelist teardown
    [Arguments]  @{codelists}
    Test Case Teardown Generic Teardown
    FOR    ${codelist}    IN    @{codelists}
        Delete codelist ${codelist} from registery test with api
    END

Remove codelist with extensions teardown
    [Arguments]  @{codelists}
    Test Case Teardown Generic Teardown
    FOR    ${codelist}    IN    @{codelists}
        Delete codelist ${codelist} from registery test with api
    END

Delete registry with code lists
    [Arguments]    ${registry}  ${api_registery}    @{codelists}
    Close all browsers
    Open koodistot
    Select superuser user

    Delete registery                ${registry}

    Wait Until Page Contains        ${Error_registry_with_codelists}    timeout=20
    Click element with wait         ${CLOSE_ERROR_MESSAGE_BTN}          timeout=20

    FOR    ${codelist}    IN    @{codelists}
        Delete codelist ${codelist} from registery ${api_registery} with api
    END
    Delete empty registry           ${registry}

Delete codelist ${codelist} if test fails
    run keyword if test failed   Delete codelist ${codelist} from registery test with api