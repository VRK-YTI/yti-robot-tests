*** Settings ***
Resource          ../resources/keywords/Generic_resources.robot
Resource          ../resources/keywords/Extension_resources.robot
Resource          ../resources/keywords/Terminologies_resources.robot

Resource          ../resources/variables/test_files.robot

Resource          ../../yti-robot-common/resources/resources_and_libraries.robot
Library           ScreenCapLibrary

*** Keywords ***
Test Case Suite Teardown Generic Teardown
    Close All Browsers

Test Case Teardown Generic Teardown
    Run keyword and ignore error    Print console logs
    Close All Browsers
    Run Keyword If                  '${RECORD}' == 'True'      Stop video recording
    run keyword if test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}

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
