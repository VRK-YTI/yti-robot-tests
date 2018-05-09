*** Settings ***
Documentation     Test Suite for CSV Import test cases
Suite Setup       Create Terminological Dictionary
Suite Teardown    Delete Terminological Dictionary
Test Teardown     Test Case Teardown
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
300. Import Concepts to the Terminological Dictionary, related concepts not found from CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that error message is displayed in
    ...    import confirmation when related, broader and isPartOf concepts are not found from CSV.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_2}")]
    Wait until page contains    ${VOCABULARY_2}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${invalid_related_concepts}
    Sleep    3
    Page should contain    4: Viittauksella “broader” ei löydy käsitettä
    Page should contain    4: Viittauksella “related” ei löydy käsitettä
    Page should contain    4: Viittauksella “isPartOf” ei löydy käsitettä
    Page should contain    5: Viittauksella “broader” ei löydy käsitettä
    Page should contain    5: Viittauksella “related” ei löydy käsitettä
    Page should contain    5: Viittauksella “isPartOf” ei löydy käsitettä
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage

301. Import Concepts to the Terminological Dictionary, related columns with empty values in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that import is successful when
    ...    related, broader and isPartOf columns are empty for certain concepts in CSV.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_2}")]
    Wait until page contains    ${VOCABULARY_2}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${empty_related_concepts}
    Sleep    2
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    Go back to Sanastot frontpage

*** Keywords ***
Create Terminological Dictionary
    Test Case Setup
    Wait until page contains element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TYPE_DDL}    timeout=30
    Click element    ${VOCABULARY_TYPE_DDL}
    Wait until page contains element    //*[contains(text(), "Terminologinen sanasto")]    timeout=20
    Click element    //*[contains(text(), "Terminologinen sanasto")]
    Wait until page contains element    ${TITLE_INPUT_FI}    timeout=30
    Input text    ${TITLE_INPUT_FI}    ${VOCABULARY_2}
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_ORGANIZATION_BTN}
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
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    2
    Go back to Sanastot frontpage

Delete Terminological Dictionary
    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_2}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatiosanasto2    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Page should contain    sanastoa
    Sleep    1
    Close All Browsers
