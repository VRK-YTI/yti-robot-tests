*** Settings ***
Documentation     Test Suite for DPM extensions
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Controlled_vocabularies_resources.robot
Resource          resources/Extension_resources.robot

*** Test Cases ***
700. Create DPM Metric extension
    [Documentation]    Import new code list and create DPM Metric extension
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    ${DRAFT_STATUS}
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=30
    Click element    ${MODIFY_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}
    Input text    ${EXTENSION_NAME_INPUT}    DPM Metric laajennus
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains    DPM Metric laajennus    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}
