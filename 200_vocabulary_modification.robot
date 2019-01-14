*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Variables ***
${EXT_LINK}       //app-root/div/app-concepts/div/div[2]/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF}    //app-root/div/app-concepts/div/div[2]/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF_2}    //app-root/div/app-concepts/div/div[2]/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div[2]/div[2]/div/div/div/div/p/a

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Vocabulary

203. Add new concept to the existing vocabulary
    [Documentation]    Add new concept to the existing vocabulary and remove concept
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
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
    Wait until page contains element    //*[contains(@id,'concept-1_concept_broader_concept_reference_concept_link')]    timeout=30
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
    [Tags]    regression    sanastot    test    200
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
    [Tags]    regression    sanastot    test    200
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
    [Documentation]    Create new vocabulary, import concepts and modify concept values.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Maximize Browser Window
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}
    Wait until page contains element    ${CONCEPT_EDITORIAL_NOTE_INPUT}    timeout=30
    Click element    ${CONCEPT_EDITORIAL_NOTE_INPUT}
    Input text    ${CONCEPT_EDITORIAL_NOTE_INPUT}    Editorial note
    Wait until page contains element    ${CONCEPT_EXAMPLE_ADD_BTN}    timeout=30
    Click element    ${CONCEPT_EXAMPLE_ADD_BTN}
    Click element    ${CONCEPT_EXAMPLE_EN}
    Wait until page contains element    ${CONCEPT_EXAMPLE_EN_TEXTAREA}    timeout=30
    Click element    ${CONCEPT_EXAMPLE_EN_TEXTAREA}
    input text    ${CONCEPT_EXAMPLE_EN_TEXTAREA}    Example
    Wait until page contains element    ${CONCEPT_SCOPE_INPUT}    timeout=30
    input text    ${CONCEPT_SCOPE_INPUT}    Concept scope
    Wait until page contains element    ${CONCEPT_SCOPE_CLASS_INPUT}    timeout=30
    input text    ${CONCEPT_SCOPE_CLASS_INPUT}    Concept scope class
    Wait until page contains element    ${CONCEPT_WORD_CLASS_INPUT}    timeout=30
    input text    ${CONCEPT_WORD_CLASS_INPUT}    Concept word class
    Wait until page contains element    ${CONCEPT_CHNAGE NOTE_INPUT}    timeout=30
    input text    ${CONCEPT_CHNAGE NOTE_INPUT}    Concept change note
    Wait until page contains element    ${CONCEPT_HISTORY_NOTE_INPUT}    timeout=30
    input text    ${CONCEPT_HISTORY_NOTE_INPUT}    Concept change note
    Wait until page contains element    ${CONCEPT_CONCEPT_NOTATION_INPUT}    timeout=30
    input text    ${CONCEPT_CONCEPT_NOTATION_INPUT}    Concept notation
    Wait until page contains element    ${CONCEPT_STATUS_DDL}    timeout=30
    Click element    ${CONCEPT_STATUS_DDL}
    Click element    ${CONCEPT_STATUS_VALID}
    Save concept
    Sleep    5
    Wait until page contains    Editorial note    timeout=30
    Wait until page contains    Example    timeout=30
    Wait until page contains    Concept scope    timeout=30
    Wait until page contains    Concept scope class    timeout=30
    Wait until page contains    Concept word class    timeout=30
    Wait until page contains    Concept change note    timeout=30
    Wait until page contains    Concept notation    timeout=30
    Wait until page contains    Voimassa oleva    timeout=30
    Log to Console    Concept values modified
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

210. Import Concepts to the Terminological Vocabulary and filter concepts with status value
    [Documentation]    Import Concepts to the Terminological Vocabulary and filter
    ...    concepts with status value.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Select Terminological Vocabulary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${test_concepts_for_status_filter}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Sleep    3
    Log to Console    Concept import ok
    Wait until page contains element    ${CONCEPT_FILTER_BTN}    timeout=30
    Click element    ${CONCEPT_FILTER_BTN}
    Wait until page contains element    ${CONCEPT_FILTER_DDL}    timeout=30
    Click element    ${CONCEPT_FILTER_DDL}
    Click element    ${CONCEPT_INCOMPLETE_STATUS}
    Wait until page contains    Venus    timeout=20
    Page should not contain    Jupiter
    Wait until page contains element    ${CONCEPT_FILTER_DDL}    timeout=30
    Click element    ${CONCEPT_FILTER_DDL}
    Click element    ${CONCEPT_DRAFT_STATUS}
    Wait until page contains    Merkurius    timeout=20
    Page should not contain    Jupiter
    Page should not contain    Kuu
    Page should not contain    Mars
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

211. Add external link for concept
    [Documentation]    Create new vocabulary, import concepts and add external link for concept.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Maximize Browser Window
    Select Terminological Vocabulary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concept_reference}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Sleep    3
    Log to Console    Concept import ok
    Sleep    1
    Edit concept    Merkurius
    Sleep    2
    Wait until page contains element    ${CONCEPT_DEFINITION_FI_0_INPUT}    timeout=30
    Click element    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click element    ${ADD_LINK}
    Wait until page contains element    ${SELECT_LINK_URL_INPUT}    timeout=30
    Input text    ${SELECT_LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SELECT_LINK_CONFRIM_BTN}    timeout=30
    Click element    ${SELECT_LINK_CONFRIM_BTN}
    Save concept
    Wait until page contains    Planeetta    timeout=30
    Wait until page contains element    ${EXT_LINK}    timeout=30
    Click element    ${EXT_LINK}
    Sleep    5
    Select Window    title=Etusivu - Suomi.fi
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Sanastot
    ...    ELSE    Select Window    title=TEST - Sanastot
    Sleep    1
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

212. Add concept reference
    [Documentation]    Create new vocabulary, import concepts and add concept reference.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Maximize Browser Window
    Select Terminological Vocabulary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${concept_reference}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Sleep    3
    Wait until page contains element    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Sleep    3
    Log to Console    Concept import ok
    Sleep    1
    Edit concept    Merkurius
    Sleep    2
    Wait until page contains element    ${CONCEPT_DEFINITION_FI_0_INPUT}    timeout=30
    Click element    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Wait until page contains element    ${ADD_CONCEPT_REFERENCE}    timeout=30
    Click element    ${ADD_CONCEPT_REFERENCE}
    Wait until page contains element    //*[contains(@id,'_search_result_concept')]
    Click element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait until page contains element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Wait until page contains element    ${SELECT_CONCEPT_REFERENCE_DDL}    timeout=30
    Click element    ${SELECT_CONCEPT_REFERENCE_DDL}
    Wait until page contains element    ${BROADER_CONCEPT_BTN}    timeout=30
    Click element    ${BROADER_CONCEPT_BTN}
    Wait until page contains element    ${SELECT_CONCEPT_CONFIRM_BTN}    timeout=30
    Click element    ${SELECT_CONCEPT_CONFIRM_BTN}
    Save concept
    Sleep    2
    Wait until page contains    Planeetta    timeout=30
    Wait until page contains element    ${CONCEPT_REF}    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

213. Add definition for concept
    [Documentation]    Create new vocabulary and import concepts. Add another definition in Finnish and concept reference for concept.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Maximize Browser Window
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_CONCEPT_DEFINITION_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_DEFINITION_BTN}
    Wait until page contains element    ${CONCEPT_DEFINITION_FI}    timeout=30
    Click element    ${CONCEPT_DEFINITION_FI}
    Wait until page contains element    ${CONCEPT_DEFINITION_FI_1_INPUT}    timeout=30
    Click element    ${CONCEPT_DEFINITION_FI_1_INPUT}
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    h
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    u
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    t
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    k
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    i
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    j
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    a
    Wait until page contains element    ${ADD_CONCEPT_REFERENCE_1}    timeout=30
    Click element    ${ADD_CONCEPT_REFERENCE_1}
    Wait until page contains element    //*[contains(@id,'_search_result_concept')]
    Click element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait until page contains element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save concept
    Sleep    5
    Wait until page contains    hutkija    timeout=30
    Wait until page contains element    ${CONCEPT_REF_2}    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

214. Add note for concept
    [Documentation]    Create new vocabulary and import concepts. Add another note in Finnish and concept reference for concept.
    [Tags]    sanastot    200
    [Setup]    Test Case Setup Create Terminological Vocabulary with concepts
    Maximize Browser Window
    Go back to Sanastot frontpage
    Select dictionary    ${VOCABULARY_2}
    Sleep    1
    Edit concept    tutkija
    Wait until page contains element    ${ADD_CONCEPT_NOTE_BTN}    timeout=30
    Click element    ${ADD_CONCEPT_NOTE_BTN}
    Wait until page contains element    ${CONCEPT_NOTE_FI}    timeout=30
    Click element    ${CONCEPT_NOTE_FI}}
    Wait until page contains element    ${CONCEPT_NOTE_FI_1_INPUT}    timeout=30
    Click element    ${CONCEPT_NOTE_FI_1_INPUT}
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    h
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    u
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    t
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    k
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    i
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    j
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    a
    Wait until page contains element    ${ADD_CONCEPT_REFERENCE_1}    timeout=30
    Click element    ${ADD_CONCEPT_REFERENCE_1}
    Wait until page contains element    //*[contains(@id,'_search_result_concept')]
    Click element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait until page contains element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save concept
    Sleep    5
    Wait until page contains    hutkija    timeout=30
    Wait until page contains element    ${CONCEPT_REF_2}    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

215. Import Concepts in xml format and check concept description links
    [Documentation]    Import Concepts in xml format and check concept description links. YTI-400.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Select Terminological Vocabulary
    Import concepts    ${XML_FORMAT_BTN}    ${tax}
    Select concept    verotuspäätös
    Wait until page contains element    //*[contains(text(), "Verovelvolliselle")]    timeout=30
    Click element    //*[contains(text(), "Verovelvolliselle")]
    Wait until page contains    verovelvollinen    timeout=30
    Select concept    verotuspäätös
    Wait until page contains element    //*[contains(text(), "veronpalautuksesta")]    timeout=30
    Click element    //*[contains(text(), "veronpalautuksesta")]
    Wait until page contains    veronpalautus    timeout=30
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

216. Import Concepts in xml format and check import warnings
    [Documentation]    Import Concepts in xml format and check import warnings
    [Tags]    sanastot    200
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Select Terminological Vocabulary
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click element    ${IMPORT_VOCABULARY_BTN}
    Wait until page contains element    ${FILE_FORMAT_DROPDOWN_BTN}    timeout=30
    Click element    ${FILE_FORMAT_DROPDOWN_BTN}
    Click element    ${XML_FORMAT_BTN}
    Choose file    ${FILE_UPLOAD_INPUT}    ${Concepts_with_dropped_items}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=30
    Click element    ${FILE_UPLOAD_BTN}
    Wait until element is enabled    ${IMPORT_YES_BTN}    timeout=30
    Wait until page contains    67 kohdetta luotu. Virheitä: 0. Varoituksia: 11.    timeout=30
    Wait until page contains element    //*[contains(text(), "Näytä viestit")]    timeout=30
    Click element    //*[contains(text(), "Näytä viestit")]
    Wait until page contains    Dropping 'ulottuvuus' type record    timeout=20
    Wait until page contains    c2
    Wait until page contains    c68    timeout=20
    Wait until page contains    [DIAG:c70 LINK-target #c46 <[kasvupalvelu palvelun sisällön mukaan]> not added into the collection]    timeout=20
    Wait until page contains element    //*[contains(text(), "Piilota viestit")]    timeout=30
    Click element    //*[contains(text(), "Piilota viestit")]
    Wait until element is enabled    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Sleep    5
    Log to Console    Concept import ok
    Go back to Sanastot frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

*** Keywords ***
Select and edit Draft vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Click element    ${TERMINOLOGY_TAB}
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
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Click element    ${TERMINOLOGY_TAB}
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
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Click element    ${TERMINOLOGY_TAB}
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
