*** Settings ***
Documentation     Test Suite for CSV Import test cases
Test Teardown     Test Case Teardown
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
300. Import Concepts to the Terminological Dictionary, related concepts not found from CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that error message is displayed in
    ...    import confirmation when related, broader and isPartOf concepts are not found from CSV.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${invalid_related_concepts}
    Sleep    3
    Page should contain    Tuodaan 4 käsitettä
    Page should contain    4: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page should contain    4: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page should contain    4: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page should contain    5: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

301. Import Concepts to the Terminological Dictionary, related columns with empty values in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that import is successful when
    ...    related, broader and isPartOf columns are empty for certain concepts in CSV.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
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
    [Teardown]    Delete Terminological Dictionary

302. Import Concepts to the Terminological Dictionary with empty STATUS values
    [Documentation]    Import Concepts to the Terminological Dictionary with empty STATUS values.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_empty_status}
    Sleep    2
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Luonnos
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Luonnos
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

303. Import Concepts to the Terminological Dictionary with missing STATUS column
    [Documentation]    Import Concepts to the Terminological Dictionary with missing STATUS column.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_missing_status}
    Sleep    2
    Page should contain    Tuodaan 1 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    study
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esimerkki
    Page should contain    Luonnos
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    study
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esimerkki
    Page should contain    Luonnos
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

304. Import Concepts to the Terminological Dictionary with invalid column name in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary with invalid column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_invalid_column}
    Sleep    3
    Page should contain    Ominaisuus “definition” täytyy olla määritelty kielen kanssa
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

305. Import Concepts to the Terminological Dictionary with invalid status value in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary with invalid status value in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_invalid_status_value}
    Sleep    3
    Page should contain    3: Virheellinen tila “xxxxx”
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

306. Import Concepts to the Terminological Dictionary with duplicate Definition columns in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary with duplicate Definition columns in CSV.
    ...    Check that the values of the second column are taken into use
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Terminological Dictionary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_duplicate_definition_columns}
    Sleep    3
    Page should contain    systemaattista ja luovaa toimintaa2
    Page should contain    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta2
    Page should contain    henkilö, joka hutkii ammatikseen2
    Page should contain    henkilö, joka hotkii kaiken2
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa2
    Page should contain    huomio
    Page should contain    esim
    Page should contain    Voimassa oleva
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary

307. Import Concepts to the Thesaurus with columns that are not supported
    [Documentation]    Import Concepts to the Thesaurus with isPartOf and status columns
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Thesaurus
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${concepts_with_isPartOf_and_status}
    Sleep    3
    Page should contain    Ominaisuutta tai viitettä ei löydy nimellä “isPartOf”
    Page should contain    Ominaisuutta tai viitettä ei löydy nimellä “status”
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Thesaurus

308. Successful CSV import to the Thesaurus
    [Documentation]    Import Concepts to the Thesaurus and check that import is successful
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Thesaurus
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${test_concepts_to_thesaurus}
    Sleep    3
    Page should contain    Tuodaan 4 käsitettä
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    tutkija
    Page should contain    researcher
    Page should contain    hutkija
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait until page contains element    //*[contains(text(), "${TERM_2}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_2}")]
    Sleep    2
    Page should contain    tutkimus
    Page should contain    research
    Page should contain    tutkielma
    Page should contain    systemaattista ja luovaa toimintaa
    Page should contain    huomio
    Page should contain    esim
    Page should contain    tutkija
    Page should contain    hutkija
    Go back to Sanastot frontpage
    [Teardown]    Delete Thesaurus

309. Import Concepts to the Thesaurus with invalid column name
    [Documentation]    Import Concepts to the Thesaurus with invalid column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Thesaurus
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${test_concepts_to_thesaurus_invalid_column}
    Sleep    3
    Page should contain    Viittaus “narrower” täytyy määritellä kielen kanssa
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Thesaurus

310. Import Concepts to the Thesaurus with incorrect column name
    [Documentation]    Import Concepts to the Thesaurus with incorrect column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Create Thesaurus
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${test_concepts_to_thesaurus_incorrect_column}
    Sleep    3
    Page should contain    Ominaisuutta tai viitettä ei löydy nimellä “ggggggggg”
    Wait until page contains element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click element    ${IMPORT_CANCEL_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Delete Thesaurus

*** Keywords ***
Create Terminological Dictionary
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

Delete Terminological Dictionary
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

Select Testiautomaatiosanasto2 vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30

Create Thesaurus
    Wait until page contains element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TYPE_DDL}    timeout=30
    Click element    ${VOCABULARY_TYPE_DDL}
    Wait until page contains element    //*[contains(text(), "Asiasanasto")]    timeout=20
    Click element    //*[contains(text(), "Asiasanasto")]
    Wait until page contains element    ${TITLE_INPUT_FI}    timeout=30
    Input text    ${TITLE_INPUT_FI}    ${VOCABULARY_3}
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
    Input text    ${PREFIX_INPUT}    ${PREFIX_3}
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    2

Delete Thesaurus
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_3}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_3}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_3}")]
    Wait until page contains    ${VOCABULARY_3}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatioasiasanasto    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_3}
    Page should contain    sanastoa
    Sleep    1
    Close All Browsers
