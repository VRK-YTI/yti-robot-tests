*** Settings ***
Documentation     Test Suite for terminology email subscription
Suite Setup       Test Case Generic Suite setup
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${IMPERSONATE_USER_DROPDOWN}=  fakeable_user_dropdown
${NAVIGATION_MENU_DDL}    id=nav_item_dropdown_link

*** Test Cases ***
400. Add and remove email subscription for new terminology
    [Documentation]    Add and remove email subscription for new terminology
    [Tags]     test    400
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Open Tool    ${TERMINOLOGIES_ENVIRONMENT_URL}
    Select Dictionary    ${VOCABULARY_1}
    Add Email Subscription For Terminology
    Select navigation menu link    Käyttäjätiedot
    Select Tab    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains    Sanastoaineistot    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=20
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Remove Email Subscription For Terminology
    Select navigation menu link    Käyttäjätiedot
    Page Should Not Contain Element    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}
