*** Settings ***
Documentation     Test Suite for basic functionality of Data Vocabularies application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Variables ***
${class}          Maksu
${class_2}        auto
${namespace}      Julkishallinnon tietokomponentit
${attribute}      Entinen nimi
${association}    Jäsen
${classification}    Asuminen
${contributor}    Testiorganisaatio
${vocabulary}     JHSMETA
${new_class_link}    //*[contains(@id,'create_new_LuoUusiLuokka')]
${external_uri}    http://uri.suomi.fi/datamodel/ns/jhs#Maksu
${class_property_po_box}    id=select_property_attribute_Postilokero-osoite_checkbox
${class_property_post_code}    id=select_property_attribute_Postinumero_checkbox
${class_property_post_name}    id=select_property_attribute_Postitoimipaikka_checkbox
${concept}        liikenneväline
${class_item_person}    Päätös
${class_item_record}    Maksu
${class_item_time_period}    Ajanjakso

*** Test Cases ***
200. Modify profile
    [Documentation]    Modify existing profile
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log to Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log to Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait until page contains element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log to Console    New link added
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log to Console    Modifications saved
    Sleep    2
    Page should contain    Uusi nimi
    Page should contain    Uusi kuvaus
    Page should contain    Kulttuuri
    Page should contain    Väestörekisterikeskus
    Page should contain    www.suomi.fi/etusivu/
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    Uusi nimi

201. Add new class to profile
    [Documentation]    Add new class to profile
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add class    Päätös
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Päätös" added
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

202. Add new Core Vocabulary
    [Documentation]    Add new Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup
    Create Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary created
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Automaatiokirjasto Core Vocabulary

203. Modify Core Vocabulary
    [Documentation]    Modify Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary created
    Select and edit Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary selcted
    Wait until page contains element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log to Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log to Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait until page contains element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log to Console    New link added
    Sleep    3
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log to Console    Modifications saved
    Sleep    2
    Page should contain    Uusi nimi
    Page should contain    Uusi kuvaus
    Page should contain    Kulttuuri
    Page should contain    Väestörekisterikeskus
    Page should contain    www.suomi.fi/etusivu/
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    Uusi nimi

204. Add new attribute and association
    [Documentation]    Add new attribute and association for class
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add class    Päätös
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Päätös" added
    Add attribute    Entinen nimi
    Save class
    Log to Console    Attribute "Entinen nimi" added to class "Päätös"
    Sleep    2
    Add association    Jäsen
    Save class
    Log to Console    Association "Jäsen" added to class "Päätös"
    Sleep    2
    Page should contain    Entinen nimi
    Page should contain    Jäsen
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

205. Add association between two classes
    [Documentation]    Add association between two classes
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Add class    Päätös
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Päätös" added
    Add class    Maksu
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Maksu" added
    Sleep    1
    Add association    Rekisteröinti
    Log to Console    Association "Rekisteröinti" added
    Wait until page contains element    ${VALUE_CLASS_BTN}    timeout=30
    Click Element    ${VALUE_CLASS_BTN}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    Päätös
    Click Element    //*[contains(text(), "Päätös")]
    Sleep    2
    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2
    Save class
    Page should contain    Rekisteröinti
    Page should contain    autom:Paatos
    Log to Console    Association "Rekisteröinti" added between "Päätös" and "Maksu"
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

206. Create new class without referencing concept
    [Documentation]    Create new class without referencing concept
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Create new class without referencing concept    ${new_class_link}    automobiili
    Save class
    Page should contain    Automobiili
    Log to Console    Class "Automobiili" added without referencing concept
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

207. Create new shape by referencing external uri
    [Documentation]    Create new shape by referencing external uri
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Create new shape by referencing external uri    ${external_uri}    ${class}
    Confirm all properties for class and save
    Page should contain    Maksu
    Log to Console    Shape "Maksu" added by referencing external uri
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

208. Add new class to profile and remove properties
    [Documentation]    Add new class to profile and remove properties
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add class    Postiosoite
    Sleep    2
    Deselect properties for class and save    ${class_property_po_box}    ${class_property_post_code}    ${class_property_post_name}
    Page should not contain element    //*[contains(text(), "Postilokero-osoite")]
    Page should not contain element    //*[contains(text(), "Postinumero")]
    Page should not contain element    //*[contains(text(), "Postitoimipaikka")]
    Log to Console    PO box, post code and post name properties removed from class
    Log to Console    Class "Postiosoite" added
    Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

209. Create new class and add referencing concept
    [Documentation]    Create new class and add referencing concept
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${vocabulary}
    Save model
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Log to Console    Vocabulary "JHSMETA" added
    Hide model details
    Create new class without referencing concept    ${new_class_link}    automobiili
    Page should contain    Automobiili
    Log to Console    Class "Automobiili" added without referencing concept
    Sleep    1
    Change concept for class    ${concept}
    Save class
    Page should contain    liikennevälineen määritelmä
    Log to Console    Concept definition "liikenneväline" added for "automobiili"
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

210. Add several classes to profile, check history and remove one class
    [Documentation]    Add several classes to profile, check class history information and remove one class
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add several classes    ${class_item_person}    ${class_item_record}    ${class_item_time_period}
    Sleep    2
    Page should contain element    //*[contains(@id, 'Ajanjakso_tabset_link')]
    Page should contain element    //*[contains(@id, 'Paatos_tabset_link')]
    Page should contain element    //*[contains(@id, 'Maksu_tabset_link')]
    Log to Console    Class "Päätös" added
    Log to Console    Class "Maksu" added
    Log to Console    Class "Ajanjakso" added
    Sleep    1
    Wait until page contains element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Click Element    //*[contains(@id, 'Ajanjakso_tabset_link')]
    Wait until page contains element    ${SHOW_HISTORY_BTN}    timeout=30
    Click Element    ${SHOW_HISTORY_BTN}
    Wait until page contains    Historialliset versiot    timeout=10
    Log to Console    History for class "Ajanjakso" opened
    Wait until page contains element    ${CLOSE_HISTORY_BTN}    timeout=30
    Click Element    ${CLOSE_HISTORY_BTN}
    Wait until page contains element    ${REMOVE_CLASS_BTN}    timeout=30
    Click Element    ${REMOVE_CLASS_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Page should not contain element    //*[contains(@id, 'Ajanjakso_tabset_link')]
    Log to Console    Class "Ajanjakso" removed
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

211. Add reference data for profile
    [Documentation]    Create profile and add reference data for that profile
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Wait until page contains element    ${ADD_REF_DATA_BTN}    timeout=30
    Click Element    ${ADD_REF_DATA_BTN}
    Sleep    7
    Wait until page contains element    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait until page contains element    //*[contains(text(), "Voimassa oleva")]    timeout=30
    Click Element    //*[contains(text(), "Voimassa oleva")]
    Wait until page contains element    ${SEARCH_REF_DATA_INPUT}    timeout=30
    Input Text    ${SEARCH_REF_DATA_INPUT}    Kunnat 2018
    Sleep    3
    Wait until page contains element    //*[contains(text(), "Kunnat 2018")]    timeout=30
    Click Element    //*[contains(text(), "Kunnat 2018")]
    Wait until page contains element    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait until page contains element    //*[contains(text(), "Kaikki tilat")]    timeout=30
    Click Element    //*[contains(text(), "Kaikki tilat")]
    Page should contain    Koodiston URI
    Page should contain    Koodiston tila
    Page should contain    Voimassa oleva
    Page should contain    Koodiston nimi
    Page should contain    Tunniste
    Page should contain    005
    Page should contain    Alajärvi
    Wait until page contains element    ${USE_SELCTION_BTN}    timeout=30
    Click Element    ${USE_SELCTION_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Sleep    2
    Wait until page contains    Kunnat 2018
    Log to Console    Reference data "Kunnat 2018" added for profile
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

*** Keywords ***
Select and edit Testiautomaatio profile
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}

Select and edit Automaatiokirjasto Core Vocabulary
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${MODIFY_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${MODIFY_CORE_VOCABULARY_BTN}

Add classification
    [Arguments]    ${classification}
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "${classification}")]    timeout=30
    Click Element    //*[contains(text(), "${classification}")]
    Sleep    2
    Log to Console    New classification ${classification} added

Add contributor
    [Arguments]    ${contributor}
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "${contributor}")]    timeout=30
    Click Element    //*[contains(text(), "${contributor}")]
    Sleep    2
    Log to Console    New contributor ${contributor} added

Add vocabulary
    [Arguments]    ${vocabulary}
    Wait until page contains element    ${ADD_VOCABULARY}    timeout=30
    Click Element    ${ADD_VOCABULARY}
    Wait until page contains element    ${SEARCH_VOCABULARY_INPUT}    timeout=30
    Input Text    ${SEARCH_VOCABULARY_INPUT}    ${vocabulary}
    Click Element    //*[contains(text(), "${vocabulary}")]
    Sleep    2
    Wait until page contains element    //*[contains(text(), "${vocabulary}")]    timeout=30
    Click Element    //*[contains(text(), "${vocabulary}")]
    Sleep    2

Import namespace
    [Arguments]    ${namespace}
    Wait until page contains element    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait until page contains element    ${SEARCH_NAMESPACE_INPUT}    timeout=30
    Input Text    ${SEARCH_NAMESPACE_INPUT}    ${namespace}
    Click Element    //*[contains(text(), "${namespace}")]
    Sleep    2
    Log to Console    New namespace ${namespace} added

Save model
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Sleep    2

Add class
    [Arguments]    ${class}
    Wait until page contains element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    2
    Click Element    //*[contains(text(), "${class}")]
    Sleep    2
    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2

Add several classes
    [Arguments]    @{class_items}
    : FOR    ${class_item}    IN    @{class_items}
    \    Wait until page contains element    ${ADD_NEW_CLASS}    timeout=30
    \    Click Element    ${ADD_NEW_CLASS}
    \    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    \    Input Text    ${SEARCH_CLASS_INPUT}    ${class_item}
    \    Click Element    //*[contains(text(), "${class_item}")]
    \    Sleep    2
    \    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    \    Click Element    ${SPECIALIZE_CLASS}
    \    Sleep    1
    \    Confirm all properties for class and save
    \    Sleep    2

Save class
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Sleep    2

Hide model details
    Wait until page contains element    ${HIDE_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${HIDE_MODEL_DETAILS_BTN}
    Sleep    2

Confirm all properties for class and save
    Wait until page contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Sleep    2
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Sleep    2

Deselect properties for class and save
    [Arguments]    @{class_properties}
    : FOR    ${class_property}    IN    @{class_properties}
    \    Unselect Checkbox    ${class_property}
    \    Checkbox Should Not Be Selected    ${class_property}
    Wait until page contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Sleep    2

Add attribute
    [Arguments]    ${attribute}
    Wait until page contains element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait until page contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until page contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Sleep    4
    Wait until page contains element    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    Sleep    2
    Click Element    //*[contains(text(), "Attribuutti")]
    Wait until page contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Click Element    //*[contains(text(), "${attribute}")]
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Add association
    [Arguments]    ${association}
    Wait until page contains element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait until page contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until page contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Sleep    4
    Wait until page contains element    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    Sleep    2
    Click Element    //*[contains(text(), "Assosiaatio")]
    Wait until page contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${association}
    Click Element    //*[contains(text(), "${association}")]
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Change concept for class
    [Arguments]    ${concept}
    Wait until page contains element    ${CHANGE_CONCEPT}    timeout=30
    Click Element    ${CHANGE_CONCEPT}
    Wait until page contains element    ${SEARCH_CONCEPT_DB_INPUT}    timeout=30
    Input Text    ${SEARCH_CONCEPT_DB_INPUT}    ${concept}
    Wait until page contains element    //*[contains(text(), "${concept}")]    timeout=30
    Click Element    //*[contains(text(), "${concept}")]
    Sleep    2
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Create new class without referencing concept
    [Arguments]    ${new_class_link}    ${class_2}
    Wait until page contains element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class_2}
    Sleep    2
    Click Element    ${new_class_link}
    Sleep    8
    Click Element    ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}
    sleep    2
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Create new shape by referencing external uri
    [Arguments]    ${external_uri}    ${class}
    Wait until page contains element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    2
    Click Element    ${CREATE_NEW_SHAPE_BY_REF_URI}
    Sleep    2
    Input Text    ${EXTERNAL_URI_INPUT}    ${external_uri}
    Sleep    2
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Delete profile
    [Arguments]    ${profile}
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait until page contains element    //*[contains(text(), "${profile}")]    timeout=30
    Click Element    //*[contains(text(), "${profile}")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains    tietomallia    timeout=30
    Log to Console    "${profile}" profile deleted
    Sleep    2
    Close All Browsers
