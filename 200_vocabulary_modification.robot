*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Variables ***
${EXT_LINK}       //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF_2}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div[2]/div[2]/div/div/div/div/p/a
${CONCEPT_REF_3}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[2]/dl/dd/app-localized-input/div/div[2]/div[2]/div/div/div/div/p/a

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary and add contact information
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select And Edit Dictionary    ${VOCABULARY_1}
    Wait Until Page Contains Element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input Text    ${VOCABULARY_TITLE_TEXTAREA}    Uusi sanasto
    Wait Until Page Contains Element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input Text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Uusi kuvaus
    Wait Until Page Contains Element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${EDIT_VOCABULARY_BTN}    timeout=60
    Wait Until Page Contains    Uusi sanasto    timeout=20
    Wait Until Page Contains    Uusi kuvaus    timeout=20
    Wait Until Page Contains Element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click Element    ${EDIT_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${VOCABULARY_TITLE_TEXTAREA}    timeout=30
    Input Text    ${VOCABULARY_TITLE_TEXTAREA}    Testiautomaatiosanasto
    Wait Until Page Contains Element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input Text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait Until Element Is Enabled    ${VOCABULARY_SOURCE_INPUT}    timeout=30
    Input Text    ${VOCABULARY_SOURCE_INPUT}    Yhteystiedot tähän
    Wait Until Page Contains Element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60
    Sleep    1
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=30
    Wait Until Page Contains    Tämä on kuvaus    timeout=30
    Wait Until Page Contains    Yhteydenotto    timeout=30
    Wait Until Page Contains    Yhteystiedot tähän    timeout=30
    Log To Console    Title and description of Terminological Vocabulary modified
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

201. Add new organization and classification for DRAFT vocabulary
    [Documentation]    Add new organization and classification for DRAFT vocabulary
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select And Edit Dictionary    ${VOCABULARY_1}
    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click Element    ${ADD_ORGANIZATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input Text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Wait Until Page Contains Element    //*[contains(text(), "${ORGANIZATION_2}")]    timeout=30
    Click Element    //*[contains(text(), "${ORGANIZATION_2}")]
    Log To Console    Organization added
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION_BTN}    timeout=30
    Click Element    ${ADD_CLASSIFICATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Wait Until Page Contains Element    //*[contains(text(), "${CLASSIFICATION_1}")]    timeout=30
    Click Element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Log To Console    Classification added
    Wait Until Page Contains Element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60
    Sleep    1
    Go Back To Sanastot Frontpage
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains    ${ORGANIZATION_1}    timeout=30
    Wait Until Page Contains    ${CLASSIFICATION_1}    timeout=30
    Wait Until Page Contains    Yhteentoimivuusalustan ylläpito    timeout=30
    Wait Until Page Contains    Eläkkeet    timeout=30
    Wait Until Page Contains    Terminologinen sanasto    timeout=30
    Click Element    //*[contains(text(), "${VOCABULARY_1}")]
    Restore organization and classification for DRAFT vocabulary
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

203. Add new concept to the existing vocabulary
    [Documentation]    Add new concept to the existing vocabulary and remove concept
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select Dictionary    ${VOCABULARY_1}
    Wait Until Page Contains Element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    Click Element    ${ADD_NEW_CONCEPT_BTN}
    Wait Until Page Contains Element    ${TERM_LITERAL_VALUE_INPUT}    timeout=30
    Input Text    ${TERM_LITERAL_VALUE_INPUT}    ${TERM_1}
    Wait Until Page Contains Element    ${ADD_NEW_CONCEPT}    timeout=30
    Click Element    ${ADD_NEW_CONCEPT}
    Wait Until Page Contains Element    ${SOURCE_INPUT}    timeout=30
    Input Text    ${SOURCE_INPUT}    Lähde
    Wait Until Page Contains Element    ${SCOPE_INPUT}    timeout=30
    Input Text    ${SCOPE_INPUT}    Käyttöala
    Wait Until Page Contains Element    ${DRAFT_COMMENT_INPUT}    timeout=30
    Input Text    ${DRAFT_COMMENT_INPUT}    Luonnosvaiheen kommentti
    Wait Until Page Contains Element    ${HISTORY_NOTE_INPUT}    timeout=30
    Input Text    ${HISTORY_NOTE_INPUT}    Käytön historiatieto
    Wait Until Page Contains Element    ${CHANGENOTE_INPUT}    timeout=30
    Input Text    ${CHANGENOTE_INPUT}    Muutoshistoriatieto
    Wait Until Page Contains Element    ${TERM_STATUS_DDL}    timeout=30
    Click Element    ${TERM_STATUS_DDL}
    Click button    Voimassa oleva
    Save Concept
    Wait Until Page Contains    Automaatio    timeout=30
    Log To Console    New concept "Automaatio" added
    Delete Concept    Automaatio
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

204. Remove related concept and check confirmation
    [Documentation]    Add new Terminological Dictionary, import vocabulary, delete related concept
    ...    and check remove confirmation, YTI-768.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Edit Concept    tutkija
    Wait Until Page Contains Element    //*[contains(@id,'_related_concept_reference_remove_reference_link')]    timeout=30
    Click Element    //*[contains(@id,'_related_concept_reference_remove_reference_link')]
    Wait Until Page Contains Element    ${SAVE_CONCEPT_BTN}    timeout=30
    Click Element    ${SAVE_CONCEPT_BTN}
    Wait Until Page Contains    Seuraava viite poistuu kokonaan tallennuksen yhteydessä    timeout=30
    Wait Until Page Contains    Viitteen tyyppi    timeout=30
    Wait Until Page Contains    Kohteen sijainti    timeout=30
    Wait Until Page Contains    Kohde    timeout=30
    Wait Until Page Contains    Liittyvä käsite    timeout=30
    Wait Until Page Contains    hutkija    timeout=30
    Wait Until Page Contains Element    ${REMOVE_LINK_CONFIRMATION_BTN}    timeout=30
    Click Element    ${REMOVE_LINK_CONFIRMATION_BTN}
    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}    timeout=60
    Sleep    2
    Page should not contain    Liittyvä käsite
    Log To Console    Related concept removed
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

205. Add collection for vocabulary
    [Documentation]    Add new collection to vocabulary and delete collection.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Add Collection For Vocabulary    Testikäsitevalikoima    Valikoiman määritelmä
    Edit Collection
    Add Broader Concepts For Collection    hotkija    hutkija
    Add Members For Collection    tutkija    tutkimus
    Save Collection
    Wait Until Page Contains Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=30
    Wait Until Element Is Visible    ${REMOVE_COLLECTION_BTN}    timeout=30
    Click Element    ${REMOVE_COLLECTION_BTN}
    Wait Until Element Is Visible    ${CONFIRM_REMOVE_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}
    Wait Until Page Does Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=5
    Page should not contain    Testikäsitevalikoima
    Wait Until Page Contains Element    ${CONCEPTS_ALPHABETICAL_TAB}    timeout=30
    Click Element    ${CONCEPTS_ALPHABETICAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Wait Until Page Contains Element    ${CONCEPTS_HIERARCHIAL_TAB}    timeout=30
    Click Element    ${CONCEPTS_HIERARCHIAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

206. Modify concept which is defined in collection
    [Documentation]    Add new collection to vocabulary and modify concept which is
    ...    defined in collection broader. Check that collection is not listed
    ...    in alphabetic or hierarchial listing. YTI-1181.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Add Collection For Vocabulary    Testikäsitevalikoima    Valikoiman määritelmä
    Edit Collection
    Add Broader Concepts For Collection    tutkija    tutkimus
    Add Members For Collection    hotkija    hutkija
    Save Collection
    Wait Until Page Contains Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=30
    Wait Until Page Contains Element    ${CONCEPTS_ALPHABETICAL_TAB}    timeout=30
    Click Element    ${CONCEPTS_ALPHABETICAL_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'concept-2_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'concept-2_concept_list_listitem')]
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Sleep    1
    Page should not contain    Testikäsitevalikoima
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_BROADER_CONCEPT_BTN}    timeout=30
    Click Element    ${ADD_BROADER_CONCEPT_BTN}
    Wait Until Page Contains Element    //*[contains(@id,'concept-0_search_result_concept')]    timeout=30
    Click Element    //*[contains(@id,'concept-0_search_result_concept')]
    Wait Until Element Is Enabled    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept
    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}
    Wait Until Page Contains Element    //*[contains(@id,'concept-0_concept_broader_concept_reference_concept_link')]    timeout=30
    Reload page
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Wait Until Page Contains Element    ${CONCEPTS_HIERARCHIAL_TAB}    timeout=30
    Click Element    ${CONCEPTS_HIERARCHIAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

207. Add preferred term and synonym for concept
    [Documentation]    Create new vocabulary, import concepts and modify concept
    ...    by adding preferred term, synonym and non-recommended synonym.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Sleep    1
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_PREFERRED_TERM_BTN}    timeout=30
    Click Element    ${ADD_PREFERRED_TERM_BTN}
    Wait Until Page Contains Element    ${ADD_PREFERRED_TERM_SV}    timeout=30
    Click Element    ${ADD_PREFERRED_TERM_SV}
    Wait Until Page Contains Element    ${PREFERRED_TERM_INPUT}    timeout=30
    Input Text    ${PREFERRED_TERM_INPUT}    Forskaren
    Wait Until Page Contains Element    ${ADD_SYNONYM_BTN}    timeout=30
    Click Element    ${ADD_SYNONYM_BTN}
    Wait Until Page Contains Element    ${ADD_SYNONYM_EN}    timeout=30
    Click Element    ${ADD_SYNONYM_EN}
    Wait Until Page Contains Element    ${SYNONYM_INPUT}    timeout=30
    Input Text    ${SYNONYM_INPUT}    Oppinut henkilö
    Wait Until Page Contains Element    ${NOT_SYNONYM_BTN}    timeout=30
    Click Element    ${NOT_SYNONYM_BTN}
    Wait Until Page Contains Element    ${NOT_SYNONYM_EN}    timeout=30
    Click Element    ${NOT_SYNONYM_EN}
    Wait Until Page Contains Element    ${NOT_SYNONYM_INPUT}    timeout=30
    Input Text    ${NOT_SYNONYM_INPUT}    Tarkastelija
    Save Concept
    Sleep    5
    Wait Until Page Contains    Forskaren    timeout=30
    Wait Until Page Contains    Oppinut henkilö    timeout=30
    Wait Until Page Contains    Tarkastelija    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

208. Add hidden term for concept
    [Documentation]    Create new vocabulary, import concepts and add hidden term for concept
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Sleep    1
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_HIDDEN_TERM_BTN}    timeout=30
    Click Element    ${ADD_HIDDEN_TERM_BTN}
    Wait Until Page Contains Element    ${ADD_HIDDEN_TERM_FI}    timeout=30
    Click Element    ${ADD_HIDDEN TERM_FI}
    Wait Until Page Contains Element    ${HIDDEN TERM_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_INPUT}    Tieteilijä
    Wait Until Page Contains Element    ${ADD_HIDDEN_TERM_SOURCE_BTN}    timeout=30
    Click Element    ${ADD_HIDDEN_TERM_SOURCE_BTN}
    Input Text    ${HIDDEN_TERM_SOURCE_INPUT}    Ohjaustermin lähde
    Wait Until Page Contains Element    ${HIDDEN_TERM_SCOPE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_SCOPE_INPUT}    Ohjaustermin ala
    Wait Until Page Contains Element    ${HIDDEN_TERM_STYLE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_STYLE_INPUT}    Älykkö
    Wait Until Page Contains Element    ${HIDDEN_TERM_FAMILY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_FAMILY_INPUT}    Feminiini
    Wait Until Page Contains Element    ${HIDDEN_TERM_CONJUGATION_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CONJUGATION_INPUT}    Yksikkö
    Wait Until Page Contains Element    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_EQUIVALENCY_INPUT}    >
    Wait Until Page Contains Element    ${HIDDEN_TERM_WORD_CLASS_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_WORD_CLASS_INPUT}    Eri sanaluokka
    Wait Until Page Contains Element    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HOMOGRPAH_INPUT}    9
    Wait Until Page Contains Element    ${HIDDEN_TERM_NOTE_BTN}    timeout=30
    Click Element    ${HIDDEN_TERM_NOTE_BTN}
    Input Text    ${HIDDEN_TERM_NOTE_INPUT}    Huomio
    Wait Until Page Contains Element    ${HIDDEN_TERM_COMMENT_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_COMMENT_INPUT}    Kommentti
    Wait Until Page Contains Element    ${HIDDEN_TERM_HISTORY_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_HISTORY_INPUT}    Termin historia
    Wait Until Page Contains Element    ${HIDDEN_TERM_CHANGENOTE_INPUT}    timeout=30
    Input Text    ${HIDDEN_TERM_CHANGENOTE_INPUT}    Termin muutoshistoriatieto
    Wait Until Page Contains Element    ${HIDDEN_TERM_STATUS_DDL}    timeout=30
    Click Element    ${HIDDEN_TERM_STATUS_DDL}
    Click Element    ${HIDDEN_TERM_STATUS_VALID}
    Save Concept
    Sleep    5
    Wait Until Page Contains Element    ${HIDDEN_TERM}    timeout=30
    Click Element    ${HIDDEN_TERM}
    Wait Until Page Contains    Voimassa oleva    timeout=30
    Wait Until Page Contains    Tieteilijä    timeout=30
    Wait Until Page Contains    Ohjaustermin lähde    timeout=30
    Wait Until Page Contains    Ohjaustermin ala    timeout=30
    Wait Until Page Contains    Älykkö    timeout=30
    Wait Until Page Contains    Feminiini    timeout=30
    Wait Until Page Contains    Yksikkö    timeout=30
    Wait Until Page Contains    >    timeout=30
    Wait Until Page Contains    Eri sanaluokka    timeout=30
    Wait Until Page Contains    9    timeout=30
    Wait Until Page Contains    Huomio    timeout=30
    Wait Until Page Contains    Kommentti    timeout=30
    Wait Until Page Contains    Termin historia    timeout=30
    Wait Until Page Contains    Termin muutoshistoriatieto    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

209. Modify concept
    [Documentation]    Create new vocabulary, import concepts and modify concept values.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Sleep    1
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}    timeout=30
    Click Element    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}
    Wait Until Page Contains Element    ${CONCEPT_EDITORIAL_NOTE_INPUT}    timeout=30
    Click Element    ${CONCEPT_EDITORIAL_NOTE_INPUT}
    Input Text    ${CONCEPT_EDITORIAL_NOTE_INPUT}    Editorial note
    Wait Until Page Contains Element    ${CONCEPT_EXAMPLE_ADD_BTN}    timeout=30
    Click Element    ${CONCEPT_EXAMPLE_ADD_BTN}
    Click Element    ${CONCEPT_EXAMPLE_EN}
    Wait Until Page Contains Element    ${CONCEPT_EXAMPLE_EN_TEXTAREA}    timeout=30
    Click Element    ${CONCEPT_EXAMPLE_EN_TEXTAREA}
    Input Text    ${CONCEPT_EXAMPLE_EN_TEXTAREA}    Example
    Wait Until Page Contains Element    ${CONCEPT_SCOPE_INPUT}    timeout=30
    Input Text    ${CONCEPT_SCOPE_INPUT}    Concept scope
    Wait Until Page Contains Element    ${CONCEPT_SCOPE_CLASS_INPUT}    timeout=30
    Input Text    ${CONCEPT_SCOPE_CLASS_INPUT}    Concept scope class
    Wait Until Page Contains Element    ${CONCEPT_WORD_CLASS_INPUT}    timeout=30
    Input Text    ${CONCEPT_WORD_CLASS_INPUT}    Concept word class
    Wait Until Page Contains Element    ${CONCEPT_CHNAGE NOTE_INPUT}    timeout=30
    Input Text    ${CONCEPT_CHNAGE NOTE_INPUT}    Concept change note
    Wait Until Page Contains Element    ${CONCEPT_HISTORY_NOTE_INPUT}    timeout=30
    Input Text    ${CONCEPT_HISTORY_NOTE_INPUT}    Concept change note
    Wait Until Page Contains Element    ${CONCEPT_CONCEPT_NOTATION_INPUT}    timeout=30
    Input Text    ${CONCEPT_CONCEPT_NOTATION_INPUT}    Concept notation
    Wait Until Page Contains Element    ${CONCEPT_STATUS_DDL}    timeout=30
    Click Element    ${CONCEPT_STATUS_DDL}
    Click Element    ${CONCEPT_STATUS_VALID}
    Save Concept
    Sleep    5
    Wait Until Page Contains    Editorial note    timeout=30
    Wait Until Page Contains    Example    timeout=30
    Wait Until Page Contains    Concept scope    timeout=30
    Wait Until Page Contains    Concept scope class    timeout=30
    Wait Until Page Contains    Concept word class    timeout=30
    Wait Until Page Contains    Concept change note    timeout=30
    Wait Until Page Contains    Concept notation    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30
    Log To Console    Concept values modified
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

210. Import Concepts to the Terminological Vocabulary and filter concepts with status value
    [Documentation]    Import Concepts to the Terminological Vocabulary and filter
    ...    concepts with status value.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_2}
    Wait Until Element Is Enabled    ${VOCABULARY_DDL}    timeout=30
    Click Element    ${VOCABULARY_DDL}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${test_concepts_for_status_filter}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Log To Console    Concept import ok
    Wait Until Page Contains Element    ${CONCEPT_FILTER_BTN}    timeout=30
    Click Element    ${CONCEPT_FILTER_BTN}
    Wait Until Page Contains Element    ${CONCEPT_FILTER_DDL}    timeout=30
    Click Element    ${CONCEPT_FILTER_DDL}
    Click Element    ${CONCEPT_INCOMPLETE_STATUS}
    Wait Until Page Contains    Venus    timeout=20
    Wait Until Page Does Not Contain    Jupiter    timeout=60
    Wait Until Page Contains Element    ${CONCEPT_FILTER_DDL}    timeout=30
    Click Element    ${CONCEPT_FILTER_DDL}
    Click Element    ${CONCEPT_DRAFT_STATUS}
    Wait Until Page Contains    Merkurius    timeout=20
    Wait Until Page Does Not Contain    Jupiter    timeout=20
    Wait Until Page Does Not Contain    Kuu    timeout=20
    Wait Until Page Does Not Contain    Mars    timeout=20
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

211. Add external link for concept
    [Documentation]    Create new vocabulary, import concepts and add external link for concept.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Wait Until Element Is Enabled    ${VOCABULARY_DDL}    timeout=30
    Click Element    ${VOCABULARY_DDL}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concept_reference}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Log To Console    Concept import ok
    Edit Concept    Merkurius
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_FI_0_INPUT}    timeout=30
    Click Element    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Wait Until Page Contains Element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait Until Page Contains Element    ${SELECT_LINK_URL_INPUT}    timeout=30
    Input Text    ${SELECT_LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${SELECT_LINK_CONFRIM_BTN}    timeout=30
    Click Element    ${SELECT_LINK_CONFRIM_BTN}
    Save Concept
    Wait Until Page Contains    Planeetta    timeout=30
    Sleep    2
    Wait Until Page Contains Element    ${EXT_LINK}    timeout=30
    Click Element    ${EXT_LINK}
    Sleep    5
    Select Window    title=Etusivu - Suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Sleep    1
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

212. Add concept reference
    [Documentation]    Create new vocabulary, import concepts and add concept reference.
    [Tags]    sanastot    regression    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Wait Until Element Is Enabled    ${VOCABULARY_DDL}    timeout=30
    Click Element    ${VOCABULARY_DDL}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concept_reference}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Sleep    1
    Log To Console    Concept import ok
    Sleep    1
    Edit Concept    Merkurius
    Sleep    2
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_FI_0_INPUT}    timeout=30
    Click Element    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Wait Until Page Contains Element    ${ADD_CONCEPT_REFERENCE}    timeout=30
    Click Element    ${ADD_CONCEPT_REFERENCE}
    Wait Until Page Contains Element    //*[contains(@id,'_search_result_concept')]
    Click Element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait Until Page Contains Element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Wait Until Page Contains Element    ${SELECT_CONCEPT_REFERENCE_DDL}    timeout=30
    Click Element    ${SELECT_CONCEPT_REFERENCE_DDL}
    Wait Until Page Contains Element    ${BROADER_CONCEPT_BTN}    timeout=30
    Click Element    ${BROADER_CONCEPT_BTN}
    Wait Until Page Contains Element    ${SELECT_CONCEPT_CONFIRM_BTN}    timeout=30
    Click Element    ${SELECT_CONCEPT_CONFIRM_BTN}
    Save Concept
    Sleep    5
    Wait Until Page Contains    Planeetta    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF}    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

213. Add definition for concept
    [Documentation]    Create new vocabulary and import concepts. Add another definition in Finnish and concept reference for concept.
    [Tags]    sanastot
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Set Selenium Speed    0.5
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Sleep    1
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_CONCEPT_DEFINITION_BTN}    timeout=30
    Click Element    ${ADD_CONCEPT_DEFINITION_BTN}
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_FI}    timeout=30
    Click Element    ${CONCEPT_DEFINITION_FI}
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_FI_1_INPUT}    timeout=30
    Click Element    ${CONCEPT_DEFINITION_FI_1_INPUT}
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    h
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    u
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    t
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    k
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    i
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    j
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    a
    Sleep    1
    Wait Until Element Is Enabled    ${ADD_CONCEPT_REFERENCE_1}    timeout=30
    Click Element    ${ADD_CONCEPT_REFERENCE_1}
    Wait Until Element Is Enabled    //*[contains(@id,'_search_result_concept')]
    Click Element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait Until Element Is Enabled    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept
    Sleep    5
    Wait Until Page Contains    hutkija    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF_2}    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

214. Add note for concept
    [Documentation]    Create new vocabulary and import concepts. Add another note in Finnish and concept reference for concept.
    [Tags]    sanastot
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}
    Sleep    1
    Edit Concept    tutkija
    Wait Until Page Contains Element    ${ADD_CONCEPT_NOTE_BTN}    timeout=30
    Click Element    ${ADD_CONCEPT_NOTE_BTN}
    Wait Until Page Contains Element    ${CONCEPT_NOTE_FI}    timeout=30
    Click Element    ${CONCEPT_NOTE_FI}
    Wait Until Page Contains Element    ${CONCEPT_NOTE_FI_1_INPUT}    timeout=30
    Click Element    ${CONCEPT_NOTE_FI_1_INPUT}
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    h
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    u
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    t
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    k
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    i
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    j
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    a
    Wait Until Page Contains Element    ${ADD_CONCEPT_NOTE_REFERENCE_1}    timeout=30
    Click Element    ${ADD_CONCEPT_NOTE_REFERENCE_1}
    Wait Until Page Contains Element    //*[contains(@id,'_search_result_concept')]
    Click Element    //*[contains(@id,'_search_result_concept')]
    Sleep    1
    Wait Until Page Contains Element    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=30
    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept
    Sleep    5
    Wait Until Page Contains    hutkija    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF_3}    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_1}

215. Import Concepts in xml format and check concept description links
    [Documentation]    Import Concepts in xml format and check concept description links. YTI-400.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Import Concepts    ${XML_FORMAT_BTN}    ${tax}    ${EMPTY}
    Wait Until Page Contains Element    //*[contains(@id,'c40_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'c40_concept_list_listitem')]
    Wait Until Page Contains Element    //h3[contains(text(), "verotuspäätös")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Verovelvolliselle")]    timeout=30
    Click Element    //*[contains(text(), "Verovelvolliselle")]
    Wait Until Page Contains Element    //h3[contains(text(), "verovelvollinen")]    timeout=30
    Wait Until Page Contains Element    //*[contains(@id,'c40_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'c40_concept_list_listitem')]
    Wait Until Page Contains Element    //h3[contains(text(), "verotuspäätös")]    timeout=30
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "veronpalautuksesta")]    timeout=30
    Click Element    //*[contains(text(), "veronpalautuksesta")]
    Wait Until Page Contains Element    //h3[contains(text(), "veronpalautus")]    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

216. Import Concepts in xml format and check import warnings
    [Documentation]    Import Concepts in xml format and check import warnings
    [Tags]    sanastot
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Select Dictionary    ${VOCABULARY_2}
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Page Contains Element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${FILE_FORMAT_DROPDOWN_BTN}    timeout=30
    Click Element    ${FILE_FORMAT_DROPDOWN_BTN}
    Click Element    ${XML_FORMAT_BTN}
    Choose File    ${FILE_UPLOAD_INPUT}    ${Concepts_with_dropped_items}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=120
    Wait Until Page Contains    67 kohdetta luotu. Virheitä: 0. Varoituksia: 21.    timeout=30
    Wait Until Element Is Visible    //*[contains(text(), "Näytä viestit")]    timeout=30
    Click Element    //*[contains(text(), "Näytä viestit")]
    Wait Until Page Contains    Dropping 'ulottuvuus' type record    timeout=20
    Wait Until Page Contains    c2
    Wait Until Page Contains    c68    timeout=20
    Wait Until Page Contains    [DIAG:c70 LINK-target #c46 <kasvupalvelu palvelun sisällön mukaan> not added into the collection]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "Piilota viestit")]    timeout=30
    Click Element    //*[contains(text(), "Piilota viestit")]
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=120
    Click Element    ${IMPORT_YES_BTN}
    Sleep    5
    Log To Console    Concept import ok
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminological Dictionary    ${VOCABULARY_2}

217. Import Concepts in CSV format with semicolon delimiters
    [Documentation]    Import Concepts in CSV format with semicolon delimiters. YTI-845.
    [Tags]    regression    sanastot    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Import Concepts    ${CSV_FORMAT_BTN}    ${Concepts_with_semicolon_delimiter}    ${SEMICOLON_DELIMITER_BTN}
    Wait Until Page Contains Element    ${CONCEPTS_LIST}    timeout=30
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

218. Visibility of incomplete terminologies
    [Documentation]    Check that incomplete terminologies and concepts are shown
    ...    for organization's own users only in Terminologies frontpage. YTI-907.
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create New Terminology With Parameters    ${VOCABULARY_3}    ${VOCABULARY_STATUS_INCOMPLETE}    Testiorganisaatio    Asuminen    865
    Import Concepts    ${CSV_FORMAT_BTN}    ${test_concepts_for_status_filter}    ${EMPTY}
    Go Back To Sanastot Frontpage
    Create New Terminology With Parameters    ${VOCABULARY_4}    ${VOCABULARY_STATUS_INCOMPLETE}    Automaatiotestaus    Eläkkeet    771
    Import Concepts    ${CSV_FORMAT_BTN}    ${test_concepts_for_status_filter_2}    ${EMPTY}
    Go Back To Sanastot Frontpage
    Select User    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create New Terminology With Parameters    ${VOCABULARY_5}    ${VOCABULARY_STATUS_INCOMPLETE}    Yhteentoimivuusalustan ylläpito    Eläkkeet    267
    Import Concepts    ${CSV_FORMAT_BTN}    ${test_concepts_for_status_filter_2}    ${EMPTY}
    Go Back To Sanastot Frontpage
    Set Frontpage Filters    Abc    ${ALL_ORGANIZATIONS}    ${INCOMPLETE_STATUS}
    Wait Until Element Is Enabled    //*[contains(text(), "123")]    timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "456")]    timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "789")]    timeout=30
    Sleep    1
    Select User    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Element Is Enabled    //*[contains(text(), "123")]    timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "456")]    timeout=30
    Page Should Not Contain Element    //*[contains(text(), "789")]    timeout=30
    Sleep    1
    Select User    ${TEST_TERMINOLOGY_ID}    ${TEST_TERMINOLOGY_NAME}
    Wait Until Element Is Enabled    //*[contains(text(), "123")]    timeout=30
    Page Should Not Contain Element    //*[contains(text(), "456")]    timeout=30
    Page Should Not Contain Element    //*[contains(text(), "789")]    timeout=30
    Sleep    1
    Select User    ${TEST_NOGROUP_ID}    ${TEST_NOGROUP_NAME}
    Page Should Not Contain Element    //*[contains(text(), "123")]    timeout=30
    Page Should Not Contain Element    //*[contains(text(), "456")]    timeout=30
    Page Should Not Contain Element    //*[contains(text(), "789")]    timeout=30
    Sleep    1
    [Teardown]    Delete Terminologies    ${VOCABULARY_3}    ${VOCABULARY_4}    ${VOCABULARY_5}

*** Keywords ***
Restore organization and classification for DRAFT vocabulary
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Page Contains Element    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click Element    ${EDIT_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${REMOVE_ORGANIZATION_2}    timeout=30
    Click Element    ${REMOVE_ORGANIZATION_2}
    Wait Until Page Contains Element    ${REMOVE_CLASSIFICATION_1}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION_1}
    Wait Until Page Contains Element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60
    Sleep    1
    Page should not contain    ${ORGANIZATION_2}
    Page should not contain    ${CLASSIFICATION_1}
    Log To Console    Vocabulary changes restored
    Go Back To Sanastot Frontpage
    Sleep    1
    Close All Browsers
