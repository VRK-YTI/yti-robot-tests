*** Settings ***
Documentation     Test Suite for basic functionality of Data Vocabularies application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot
Resource          resources/Terminologies_Resources.robot

*** Variables ***
${class}          Maksu
${class_2}        auto
${namespace}      Julkishallinnon tietokomponentit
${attribute}      Entinen nimi
${association}    Jäsen
${classification}    Asuminen
${contributor}    Testiorganisaatio
${vocabulary}     Verotussanasto
${external_uri}    http://uri.suomi.fi/datamodel/ns/jhs#Maksu
${class_property_po_box}    id=select_property_attribute_Postilokero-osoite_checkbox
${class_property_post_code}    id=select_property_attribute_Postinumero_checkbox
${class_property_post_name}    id=select_property_attribute_Postitoimipaikka_checkbox
${class_item_1}    Rooli
${class_item_2}    Maksu
${class_item_3}    Ajanjakso
${predicate_change_error}    Predikaatin tyyppiä ei voida muuttaa koska seuraavat resurssit käyttävät sitä
${class_json_ld_frame}    blob:https://tietomallit.dev.yti.cloud.vrk.fi/46f77ed0-82b6-4d57-b771-fc9a92bf1f17
${class_json_ld_frame_test}    blob:https://tietomallit.dev.yti.cloud.vrk.fi/a93dc0f7-ee66-48ea-8723-85c89ea28e9c
${class_framed_json_ld}    blob:https://tietomallit.dev.yti.cloud.vrk.fi/61658254-be26-4815-a168-a9f4325d8d15
${class_framed_json_ld_test}    blob:https://tietomallit.dev.yti.cloud.vrk.fi/cad2b19c-faee-4aca-942c-2775ef13e268

*** Test Cases ***
200. Modify profile
    [Documentation]    Modify existing profile
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select And Edit Profile    Testiautomaatio
    Log To Console    Testiautomaatio profile selected
    Wait Until Page Contains Element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    Uusi nimi
    Wait Until Page Contains Element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait Until Page Contains Element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log To Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log To Console    New classification added
    Wait Until Page Contains Element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log To Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
    Wait Until Page Contains Element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait Until Page Contains Element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait Until Page Contains Element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log To Console    New link added
    Save model
    Log To Console    Modifications saved
    Wait Until Page Contains    Uusi nimi    timeout=30
    Wait Until Page Contains    Uusi kuvaus    timeout=30
    Wait Until Page Contains    Kulttuuri    timeout=30
    Wait Until Page Contains    Väestörekisterikeskus    timeout=30
    Wait Until Page Contains    www.suomi.fi/etusivu/    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    Uusi nimi

201. Add new class to profile
    [Documentation]    Add new class to profile
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select And Edit Profile    Testiautomaatio
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add class    Rooli    ${NAMESPACE_1}
    Confirm all properties for class and save
    Log To Console    Class "Rooli" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

202. Add new Core Vocabulary
    [Documentation]    Add new Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Log To Console    Automaatiokirjasto Core Vocabulary created
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Automaatiokirjasto Core Vocabulary

203. Modify Core Vocabulary
    [Documentation]    Modify Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Log To Console    Automaatiokirjasto Core Vocabulary created
    Select And Edit Core Vocabulary    Automaatiokirjasto
    Log To Console    Automaatiokirjasto Core Vocabulary selcted
    Wait Until Page Contains Element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    Uusi nimi
    Wait Until Page Contains Element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait Until Page Contains Element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log To Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log To Console    New classification added
    Wait Until Page Contains Element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log To Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
    Wait Until Page Contains Element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait Until Page Contains Element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait Until Page Contains Element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait Until Page Contains Element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log To Console    New link added
    Sleep    3
    Wait Until Page Contains Element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log To Console    Modifications saved
    Sleep    2
    Wait Until Page Contains    Uusi nimi    timeout=30
    Wait Until Page Contains    Uusi kuvaus    timeout=30
    Wait Until Page Contains    Kulttuuri    timeout=30
    Wait Until Page Contains    Väestörekisterikeskus    timeout=30
    Wait Until Page Contains    www.suomi.fi/etusivu/    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    Uusi nimi

204. Add new attribute and association
    [Documentation]    Add new attribute and association for class
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log To Console    Class "Rooli" added
    Add attribute    Entinen nimi
    Save class
    Log To Console    Attribute "Entinen nimi" added to class "Rooli"
    Sleep    2
    Add association    Jäsen
    Save class
    Log To Console    Association "Jäsen" added to class "Rooli"
    Sleep    2
    Wait Until Page Contains    Entinen nimi    timeout=30
    Wait Until Page Contains    Jäsen    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

205. Add association between two classes
    [Documentation]    Add association between two classes
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log To Console    Class "Rooli" added
    Add class    Maksu    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Log To Console    Class "Maksu" added
    Sleep    1
    Add association    Rekisteröinti
    Log To Console    Association "Rekisteröinti" added
    Wait Until Page Contains Element    ${VALUE_CLASS_BTN}    timeout=30
    Click Element    ${VALUE_CLASS_BTN}
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    Rooli
    Click Element    //*[contains(text(), "Rooli")]
    Sleep    2
    Wait Until Page Contains Element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2
    Save class
    Page Should Contain    Rekisteröinti
    Page Should Contain    autom:Rooli
    Log To Console    Association "Rekisteröinti" added between "Rooli" and "Maksu"
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

206. Create new class without referencing concept
    [Documentation]    Create new class without referencing concept
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    automobiili
    Save class
    Wait Until Page Contains    Automobiili    timeout=30
    Log To Console    Class "Automobiili" added without referencing concept
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

207. Create new shape by referencing external uri
    [Documentation]    Create new shape by referencing external uri
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new shape by referencing external uri    ${external_uri}    ${class}
    Confirm all properties for class and save
    Wait Until Page Contains    Maksu    timeout=30
    Log To Console    Shape "Maksu" added by referencing external uri
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

208. Add new class to profile and remove properties
    [Documentation]    Add new class to profile and remove properties
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add class    Postiosoite    ${NAMESPACE_1}
    Sleep    2
    Deselect properties for class and save    ${class_property_po_box}    ${class_property_post_code}    ${class_property_post_name}
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postilokero-osoite")]    timeout=30
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postinumero")]    timeout=30
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postitoimipaikka")]    timeout=30
    Log To Console    PO box, post code and post name properties removed from class
    Log To Console    Class "Postiosoite" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

209. Create new class and add referencing concept and vocabulary
    [Documentation]    Create new class and add referencing concept and vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${vocabulary}
    Save model
    Log To Console    Namespace "Julkishallinnon tietokomponentit" added
    Log To Console    Vocabulary "Verotussanasto" added
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    liksa
    Page Should Contain    Liksa
    Log To Console    Class "Liksa" added without referencing concept
    Sleep    1
    Change concept for class    ansiotulo
    Save class
    Wait Until Page Contains    Käsitteen määritelmä    timeout=30
    Wait Until Page Contains    muu tulo kuin pääomatulo    timeout=30
    Log To Console    Concept definition "ansiotulo" added for "liksa"
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

210. Add several classes to profile, check history and remove one class
    [Documentation]    Add several classes to profile, check class history information and remove one class
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add several classes    ${class_item_1}    ${class_item_2}    ${class_item_3}
    Wait Until Page Contains Element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Wait Until Page Contains Element    //*[contains(@id, 'Rooli_tabset_link')]    timeout=30
    Wait Until Page Contains Element    //*[contains(@id, 'Maksu_tabset_link')]    timeout=30
    Log To Console    Class "Rooli" added
    Log To Console    Class "Maksu" added
    Log To Console    Class "Ajanjakso" added
    Wait Until Page Contains Element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Click Element    //*[contains(@id, 'Ajanjakso_tabset_link')]
    Wait Until Page Contains Element    ${SHOW_CLASS_HISTORY_BTN}    timeout=30
    Click Element    ${SHOW_CLASS_HISTORY_BTN}
    Wait Until Page Contains    Historialliset versiot    timeout=10
    Log To Console    History for class "Ajanjakso" opened
    Wait Until Page Contains Element    ${CLOSE_HISTORY_BTN}    timeout=30
    Click Element    ${CLOSE_HISTORY_BTN}
    Wait Until Page Contains Element    ${REMOVE_CLASS_BTN}    timeout=30
    Click Element    ${REMOVE_CLASS_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Wait Until Page Does Not Contain Element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Log To Console    Class "Ajanjakso" removed
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

211. Add reference data for profile
    [Documentation]    Create profile and add reference data for that profile
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Wait Until Page Contains Element    ${ADD_REF_DATA_BTN}    timeout=30
    Click Element    ${ADD_REF_DATA_BTN}
    Wait Until Element Is Visible    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "Voimassa oleva")]    timeout=30
    Click Element    //*[contains(text(), "Voimassa oleva")]
    Wait Until Page Contains Element    ${SEARCH_REF_DATA_INPUT}    timeout=30
    Input Text    ${SEARCH_REF_DATA_INPUT}    Kunnat 2018
    Wait Until Element Is Enabled    //*[contains(@id,'kunta_1_20180101_search_result_link')]    timeout=60
    Click Element    //*[contains(text(), "Kunnat 2018")]
    Sleep    2
    Wait Until Page Contains Element    ${REF_DATA_FILTER_DDL}    timeout=30
    Click Element    ${REF_DATA_FILTER_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "Kaikki tilat")]    timeout=30
    Click Element    //*[contains(text(), "Kaikki tilat")]
    Wait Until Page Contains    Koodiston URI    timeout=30
    Wait Until Page Contains    Koodiston tila    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30
    Wait Until Page Contains    Koodiston nimi    timeout=30
    Wait Until Page Contains    Tunniste    timeout=30
    Wait Until Page Contains    005    timeout=30
    Wait Until Page Contains    Alajärvi    timeout=30
    Wait Until Page Contains Element    ${USE_SELCTION_BTN}    timeout=30
    Click Element    ${USE_SELCTION_BTN}
    Sleep    2
    Wait Until Page Contains Element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Wait Until Element Is Visible    ${MODIFY_MODEL}    timeout=30
    Wait Until Page Contains    Kunnat 2018    timeout=30
    Log To Console    Reference data "Kunnat 2018" added for profile
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

212. Remove INCOMPLETE status profile, class, attribute and association
    [Documentation]    Create new profile, class, attribute and association.
    ...    Change status as INCOMPLETE and check that deletion of profile, class,
    ...    attribute and association is possible.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Log To Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Create new association    Testiassosiaatio
    Wait Until Page Contains Element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Page Contains Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Wait Until Page Contains Element    ${PREDICATE_STATE_INCOMPLETE}    timeout=30
    Click Element    ${PREDICATE_STATE_INCOMPLETE}
    Wait Until Page Contains Element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Page Contains    Keskeneräinen    timeout=30
    Wait Until Page Contains Element    ${PREDICATE_REMOVE_BTN}    timeout=30
    Click Element    ${PREDICATE_REMOVE_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Log To Console    Incomplete state association removed
    Wait Until Page Contains Element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait Until Page Contains Element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Page Contains Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Wait Until Page Contains Element    ${PREDICATE_STATE_INCOMPLETE}    timeout=30
    Click Element    ${PREDICATE_STATE_INCOMPLETE}
    Wait Until Page Contains Element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Page Contains    Keskeneräinen    timeout=30
    Wait Until Page Contains Element    ${PREDICATE_REMOVE_BTN}    timeout=30
    Click Element    ${PREDICATE_REMOVE_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Log To Console    Incomplete state attribute removed
    Wait Until Page Contains Element    ${CLASS_TAB}    timeout=30
    Click Element    ${CLASS_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Wait Until Page Contains Element    ${MODIFY_CLASS}    timeout=60
    Click Element    ${MODIFY_CLASS}
    Wait Until Page Contains Element    //*[@id="classState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="classState"]/div/div/iow-selection-transclude/span
    Wait Until Page Contains Element    ${CLASS_STATE_INCOMPLETE}    timeout=30
    Click Element    ${CLASS_STATE_INCOMPLETE}
    Save class
    Wait Until Page Contains Element    ${REMOVE_CLASS_BTN}    timeout=60
    Click Element    ${REMOVE_CLASS_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Wait Until Page Does Not Contain Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}
    Wait Until Page Contains Element    //*[@id="modelState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="modelState"]/div/div/iow-selection-transclude/span
    Wait Until Page Contains Element    ${MODEL_STATE_INCOMPLETE}    timeout=30
    Click Element    ${MODEL_STATE_INCOMPLETE}
    Wait Until Page Contains Element    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Wait Until Page Contains    Keskeneräinen    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

213. Convert attribute to association
    [Documentation]    Create new profile, attribute and association.
    ...    Check that converting attribute to association and vice versa is successful.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Log To Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Create new association    Testiassosiaatio
    Wait Until Page Contains Element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Page Contains Element    ${CONVERT_TO_ATTRIBUTE}    timeout=30
    Click Element    ${CONVERT_TO_ATTRIBUTE}
    Wait Until Page Contains Element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=30
    Wait Until Page Contains Element    ${ASSOCIATION_TAB}    timeout=30
    Click Element    ${ASSOCIATION_TAB}
    Page Should Not Contain element    //*[contains(@id,'testiassosiaatio_tabset_link')]    timeout=60
    Wait Until Page Contains Element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait Until Page Contains Element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Page Contains Element    ${CONVERT_TO_ASSOCIATION}    timeout=30
    Click Element    ${CONVERT_TO_ASSOCIATION}
    Wait Until Page Contains Element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=30
    Wait Until Page Contains Element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Page Should Not Contain element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

214. Convert attribute to association when it is used by a resource
    [Documentation]    Create new profile and attribute and check that converting attribute
    ...    to association is not possible when it is used by the profile.
    ...    Check that error message is displayed.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Log To Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Wait Until Page Contains Element    ${CLASS_TAB}    timeout=60
    Click Element    ${CLASS_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Add attribute    Testiattribuutti
    Save class
    Wait Until Page Contains Element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait Until Page Contains Element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Page Contains Element    ${CONVERT_TO_ASSOCIATION}    timeout=30
    Click Element    ${CONVERT_TO_ASSOCIATION}
    Wait Until Page Contains    ${predicate_change_error}    timeout=30
    Click Element    ${CLOSE_BTN}
    Wait Until Page Contains Element    ${PREDICATE_EDIT_CANCEL_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_CANCEL_BTN}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

215. Add new attribute for unsaved class
    [Documentation]    Create new profile and two classes. Add new attribute for class before saving the class.
    ...    Check that new class is created.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Create new class without referencing concept    Testiluokka2
    Wait Until Element Is Visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait Until Element Is Visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    testiattribuutti
    Wait Until Element Is Visible    ${CREATE_NEW_ATTRIBUTE_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_LINK}
    Wait Until Page Contains Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Wait Until Page Contains Element    ${CREATE_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_BTN}
    Wait Until Page Contains Element    ${CREATE_AND_USE_ATTRIBUTE}    timeout=30
    Click Element    ${CREATE_AND_USE_ATTRIBUTE}
    Sleep    2
    Save class
    Wait Until Page Contains    Testiluokka2    timeout=30
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka2_tabset_link')]    timeout=60
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

216. Create new class and suggest concept to Terminologies tool
    [Documentation]    Create new class to profile and suggest concept to Terminologies tool.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    Testiautomaatiosanasto
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class and suggest concept to terminologies    Testiluokka    Testiluokan määritelmä
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Wait Until Page Contains    Käsitteen määritelmä    timeout=30
    Wait Until Page Contains    Testiluokan määritelmä    timeout=30
    Wait Until Page Contains    Sanasto    timeout=30
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=30
    Go back to Data Vocabularies frontpage
    Close All Browsers
    Terminology Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    ${VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click Element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains Element    ${CONCEPTS_TAB}    timeout=30
    Click Element    ${CONCEPTS_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'concept-4_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'concept-4_concept_list_listitem')]
    Wait Until Page Contains    Testiluokka    timeout=30
    Close All Browsers
    [Teardown]    Test Case Teardown Terminologies

217. Create new attribute and association and suggest concepts to Terminologies tool
    [Documentation]    Create new attribute and association for profile and suggest concepts to Terminologies tool.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    Testiautomaatiosanasto
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka1
    Wait Until Element Is Visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait Until Element Is Visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Testiattribuutti
    Wait Until Element Is Visible    ${CREATE_NEW_ATTRIBUTE_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_LINK}
    Wait Until Page Contains Element    ${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}    timeout=30
    Click Element    ${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_INPUT}    timeout=30
    Input Text    ${CONCEPT_DEFINITION_INPUT}    Testiattribuutin määritelmä
    Wait Until Page Contains Element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    4
    Wait Until Page Contains Element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2
    Save class
    Wait Until Page Contains Element    //*[contains(text(), "Testiattribuutti")]    timeout=30
    Click Element    //*[contains(text(), "Testiattribuutti")]
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "autom:testiattribuutti")]    timeout=30
    Click Element    //*[contains(text(), "autom:testiattribuutti")]
    Wait Until Page Contains    Testiattribuutti    timeout=30
    Wait Until Page Contains    Käsitteen määritelmä    timeout=30
    Wait Until Page Contains    Testiattribuutin määritelmä    timeout=30
    Wait Until Page Contains    Sanasto    timeout=30
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=30
    Wait Until Page Contains Element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait Until Element Is Visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait Until Element Is Visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Testiassosiaatio
    Wait Until Element Is Visible    ${CREATE_NEW_ASSOCIATION_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ASSOCIATION_LINK}
    Wait Until Page Contains Element    ${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}    timeout=30
    Click Element    ${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_INPUT}    timeout=30
    Input Text    ${CONCEPT_DEFINITION_INPUT}    Testiassosiaation määritelmä
    Wait Until Page Contains Element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    4
    Wait Until Page Contains Element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2
    Wait Until Page Contains Element    //*[contains(text(), "autom:testiassosiaatio")]    timeout=30
    Click Element    //*[contains(text(), "autom:testiassosiaatio")]
    Wait Until Page Contains    Testiassosiaatio    timeout=30
    Wait Until Page Contains    Käsitteen määritelmä    timeout=30
    Wait Until Page Contains    Testiassosiaation määritelmä    timeout=30
    Wait Until Page Contains    Sanasto    timeout=30
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=30
    Save class
    Sleep    1
    Go back to Data Vocabularies frontpage
    Close All Browsers
    Terminology Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    ${VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click Element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains Element    ${CONCEPTS_TAB}    timeout=30
    Click Element    ${CONCEPTS_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'concept-4_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'concept-4_concept_list_listitem')]
    Wait Until Page Contains    Testiattribuutti    timeout=30
    Sleep    1
    Wait Until Page Contains Element    //*[contains(@id,'concept-5_concept_list_listitem')]    timeout=30
    Click Element    //*[contains(@id,'concept-5_concept_list_listitem')]
    Wait Until Page Contains    Testiassosiaatio    timeout=30
    Sleep    1
    Close All Browsers
    [Teardown]    Test Case Teardown Terminologies

218. Create new namespace
    [Documentation]    Create new profile and create new namespace. Check that namespace prefix can not be
    ...    "example" or same as the model prefix. Check that namespace can be added only once. Add two classes.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Wait Until Element Is Enabled    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait Until Element Is Enabled    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait Until Element Is Enabled    ${NAMESPACE_LABEL}    timeout=30
    Input Text    ${NAMESPACE_LABEL}    autom1
    Wait Until Element Is Enabled    ${NAMESPACE_VALUE}    timeout=30
    Input Text    ${NAMESPACE_VALUE}    http://uri.suomi.fi/datamodel/ns/autom1/
    Wait Until Element Is Enabled    ${NAMESPACE_PREFIX}    timeout=30
    Input Text    ${NAMESPACE_PREFIX}    autom
    Wait Until Page Contains    ${reserved_namespace_prefix}    timeout=30
    Sleep    1
    Input Text    ${NAMESPACE_PREFIX}    example
    Wait Until Page Contains    ${reserved_namespace_prefix}    timeout=30
    Sleep    1
    Input Text    ${NAMESPACE_PREFIX}    autom1
    Wait Until Element Is Enabled    ${NAMESPACE_CREATE}    timeout=30
    Click Element    ${NAMESPACE_CREATE}
    Wait Until Element Is Enabled    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait Until Element Is Enabled    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait Until Element Is Enabled    ${NAMESPACE_LABEL}    timeout=30
    Input Text    ${NAMESPACE_LABEL}    autom2
    Wait Until Element Is Enabled    ${NAMESPACE_VALUE}    timeout=30
    Input Text    ${NAMESPACE_VALUE}    http://uri.suomi.fi/datamodel/ns/autom1/
    Wait Until Page Contains    ${namespace_in_use}    timeout=30
    Wait Until Element Is Enabled    ${CANCEL_NAMESPACE_CREATION}    timeout=30
    Click Element    ${CANCEL_NAMESPACE_CREATION}
    Wait Until Element Is Enabled    ${CANCEL_SEARCH_NAMESPACE}    timeout=30
    Click Element    ${CANCEL_SEARCH_NAMESPACE}
    Save model
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/autom1/    timeout=30
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    uusiluokka10
    Save class
    Wait Until Element Is Enabled    //*[contains(@id,'Uusiluokka10_tabset_link')]    timeout=30
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Wait Until Page Contains Element    //*[contains(@id,'Rooli_tabset_link')]    timeout=30
    Log To Console    Class "Rooli" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

219. Export class in different formats
    [Documentation]    Create new profile and class.
    ...    Check that export for class is succesfull in all formats.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Log To Console    Class "Testiluokka" added without referencing concept
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_JSON_LD}    timeout=30
    Click Element    ${EXPORT_JSON_LD}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson&lang=fi&raw=true
    Wait Until Page Contains    "@id" : "autom:Testiluokka",    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Sleep    1
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_Turtle}    timeout=30
    Click Element    ${EXPORT_Turtle}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=text%2Fturtle&lang=fi&raw=true
    Wait Until Page Contains    <http://uri.suomi.fi/datamodel/ns/autom>    timeout=30
    Wait Until Page Contains    "Testiluokka"@fi    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_RDF}    timeout=30
    Click Element    ${EXPORT_RDF}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Frdf%2Bxml&lang=fi&raw=true
    Wait Until Page Contains    xmlns:autom="http://uri.suomi.fi/datamodel/ns/autom#"    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_XML}    timeout=30
    Click Element    ${EXPORT_XML}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fxml&lang=fi&raw=true
    Wait Until Page Contains    sawsdl:modelReference="http://uri.suomi.fi/datamodel/ns/autom#Testiluokka">    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_JSON_Schema}    timeout=30
    Click Element    ${EXPORT_JSON_Schema}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
    Wait Until Page Contains    "id":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka.jschema",    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_JSON_LD_Context}    timeout=30
    Click Element    ${EXPORT_JSON_LD_Context}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson%2Bcontext&lang=fi&raw=true
    Wait Until Page Contains    "@context":{    timeout=30
    Wait Until Page Contains    "Testiluokka":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"    timeout=30
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window
    Sleep    1
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

220. Deactivate class and export class in JSON Schema format
    [Documentation]    Create new profile and class.
    ...    Deactivate class and check that deactivated class is not used in JSON Schema generation.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Wait Until Page Contains Element    ${DEACTIVATED_CHECKBOX}    timeout=30
    Click Element    ${DEACTIVATED_CHECKBOX}
    Save class
    Sleep    10
    Wait Until Page Contains    Testiluokka    timeout=30
    Wait Until Page Contains    Deaktivoitu    timeout=30
    Wait Until Page Contains    Kyllä    timeout=30
    Log To Console    Class "Testiluokka" deactivated
    Sleep    1
    Wait Until Page Contains Element    ${EXPORT_MODEL_DDL}    timeout=30
    Click Element    ${EXPORT_MODEL_DDL}
    Wait Until Element Is Visible    ${EXPORT_MODEL_JSON_Schema}    timeout=30
    Click Element    ${EXPORT_MODEL_JSON_Schema}
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}api/rest/exportModel?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
    Page Should Not Contain    "@id":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"
    Page Should Not Contain    Whitelabel Error Page
    Page Should Not Contain    {"errorMessage":"Not found"}
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

221. Create namespace with certain prefix
    [Documentation]    Create new profile and create new namespace. Check that namespace URI is set
    ...    correctly with certain prefix. Add two classes.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Wait Until Element Is Enabled    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait Until Element Is Enabled    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait Until Element Is Enabled    ${NAMESPACE_PREFIX}    timeout=30
    Input Text    ${NAMESPACE_PREFIX}    httpv
    Wait Until Page Contains    http://www.w3.org/2011/http#    timeout=30
    Wait Until Page Contains Element    ${NAMESPACE_PREFIX}    timeout=30
    Input Text    ${NAMESPACE_PREFIX}    rdf
    Wait Until Page Contains    http://www.w3.org/1999/02/22-rdf-syntax-ns#    timeout=30
    Wait Until Element Is Enabled    ${CANCEL_NAMESPACE_CREATION}    timeout=30
    Click Element    ${CANCEL_NAMESPACE_CREATION}
    Wait Until Element Is Enabled    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait Until Page Contains Element    ${NAMESPACE_VALUE}    timeout=30
    Input Text    ${NAMESPACE_VALUE}    http://uri.suomi.fi/datamodel/ns/iow#
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/iow#    timeout=30
    Wait Until Element Is Enabled    ${NAMESPACE_LABEL}    timeout=30
    Input Text    ${NAMESPACE_LABEL}    namesapce_iow
    Wait Until Element Is Enabled    ${NAMESPACE_CREATE}    timeout=30
    Click Element    ${NAMESPACE_CREATE}
    Save model
    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/iow#    timeout=30
    Wait Until Page Contains    namesapce_iow    timeout=30
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    uusiluokka10
    Save class
    Wait Until Page Contains Element    //*[contains(@id,'Uusiluokka10_tabset_link')]    timeout=30
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Wait Until Page Contains Element    //*[contains(@id,'Rooli_tabset_link')]    timeout=30
    Log To Console    Class "Rooli" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

222. Change ID for class and predicate
    [Documentation]    Create new profile, class, attribute and association.
    ...    Check that changing ID for class, attribute and association is successful. YTI-821.
    [Tags]    regression    tietomallit    200    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait Until Page Contains    Testiluokka    timeout=30
    Log To Console    Class "Testiluokka" added without referencing concept
    Select And Edit Class    Testiluokka
    Wait Until Element Is Enabled    ${CLASS_ID}    timeout=60
    Input Text    ${CLASS_ID}    Testiluokka_123
    Sleep    1
    Save class
    Wait Until Page Contains Element    //*[contains(text(), "autom:Testiluokka_123")]    timeout=60
    Create new attribute    testiattribuutti
    Select And Edit Predicate    ${ATTRIBUTE_TAB}    testiattribuutti
    Wait Until Element Is Enabled    ${PREDICATE_ID}    timeout=60
    Input Text    ${PREDICATE_ID}    testiattribuutti_123
    Save Predicate
    Wait Until Page Contains Element    //*[contains(text(), "autom:testiattribuutti_123")]    timeout=60
    Create new association    testiassosiaatio
    Select And Edit Predicate    ${ASSOCIATION_TAB}    testiassosiaatio
    Wait Until Element Is Enabled    ${PREDICATE_ID}    timeout=60
    Input Text    ${PREDICATE_ID}    testiassosiaatio_123
    Save Predicate
    Wait Until Page Contains Element    //*[contains(text(), "autom:testiassosiaatio_123")]
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

*** Keywords ***
Test Case Setup Terminologies
    Terminology Setup
    Test Case Setup Create Testiautomaatio profile

Test Case Teardown Terminologies
    Test Case Setup
    Delete profile    ${MODEL_1}
    Terminology Teardown
