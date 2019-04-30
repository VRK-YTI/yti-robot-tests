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
${class_json_ld_url}    https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson&lang=fi&raw=true
${class_json_ld_url_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson&lang=fi&raw=true
${class_turtle}    https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=text%2Fturtle&lang=fi&raw=true
${class_turtle_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=text%2Fturtle&lang=fi&raw=true
${class_rdf}      https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Frdf%2Bxml&lang=fi&raw=true
${class_rdf_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Frdf%2Bxml&lang=fi&raw=true
${class_xml}      https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fxml&lang=fi&raw=true
${class_xml_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fxml&lang=fi&raw=true
${class_json_schema}    https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
${class_json_schema_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
${model_json_schema}    https://tietomallit-dev.suomi.fi/api/rest/exportModel?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
${model_json_schema_test}    https://tietomallit-test.suomi.fi/api/rest/exportModel?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
${class_json_ld_context}    https://tietomallit-dev.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson%2Bcontext&lang=fi&raw=true
${class_json_ld_context_test}    https://tietomallit-test.suomi.fi/api/rest/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson%2Bcontext&lang=fi&raw=true
${class_json_ld_frame}    blob:https://tietomallit-dev.suomi.fi/46f77ed0-82b6-4d57-b771-fc9a92bf1f17
${class_json_ld_frame_test}    blob:https://tietomallit-test.suomi.fi/a93dc0f7-ee66-48ea-8723-85c89ea28e9c
${class_framed_json_ld}    blob:https://tietomallit-dev.suomi.fi/61658254-be26-4815-a168-a9f4325d8d15
${class_framed_json_ld_test}    blob:https://tietomallit-test.suomi.fi/cad2b19c-faee-4aca-942c-2775ef13e268

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
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
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
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
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
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    automobiili
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
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
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
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
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

209. Create new class and add referencing concept and vocabulary
    [Documentation]    Create new class and add referencing concept and vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${vocabulary}
    Save model
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Log to Console    Vocabulary "Verotussanasto" added
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    liksa
    Page should contain    Liksa
    Log to Console    Class "Liksa" added without referencing concept
    Sleep    1
    Change concept for class    ansiotulo
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
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Add several classes    ${class_item_1}    ${class_item_2}    ${class_item_3}
    Wait until page contains element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Wait until page contains element    //*[contains(@id, 'Rooli_tabset_link')]    timeout=30
    Wait until page contains element    //*[contains(@id, 'Maksu_tabset_link')]    timeout=30
    Log to Console    Class "Rooli" added
    Log to Console    Class "Maksu" added
    Log to Console    Class "Ajanjakso" added
    Wait until page contains element    //*[contains(@id, 'Ajanjakso_tabset_link')]    timeout=30
    Click Element    //*[contains(@id, 'Ajanjakso_tabset_link')]
    Wait until page contains element    ${SHOW_CLASS_HISTORY_BTN}    timeout=30
    Click Element    ${SHOW_CLASS_HISTORY_BTN}
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
    Maximize Browser Window
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

212. Remove INCOMPLETE status profile, class, attribute and association
    [Documentation]    Create new profile, class, attribute and association.
    ...    Change status as INCOMPLETE and check that deletion of profile, class,
    ...    attribute and association is possible.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait until page contains    Testiluokka    timeout=30
    Log to Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Create new association    Testiassosiaatio
    Wait until page contains element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait until page contains element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Wait until page contains element    ${PREDICATE_STATE_INCOMPLETE}    timeout=30
    Click Element    ${PREDICATE_STATE_INCOMPLETE}
    Wait until page contains element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait until page contains    Keskeneräinen    timeout=30
    Wait until page contains element    ${PREDICATE_REMOVE_BTN}    timeout=30
    Click Element    ${PREDICATE_REMOVE_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Log to Console    Incomplete state association removed
    Wait until page contains element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait until page contains element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait until page contains element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait until page contains element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Wait until page contains element    ${PREDICATE_STATE_INCOMPLETE}    timeout=30
    Click Element    ${PREDICATE_STATE_INCOMPLETE}
    Wait until page contains element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait until page contains    Keskeneräinen    timeout=30
    Wait until page contains element    ${PREDICATE_REMOVE_BTN}    timeout=30
    Click Element    ${PREDICATE_REMOVE_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Log to Console    Incomplete state attribute removed
    Wait until page contains element    ${CLASS_TAB}    timeout=30
    Click Element    ${CLASS_TAB}
    Wait until page contains element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Wait until page contains element    ${MODIFY_CLASS}    timeout=60
    Click Element    ${MODIFY_CLASS}
    Wait until page contains element    //*[@id="classState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="classState"]/div/div/iow-selection-transclude/span
    Wait until page contains element    ${CLASS_STATE_INCOMPLETE}    timeout=30
    Click Element    ${CLASS_STATE_INCOMPLETE}
    Save class
    Wait until page contains element    ${REMOVE_CLASS_BTN}    timeout=60
    Click Element    ${REMOVE_CLASS_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Wait until page does not contain element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Wait until page contains element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait until page contains element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}
    Wait until page contains element    //*[@id="modelState"]/div/div/iow-selection-transclude/span    timeout=30
    Click Element    //*[@id="modelState"]/div/div/iow-selection-transclude/span
    Wait until page contains element    ${MODEL_STATE_INCOMPLETE}    timeout=30
    Click Element    ${MODEL_STATE_INCOMPLETE}
    Wait until page contains element    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Wait until page contains    Keskeneräinen    timeout=30
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

213. Convert attribute to association
    [Documentation]    Create new profile, attribute and association.
    ...    Check that converting attribute to association and vice versa is successful.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait until page contains    Testiluokka    timeout=30
    Log to Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Create new association    Testiassosiaatio
    Wait until page contains element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait until page contains element    ${CONVERT_TO_ATTRIBUTE}    timeout=30
    Click Element    ${CONVERT_TO_ATTRIBUTE}
    Wait until page contains element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait until element is visible    ${PREDICATE_EDIT_BTN}    timeout=30
    Wait until page contains element    ${ASSOCIATION_TAB}    timeout=30
    Click Element    ${ASSOCIATION_TAB}
    Page should not contain element    //*[contains(@id,'testiassosiaatio_tabset_link')]    timeout=60
    Wait until page contains element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait until page contains element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait until page contains element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait until page contains element    ${CONVERT_TO_ASSOCIATION}    timeout=30
    Click Element    ${CONVERT_TO_ASSOCIATION}
    Wait until page contains element    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait until element is visible    ${PREDICATE_EDIT_BTN}    timeout=30
    Wait until page contains element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Page should not contain element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60
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
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait until page contains    Testiluokka    timeout=30
    Log to Console    Class "Testiluokka" added without referencing concept
    Create new attribute    Testiattribuutti
    Wait until page contains element    ${CLASS_TAB}    timeout=60
    Click Element    ${CLASS_TAB}
    Wait until page contains element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Add attribute    Testiattribuutti
    Save class
    Wait until page contains element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait until page contains element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'testiattribuutti_tabset_link')]
    Wait until page contains element    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait until page contains element    ${CONVERT_TO_ASSOCIATION}    timeout=30
    Click Element    ${CONVERT_TO_ASSOCIATION}
    Wait until page contains    ${predicate_change_error}    timeout=30
    Click element    ${CLOSE_BTN}
    Wait until page contains element    ${PREDICATE_EDIT_CANCEL_BTN}    timeout=30
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
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait until page contains element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Click Element    //*[contains(@id,'Testiluokka_tabset_link')]
    Create new class without referencing concept    Testiluokka2
    Wait until element is visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until element is visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait until page contains element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    testiattribuutti
    Wait until element is visible    ${CREATE_NEW_ATTRIBUTE_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_LINK}
    Wait until page contains element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Wait until page contains element    ${CREATE_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_BTN}
    Wait until page contains element    ${CREATE_AND_USE_ATTRIBUTE}    timeout=30
    Click Element    ${CREATE_AND_USE_ATTRIBUTE}
    Sleep    2
    Save class
    Wait until page contains    Testiluokka2    timeout=30
    Wait until page contains element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Wait until page contains element    //*[contains(@id,'Testiluokka2_tabset_link')]    timeout=60
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

216. Create new class and suggest concept to Terminologies tool
    [Documentation]    Create new class to profile and suggest concept to Terminologies tool.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    Testiautomaatiosanasto
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class and suggest concept to terminologies    Testiluokka    Testiluokan määritelmä
    Save class
    Wait until page contains    Testiluokka    timeout=30
    Wait until page contains    Käsitteen määritelmä    timeout=30
    Wait until page contains    Testiluokan määritelmä    timeout=30
    Wait until page contains    Sanasto    timeout=30
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Go back to Data Vocabularies frontpage
    Close All Browsers
    Terminology Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${CONCEPTS_TAB}    timeout=30
    Click element    ${CONCEPTS_TAB}
    Wait until page contains element    //*[contains(@id,'concept-4_concept_list_listitem')]    timeout=30
    Click element    //*[contains(@id,'concept-4_concept_list_listitem')]
    Wait until page contains    Testiluokka    timeout=30
    Close All Browsers
    [Teardown]    Test Case Teardown Terminologies

217. Create new attribute and association and suggest concepts to Terminologies tool
    [Documentation]    Create new attribute and association for profile and suggest concepts to Terminologies tool.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Add vocabulary    Testiautomaatiosanasto
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka1
    Wait until element is visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until element is visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait until page contains element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Testiattribuutti
    Wait until element is visible    ${CREATE_NEW_ATTRIBUTE_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_LINK}
    Wait until page contains element    ${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}    timeout=30
    Click Element    ${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}
    Wait until page contains element    ${CONCEPT_DEFINITION_INPUT}    timeout=30
    Input Text    ${CONCEPT_DEFINITION_INPUT}    Testiattribuutin määritelmä
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    4
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2
    Save class
    Wait until page contains element    //*[contains(text(), "Testiattribuutti")]    timeout=30
    Click element    //*[contains(text(), "Testiattribuutti")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "autom:testiattribuutti")]    timeout=30
    Click element    //*[contains(text(), "autom:testiattribuutti")]
    Wait until page contains    Testiattribuutti    timeout=30
    Wait until page contains    Käsitteen määritelmä    timeout=30
    Wait until page contains    Testiattribuutin määritelmä    timeout=30
    Wait until page contains    Sanasto    timeout=30
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Wait until page contains element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait until element is visible    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until element is visible    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait until page contains element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Testiassosiaatio
    Wait until element is visible    ${CREATE_NEW_ASSOCIATION_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ASSOCIATION_LINK}
    Wait until page contains element    ${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}    timeout=30
    Click Element    ${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}
    Wait until page contains element    ${CONCEPT_DEFINITION_INPUT}    timeout=30
    Input Text    ${CONCEPT_DEFINITION_INPUT}    Testiassosiaation määritelmä
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    4
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "autom:testiassosiaatio")]    timeout=30
    Click element    //*[contains(text(), "autom:testiassosiaatio")]
    Wait until page contains    Testiassosiaatio    timeout=30
    Wait until page contains    Käsitteen määritelmä    timeout=30
    Wait until page contains    Testiassosiaation määritelmä    timeout=30
    Wait until page contains    Sanasto    timeout=30
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Save class
    Sleep    1
    Go back to Data Vocabularies frontpage
    Close All Browsers
    Terminology Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX_TERMINOLOGIES}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${CONCEPTS_TAB}    timeout=30
    Click element    ${CONCEPTS_TAB}
    Wait until page contains element    //*[contains(@id,'concept-4_concept_list_listitem')]    timeout=30
    Click element    //*[contains(@id,'concept-4_concept_list_listitem')]
    Wait until page contains    Testiattribuutti    timeout=30
    Sleep    1
    Wait until page contains element    //*[contains(@id,'concept-5_concept_list_listitem')]    timeout=30
    Click element    //*[contains(@id,'concept-5_concept_list_listitem')]
    Wait until page contains    Testiassosiaatio    timeout=30
    Sleep    1
    Close All Browsers
    [Teardown]    Test Case Teardown Terminologies

218. Create new namespace
    [Documentation]    Create new profile and create new namespace. Add two classes.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Wait until page contains element    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait until page contains element    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait until page contains element    ${NAMESPACE_LABEL}    timeout=30
    Input Text    ${NAMESPACE_LABEL}    autom1
    Wait until page contains element    ${NAMESPACE_VALUE}    timeout=30
    Input Text    ${NAMESPACE_VALUE}    http://uri.suomi.fi/datamodel/ns/autom1/
    Wait until page contains element    ${NAMESPACE_PREFIX}    timeout=30
    Input Text    ${NAMESPACE_PREFIX}    autom1
    Wait until page contains element    ${NAMESPACE_CREATE}    timeout=30
    Click Element    ${NAMESPACE_CREATE}
    Save model
    Wait until page contains    http://uri.suomi.fi/datamodel/ns/autom1/    timeout=30
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    uusiluokka10
    Save class
    Wait until page contains element    //*[contains(@id,'Uusiluokka10_tabset_link')]    timeout=30
    Add class    Rooli    ${NAMESPACE_1}
    Sleep    2
    Confirm all properties for class and save
    Wait until page contains element    //*[contains(@id,'Rooli_tabset_link')]    timeout=30
    Log to Console    Class "Rooli" added
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

219. Export class in different formats
    [Documentation]    Create new profile and class.
    ...    Check that export for class is succesfull in all formats.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Save class
    Wait until page contains    Testiluokka    timeout=30
    Log to Console    Class "Testiluokka" added without referencing concept
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_JSON_LD}    timeout=30
    Click Element    ${EXPORT_JSON_LD}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_json_ld_url}
    ...    ELSE    Select Window    url=${class_json_ld_url_test}
    Wait until page contains    "@id" : "autom:Testiluokka",    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Sleep    1
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_Turtle}    timeout=30
    Click Element    ${EXPORT_Turtle}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_turtle}
    ...    ELSE    Select Window    url=${class_turtle_test}
    Wait until page contains    <http://uri.suomi.fi/datamodel/ns/autom>    timeout=30
    Wait until page contains    "Testiluokka"@fi    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_RDF}    timeout=30
    Click Element    ${EXPORT_RDF}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_rdf}
    ...    ELSE    Select Window    url=${class_rdf_test}
    Wait until page contains    xmlns:autom="http://uri.suomi.fi/datamodel/ns/autom#"    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_XML}    timeout=30
    Click Element    ${EXPORT_XML}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_xml}
    ...    ELSE    Select Window    url=${class_xml_test}
    Wait until page contains    sawsdl:modelReference="http://uri.suomi.fi/datamodel/ns/autom#Testiluokka">    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_JSON_Schema}    timeout=30
    Click Element    ${EXPORT_JSON_Schema}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_json_schema}
    ...    ELSE    Select Window    url=${class_json_schema_test}
    Wait until page contains    "id":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka.jschema",    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Sleep    1
    Wait until page contains element    ${EXPORT_CLASS_DDL}    timeout=30
    Click Element    ${EXPORT_CLASS_DDL}
    Wait until element is visible    ${EXPORT_JSON_LD_Context}    timeout=30
    Click Element    ${EXPORT_JSON_LD_Context}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${class_json_ld_context}
    ...    ELSE    Select Window    url=${class_json_ld_context_test}
    Wait until page contains    "@context":{    timeout=30
    Wait until page contains    "Testiluokka":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"    timeout=30
    Page should not contain    {"errorMessage":"Not found"}
    Page should not contain    Whitelabel Error Page
    Close Window
    Sleep    1
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

220. Deactivate class and export class in JSON Schema format
    [Documentation]    Create new profile and class.
    ...    Deactivate class and check that deactivated class is not used in JSON Schema generation.
    [Tags]    regression    tietomallit    test    200
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Maximize Browser Window
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait until page contains element    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}
    Create new class without referencing concept    Testiluokka
    Wait until page contains element    ${DEACTIVATED_CHECKBOX}    timeout=30
    Click Element    ${DEACTIVATED_CHECKBOX}
    Save class
    Sleep    10
    Wait until page contains    Testiluokka    timeout=30
    Wait until page contains    Deaktivoitu    timeout=30
    Wait until page contains    Kyllä    timeout=30
    Log to Console    Class "Testiluokka" deactivated
    Sleep    1
    Wait until page contains element    ${EXPORT_MODEL_DDL}    timeout=30
    Click Element    ${EXPORT_MODEL_DDL}
    Wait until element is visible    ${EXPORT_MODEL_JSON_Schema}    timeout=30
    Click Element    ${EXPORT_MODEL_JSON_Schema}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    url=${model_json_schema}
    ...    ELSE    Select Window    url=${model_json_schema_test}
    Page should not contain    "@id":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"
    Page should not contain    Whitelabel Error Page
    Page should not contain    {"errorMessage":"Not found"}
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://tietomallit-dev.suomi.fi/"    Select Window    title=DEV - Tietomallit
    ...    ELSE    Select Window    title=TEST - Tietomallit
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
