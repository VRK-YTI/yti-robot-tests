*** Settings ***
Documentation     Test Suite for comment round email subscription
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
300. Add and remove email subscription for new comment round
    [Documentation]    Add and remove email subscription for new comment round
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Return To Comments Frontpage
    Open Tool    ${COMMENTS_ENVIRONMENT_URL}
    Search Comment Round    Testiautomaatiokierros
    Select Comment Round    Testiautomaatiokierros
    Add Email Subscription For Comment Round
    Select Navigation Menu Link    Käyttäjätiedot
    Select Tab    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Wait Until Page Contains    Kommenttien aineistot    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatiokierros")]    timeout=20
    Return To Comments Frontpage
    Search Comment Round    Testiautomaatiokierros
    Select Comment Round    Testiautomaatiokierros
    Remove Email Subscription For Comment Round
    Select Navigation Menu Link    Käyttäjätiedot
    Page Should Not Contain Element    ${USER_DETAILS_SUBSCRIPTIONS_TAB}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_IN_PROGRESS}
