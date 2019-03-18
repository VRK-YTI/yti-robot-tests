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
${vocabulary}     Verotussanasto
${new_class_link}    //*[contains(@id,'create_new_LuoUusiLuokka')]
${external_uri}    http://uri.suomi.fi/datamodel/ns/jhs#Maksu
${class_property_po_box}    id=select_property_attribute_Postilokero-osoite_checkbox
${class_property_post_code}    id=select_property_attribute_Postinumero_checkbox
${class_property_post_name}    id=select_property_attribute_Postitoimipaikka_checkbox
${concept}        ansiotulo
${class_item_1}    Rooli
${class_item_2}    Maksu
${class_item_3}    Ajanjakso

*** Test Cases ***
200. Modify profile
    [Documentation]    Modify existing profile
    [Tags]    regression    tietomallit    test    200
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
    Save model
    Log to Console    Modifications saved
    Wait until page contains    Uusi nimi    timeout=30
    Wait until page contains    Uusi kuvaus    timeout=30
    Wait until page contains    Kulttuuri    timeout=30
    Wait until page contains    Väestörekisterikeskus    timeout=30
    Wait until page contains    www.suomi.fi/etusivu/    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    Uusi nimi

201. Add new class to profile
    [Documentation]    Add new class to profile
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Rooli" added
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

202. Add new Core Vocabulary
    [Documentation]    Add new Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Automaatiokirjasto Core Vocabulary
    #Create Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary created
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Automaatiokirjasto Core Vocabulary

203. Modify Core Vocabulary
    [Documentation]    Modify Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test    200
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
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Rooli" added
    Add attribute    Entinen nimi
    Save class
    Log to Console    Attribute "Entinen nimi" added to class "Rooli"
    Sleep    2
    Add association    Jäsen
    Save class
    Log to Console    Association "Jäsen" added to class "Rooli"
    Sleep    2
    Wait until page contains    Entinen nimi    timeout=30
    Wait until page contains    Jäsen    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

205. Add association between two classes
    [Documentation]    Add association between two classes
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Rooli" added
    Add class    Maksu    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log to Console    Class "Maksu" added
    Sleep    1
    Add association    Rekisteröinti
    Log to Console    Association "Rekisteröinti" added
    Wait until page contains element    ${VALUE_CLASS_BTN}    timeout=30
    Click Element    ${VALUE_CLASS_BTN}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    Rooli
    Click Element    //*[contains(text(), "Rooli")]
    Sleep    2
    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2
    Save class
    Page should contain    Rekisteröinti
    Page should contain    autom:Rooli
    Log to Console    Association "Rekisteröinti" added between "Rooli" and "Maksu"
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

206. Create new class without referencing concept
    [Documentation]    Create new class without referencing concept
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Create new class without referencing concept    ${new_class_link}    automobiili
    Save class
    Wait until page contains    Automobiili    timeout=30
    Log to Console    Class "Automobiili" added without referencing concept
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

207. Create new shape by referencing external uri
    [Documentation]    Create new shape by referencing external uri
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Create new shape by referencing external uri    ${external_uri}    ${class}
    Confirm all properties for class and save
    Wait until page contains    Maksu    timeout=30
    Log to Console    Shape "Maksu" added by referencing external uri
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

208. Add new class to profile and remove properties
    [Documentation]    Add new class to profile and remove properties
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add class    Postiosoite    ${NAMESPACE_1}
    Sleep    2
    Deselect properties for class and save    ${class_property_po_box}    ${class_property_post_code}    ${class_property_post_name}
    Wait until page does not contain element    //*[contains(text(), "Postilokero-osoite")]    timeout=30
    Wait until page does not contain element    //*[contains(text(), "Postinumero")]    timeout=30
    Wait until page does not contain element    //*[contains(text(), "Postitoimipaikka")]    timeout=30
    Log to Console    PO box, post code and post name properties removed from class
    Log to Console    Class "Postiosoite" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

209. Create new class and add referencing concept
    [Documentation]    Create new class and add referencing concept
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${vocabulary}
    Save model
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Log to Console    Vocabulary "Verotussanasto" added
    Hide model details
    Create new class without referencing concept    ${new_class_link}    liksa
    Page should contain    Liksa
    Log to Console    Class "Liksa" added without referencing concept
    Sleep    1
    Change concept for class    ${concept}
    Save class
    Wait until page contains    Käsitteen määritelmä    timeout=30
    Wait until page contains    muu tulo kuin pääomatulo    timeout=30
    Log to Console    Concept definition "ansiotulo" added for "liksa"
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

210. Add several classes to profile, check history and remove one class
    [Documentation]    Add several classes to profile, check class history information and remove one class
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Hide model details
    Add several classes    ${class_item_1}    ${class_item_2}    ${class_item_3}
    Wait until page contains element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Wait until page contains element    //*[contains(@id, 'Rooli_tabset_link')]    timeout=30
    Wait until page contains element    //*[contains(@id, 'Maksu_tabset_link')]    timeout=30
    Log to Console    Class "Rooli" added
    Log to Console    Class "Maksu" added
    Log to Console    Class "Ajanjakso" added
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
    Wait until page does not contain element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Log to Console    Class "Ajanjakso" removed
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

211. Add reference data for profile
    [Documentation]    Create profile and add reference data for that profile
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Wait until page contains element    ${ADD_REF_DATA_BTN}    timeout=30
    Click Element    ${ADD_REF_DATA_BTN}
    Wait until element is visible    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait until page contains element    //*[contains(text(), "Voimassa oleva")]    timeout=30
    Click Element    //*[contains(text(), "Voimassa oleva")]
    Wait until page contains element    ${SEARCH_REF_DATA_INPUT}    timeout=30
    Input Text    ${SEARCH_REF_DATA_INPUT}    Kunnat 2018
    Wait until element is visible    //*[contains(text(), "Kunnat 2018")]    timeout=60
    Click Element    //*[contains(text(), "Kunnat 2018")]
    Sleep    2
    Wait until page contains element    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait until page contains element    //*[contains(text(), "Kaikki tilat")]    timeout=30
    Click Element    //*[contains(text(), "Kaikki tilat")]
    Wait until page contains    Koodiston URI    timeout=30
    Wait until page contains    Koodiston tila    timeout=30
    Wait until page contains    Voimassa oleva    timeout=30
    Wait until page contains    Koodiston nimi    timeout=30
    Wait until page contains    Tunniste    timeout=30
    Wait until page contains    005    timeout=30
    Wait until page contains    Alajärvi    timeout=30
    Wait until page contains element    ${USE_SELCTION_BTN}    timeout=30
    Click Element    ${USE_SELCTION_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Wait until element is visible    ${MODIFY_MODEL}    timeout=30
    Wait until page contains    Kunnat 2018    timeout=30
    Log to Console    Reference data "Kunnat 2018" added for profile
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}
