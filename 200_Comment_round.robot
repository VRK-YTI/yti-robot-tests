*** Settings ***
Documentation     Test Suite for creating comment round
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Reference_Data_resources.robot

*** Test Cases ***
200. Create new comment round for code list
    [Documentation]    Import new code list in Reference Data tool and create new comment round for code list.
    ...    Delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    Koodisto600    Testiautomaatiokierros    kuvaus
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros
