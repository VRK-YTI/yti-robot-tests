*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Testiautomaatiosanasto
    Select and edit Draft vocabulary
    Wait until page contains element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_TITLE_TEXTAREA}    Uusi sanasto
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Uusi kuvaus
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    5
    Wait until page contains    Uusi sanasto    timeout=20
    Wait until page contains    Uusi kuvaus    timeout=20
    Wait until page contains element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCABULARY_TITLE_TEXTAREA}    Testiautomaatiosanasto
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Sleep    5
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Wait until page contains    Tämä on kuvaus    timeout=30
    Log to console    Title and description of Terminological Vocabulary modified
    Go back to Sanastot frontpage
    [Teardown]    Delete Testiautomaatiosanasto

201. Add new organization and classification for DRAFT vocabulary
    [Documentation]    Add new organization and classification for DRAFT vocabulary
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Testiautomaatiosanasto
    Select and edit Draft vocabulary
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_1}")]    timeout=30
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Log to Console    Organization added
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Wait until page contains element    //*[contains(text(), "${CLASSIFICATION_1}")]    timeout=30
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Log to Console    Classification added
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
    Restore organization and classification for DRAFT vocabulary
    [Teardown]    Delete Testiautomaatiosanasto

202. Add new Terminological Dictionary and import vocabulary
    [Documentation]    Add new Terminological Dictionary, import vocabulary and delete dictionary
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Vocabulary

203. Add new concept to the existing vocabulary
    [Documentation]    Add new concept to the existing vocabulary and remove concept
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Testiautomaatiosanasto
    Select Draft vocabulary
    Wait until page contains element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    Click element    ${ADD_NEW_CONCEPT_BTN}
    Wait until page contains element    ${TERM_LITERAL_VALUE_INPUT}    timeout=30
    Input text    ${TERM_LITERAL_VALUE_INPUT}    ${TERM_1}
    Wait until page contains element    ${ADD_NEW_CONCEPT}    timeout=30
    Click element    ${ADD_NEW_CONCEPT}
    Wait until page contains element    ${SOURCE_INPUT}    timeout=30
    Input text    ${SOURCE_INPUT}    Lähde
    Wait until page contains element    ${SCOPE_INPUT}    timeout=30
    Input text    ${SCOPE_INPUT}    Käyttöala
    Wait until page contains element    ${DRAFT_COMMENT_INPUT}    timeout=30
    Input text    ${DRAFT_COMMENT_INPUT}    Luonnosvaiheen kommentti
    Wait until page contains element    ${HISTORY_NOTE_INPUT}    timeout=30
    Input text    ${HISTORY_NOTE_INPUT}    Käytön historiatieto
    Wait until page contains element    ${CHANGENOTE_INPUT}    timeout=30
    Input text    ${CHANGENOTE_INPUT}    Muutoshistoriatieto
    Wait until page contains element    ${TERM_STATUS_DDL}    timeout=30
    Click element    ${TERM_STATUS_DDL}
    Click button    Voimassa oleva
    Wait until page contains element    ${SAVE_CONCEPT_BTN}    timeout=30
    Click element    ${SAVE_CONCEPT_BTN}
    Sleep    2
    Wait until page contains    Automaatio    timeout=30
    Log to Console    New concept "Automaatio" added
    Go back to Sanastot frontpage
    Delete concept from Testiautomaatiosanasto vocabulary
    Log to console    Concept "Automaatio" deleted
    Go back to Sanastot frontpage
    [Teardown]    Delete Testiautomaatiosanasto

204. Remove related concept and check confirmation
    [Documentation]    Add new Terminological Dictionary, import vocabulary, delete related concept
    ...    and check remove confirmation, YTI-768.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Edit concept    tutkija
    Wait until page contains element    //*[contains(@id,'concept-3_concept_related_concept_')]    timeout=30
    Click element    //*[contains(@id,'concept-3_concept_related_concept_')]
    Save concept
    Wait until page contains    Seuraava viite poistuu kokonaan tallennuksen yhteydessä    timeout=30
    Wait until page contains    Viitteen tyyppi    timeout=30
    Wait until page contains    Kohteen sijainti    timeout=30
    Wait until page contains    Kohde    timeout=30
    Wait until page contains    Liittyvä käsite    timeout=30
    Wait until page contains    hutkija    timeout=30
    Wait until page contains element    ${REMOVE_LINK_CONFIRMATION_BTN}    timeout=30
    Click element    ${REMOVE_LINK_CONFIRMATION_BTN}
    Sleep    2
    Page should not contain    Liittyvä käsite
    Log to Console    Related concept removed
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

205. Add collection for vocabulary
    [Documentation]    Add new collection to vocabulary and delete collection.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Add collection for vocabulary    Testikäsitevalikoima    Valikoiman määritelmä
    Edit collection
    Add broader concepts for collection    hotkija    hutkija
    Add members for collection    tutkija    tutkimus
    Save collection
    Wait until page contains element    //*[contains(@id,'1_collection_list_listitem')]    timeout=30
    Wait until page contains element    ${REMOVE_COLLECTION_BTN}    timeout=30
    Click element    ${REMOVE_COLLECTION_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_BTN}
    Sleep    2
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Wait until page contains element    ${CONCEPTS_ALPHABETICAL_TAB}    timeout=30
    Click element    ${CONCEPTS_ALPHABETICAL_TAB}
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Sleep    1
    Wait until page contains element    ${CONCEPTS_HIERARCHIAL_TAB}    timeout=30
    Click element    ${CONCEPTS_HIERARCHIAL_TAB}
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

206. Modify concept which is defined in collection
    [Documentation]    Add new collection to vocabulary and modify concept which is
    ...    defined in collection broader. Check that collection is not listed
    ...    in alphabetic or hierarchial listing. YTI-1181.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Add collection for vocabulary    Testikäsitevalikoima    Valikoiman määritelmä
    Edit collection
    Add broader concepts for collection    tutkija    tutkimus
    Add members for collection    hotkija    hutkija
    Save collection
    Wait until page contains element    //*[contains(@id,'1_collection_list_listitem')]    timeout=30
    Wait until page contains element    ${CONCEPTS_ALPHABETICAL_TAB}    timeout=30
    Click element    ${CONCEPTS_ALPHABETICAL_TAB}
    Wait until page contains element    //*[contains(@id,'concept-2_concept_list_listitem')]    timeout=30
    Click element    //*[contains(@id,'concept-2_concept_list_listitem')]
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_BROADER_CONCEPT_BTN}    timeout=30
    Click element    ${ADD_BROADER_CONCEPT_BTN}
    Wait until page contains element    //*[contains(@id,'concept-1_search_result_concept')]    timeout=30
    Click element    //*[contains(@id,'concept-1_search_result_concept')]
    Wait until page contains element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save concept
    Sleep    5
    Wait until page contains element    //*[contains(@id,'concept-1_concept_broader_concept_reference_remove_reference_link')]    timeout=30
    Reload page
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Wait until page contains element    ${CONCEPTS_HIERARCHIAL_TAB}    timeout=30
    Click element    ${CONCEPTS_HIERARCHIAL_TAB}
    Page should not contain element    //*[contains(@id,'1_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

207. Add preferred term and synonym for concept
    [Documentation]    Create new vocabulary, import concepts and modify concept
    ...    by adding preferred term, synonym and non-recommended synonym.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_PREFERRED_TERM_BTN}    timeout=30
    Click element    ${ADD_PREFERRED_TERM_BTN}
    Wait until page contains element    ${ADD_PREFERRED_TERM_SV}    timeout=30
    Click element    ${ADD_PREFERRED_TERM_SV}
    Wait until page contains element    ${PREFERRED_TERM_INPUT}    timeout=30
    Input Text    ${PREFERRED_TERM_INPUT}    Forskaren
    Wait until page contains element    ${ADD_SYNONYM_BTN}    timeout=30
    Click element    ${ADD_SYNONYM_BTN}
    Wait until page contains element    ${ADD_SYNONYM_EN}    timeout=30
    Click element    ${ADD_SYNONYM_EN}
    Wait until page contains element    ${SYNONYM_INPUT}    timeout=30
    Input Text    ${SYNONYM_INPUT}    Oppinut henkilö
    Wait until page contains element    ${NOT_SYNONYM_BTN}    timeout=30
    Click element    ${NOT_SYNONYM_BTN}
    Wait until page contains element    ${NOT_SYNONYM_EN}    timeout=30
    Click element    ${NOT_SYNONYM_EN}
    Wait until page contains element    ${NOT_SYNONYM_INPUT}    timeout=30
    Input Text    ${NOT_SYNONYM_INPUT}    Tarkastelija
    Save concept
    Sleep    5
    Wait until page contains    Forskaren    timeout=30
    Wait until page contains    Oppinut henkilö    timeout=30
    Wait until page contains    Tarkastelija    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

208. Add hidden term for concept
    [Documentation]    Create new vocabulary, import concepts and add hidden term for concept
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Maximize Browser Window
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_HIDDEN_TERM_BTN}    timeout=30
    Click element    ${ADD_HIDDEN_TERM_BTN}
    Wait until page contains element    ${ADD_HIDDEN_TERM_FI}    timeout=30
    Click element    ${ADD_HIDDEN TERM_FI}
    Wait until page contains element    ${HIDDEN TERM_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_INPUT}    Tieteilijä
    Wait until page contains element    ${ADD_HIDDEN_TERM_SOURCE_BTN}    timeout=30
    Click element    ${ADD_HIDDEN_TERM_SOURCE_BTN}
    Input Text    ${HIDDEN_TERM_SOURCE_INPUT}    Ohjaustermin lähde
    Wait until page contains element    ${HIDDEN_TERM_SCOPE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_SCOPE_INPUT}    Ohjaustermin ala
    Wait until page contains element    ${HIDDEN_TERM_STYLE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_STYLE_INPUT}    Älykkö
    Wait until page contains element    ${HIDDEN_TERM_FAMILY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_FAMILY_INPUT}    Feminiini
    Wait until page contains element    ${HIDDEN_TERM_CONJUGATION_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CONJUGATION_INPUT}    Yksikkö
    Wait until page contains element    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    >
    Wait until page contains element    ${HIDDEN_TERM_WORD_CLASS_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_WORD_CLASS_INPUT}    Eri sanaluokka
    Wait until page contains element    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    9
    Wait until page contains element    ${HIDDEN_TERM_NOTE_BTN}    timeout=30
    Click element    ${HIDDEN_TERM_NOTE_BTN}
    Input Text    ${HIDDEN_TERM_NOTE_INPUT}    Huomio
    Wait until page contains element    ${HIDDEN_TERM_COMMENT_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_COMMENT_INPUT}    Kommentti
    Wait until page contains element    ${HIDDEN_TERM_HISTORY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HISTORY_INPUT}    Termin historia
    Wait until page contains element    ${HIDDEN_TERM_CHANGENOTE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CHANGENOTE_INPUT}    Termin muutoshistoriatieto
    Wait until page contains element    ${HIDDEN_TERM_STATUS_DDL}    timeout=30
    Click element    ${HIDDEN_TERM_STATUS_DDL}
    Click element    ${HIDDEN_TERM_STATUS_VALID}
    Save concept
    Sleep    5
    Wait until page contains element    ${HIDDEN_TERM}    timeout=30
    Click Element    ${HIDDEN_TERM}
    Wait until page contains    Voimassa oleva    timeout=30
    Wait until page contains    Tieteilijä    timeout=30
    Wait until page contains    Ohjaustermin lähde    timeout=30
    Wait until page contains    Ohjaustermin ala    timeout=30
    Wait until page contains    Älykkö    timeout=30
    Wait until page contains    Feminiini    timeout=30
    Wait until page contains    Yksikkö    timeout=30
    Wait until page contains    >    timeout=30
    Wait until page contains    Eri sanaluokka    timeout=30
    Wait until page contains    9    timeout=30
    Wait until page contains    Huomio    timeout=30
    Wait until page contains    Kommentti    timeout=30
    Wait until page contains    Termin historia    timeout=30
    Wait until page contains    Termin muutoshistoriatieto    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

209. Modify concept
    [Documentation]    Create new vocabulary, import concepts and mdify concept values.
    [Tags]    sanastot
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Maximize Browser Window
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_CONCEPT_DEFINITION_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_DEFINITION_BTN}
    Click element    ${CONCEPT_DEFINITION_EN}
    Input Text    ${CONCEPT_DEFINITION_INPUT}    Käsitteen määritelmä englanniksi
    Wait until page contains element    ${ADD_CONCEPT_NOTE_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_NOTE_BTN}
    Click element    ${CONCEPT_NOTE_EN}
    Input Text    ${CONCEPT_NOTE_INPUT}    Käsitteen huomautus englanniksi
    Wait until page contains element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}
    Wait until page contains element    ${ADD_HIDDEN_TERM_SOURCE_BTN}    timeout=30
    Click element    ${ADD_HIDDEN_TERM_SOURCE_BTN}
    Input Text    ${HIDDEN_TERM_SOURCE_INPUT}    Ohjaustermin lähde
    Wait until page contains element    ${HIDDEN_TERM_SCOPE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_SCOPE_INPUT}    Ohjaustermin ala
    Wait until page contains element    ${HIDDEN_TERM_STYLE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_STYLE_INPUT}    Älykkö
    Wait until page contains element    ${HIDDEN_TERM_FAMILY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_FAMILY_INPUT}    Feminiini
    Wait until page contains element    ${HIDDEN_TERM_CONJUGATION_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CONJUGATION_INPUT}    Yksikkö
    Wait until page contains element    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    >
    Wait until page contains element    ${HIDDEN_TERM_WORD_CLASS_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_WORD_CLASS_INPUT}    Eri sanaluokka
    Wait until page contains element    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    9
    Wait until page contains element    ${HIDDEN_TERM_NOTE_BTN}    timeout=30
    Click element    ${HIDDEN_TERM_NOTE_BTN}
    Input Text    ${HIDDEN_TERM_NOTE_INPUT}    Huomio
    Wait until page contains element    ${HIDDEN_TERM_COMMENT_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_COMMENT_INPUT}    Kommentti
    Wait until page contains element    ${HIDDEN_TERM_HISTORY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HISTORY_INPUT}    Termin historia
    Wait until page contains element    ${HIDDEN_TERM_CHANGENOTE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CHANGENOTE_INPUT}    Termin muutoshistoriatieto
    Wait until page contains element    ${HIDDEN_TERM_STATUS_DDL}    timeout=30
    Click element    ${HIDDEN_TERM_STATUS_DDL}
    Click element    ${HIDDEN_TERM_STATUS_VALID}
    Save concept
    Sleep    5
    Wait until page contains element    ${HIDDEN_TERM}    timeout=30
    Click Element    ${HIDDEN_TERM}
    Wait until page contains    Voimassa oleva    timeout=30
    Wait until page contains    Tieteilijä    timeout=30
    Wait until page contains    Ohjaustermin lähde    timeout=30
    Wait until page contains    Ohjaustermin ala    timeout=30
    Wait until page contains    Älykkö    timeout=30
    Wait until page contains    Feminiini    timeout=30
    Wait until page contains    Yksikkö    timeout=30
    Wait until page contains    >    timeout=30
    Wait until page contains    Eri sanaluokka    timeout=30
    Wait until page contains    9    timeout=30
    Wait until page contains    Huomio    timeout=30
    Wait until page contains    Kommentti    timeout=30
    Wait until page contains    Termin historia    timeout=30
    Wait until page contains    Termin muutoshistoriatieto    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

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

Select Draft vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30

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
    Log to Console    Vocabulary changes restored
    Go back to Sanastot frontpage
    Sleep    1
    Close All Browsers

Delete Terminological Vocabulary
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
    Sleep    2
    Page should not contain element    //*[contains(text(), "${VOCABULARY_2}")]
    Sleep    1
    Log to Console    Terminological Vocabulary deleted
    Sleep    1
    Close All Browsers

Delete concept from Testiautomaatiosanasto vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    //*[contains(text(), "${TERM_1}")]    timeout=30
    Click element    //*[contains(text(), "${TERM_1}")]
    Wait until page contains element    ${REMOVE_CONCEPT_BTN}    timeout=30
    Click element    ${REMOVE_CONCEPT_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_CONCEPT_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_CONCEPT_BTN}
    Log to Console    Concept removed from Terminological Vocabulary
    Go back to Sanastot frontpage
    Sleep    1
