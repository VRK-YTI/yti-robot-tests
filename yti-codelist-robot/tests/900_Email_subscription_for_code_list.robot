*** Settings ***
Documentation     Test Suite for code list email subscription
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Remove codelist teardown      ${CODE_LIST_16}

Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}        id=select_lang_dropdown
${CODELIST}                     900_testing_code_list

*** Test Cases ***
900. Add and remove email subscription for new code list
    [Documentation]    Add and remove email subscription for new code list
    [Tags]    test    900
    ${excel_file_path}=    Create excel Code list with 30 Codes
    Upload codelist in Excel format     ${excel_file_path}    ${CODE_LIST_16}

    Return to Koodistot frontpage
    Search For Code List                ${CODE_LIST_16}
    Select Code List                    ${CODE_LIST_16}
    Add Email Subscription For Code List
    Select navigation menu link         Käyttäjätiedot
    Select Tab                          ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains            Koodistoaineistot                           timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=20

    Return to Koodistot frontpage
    Select Code List                    ${CODE_LIST_16}
    Remove Email Subscription For Code List
    Select navigation menu link         Käyttäjätiedot
    Page Should Not Contain Element     ${USER_DETAILS_SUBSCRIPTIONS_TAB}
