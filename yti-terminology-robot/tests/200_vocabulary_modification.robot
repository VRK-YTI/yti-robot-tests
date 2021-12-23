*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test case teardown delete terminology     ${VOCABULARY_1}
Test Setup        Test Case Setup admin
Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${EXT_LINK}       //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div/div[2]/div/div/div/div/p/a
${CONCEPT_REF_2}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[1]/dl/dd/app-localized-input/div/div[2]/div[2]/div/div/div/div/p/a
${CONCEPT_REF_3}    //*[@id="conceptsTab-panel"]/app-concepts/div/div/div[3]/div[1]/app-concept/div/form/app-concept-form/div/app-property[2]/dl/dd/app-localized-input/div/div[2]/div[2]/div/div/div/div/p/a
${NAVIGATION_MENU_DDL}    id=nav_item_dropdown_link

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary and add contact information
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select And Edit Dictionary    ${VOCABULARY_1}

    Input Text with wait   ${VOCABULARY_TITLE_TEXTAREA}    Uusi sanasto
    Input Text with wait    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Uusi kuvaus

    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${EDIT_VOCABULARY_BTN}    timeout=60
    Wait Until Page Contains    Uusi sanasto    timeout=20
    Wait Until Page Contains    Uusi kuvaus    timeout=20

    Click Element with wait     ${EDIT_VOCABULARY_BTN}
    Input Text with wait        ${VOCABULARY_TITLE_TEXTAREA}                Testiautomaatiosanasto
    Input Text with wait        ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}       Tämä on kuvaus
    Input Text with wait        ${VOCABULARY_CONTACT_TEXTAREA}              Yhteystiedot tähän

    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60

    Wait Until Page Contains    Testiautomaatiosanasto    timeout=30
    Wait Until Page Contains    Tämä on kuvaus    timeout=30
    Wait Until Page Contains    Yhteydenotto    timeout=30
    Wait Until Page Contains    Yhteystiedot tähän    timeout=30

201. Add new organization and classification for DRAFT vocabulary
    [Documentation]    Add new organization and classification for DRAFT vocabulary
    [Tags]    regression    sanastot    test    200
    [Setup]    Test Case Setup superuser
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select And Edit Dictionary    ${VOCABULARY_1}

    Click Element with wait    ${ADD_ORGANIZATION_BTN}
    Input Text with wait    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Click Element with wait    //*[contains(text(), "${ORGANIZATION_2}")]

    Click Element with wait    ${ADD_CLASSIFICATION_BTN}
    Input Text with wait    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Click Element with wait    //*[contains(text(), "${CLASSIFICATION_1}")]

    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60

    Go Back To Sanastot Frontpage
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains    ${ORGANIZATION_1}    timeout=30
    Wait Until Page Contains    ${CLASSIFICATION_1}    timeout=30
    Wait Until Page Contains    Yhteentoimivuusalustan ylläpito    timeout=30
    Wait Until Page Contains    Eläkkeet    timeout=30
    Wait Until Page Contains    Terminologinen sanasto    timeout=30

    Click Element with wait    //*[contains(text(), "${VOCABULARY_1}")]
    Restore organization and classification for DRAFT vocabulary

203. Add new concept to the existing vocabulary
    [Documentation]    Add new concept to the existing vocabulary and remove concept
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Select Dictionary    ${VOCABULARY_1}
    Click Element with wait    ${ADD_NEW_CONCEPT_BTN}
    Input Text with wait    ${TERM_LITERAL_VALUE_INPUT}    ${TERM_1}

    Click Element with wait    ${ADD_NEW_CONCEPT}
    Input Text with wait    ${SOURCE_INPUT}    Lähde
    Input Text with wait    ${SCOPE_INPUT}    Käyttöala
    Input Text with wait    ${DRAFT_COMMENT_INPUT}    Luonnosvaiheen kommentti
    Input Text with wait    ${HISTORY_NOTE_INPUT}    Käytön historiatieto
    Input Text with wait    ${CHANGENOTE_INPUT}    Muutoshistoriatieto

    Wait Until Page Contains Element    ${TERM_STATUS_DDL}    timeout=30
    Click Element with wait    ${TERM_STATUS_DDL}
    Click button    Voimassa oleva
    Save Concept

    Wait Until Page Contains    Automaatio    timeout=30
    Delete Concept    Automaatio

204. Remove related concept and check confirmation
    [Documentation]    Add new Terminological Dictionary, import vocabulary, delete related concept
    ...    and check remove confirmation, YTI-768.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage

    Select Dictionary    ${VOCABULARY_1}
    Edit Concept    tutkija
    Click Element with wait     //*[contains(@id,'_related_concept_reference_remove_reference_link')]
    Click Element with wait     ${SAVE_CONCEPT_BTN}
    Wait Until Page Contains    Seuraava viite poistuu kokonaan tallennuksen yhteydessä    timeout=30
    Wait Until Page Contains    Viitteen tyyppi    timeout=30
    Wait Until Page Contains    Kohteen sijainti    timeout=30
    Wait Until Page Contains    Kohde    timeout=30
    Wait Until Page Contains    Liittyvä käsite    timeout=30
    Wait Until Page Contains    hutkija    timeout=30

    Click Element with wait    ${REMOVE_LINK_CONFIRMATION_BTN}
    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}    timeout=60

    Page should not contain    Liittyvä käsite

205. Add collection for vocabulary
    [Documentation]    Add new collection to vocabulary and delete collection.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage

    Select Dictionary    ${VOCABULARY_1}
    Add Collection For Vocabulary    Testikäsitevalikoima    Valikoiman määritelmä

    Edit Collection
    Add Broader Concepts For Collection    hotkija    hutkija
    Add Members For Collection    tutkija    tutkimus
    Save Collection

    Wait Until Page Contains Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=30
    Click Element with wait    ${REMOVE_COLLECTION_BTN}
    Click Element with wait    ${CONFIRM_REMOVE_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}
    Wait Until Page Does Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=5
    Page should not contain    Testikäsitevalikoima

    Click Element with wait    ${CONCEPTS_ALPHABETICAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima

    Click Element with wait    ${CONCEPTS_HIERARCHIAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima

206. Modify concept which is defined in collection
    [Documentation]    Add new collection to vocabulary and modify concept which is
    ...    defined in collection broader. Check that collection is not listed
    ...    in alphabetic or hierarchial listing. YTI-1181.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage

    Select Dictionary    ${VOCABULARY_1}
    Add Collection For Vocabulary    Testikäsitevalikoima    Valikoiman määritelmä
    Edit Collection

    Add Broader Concepts For Collection    tutkija    tutkimus
    Add Members For Collection    hotkija    hutkija
    Save Collection

    Wait Until Page Contains Element    //*[contains(@id,'0_collection_list_listitem')]    timeout=30

    Click Element with wait    ${CONCEPTS_ALPHABETICAL_TAB}
    Click Element with wait    //*[contains(@id,'concept-2_concept_list_listitem')]
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]

    Wait until page does not contain    Testikäsitevalikoima
    Edit Concept    tutkija

    Click Element with wait    ${ADD_BROADER_CONCEPT_BTN}
    Click Element with wait    //*[contains(@id,'concept-0_search_result_concept')]
    Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept

    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}
    Wait Until Page Contains Element    //*[contains(@id,'concept-0_concept_broader_concept_reference_concept_link')]    timeout=30
    Reload page

    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima

    Click Element with wait    ${CONCEPTS_HIERARCHIAL_TAB}
    Page Should Not Contain Element    //*[contains(@id,'0_collection_list_listitem')]
    Page should not contain    Testikäsitevalikoima

207. Add preferred term and synonym for concept
    [Documentation]    Create new vocabulary, import concepts and modify concept
    ...    by adding preferred term, synonym and non-recommended synonym.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}

    Edit Concept    tutkija

    Click Element with wait     ${ADD_PREFERRED_TERM_BTN}
    Click Element with wait     ${ADD_PREFERRED_TERM_SV}
    Input Text with wait        ${PREFERRED_TERM_INPUT}    Forskaren
    Click Element with wait     ${ADD_SYNONYM_BTN}
    Click Element with wait     ${ADD_SYNONYM_EN}
    Input Text with wait        ${SYNONYM_INPUT}    Oppinut henkilö
    Click Element with wait     ${NOT_SYNONYM_BTN}
    Click Element with wait     ${NOT_SYNONYM_EN}
    Input Text with wait        ${NOT_SYNONYM_INPUT}    Tarkastelija
    Save Concept

    Wait Until Page Contains    Forskaren    timeout=30
    Wait Until Page Contains    Oppinut henkilö    timeout=30
    Wait Until Page Contains    Tarkastelija    timeout=30

208. Add hidden term for concept
    [Documentation]    Create new vocabulary, import concepts and add hidden term for concept
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}

    Edit Concept    tutkija
    Click Element with wait    ${ADD_HIDDEN_TERM_BTN}
    Click Element with wait    ${ADD_HIDDEN TERM_FI}
    Input Text with wait        ${HIDDEN_TERM_INPUT}    Tieteilijä

    Click Element with wait     ${ADD_HIDDEN_TERM_SOURCE_BTN}
    Input Text with wait        ${HIDDEN_TERM_SOURCE_INPUT}    Ohjaustermin lähde
    Input Text with wait        ${HIDDEN_TERM_SCOPE_INPUT}    Ohjaustermin ala
    Input Text with wait        ${HIDDEN_TERM_STYLE_INPUT}    Älykkö
    Input Text with wait        ${HIDDEN_TERM_FAMILY_INPUT}    Feminiini
    Input Text with wait        ${HIDDEN_TERM_CONJUGATION_INPUT}    Yksikkö
    Input Text with wait        ${HIDDEN_TERM_EQUIVALENCY_INPUT}    >
    Input Text with wait        ${HIDDEN_TERM_WORD_CLASS_INPUT}    Eri sanaluokka
    Input Text with wait        ${HIDDEN_TERM_HOMOGRPAH_INPUT}    9

    Click Element with wait    ${HIDDEN_TERM_NOTE_BTN}
    Input Text with wait        ${HIDDEN_TERM_NOTE_INPUT}    Huomio
    Input Text with wait        ${HIDDEN_TERM_COMMENT_INPUT}    Kommentti
    Input Text with wait        ${HIDDEN_TERM_HISTORY_INPUT}    Termin historia
    Input Text with wait        ${HIDDEN_TERM_CHANGENOTE_INPUT}    Termin muutoshistoriatieto

    Click Element with wait    ${HIDDEN_TERM_STATUS_DDL}
    Click Element with wait    ${HIDDEN_TERM_STATUS_VALID}
    Save Concept

    Click Element with wait    ${HIDDEN_TERM}
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

209. Modify concept
    [Documentation]    Create new vocabulary, import concepts and modify concept values.
    [Tags]    sanastot    regression    test    200
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}

    Edit Concept    tutkija

    Click Element with wait    ${ADD_CONCEPT_EDITORIAL_NOTE_BTN}
    Click Element with wait    ${CONCEPT_EDITORIAL_NOTE_INPUT}
    Input Text with wait    ${CONCEPT_EDITORIAL_NOTE_INPUT}    Editorial note
    Click Element with wait    ${CONCEPT_EXAMPLE_ADD_BTN}
    Click Element with wait    ${CONCEPT_EXAMPLE_EN}
    Click Element with wait    ${CONCEPT_EXAMPLE_EN_TEXTAREA}
    Input Text with wait    ${CONCEPT_EXAMPLE_EN_TEXTAREA}    Example
    Input Text with wait    ${CONCEPT_SCOPE_INPUT}    Concept scope
    Input Text with wait    ${CONCEPT_SCOPE_CLASS_INPUT}    Concept scope class
    Input Text with wait    ${CONCEPT_WORD_CLASS_INPUT}    Concept word class
    Input Text with wait    ${CONCEPT_CHNAGE NOTE_INPUT}    Concept change note
    Input Text with wait    ${CONCEPT_HISTORY_NOTE_INPUT}    Concept change note
    Input Text with wait    ${CONCEPT_CONCEPT_NOTATION_INPUT}    Concept notation

    Click Element with wait    ${CONCEPT_STATUS_DDL}
    Click Element with wait    ${CONCEPT_STATUS_VALID}
    Save Concept

    Wait Until Page Contains    Editorial note    timeout=30
    Wait Until Page Contains    Example    timeout=30
    Wait Until Page Contains    Concept scope    timeout=30
    Wait Until Page Contains    Concept scope class    timeout=30
    Wait Until Page Contains    Concept word class    timeout=30
    Wait Until Page Contains    Concept change note    timeout=30
    Wait Until Page Contains    Concept notation    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30

210. Import Concepts to the Terminological Vocabulary and filter concepts with status value
    [Documentation]    Import Concepts to the Terminological Vocabulary and filter
    ...    concepts with status value.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Go Back To Sanastot Frontpage

    Select Dictionary    ${VOCABULARY_2}
    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}

    ${csv_file_path}=   Create terminology test concepts for status filter csv
    Choose File    ${FILE_UPLOAD_INPUT}    ${csv_file_path}

    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element with wait    ${FILE_UPLOAD_BTN}
    Click Element with wait    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120

    Click Element with wait    ${CONCEPT_FILTER_BTN}
    Click Element with wait    ${CONCEPT_FILTER_DDL}
    Click Element with wait    ${CONCEPT_INCOMPLETE_STATUS}
    Wait Until Page Contains    Venus    timeout=20
    Wait Until Page Does Not Contain    Jupiter    timeout=60

    Click Element with wait    ${CONCEPT_FILTER_DDL}
    Click Element with wait    ${CONCEPT_DRAFT_STATUS}
    Wait Until Page Contains    Merkurius    timeout=20
    Wait Until Page Does Not Contain    Jupiter    timeout=20
    Wait Until Page Does Not Contain    Kuu    timeout=20
    Wait Until Page Does Not Contain    Mars    timeout=20
    [Teardown]  Test case teardown delete terminology     ${VOCABULARY_2}

211. Add external link for concept
    [Documentation]    Create new vocabulary, import concepts and add external link for concept.
    [Tags]    sanastot    regression    test    200
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}

    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}

    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    ${csv_file_path}=   Create terminology concept reference csv
    Choose File    ${FILE_UPLOAD_INPUT}    ${csv_file_path}
    Click Element with wait    ${FILE_UPLOAD_BTN}
    Click Element with wait    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120

    Edit Concept    Merkurius

    Click Element with wait    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Click Element with wait    ${ADD_LINK}
    Input Text with wait    ${SELECT_LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${SELECT_LINK_CONFRIM_BTN}    timeout=30
    Click Element with wait    ${SELECT_LINK_CONFRIM_BTN}
    Save Concept

    Wait Until Page Contains    Planeetta    timeout=30
    Click Element with wait    ${EXT_LINK}

    Switch window with wait  title=Etusivu - Suomi.fi
    [Teardown]  Test case teardown delete terminology     ${VOCABULARY_2}

212. Add concept reference
    [Documentation]    Create new vocabulary, import concepts and add concept reference.
    [Tags]    sanastot    test    200
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}

    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}

    ${csv_file_path}=   Create terminology concept reference csv
    Choose File    ${FILE_UPLOAD_INPUT}    ${csv_file_path}
    Click Element with wait    ${FILE_UPLOAD_BTN}
    Click Element with wait    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120

    Edit Concept    Merkurius

    Click Element with wait    ${CONCEPT_DEFINITION_FI_0_INPUT}
    Click Element with wait    ${ADD_CONCEPT_REFERENCE}
    Click Element with wait    //*[contains(@id,'_search_result_concept')]
    Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Click Element with wait    ${SELECT_CONCEPT_REFERENCE_DDL}
    Click Element with wait    ${BROADER_CONCEPT_BTN}
    Click Element with wait    ${SELECT_CONCEPT_CONFIRM_BTN}
    Save Concept

    Wait Until Page Contains    Planeetta    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF}    timeout=30

    [Teardown]    Test case teardown delete terminology    ${VOCABULARY_2}

213. Add definition for concept
    [Documentation]    Create new vocabulary and import concepts. Add another definition in Finnish and concept reference for concept.
    [Tags]    sanastot
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage
    Select Dictionary    ${VOCABULARY_1}

    Edit Concept    tutkija
    Click Element with wait    ${ADD_CONCEPT_DEFINITION_BTN}
    Click Element with wait    ${CONCEPT_DEFINITION_FI}
    Click Element with wait    ${CONCEPT_DEFINITION_FI_1_INPUT}

    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    h
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    u
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    t
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    k
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    i
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    j
    Press key    ${CONCEPT_DEFINITION_FI_1_INPUT}    a

    Click Element with wait    ${ADD_CONCEPT_REFERENCE_1}
    Click Element with wait    //*[contains(@id,'_search_result_concept')]

    Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept

    Wait Until Page Contains    hutkija    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF_2}    timeout=30

214. Add note for concept
    [Documentation]    Create new vocabulary and import concepts. Add another note in Finnish and concept reference for concept.
    [Tags]    sanastot
    Create Terminological Vocabulary with concepts    ${VOCABULARY_1}
    Maximize Browser Window
    Go Back To Sanastot Frontpage

    Select Dictionary    ${VOCABULARY_1}

    Edit Concept    tutkija
    Click Element with wait    ${ADD_CONCEPT_NOTE_BTN}
    Click Element with wait    ${CONCEPT_NOTE_FI}
    Click Element with wait    ${CONCEPT_NOTE_FI_1_INPUT}

    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    h
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    u
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    t
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    k
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    i
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    j
    Press key    ${CONCEPT_NOTE_FI_1_INPUT}    a

    Click Element with wait    ${ADD_CONCEPT_NOTE_REFERENCE_1}
    Click Element with wait    //*[contains(@id,'_search_result_concept')]

    Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    Save Concept

    Wait Until Page Contains    hutkija    timeout=30
    Wait Until Page Contains Element    ${CONCEPT_REF_3}    timeout=30

215. Import Concepts in xml format and check concept description links
    [Documentation]    Import Concepts in xml format and check concept description links. YTI-400.
    [Tags]    regression    sanastot    test    200
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    Import Concepts    ${XML_FORMAT_BTN}    ${tax}    ${EMPTY}

    Click Element with wait             //*[contains(@id,'c40_concept_list_listitem')]
    Click Element with wait             //*[contains(text(), "Verovelvolliselle")]
    Click Element with wait             //*[contains(@id,'c40_concept_list_listitem')]
    Click Element with wait             //*[contains(text(), "veronpalautuksesta")]
    Wait Until Page Contains Element    //h3[contains(text(), "veronpalautus")]    timeout=30

    [Teardown]    Test case teardown delete terminology    ${VOCABULARY_2}

216. Import Concepts in xml format and check import warnings
    [Documentation]    Import Concepts in xml format and check import warnings
    [Tags]    sanastot
    [Setup]    Test Case Setup Create Terminological Vocabulary without concepts
    Select Dictionary    ${VOCABULARY_2}

    Click Element with wait    ${TERMINOLOGY_TAB}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}
    Click Element with wait    ${FILE_FORMAT_DROPDOWN_BTN}
    Click Element with wait    ${XML_FORMAT_BTN}

    Choose File    ${FILE_UPLOAD_INPUT}    ${Concepts_with_dropped_items}
    Click Element with wait    ${FILE_UPLOAD_BTN}

    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=120
    Wait Until Page Contains    67 kohdetta luotu. Virheitä: 0. Varoituksia: 21.    timeout=30

    Click Element with wait    //*[contains(text(), "Näytä viestit")]
    Wait Until Page Contains    Dropping 'ulottuvuus' type record    timeout=20
    Wait Until Page Contains    c2
    Wait Until Page Contains    c68    timeout=20
    Wait Until Page Contains    [DIAG:c70 LINK-target #c46 <kasvupalvelu palvelun sisällön mukaan> not added into the collection]    timeout=20

    Click Element with wait    //*[contains(text(), "Piilota viestit")]
    Click Element with wait    ${IMPORT_YES_BTN}    timeout=120

    [Teardown]    Test case teardown delete Terminological Dictionary    ${VOCABULARY_2}

217. Import Concepts in CSV format with semicolon delimiters
    [Documentation]    Import Concepts in CSV format with semicolon delimiters. YTI-845.
    [Tags]    regression    sanastot    200
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Maximize Browser Window
    Select Dictionary    ${VOCABULARY_2}
    ${csv_file_path}=   Create terminology Concepts with semicolon delimiter csv
    Import Concepts    ${CSV_FORMAT_BTN}    ${csv_file_path}    ${SEMICOLON_DELIMITER_BTN}
    Wait Until Page Contains Element    ${CONCEPTS_LIST}    timeout=30

    [Teardown]    Test case teardown delete terminology    ${VOCABULARY_2}

218. Visibility of incomplete terminologies
    [Documentation]    Check that incomplete terminologies and concepts are shown
    ...    for organization's own users only in Terminologies frontpage. YTI-907.
    [Tags]    regression    sanastot    test    200
    Create New Terminology With Parameters    ${VOCABULARY_3}    ${VOCABULARY_STATUS_INCOMPLETE}    Testiorganisaatio    Asuminen    865
    ${csv_file_path}=   Create terminology test concepts for status filter csv
    Import Concepts    ${CSV_FORMAT_BTN}    ${csv_file_path}    ${EMPTY}
    Go Back To Sanastot Frontpage

    Create New Terminology With Parameters    ${VOCABULARY_4}    ${VOCABULARY_STATUS_INCOMPLETE}    Automaatiotestaus    Eläkkeet    771
    ${csv_file_path}=   Create terminology test concepts for status filter 2 csv
    Import Concepts    ${CSV_FORMAT_BTN}    ${csv_file_path}    ${EMPTY}
    Go Back To Sanastot Frontpage

    Close all browsers
    Open sanastot
    Select superuser user
    Create New Terminology With Parameters    ${VOCABULARY_5}    ${VOCABULARY_STATUS_INCOMPLETE}    Yhteentoimivuusalustan ylläpito    Eläkkeet    267
    ${csv_file_path}=   Create terminology test concepts for status filter 2 csv
    Import Concepts    ${CSV_FORMAT_BTN}    ${csv_file_path}    ${EMPTY}

    Go Back To Sanastot Frontpage
    Set Frontpage Filters    Abc    ${ALL_ORGANIZATIONS}    ${INCOMPLETE_STATUS}
    Wait Until Element Is Enabled    //*[contains(text(), "123")]    timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "456")]    timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "789")]    timeout=30

    Close all browsers
    Open sanastot
    Select admin user
    Wait Until Element Is Enabled    //*[contains(text(), "123")]       timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "456")]       timeout=30
    wait until page does not contain element    //*[contains(text(), "789")]    timeout=30

    Close all browsers
    Open sanastot
    Select terminology user
    Wait Until Element Is Enabled    //*[contains(text(), "123")]    timeout=30
    wait until page does not contain element    //*[contains(text(), "456")]    timeout=30
    wait until page does not contain element    //*[contains(text(), "789")]    timeout=30

    #Close all browsers
    #Open sanastot
    #Select no group user
    #wait until page does not contain element    //*[contains(text(), "123")]    timeout=30
    #wait until page does not contain element    //*[contains(text(), "456")]    timeout=30
    #wait until page does not contain element    //*[contains(text(), "789")]    timeout=30

    [Teardown]    Test case teardown delete Terminologies    ${VOCABULARY_3}    ${VOCABULARY_4}    ${VOCABULARY_5}

