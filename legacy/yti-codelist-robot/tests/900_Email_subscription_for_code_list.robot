*** Settings ***
Documentation     Test Suite for code list email subscription
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}        id=select_lang_dropdown

*** Test Cases ***
900. Add and remove email subscription for new code list
    [Documentation]    Add and remove email subscription for new code list
    [Tags]    test    900
    Set default codelist variables    900

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist in Excel format     ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Return to Koodistot frontpage
    Search For Code List                ${DEFAULT_PREFLABEL_SCHEME}
    Select Code List                    ${DEFAULT_PREFLABEL_SCHEME}
    Add Email Subscription For Code List
    Select navigation menu link         Käyttäjätiedot
    Select Tab                          ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains            Koodistoaineistot                          
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]

    Return to Koodistot frontpage
    Select Code List                    ${DEFAULT_PREFLABEL_SCHEME}
    Remove Email Subscription For Code List
    Select navigation menu link         Käyttäjätiedot
    Page Should Not Contain Element     ${USER_DETAILS_SUBSCRIPTIONS_TAB}
