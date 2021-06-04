*** Settings ***
Documentation     Test Suite for code list email subscription
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          resources/Generic_resources.robot
Resource          resources/Email_subscription_resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
900. Add and remove email subscription for new code list
    [Documentation]    Add and remove email subscription for new code list
    [Tags]    regression    test    900
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Return to Koodistot frontpage
    Open Tool    ${REFERENCE_DATA_ENVIRONMENT_URL}
    Search For Code List    ${CODE_LIST_16}
    Select Code List    ${CODE_LIST_16}
    Add Email Subscription For Code List
    Select navigation menu link    Käyttäjätiedot
    Select Tab    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains    Koodistoaineistot    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=20
    Return to Koodistot frontpage
    Select Code List    ${CODE_LIST_16}
    Remove Email Subscription For Code List
    Select navigation menu link    Käyttäjätiedot
    Page Should Not Contain Element    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}
