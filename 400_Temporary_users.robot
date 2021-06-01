*** Settings ***
Documentation     Test Suite for comment round temporary users
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           ImapLibrary
Resource          resources/Reference_Data_resources.robot
Resource          resources/Generic_resources.robot
Resource          resources/Mail_opening_resources.robot

*** Test Cases ***
400. Add temporary user for comment round and check email notification
    [Documentation]    Add temporary user for comment round and check email notification
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Select Tab    ${INFO_TAB}
    Edit Comment Round
    Add Temporary Users    Yti    Test    ${TEST_TEMPUSER_EMAIL}
    Sleep    2
    Save Comment Round
    Sleep    1
    Start Comment Round
    Sleep    15
    Check Mailbox
    Wait Until Page Contains    Testiautomaatiokierros    timeout=30
    Comment On Resource    ${COMMENT_TEXT_INPUT_0}    Ehdotetaan uutta tilaa    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Sleep    5
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_IN_PROGRESS}


