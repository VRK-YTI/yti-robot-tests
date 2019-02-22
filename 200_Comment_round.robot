*** Settings ***
Documentation     Test Suite for creating comment round
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Reference_Data_resources.robot
Resource          resources/Terminologies_resources.robot
Resource          resources/Data_Vocabularies_resources.robot

*** Test Cases ***
200. Create new comment round for code list
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

201. Create new comment round for terminology
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round for the terminology.
    ...    Delete terminology and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros

202. Create new comment round for profile
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Delete profile and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

203. Add resources from Reference Data for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    kommentti1    ${PRPOPOSED_STATUS_VALID}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

204. Add resources from Terminologies for comment round
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round
    ...    for the terminology. Add new concepts for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Saturnus    kommentti1    ${PRPOPOSED_STATUS_RETIRED}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros

205. Add resources from Data Vocabularies for comment round
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Add new class for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies With New Class
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Automobiili    kommentti1    ${PRPOPOSED_STATUS_SUPERSEDED}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

206. Add new resources from Reference Data for comment round after comment round has started
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, start comment round and add new code for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    True
    Add Resource For Comment Round    Testcode 28    kommentti1    ${PRPOPOSED_STATUS_VALID}
    Start Comment Round
    Add Resource For Comment Round    Testcode 57    kommentti22    ${EMPTY}
    Close Comment Round
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

207. Send comment for Reference Data resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, select another user and send comment.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    kommentti1    ${PRPOPOSED_STATUS_VALID}
    Start Comment Round
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Comment Resource    Ehdotetaan uutta tilaa    ${PRPOPOSED_STATUS_SUPERSEDED}
    Wait Until Page Contains    Ehdotetaan uutta tilaa    timeout=20
    Wait Until Page Contains    Korvattu    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros
