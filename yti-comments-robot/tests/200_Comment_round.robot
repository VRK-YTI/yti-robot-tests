*** Settings ***
Documentation     Test Suite for creating comment round
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup admin
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
200. Create new comment round for code list
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

201. Create new comment round for terminology
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round for the terminology.
    ...    Delete terminology and comment round.
    [Tags]      test    200
    [Setup]    Test Case Setup Terminology      ${VOCABULARY_1}
    Create Comment Round    ${TERMINOLOGIES_TOOL}    ${VOCABULARY_1}    Testiautomaatiokierros    kuvaus    False    False
    [Teardown]  Test Case Teardown Terminology    Testiautomaatiokierros       ${VOCABULARY_1}

202. Create new comment round for profile
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Delete profile and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies        Testiautomaatio     cmts_autom
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False    False
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

203. Add resources from Reference Data for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

204. Add resources from Terminologies for comment round
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round
    ...    for the terminology. Add new concepts for comment round and delete code list and comment round.
    [Tags]      test    200
    [Setup]    Test Case Setup Terminology      ${VOCABULARY_1}
    Create Comment Round    ${TERMINOLOGIES_TOOL}    ${VOCABULARY_1}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Saturnus    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${RETIRED_0}
    Wait Until Page Contains    kommentti1    timeout=20
    Click Element with wait    //*[contains(text(), "Saturnus")]

    Switch window with wait     NEW
    Wait Until Page Contains    ${VOCABULARY_1}                 timeout=20
    Wait Until Page Contains    Saturnus                        timeout=20
    Close Window

    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros    ${VOCABULARY_1}

205. Add resources from Data Vocabularies for comment round
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Add new class for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies With New Class     Testiautomaatio     cmts_autom      Automobiili
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Automobiili    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Wait Until Page Contains    kommentti1    timeout=20

    Click Element with wait    //*[contains(text(), "Automobiili")]

    Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Testiautomaatio    timeout=20
    Wait Until Page Contains    Automobiili    timeout=20
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

206. Add new resources from Reference Data for comment round after comment round has started
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, start comment round and add new code for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    True    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Add Resource For Comment Round    Testcode 57    ${COMMENT_TEXT_INPUT_1}    kommentti22    ${EMPTY}    ${EMPTY}
    Close Comment Round

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

207. Send comment for Reference Data resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, select another user and send comment.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round

    Close all browsers
    Open comments
    Select admin user
    Search and select comment round    Testiautomaatiokierros
    Comment On Resource    ${COMMENT_TEXT_INPUT_0}    Ehdotetaan uutta tilaa    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Click Element with wait    ${COMMENTS_TAB}
    Wait Until Page Contains    Ehdotetaan uutta tilaa    timeout=20
    Wait Until Page Contains    Korvattu    timeout=20

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

208. Remove Reference Data resources from comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for commenting, remove selected codes from comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Add Resource For Comment Round    Testcode 35    ${COMMENT_TEXT_INPUT_2}    kommentti3    ${STATUS_DDL_2}    ${VALID_2}

    Click Element with wait    ${EDIT_COMMENTROUND}
    Click Element with wait    ${REMOVE_COMMENT_THREAD_0_BTN}
    Click Element with wait    ${CONFIRMATION_BTN}
    Click Element with wait    ${REMOVE_COMMENT_THREAD_0_BTN}
    Click Element with wait    ${CONFIRMATION_BTN}
    Click Element with wait    ${REMOVE_COMMENT_THREAD_0_BTN}
    Click Element with wait    ${CONFIRMATION_BTN}
    Click Element with wait    ${SAVE_COMMENTROUND}

    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Page Should Not Contain    Testcode 28
    Page Should Not Contain    Testcode 30
    Page Should Not Contain    Testcode 35

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

209. Add Reference Data resource without prefLabel to comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code without prefLabel for commenting, delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_Code_without_prefLabel}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    testcode40    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Wait Until Page Contains    kommentti1    timeout=20

    Click Element with wait    //*[contains(text(), "testcode40")]    timeout=60
    Switch window with wait    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    testcode40    timeout=20
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

210. Check comment round results
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from three users and check comment round results.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}     Admin
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Start Comment Round
    Start Commenting
    Comment On Resource 0    Kommentti 1    ${SUPERSEDED_0}
    Comment On Resource 1    Kommentti 2    ${VALID_1}
    Send Comments

    Close all browsers
    Open comments
    Select test user
    Search and select comment round    Testiautomaatiokierros
    Start Commenting
    Comment On Resource 0    Kommentti 3    ${INVALID_0}
    Comment On Resource 1    Kommentti 4    ${VALID_1}
    Send Comments

    Close all browsers
    Open comments
    Select superuser user
    Search and select comment round    Testiautomaatiokierros
    Start Commenting
    Comment On Resource 0    Kommentti 5    ${INVALID_0}
    Comment On Resource 1    Kommentti 6    ${VALID_1}
    Send Comments
    Log To Console    Third commenter's comments added
    Select admin user
    Close Comment Round

    Click Element with wait   ${RESOURCES_TAB}    timeout=60
    Wait Until Page Contains    Korvattu:    timeout=20
    Wait Until Page Contains    (33.3 %)    timeout=20
    Wait Until Page Contains    Virheellinen:    timeout=20
    Wait Until Page Contains    (66.7 %)    timeout=20
    Wait Until Page Contains    Voimassa oleva:    timeout=20
    Wait Until Page Contains    (100.0 %)    timeout=20

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

211. Send inline comment for resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from two users and inline comments from one user.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Start Commenting
    Comment On Resource 0    Kommentti 1    ${SUPERSEDED_0}
    Send Comments

    Close all browsers
    Open comments
    Select test user
    Search and select comment round    Testiautomaatiokierros
    Start Commenting
    Comment On Resource 0    Kommentti 3    ${INVALID_0}
    Send Comments

    Close all browsers
    Open comments
    Select admin user
    Search and select comment round    Testiautomaatiokierros
    Start Commenting
    Click Element with wait    ${RESOURCES_TAB}
    Click Element with wait    ${VIEW_COMMENT_BUBLE_0}

    Wait Until Page Contains Element    //app-hierarchical-comment    timeout=20
    ${elements} =    Get WebElements    //app-hierarchical-comment
    ${element} =    Get From List    ${elements}    0
    ${element_1} =    Get From List    ${elements}    1
    ${elementId} =    Set Variable    ${element.get_attribute('id')}
    ${elementId_1} =    Set Variable    ${element_1.get_attribute('id')}

    Send Inline Comment For Comment Thread    ${elementId}    Inline kommentti 1
    Send Inline Comment For Comment Thread    ${elementId_1}    Inline kommentti 2
    Wait Until Page Contains    Inline kommentti 1    timeout=20
    Wait Until Page Contains    Inline kommentti 2    timeout=20

    Click Element with wait    ${CLOSE_INLINE_COMMENT_0_BTN}
    Page Should Not Contain    Inline kommentti 1
    Page Should Not Contain    Inline kommentti 2

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

212. Create new suggestion for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Create new suggestion, start comment round and create another new suggestion for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Maximize Browser Window
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    True    True
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Create New Suggestion    Ehdotus1    Kuvaus1
    Start Comment Round
    Create New Suggestion    Ehdotus2    Kuvaus2
    Close Comment Round

    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros

213. Check URI links
    [Documentation]    Check that comment round URI link is working correctly
    [Tags]    regression    kommentit    test    200
    [Setup]    Test Case Setup Reference Data    ${Code_list_with_30_Codes}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    ${CODE_LIST_8}    Testiautomaatiokierros    kuvaus    False    False
    ${uri}=    Get Text    //*[contains(text(), "http://uri.suomi.fi/comments/round/")]

    Go To    ${uri}
    Wait Until Page Contains    Testiautomaatiokierros    timeout=30
    [Teardown]    Test Case Teardown Reference Data    ${CODE_LIST_8_CODE}    Testiautomaatiokierros
