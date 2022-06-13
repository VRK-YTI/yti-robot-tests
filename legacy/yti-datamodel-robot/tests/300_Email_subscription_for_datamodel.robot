*** Settings ***
Documentation     Test Suite for datamodel email subscription
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model   ${DEFAULT_DATAMODEL_PREFIX}
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
300. Add and remove email subscription for new profile
    [Documentation]    Add and remove email subscription for new profile
    [Tags]     test    300
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Add Email Subscription For Datamodel
    Select navigation menu link             Käyttäjätiedot
    Select Model Tab                        ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains                Tietomalliaineistot    
    Wait Until Page Contains Element        //*[contains(text(), "${DEFAULT_DATAMODEL_NAME}")]    
    Go Back To Data Vocabularies Frontpage

    Select model                            ${DEFAULT_DATAMODEL_NAME}
    Remove Email Subscription For Datamodel
    Select navigation menu link            Käyttäjätiedot
    Page Should Not Contain Element        ${USER_DETAILS_SUBSCRIPTIONS_TAB}
