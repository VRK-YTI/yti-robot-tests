*** Settings ***
Documentation     Test Suite for creating comment round
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           Collections
Resource          resources/Generic_resources.robot
Resource          resources/Reference_Data_resources.robot
Resource          resources/Terminologies_resources.robot
Resource          resources/Data_Vocabularies_resources.robot

*** Test Cases ***
200. Create new comment round for code list
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

201. Create new comment round for terminology
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round for the terminology.
    ...    Delete terminology and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

202. Create new comment round for profile
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Delete profile and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

203. Add resources from Reference Data for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

204. Add resources from Terminologies for comment round
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round
    ...    for the terminology. Add new concepts for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Saturnus    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${RETIRED_0}
    Wait Until Page Contains    kommentti1    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Saturnus")]    timeout=20
    Click Element    //*[contains(text(), "Saturnus")]
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=20
    Wait Until Page Contains    Saturnus    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

205. Add resources from Data Vocabularies for comment round
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Add new class for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies With New Class
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Automobiili    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Wait Until Page Contains    kommentti1    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Automobiili")]    timeout=20
    Click Element    //*[contains(text(), "Automobiili")]
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Testiautomaatio    timeout=20
    Wait Until Page Contains    Automobiili    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

206. Add new resources from Reference Data for comment round after comment round has started
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, start comment round and add new code for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    True    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Add Resource For Comment Round    Testcode 57    ${COMMENT_TEXT_INPUT_1}    kommentti22    ${EMPTY}    ${EMPTY}
    Close Comment Round
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_CLOSED}

207. Send comment for Reference Data resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, select another user and send comment.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Comment On Resource    ${COMMENT_TEXT_INPUT_0}    Ehdotetaan uutta tilaa    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Wait Until Element Is Enabled    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Page Contains    Ehdotetaan uutta tilaa    timeout=20
    Wait Until Page Contains    Korvattu    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_IN_PROGRESS}

208. Remove Reference Data resources from comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for commenting, remove selected codes from comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Add Resource For Comment Round    Testcode 35    ${COMMENT_TEXT_INPUT_2}    kommentti3    ${STATUS_DDL_2}    ${VALID_2}
    Wait Until Page Contains Element    ${EDIT_COMMENTROUND}    timeout=20
    Click Element    ${EDIT_COMMENTROUND}
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Wait Until Page Contains Element    ${CONFIRMATION_BTN}    timeout=20
    Click Element    ${CONFIRMATION_BTN}
    Log To Console    First resource removed
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Wait Until Page Contains Element    ${CONFIRMATION_BTN}    timeout=20
    Click Element    ${CONFIRMATION_BTN}
    Log To Console    Second resource removed
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Wait Until Page Contains Element    ${CONFIRMATION_BTN}    timeout=20
    Click Element    ${CONFIRMATION_BTN}
    Log To Console    Third resource removed
    Wait Until Page Contains Element    ${SAVE_COMMENTROUND}    timeout=20
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Page Should Not Contain    Testcode 28
    Page Should Not Contain    Testcode 30
    Page Should Not Contain    Testcode 35
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

209. Add Reference Data resource without prefLabel to comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code without prefLabel for commenting, delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_Code_without_prefLabel}    ${CODE_LIST_8}
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    testcode40    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Wait Until Page Contains    kommentti1    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "testcode40")]    timeout=60
    Click Element    //*[contains(text(), "testcode40")]
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    testcode40    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}

210. Check comment round results
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from three users and check comment round results.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Start Comment Round
    Start Commenting
    Comment On Resource 0    Kommentti 1    ${SUPERSEDED_0}
    Comment On Resource 1    Kommentti 2    ${VALID_1}
    Send Comments
    Log To Console    First commenter's comments added
    Select User    ${TESTGROUP_USER_ID}    ${TESTGROUP_USER_NAME}
    Start Commenting
    Comment On Resource 0    Kommentti 3    ${INVALID_0}
    Comment On Resource 1    Kommentti 4    ${VALID_1}
    Send Comments
    Log To Console    Second commenter's comments added
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Start Commenting
    Comment On Resource 0    Kommentti 5    ${INVALID_0}
    Comment On Resource 1    Kommentti 6    ${VALID_1}
    Send Comments
    Log To Console    Third commenter's comments added
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Close Comment Round
    Wait Until Element Is Enabled    ${RESOURCES_TAB}    timeout=60
    Click Element    ${RESOURCES_TAB}
    Wait Until Page Contains    Korvattu:    timeout=20
    Wait Until Page Contains    (33.3 %)    timeout=20
    Wait Until Page Contains    Virheellinen:    timeout=20
    Wait Until Page Contains    (66.7 %)    timeout=20
    Wait Until Page Contains    Voimassa oleva:    timeout=20
    Wait Until Page Contains    (100.0 %)    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_CLOSED}

211. Send inline comment for resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from two users and inline comments from one user.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Start Commenting
    Comment On Resource 0    Kommentti 1    ${SUPERSEDED_0}
    Send Comments
    Log To Console    First commenter's comments added
    Select User    ${TESTGROUP_USER_ID}    ${TESTGROUP_USER_NAME}
    Start Commenting
    Comment On Resource 0    Kommentti 3    ${INVALID_0}
    Send Comments
    Log To Console    Second commenter's comments added
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Wait Until Element Is Visible    ${RESOURCES_TAB}    timeout=30
    Click Element    ${RESOURCES_TAB}
    Wait Until Element Is Visible    ${VIEW_COMMENT_BUBLE_0}    timeout=30
    Click Element    ${VIEW_COMMENT_BUBLE_0}
    Wait Until Page Contains Element    //app-hierarchical-comment    timeout=20
    ${elements} =    Get WebElements    //app-hierarchical-comment
    ${element} =    Get From List    ${elements}    0
    ${element_1} =    Get From List    ${elements}    1
    ${elementId} =    Set Variable    ${element.get_attribute('id')}
    ${elementId_1} =    Set Variable    ${element_1.get_attribute('id')}
    Send Inline Comment For Comment Thread    ${elementId}    Inline kommentti 1
    Log To Console    First inline comment added
    Send Inline Comment For Comment Thread    ${elementId_1}    Inline kommentti 2
    Log To Console    Second inline comment added
    Wait Until Page Contains    Inline kommentti 1    timeout=20
    Wait Until Page Contains    Inline kommentti 2    timeout=20
    Capture Page Screenshot
    Wait Until Element Is Visible    ${CLOSE_INLINE_COMMENT_0_BTN}    timeout=30
    Click Element    ${CLOSE_INLINE_COMMENT_0_BTN}
    Page Should Not Contain    Inline kommentti 1    timeout=20
    Page Should Not Contain    Inline kommentti 2    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_IN_PROGRESS}

212. Create new suggestion for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Create new suggestion, start comment round and create another new suggestion for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Maximize Browser Window
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    True    True
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Create New Suggestion    Ehdotus1    Kuvaus1
    Start Comment Round
    Create New Suggestion    Ehdotus2    Kuvaus2
    Close Comment Round
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMENT_ROUND_STATE_CLOSED}

213. Check URI links
    [Documentation]    Check that comment round URI link is working correctly
    [Tags]    regression    kommentit    test    100
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}    ${CODE_LIST_8}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    ${uri}=    Get Text    //*[contains(text(), "http://uri.suomi.fi/comments/round/")]
    Log    Comment round URI is ${uri}
    Open Comments
    Set Selenium Speed    ${SELENIUM_SPEED}
    GO To    ${uri}
    Wait Until Page Contains    Testiautomaatiokierros    timeout=30
    Log To Console    URI link opened successfully
    Sleep    2
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8}    Testiautomaatiokierros    ${COMMNET_ROUND_STATE_INCOMPLETE}
