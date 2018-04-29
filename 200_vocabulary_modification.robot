*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Variables ***
#CSV paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${test_concepts}    ${DATAFOLDER}${/}test_concepts_csv.csv

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Select and edit Draft vocabulary
    Wait until page contains element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_TITLE_TEXTAREA}    Uusi sanasto
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_DESCRIPTION_TEXTAREA}    Uusi kuvaus
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    5
    Wait until page contains    Uusi sanasto    timeout=20
    Wait until page contains    Uusi kuvaus    timeout=20
    Wait until page contains element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_TITLE_TEXTAREA}    Testiautomaatiosanasto
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_DESCRIPTION_TEXTAREA}    Tämä on kuvaus
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    5
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Wait until page contains    Tämä on kuvaus    timeout=30
    [Teardown]    Go back to Sanastot frontpage

201. Add new organization and classification for DRAFT vocabulary
    [Documentation]    Add new organization and classification for DRAFT vocabulary
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Select and edit Draft vocabulary
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_1}")]
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Wait until page contains element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    10
    Go back to Sanastot frontpage
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains    ${ORGANIZATION_1}    timeout=30
    Wait until page contains    ${CLASSIFICATION_1}    timeout=30
    Wait until page contains    Testiorganisaatio    timeout=30
    Wait until page contains    Eläkkeet    timeout=30
    Wait until page contains    Terminologinen sanasto    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    [Teardown]    Restore organization and classification for DRAFT vocabulary

202. Add new Terminological Dictionary and import vocabulary
    [Documentation]    Add new Terminological Dictionary, import vocabulary and delete dictionary
    [Tags]    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TYPE_DDL}    timeout=30
    Click element    ${VOCABULARY_TYPE_DDL}
    Wait until page contains element    //*[contains(text(), "Terminologinen sanasto")]    timeout=20
    Click element    //*[contains(text(), "Terminologinen sanasto")]
    Wait until page contains element    ${TITLE_INPUT_FI}    timeout=30
    Input text    ${TITLE_INPUT_FI}    ${VOCABULARY_2}
    Wait until page contains element    ${ADD_NEW_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_NEW_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_1}")]
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait until page contains element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_NEW_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Wait until page contains element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    ${PREFIX_INPUT}    timeout=30
    Input text    ${PREFIX_INPUT}    ${PREFIX_2}
    Wait until page contains element    ${SAVE_NEW_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_NEW_VOCABULARY_BTN}
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${test_concepts}
    Sleep    3
    Click button    Kyllä
    Go back to Sanastot frontpage
    [Teardown]    Delete Testiautomaatiosanasto2 vocabulary

*** Keywords ***
Select and edit Draft vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Wait until page contains    Testiorganisaatio    timeout=20
    Wait until page contains    Eläkkeet    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Tämä on kuvaus    timeout=20
    Wait until page contains element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCABULARY_BTN}

Restore organization and classification for DRAFT vocabulary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCABULARY_BTN}
    Wait until page contains element    ${REMOVE_ORGANIZATION_1}    timeout=30
    Click element    ${REMOVE_ORGANIZATION_1}
    Wait until page contains element    ${REMOVE_CLASSIFICATION_1}    timeout=30
    Click element    ${REMOVE_CLASSIFICATION_1}
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    5
    Page should not contain    ${ORGANIZATION_1}
    Page should not contain    ${CLASSIFICATION_1}
    Go back to Sanastot frontpage

Delete Testiautomaatiosanasto2 vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_2}")]
    Wait until page contains    ${VOCABULARY_2}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatiosanasto2    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Page should contain    sanastoa
