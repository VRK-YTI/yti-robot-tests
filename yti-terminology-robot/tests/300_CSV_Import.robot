*** Settings ***
Documentation     Test Suite for CSV Import test cases
Suite Setup       Test Case Suite Setup Generic Setup
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test case teardown delete terminology     ${VOCABULARY_2}
Test Setup        Test Case Setup admin
Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${NAVIGATION_MENU_DDL}    id=nav_item_dropdown_link

*** Test Cases ***
300. Import Concepts to the Terminological Vocabulary, related concepts not found from CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary. Check that error message is displayed in
    ...    import confirmation when related, broader and isPartOf concepts are not found from CSV.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${invalid_related_concepts}
    Wait Until Page Contains    Tuodaan 4 käsitettä    timeout=60
    Page Should Contain    4: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page Should Contain    4: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page Should Contain    4: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “broader” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “related” ei löydy käsitettä arvolle “joku”
    Page Should Contain    5: Viittauksella “isPartOf” ei löydy käsitettä arvolle “joku”
    Cancel Concept Import

301. Import Concepts to the Terminological Vocabulary, related columns with empty values in CSV
    [Documentation]    Import Concepts to the Terminological Dictionary. Check that import is successful when
    ...    related, broader and isPartOf columns are empty for certain concepts in CSV.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${empty_related_concepts}
    Wait Until Page Contains    Tuodaan 1 käsitettä    timeout=60
    Wait Until Page Contains    tutkimus    timeout=60
    Wait Until Page Contains    research    timeout=60
    Wait Until Page Contains    tutkielma    timeout=60
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=60
    Wait Until Page Contains    huomio    timeout=60
    Wait Until Page Contains    esim    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60

    Click Element with wait   ${IMPORT_YES_BTN}
    Click Element with wait   //*[contains(text(), "${TERM_2}")]    timeout=60
    Wait Until Page Contains    research    timeout=60
    Wait Until Page Contains    tutkielma    timeout=60
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=60
    Wait Until Page Contains    huomio    timeout=60
    Wait Until Page Contains    esim    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60

302. Import Concepts to the Terminological Vocabulary with empty STATUS values
    [Documentation]    Import Concepts to the Terminological Vocabulary with empty STATUS values.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${concepts_with_empty_status}
    Wait Until Page Contains    Tuodaan 1 käsitettä    timeout=30
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esim    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30

    Click Element with wait   ${IMPORT_YES_BTN}
    Click Element with wait    //*[contains(text(), "${TERM_2}")]    timeout=60
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esim    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30

303. Import Concepts to the Terminological Vocabulary with missing STATUS column
    [Documentation]    Import Concepts to the Terminological Vocabulary with missing STATUS column.
    ...    Check that import is successful and concept STATUS is Draft after CSV import. Check that Draft STATUS
    ...    is shown in import confirmation as well.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}

    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${concepts_with_missing_status}
    Wait Until Page Contains    Tuodaan 1 käsitettä    timeout=30
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    study    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esimerkki    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30

    Click Element with wait   ${IMPORT_YES_BTN}
    Click Element with wait   //*[contains(text(), "${TERM_2}")]

    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    study    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esimerkki    timeout=30
    Wait Until Page Contains    Luonnos    timeout=30

304. Import Concepts to the Terminological Vocabulary with invalid column name in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid column name in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window

    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${concepts_with_invalid_column}
    Wait Until Page Contains    Ominaisuus “definition” täytyy olla määritelty kielen kanssa    timeout=30

    Click Element with wait   ${IMPORT_CANCEL_BTN}

305. Import Concepts to the Terminological Vocabulary with invalid status value in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with invalid status value in CSV.
    ...    Check that error message is displayed in import confirmation and import is not successful.
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window

    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${concepts_with_invalid_status_value}
    Wait Until Page Contains    3: Virheellinen tila “xxxxx”    timeout=30

    Click Element with wait    ${IMPORT_CANCEL_BTN}

306. Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV
    [Documentation]    Import Concepts to the Terminological Vocabulary with duplicate definition columns in CSV.
    ...    Check that the values of the second column are taken into use
    [Tags]    regression    sanastot    test    300
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Concept Import Without Confirmation    ${CSV_FORMAT_BTN}    ${concepts_with_duplicate_definition_columns}
    Wait Until Page Contains    systemaattista ja luovaa toimintaa2    timeout=30
    Wait Until Page Contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta2    timeout=30
    Wait Until Page Contains    henkilö, joka hutkii ammatikseen2    timeout=30
    Wait Until Page Contains    henkilö, joka hotkii kaiken2    timeout=30

    Click Element with wait     ${IMPORT_YES_BTN}
    Click Element with wait     //*[contains(text(), "${TERM_2}")]
    Wait Until Page Contains    tutkimus    timeout=30
    Wait Until Page Contains    research    timeout=30
    Wait Until Page Contains    tutkielma    timeout=30
    Wait Until Page Contains    systemaattista ja luovaa toimintaa2    timeout=30
    Wait Until Page Contains    huomio    timeout=30
    Wait Until Page Contains    esim    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30

