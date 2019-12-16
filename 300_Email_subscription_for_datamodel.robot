*** Settings ***
Documentation     Test Suite for datamodel email subscription
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          resources/Datamodel_Resources.robot
Resource          resources/Email_subscription_resources.robot

*** Test Cases ***
300. Add and remove email subscription for new profile
    [Documentation]    Add and remove email subscription for new profile
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go Back To Data Vocabularies Frontpage
    Open Tool    ${DATA_VOCABULRIES_ENVIRONMENT_URL}
    Select model    Testiautomaatiomalli
    Add Email Subscription For Datamodel
    Select navigation menu link    Käyttäjätiedot
    Select Model Tab    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains    Tietomalliaineistot    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatiomalli")]    timeout=20
    Go Back To Data Vocabularies Frontpage
    Select model    Testiautomaatiomalli
    Remove Email Subscription For Datamodel
    Select navigation menu link    Käyttäjätiedot
    Page Should Not Contain Element    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_1}
