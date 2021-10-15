*** Settings ***
Documentation     Test Suite for datamodel email subscription
Suite Setup       Test Case Suite Setup Generic Setup
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete profile    ${MODEL_1}
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
300. Add and remove email subscription for new profile
    [Documentation]    Add and remove email subscription for new profile
    [Tags]    regression    test    300
    Create Profile    ${MODEL_1}    ${PREFIX_1}

    Select model                    Testiautomaatiomalli
    Add Email Subscription For Datamodel
    Select navigation menu link     Käyttäjätiedot
    Select Model Tab                ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains        Tietomalliaineistot    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatiomalli")]    timeout=20
    Go Back To Data Vocabularies Frontpage

    Select model    Testiautomaatiomalli
    Remove Email Subscription For Datamodel
    Select navigation menu link    Käyttäjätiedot
    Page Should Not Contain Element    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
