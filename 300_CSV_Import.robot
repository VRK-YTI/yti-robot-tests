*** Settings ***
Documentation     Test Suite for CSV Import test cases
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
300. Import Concepts to the Terminological Vocabulary, related concepts not found from CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary. Check that error message is displayed in
    ...    import confirmation when related, broader and isPartOf concepts are not found from CSV.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Import Concepts With Error    ${CSV_FORMAT_BTN}    ${invalid_related_concepts}
    Wait Until Page Contains    Tuodaan 4 käsitettä    timeout=60
    Page Should Contain    4: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page Should Contain    4: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page Should Contain    4: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Log To Console    Error message displayed when related, broader and isPartOf concepts are not found from CSV
    Cancel Concept Import
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

301. Import Concepts to the Terminological Vocabulary, related columns with empty values in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that import is successful when
    ...    related, broader and isPartOf columns are empty for certain concepts in CSV.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${empty_related_concepts}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Wait Until Page Contains    Tuodaan 1 käsitettä    timeout=60
    Wait Until Page Contains    tutkimus    timeout=60
    Wait Until Page Contains    research    timeout=60
    Wait Until Page Contains    tutkielma    timeout=60
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=60
    Wait Until Page Contains    huomio    timeout=60
    Wait Until Page Contains    esim    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Contains Element    //*[contains(text(), "${TERM_2}")]    timeout=60
    Click Element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Wait Until Page Contains    research    timeout=60
    Wait Until Page Contains    tutkielma    timeout=60
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=60
    Wait Until Page Contains    huomio    timeout=60
    Wait Until Page Contains    esim    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
    Log To Console    Import successful when related columns have empty values in CSV
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

302. Import Concepts to the Terminological Vocabulary with empty STATUS values
    [Documentation]    Import Concepts to the Terminological Vocabulary with empty STATUS values.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_with_empty_status}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Wait Until Page Contains    Tuodaan 1 käsitettä    timeout=30
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esim    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Contains Element    //*[contains(text(), "${TERM_2}")]    timeout=60
    Click Element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esim    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30
    Log To Console    Concept import with empty STATUS values in CSV is successful
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

303. Import Concepts to the Terminological Vocabulary with missing STATUS column
    [Documentation]    Import Concepts to the Terminological Vocabulary with missing STATUS column.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_with_missing_status}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page Should Contain    Tuodaan 1 käsitettä
    Page Should Contain    tutkimus
    Page Should Contain    research
    Page Should Contain    tutkielma
    Page Should Contain    study
    Page Should Contain    systemaattista ja luovaa toimintaa
    Page Should Contain    huomio
    Page Should Contain    esimerkki
    Page Should Contain    Luonnos
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Contains Element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click Element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page Should Contain    tutkimus
    Page Should Contain    research
    Page Should Contain    tutkielma
    Page Should Contain    study
    Page Should Contain    systemaattista ja luovaa toimintaa
    Page Should Contain    huomio
    Page Should Contain    esimerkki
    Page Should Contain    Luonnos
    Log To Console    When STATUS column is missing import is successful and concept STATUS is Draft after CSV import
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

304. Import Concepts to the Terminological Vocabulary with invalid column name in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_with_invalid_column}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page Should Contain    Ominaisuus “definition” täytyy olla määritelty kielen kanssa
    Log To Console    Import is not successful and error message is dispalyed when column name is invalid
    Wait Until Page Contains Element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click Element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

305. Import Concepts to the Terminological Vocabulary with invalid status value in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid status value in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_with_invalid_status_value}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page Should Contain    3: Virheellinen tila “xxxxx”
    Log To Console    Import is not successful and error message is dispalyed when status value is invalid
    Wait Until Page Contains Element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click Element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

306. Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV.
    ...    Check that the values of the second column are taken into use
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_with_duplicate_definition_columns}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Page Should Contain    systemaattista ja luovaa toimintaa2
    Page Should Contain    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta2
    Page Should Contain    henkilö, joka hutkii ammatikseen2
    Page Should Contain    henkilö, joka hotkii kaiken2
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Sleep    3
    Wait Until Page Contains Element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click Element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page Should Contain    tutkimus
    Page Should Contain    research
    Page Should Contain    tutkielma
    Page Should Contain    systemaattista ja luovaa toimintaa2
    Page Should Contain    huomio
    Page Should Contain    esim
    Page Should Contain    Voimassa oleva
    Log To Console    Import is successful and values of the second column are taken into use when duplicate definition columns are defined in CSV
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

*** Keywords ***
Select Testiautomaatiosanasto2 vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click Element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
