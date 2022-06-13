*** Settings ***
Documentation     Test Suite for basic functionality of Data Vocabularies application
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model    ${PREFIX_1}
Test Setup        Test Case setup create profile     ${MODEL_1}   ${PREFIX_1}

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${VOCABULARY_1}     Testiautomaatiosanasto2

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
    Select And Edit Profile     ${MODEL_1}
    Input Text with wait        ${MODEL_LABEL_INPUT}            Uusi nimi
    Input Text with wait        ${MODEL_DESCRIPTION_INPUT}      Uusi kuvaus
    Click Element with wait     ${REMOVE_Asuminen}

    Add Information Domain      Kulttuuri
    Click Element with wait     ${REMOVE_Testiorganisaatio}
    Add Contributor             Automaatiotestaus

    Input Text with wait        ${MODEL_CONTACT_INPUT}          Tähän yhteystiedot
    Click Element with wait     ${ADD_LINK}
    Input Text with wait        ${LINK_URL_INPUT}               https://www.suomi.fi/etusivu/
    Input Text with wait        ${LINK_NAME_INPUT}              www.suomi.fi/etusivu/
    Input Text with wait        ${LINK_DESCRIPTION_INPUT}       Tämä on suomi.fi linkki
    Click Element with wait     ${CREATE_NEW_LINK}

    Save Model
    Wait Until Page Contains    Uusi nimi               
    Wait Until Page Contains    Uusi kuvaus             
    Wait Until Page Contains    Kulttuuri               
    Wait Until Page Contains    Automaatiotestaus       
    Wait Until Page Contains    www.suomi.fi/etusivu/   
    Wait Until Page Contains    Yhteydenotto            
    Wait Until Page Contains    Tähän yhteystiedot      

201. Add new class to profile
    [Documentation]    Add new class to profile
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait     ${MODEL_DATA_TAB}
    Add Class                   Rooli               ${NAMESPACE_1}
    Confirm All Properties For Class And Save

202. Add new class to Core Vocabulary
    [Documentation]    Add new Core Vocabulary and add new class
    [Tags]    regression    tietomallit    test    200
    [Setup]  Test case setup create vocabulary   ${CORE_VOCABULARY_1}    ${PREFIX_2}

    Select And Edit Profile     ${CORE_VOCABULARY_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab            ${MODEL_DATA_TAB}
    Add Class                   Rooli                   ${NAMESPACE_1}
    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

203. Modify Core Vocabulary
    [Documentation]    Modify Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]  Test case setup create vocabulary   ${CORE_VOCABULARY_1}    ${PREFIX_2}

    Select And Edit Profile     ${CORE_VOCABULARY_1}
    Input Text with wait        ${CORE_VOCABULARY_LABEL_INPUT}          Uusi nimi
    Input Text with wait        ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Uusi kuvaus
    Click Element with wait     ${REMOVE_Asuminen}

    Add Information Domain    Kulttuuri
    Click Element with wait   ${REMOVE_Testiorganisaatio}    

    Add Contributor     Automaatiotestaus
    Add Link            https://www.suomi.fi/etusivu/    www.suomi.fi/etusivu/    Tämä on suomi.fi linkki
    Save Model

    Wait Until Page Contains    Uusi nimi               
    Wait Until Page Contains    Uusi kuvaus             
    Wait Until Page Contains    Kulttuuri               
    Wait Until Page Contains    Automaatiotestaus       
    Wait Until Page Contains    www.suomi.fi/etusivu/   

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

204. Add new attribute and association
    [Documentation]    Add new attribute and association for class
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait    ${MODEL_DATA_TAB}
    Add Class                  Rooli                ${NAMESPACE_1}
    Confirm All Properties For Class And Save

    Add Attribute               Entinen nimi
    Save Class

    Add Association             Jäsen
    Save Class

    Wait Until Page Contains    Entinen nimi    
    Wait Until Page Contains    Jäsen           

205. Add association between two classes
    [Documentation]    Add association between two classes
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait     ${MODEL_DATA_TAB}
    Add Class                   Rooli               ${NAMESPACE_1}
    Confirm All Properties For Class And Save

    Add Class                   Maksu               ${NAMESPACE_1}
    Confirm All Properties For Class And Save

    Add Association    Rekisteröinti

    Click Element with wait     ${VALUE_CLASS_BTN}
    Input Text with wait        ${SEARCH_CLASS_INPUT}    Rooli
    Click Element with wait     //*[contains(@id, 'Rooli_search_result_link')]
    Click Element with wait     ${SPECIALIZE_CLASS}
    Save Class

    Page Should Contain    Rekisteröinti
    Page Should Contain    autom:Rooli

206. Create new class without referencing concept
    [Documentation]    Create new class without referencing concept
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait     ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept        automobiili
    Save Class

    Wait Until Page Contains    Automobiili    

207. Create new shape by referencing external uri
    [Documentation]    Create new shape by referencing external uri
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait                       ${MODEL_DATA_TAB}
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Create New Shape By Referencing External Uri  ${external_uri}  ${class}
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Confirm All Properties For Class And Save
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Wait Until Page Contains    Maksu    

208. Add new class to profile and remove properties
    [Documentation]    Add new class to profile and remove properties
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait     ${MODEL_DATA_TAB}
    Add Class                   Postiosoite             ${NAMESPACE_1}

    Deselect properties for class and save    ${class_property_po_box}    ${class_property_post_code}    ${class_property_post_name}
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postilokero-osoite")]     
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postinumero")]            
    Wait Until Page Does Not Contain Element    //*[contains(text(), "Postitoimipaikka")]       

209. Create new class and add referencing concept and vocabulary
    [Documentation]    Create new class and add referencing concept and vocabulary
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${vocabulary}
    Save Model

    Click Element with wait                         ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    liksa
    Page Should Contain                             Liksa
    Change concept for class                        ansiotulo
    Save Class

    Wait Until Page Contains    Käsitteen määritelmä    
    Wait Until Page Contains    muu tulo kuin pääomatulo    

210. Add several classes to profile, check history and remove one class
    [Documentation]    Add several classes to profile, check class history information and remove one class
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Click Element with wait     ${MODEL_DATA_TAB}
    Add several classes         ${class_item_1}         ${class_item_2}    ${class_item_3}
    Wait Until Page Contains Element            //*[contains(@id, 'Rooli_tabset_link')]         
    Wait Until Page Contains Element            //*[contains(@id, 'Maksu_tabset_link')]         

    Click Element with wait                     //*[contains(@id, 'Ajanjakso_tabset_link')]
    Click Element with wait                     ${SHOW_CLASS_HISTORY_BTN}

    Wait Until Page Contains                    Historialliset versiot          

    Click Element with wait                     ${CLOSE_HISTORY_BTN}
    Click Element with wait                     ${REMOVE_CLASS_BTN}
    Click Element with wait                     ${CONFIRM_REMOVE_MODEL_BTN}
    Wait Until Page Does Not Contain Element    //*[contains(@id, 'Ajanjakso_tabset_link')]     

211. Add reference data for profile
    [Documentation]    Create profile and add reference data for that profile
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Click Element with wait    ${ADD_REF_DATA_BTN}
    Click Element with wait    ${REF_DATA_FILTER_DDL}
    Click Element with wait    //*[contains(text(), "Voimassa oleva")]

    Input Text with wait       ${SEARCH_REF_DATA_INPUT}    Kunnat 2018
    Click Element with wait    //*[contains(text(), "Kunnat 2018")]         timeout=60
    Click Element with wait    ${REF_DATA_FILTER_DDL}
    Click Element with wait    //*[contains(text(), "Kaikki tilat")]

    Wait Until Page Contains    Koodiston URI       
    Wait Until Page Contains    Koodiston tila      
    Wait Until Page Contains    Voimassa oleva      
    Wait Until Page Contains    Koodiston nimi      
    Wait Until Page Contains    Tunniste            
    Wait Until Page Contains    005                 
    Wait Until Page Contains    Alajärvi            

    Click Element with wait   ${USE_SELCTION_BTN}
    Save Model

    Wait Until Page Contains    Kunnat 2018    

212. Remove INCOMPLETE status profile, class, attribute and association
    [Documentation]    Create new profile, class, attribute and association.
    ...    Change status as INCOMPLETE and check that deletion of profile, class,
    ...    attribute and association is possible.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka    
    Create New Attribute    Testiattribuutti
    Create new association    Testiassosiaatio

    Click Element with wait    ${PREDICATE_EDIT_BTN}            timeout=60
    Click Element with wait    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Click Element with wait    ${PREDICATE_STATE_INCOMPLETE}
    Click Element with wait    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Page Contains    Keskeneräinen                   

    Click Element with wait    ${PREDICATE_REMOVE_BTN}
    Click Element with wait    ${CONFIRM_REMOVE_MODEL_BTN}
    Select Tab    ${ATTRIBUTE_TAB}

    Click Element with wait    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60
    Click Element with wait    ${PREDICATE_EDIT_BTN}                                timeout=60
    Click Element with wait    //*[@id="predicateState"]/div/div/iow-selection-transclude/span
    Click Element with wait    ${PREDICATE_STATE_INCOMPLETE}
    Click Element with wait    ${PREDICATE_EDIT_SAVE_BTN}

    Wait Until Page Contains   Keskeneräinen                    
    Click Element with wait    ${PREDICATE_REMOVE_BTN}
    Click Element with wait    ${CONFIRM_REMOVE_MODEL_BTN}
    Select And Edit Class    Testiluokka

    Click Element with wait    //*[@id="classState"]/div/div/iow-selection-transclude/span    
    Click Element with wait    ${CLASS_STATE_INCOMPLETE}
    Save Class

    Click Element with wait    ${REMOVE_CLASS_BTN}              timeout=60
    Click Element with wait    ${CONFIRM_REMOVE_MODEL_BTN}
    Wait Until Page Does Not Contain Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Modify Profile

    Click Element with wait    //*[@id="modelState"]/div/div/iow-selection-transclude/span
    Click Element with wait    ${MODEL_STATE_INCOMPLETE}
    Save Model

    Wait Until Page Contains    Keskeneräinen    

213. Convert attribute to association
    [Documentation]    Create new profile, attribute and association.
    ...    Check that converting attribute to association and vice versa is successful.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab            ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept            Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka                 
    Create New Attribute        Testiattribuutti
    Create new association      Testiassosiaatio

    Click Element with wait     ${PREDICATE_EDIT_BTN}       timeout=60
    Click Element with wait    ${CONVERT_TO_ATTRIBUTE}
    Save Predicate

    Select Tab    ${ASSOCIATION_TAB}
    sleep                      0.1
    Wait Until Page Does Not Contain Element    //*[contains(@id,'testiassosiaatio_tabset_link')]       timeout=60
    Select Tab    ${ATTRIBUTE_TAB}

    Click Element with wait    //*[contains(@id,'testiattribuutti_tabset_link')]
    Click Element with wait    ${PREDICATE_EDIT_BTN}                                                    timeout=60
    Click Element with wait    ${CONVERT_TO_ASSOCIATION}
    Save Predicate

    Select Tab    ${ATTRIBUTE_TAB}
    Wait Until Page Does Not Contain Element    //*[contains(@id,'testiattribuutti_tabset_link')]    timeout=60

214. Convert attribute to association when it is used by a resource
    [Documentation]    Create new profile and attribute and check that converting attribute
    ...    to association is not possible when it is used by the profile.
    ...    Check that error message is displayed.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab            ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka                                     
    Create New Attribute        Testiattribuutti
    Select Tab                  ${CLASS_TAB}
    Click Element with wait     //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Add Existing Attribute      Testiattribuutti
    Save Class

    Select Tab                  ${ATTRIBUTE_TAB}
    Click Element with wait     //*[contains(@id,'testiattribuutti_tabset_link')]
    Click Element with wait     ${PREDICATE_EDIT_BTN}                           timeout=60
    Click Element with wait     ${CONVERT_TO_ASSOCIATION}

    Wait Until Page Contains    ${predicate_change_error}                       

    Click Element with wait     ${CLOSE_BTN}
    Click Element with wait     ${PREDICATE_EDIT_CANCEL_BTN}

215. Add new attribute for unsaved class
    [Documentation]    Create new profile and two classes. Add new attribute for class before saving the class.
    ...    Check that new class is created.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab            ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Click Element with wait     //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Create New Class Without Referencing Concept    Testiluokka2
    Click Element with wait     ${ADD_PROPERTY_DDL}
    Click Element with wait     ${ADD_PROPERTY_BTN}
    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}    testiattribuutti
    Click Element with wait     ${CREATE_NEW_ATTRIBUTE_LINK}
    Click Element with wait     ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Click Element with wait     ${CREATE_NEW_ATTRIBUTE_BTN}
    Click Element with wait     ${CREATE_AND_USE_ATTRIBUTE}
    Sleep                       ${SLEEP_TIMEOUT}
    Save Class

    Wait Until Page Contains            Testiluokka2                                    
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka_tabset_link')]    timeout=60
    Wait Until Page Contains Element    //*[contains(@id,'Testiluokka2_tabset_link')]   timeout=60

216. Create new class and suggest concept to Terminologies tool
    [Documentation]    Create new class to profile and suggest concept to Terminologies tool.
    [Tags]    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies    ${MODEL_1}    ${PREFIX_1}   ${VOCABULARY_1}
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Add vocabulary    ${VOCABULARY_1}
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create new class and suggest concept to terminologies    Testiluokka    Testiluokan määritelmä
    Save Class

    Wait Until Page Contains    Testiluokka             
    Wait Until Page Contains    Käsitteen määritelmä    
    Wait Until Page Contains    Testiluokan määritelmä  
    Wait Until Page Contains    Sanasto                 
    Wait Until Page Contains    ${VOCABULARY_1}         
    Close All Browsers

    Open sanastot
    Select admin user
    Input Text with wait        id=vocabularies_search_input    ${VOCABULARY_1}
    Click Element with wait     //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}     

    Click Element with wait     id=conceptsTab
    Click Element with wait     //*[contains(@id,'concept-0_concept_list_listitem')]
    Wait Until Page Contains    Testiluokka         

    [Teardown]    Test Case Teardown Terminologies     ${VOCABULARY_1}      ${PREFIX_1}

217. Create new attribute and association and suggest concepts to Terminologies tool
    [Documentation]    Create new attribute and association for profile and suggest concepts to Terminologies tool.
    [Tags]    tietomallit    test    200
    [Setup]    Test Case Setup Terminologies    ${MODEL_1}    ${PREFIX_1}   ${VOCABULARY_1}
    Maximize Browser Window
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Add vocabulary      ${VOCABULARY_1}
    Save Model

    Select Model Tab            ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka1
    Click Element with wait     ${ADD_PROPERTY_DDL}
    Click Element with wait     ${ADD_PROPERTY_BTN}

    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}     Testiattribuutti
    Click Element with wait     ${CREATE_NEW_ATTRIBUTE_LINK}
    Click Element with wait     ${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}

    Input Text with wait        ${CONCEPT_DEFINITION_INPUT}     Testiattribuutin määritelmä
    Click Element with wait     ${CREATE_NEW_ATTRIBUTE_BTN}
    Click Element with wait     ${CREATE_AND_USE_ATTRIBUTE}
    Save Class

    Click Element with wait    //*[contains(text(), "Testiattribuutti")]
    Click Element with wait    //*[contains(text(), "autom:testiattribuutti")]

    Wait Until Page Contains    Testiattribuutti                
    Wait Until Page Contains    Käsitteen määritelmä            
    Wait Until Page Contains    Testiattribuutin määritelmä     
    Wait Until Page Contains    Sanasto                         
    Wait Until Page Contains    ${VOCABULARY_1}                 

    Click Element with wait    ${MODIFY_CLASS}
    Click Element with wait    ${ADD_PROPERTY_DDL}
    Click Element with wait    ${ADD_PROPERTY_BTN}
    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}    Testiassosiaatio
    Click Element with wait    ${CREATE_NEW_ASSOCIATION_LINK}
    Click Element with wait    ${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}
    Input Text with wait        ${CONCEPT_DEFINITION_INPUT}    Testiassosiaation määritelmä
    Click Element with wait    ${CREATE_NEW_ASSOCIATION_BTN}
    Click Element with wait    ${CREATE_AND_USE_ASSOCIATION}
    Click Element with wait    //*[contains(text(), "autom:testiassosiaatio")]

    Wait Until Page Contains    Testiassosiaatio                
    Wait Until Page Contains    Käsitteen määritelmä            
    Wait Until Page Contains    Testiassosiaation määritelmä    
    Wait Until Page Contains    Sanasto                         
    Wait Until Page Contains    ${VOCABULARY_1}                 
    Save Class

    Close All Browsers

    Open sanastot
    Select admin user
    Input Text with wait            id=vocabularies_search_input     ${VOCABULARY_1}
    Click Element with wait         //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains        ${VOCABULARY_1}    

    Click Element with wait         id=conceptsTab    
    Click Element with wait         //*[contains(@id,'concept-0_concept_list_listitem')]    
    Wait Until Page Contains        Testiattribuutti    

    Click Element with wait         //*[contains(@id,'concept-1_concept_list_listitem')]    
    Wait Until Page Contains        Testiassosiaatio    

    [Teardown]    Test Case Teardown Terminologies     ${VOCABULARY_1}      ${PREFIX_1}

218. Create new namespace
    [Documentation]    Create new profile and create new namespace. Check that namespace prefix can not be
    ...    "example" or same as the model prefix. Check that namespace can be added only once. Add two classes.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Click Element with wait     ${IMPORT_NAMESPACE}
    Click Element with wait     ${CREATE_NEW_NAMESPACE}

    Input Text with wait        ${NAMESPACE_LABEL}      autom1
    Input Text with wait        ${NAMESPACE_VALUE}      http://uri.suomi.fi/datamodel/ns/autom1/
    Input Text with wait        ${NAMESPACE_PREFIX}     autom
    Input Text with wait        ${NAMESPACE_PREFIX}     example
    Input Text with wait        ${NAMESPACE_PREFIX}     autom1

    Click Element with wait                     ${NAMESPACE_CREATE}
    Wait until page does not contain element    ${NAMESPACE_CREATE}
    Click Element with wait                     ${IMPORT_NAMESPACE}
    Click Element with wait                     ${CREATE_NEW_NAMESPACE}     timeout=60

    Input Text with wait        ${NAMESPACE_LABEL}      autom2
    Input Text with wait        ${NAMESPACE_VALUE}      http://uri.suomi.fi/datamodel/ns/autom1/

    Wait Until Page Contains    ${namespace_in_use}    
    Click Element with wait    ${CANCEL_NAMESPACE_CREATION}
    Click Element with wait    ${CANCEL_SEARCH_NAMESPACE}
    Save Model

    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/autom1/    
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    uusiluokka10
    Save Class

    Wait Until Element Is Enabled           //*[contains(@id,'Uusiluokka10_tabset_link')]    
    Add Class    Rooli    ${NAMESPACE_1}

    Confirm All Properties For Class And Save
    Wait Until Page Contains Element        //*[contains(@id,'Rooli_tabset_link')]    

219. Export class in different formats
    [Documentation]    Create new profile and class.
    ...    Check that export for class is succesfull in all formats.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka    
    Wait Until Page Contains Element    ${EXPORT_CLASS_DDL}    
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Wait Until Element Is Visible    ${EXPORT_JSON_LD}    
    Click Element with wait    ${EXPORT_JSON_LD}
    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson&lang=fi&raw=true
    Wait Until Page Contains    "@id" : "autom:Testiluokka",    
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Click Element with wait    ${EXPORT_Turtle}
    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=text%2Fturtle&lang=fi&raw=true
    Wait Until Page Contains    "Testiluokka"@fi    
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Click Element with wait    ${EXPORT_RDF}
    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Frdf%2Bxml&lang=fi&raw=true
    Wait Until Page Contains    xmlns:autom="http://uri.suomi.fi/datamodel/ns/autom#"    
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Click Element with wait    ${EXPORT_XML}

    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fxml&lang=fi&raw=true
    Wait Until Page Contains    sawsdl:modelReference="http://uri.suomi.fi/datamodel/ns/autom#Testiluokka">    
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Click Element with wait    ${EXPORT_JSON_Schema}
    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
    Wait Until Page Contains    "id": "http://uri.suomi.fi/datamodel/ns/autom#Testiluokka.jschema",    
    Page Should Not Contain    {"errorMessage":"Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Click Element with wait    ${EXPORT_CLASS_DDL}
    Click Element with wait    ${EXPORT_JSON_LD_Context}

    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportResource?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom%23Testiluokka&content-type=application%2Fld%2Bjson%2Bcontext&lang=fi&raw=true
    Wait Until Page Contains    "@context": {    
    Wait Until Page Contains    "Testiluokka": "http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"    
    Page Should Not Contain    {"errorMessage": "Not found"}
    Page Should Not Contain    Whitelabel Error Page
    Close Window

220. Deactivate class and export class in JSON Schema format
    [Documentation]    Create new profile and class.
    ...    Deactivate class and check that deactivated class is not used in JSON Schema generation.
    [Tags]    regression    tietomallit    200    test
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Click Element with wait    ${DEACTIVATED_CHECKBOX}
    Save Class

    Wait Until Page Contains    Testiluokka    
    Wait Until Page Contains    Deaktivoitu    
    Wait Until Page Contains    Kyllä    

    Click Element with wait    ${EXPORT_MODEL_DDL}
    Click Element with wait    ${EXPORT_MODEL_JSON_Schema}

    Switch window with wait  url=${DATA_VOCABULARIES_ENVIRONMENT_URL}datamodel-api/api/v1/exportModel?graph=http%3A%2F%2Furi.suomi.fi%2Fdatamodel%2Fns%2Fautom&content-type=application%2Fschema%2Bjson&lang=fi&raw=true
    Page Should Not Contain    "@id":"http://uri.suomi.fi/datamodel/ns/autom#Testiluokka"
    Page Should Not Contain    Whitelabel Error Page
    Page Should Not Contain    {"errorMessage":"Not found"}
    Close Window

221. Create namespace with certain prefix
    [Documentation]    Create new profile and create new namespace. Check that namespace URI is set
    ...    correctly with certain prefix. Add two classes.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile     ${MODEL_1}
    Import Namespace            Julkishallinnon tietokomponentit

    Click Element with wait     ${IMPORT_NAMESPACE}
    Click Element with wait     ${CREATE_NEW_NAMESPACE}
    Input Text with wait        ${NAMESPACE_PREFIX}    httpv
    Wait Until Page Contains    http://www.w3.org/2011/http#    

    Input Text with wait        ${NAMESPACE_PREFIX}    rdf
    Wait Until Page Contains    http://www.w3.org/1999/02/22-rdf-syntax-ns#    

    Click Element with wait     ${CANCEL_NAMESPACE_CREATION}
    Click Element with wait     ${CREATE_NEW_NAMESPACE}
    Input Text with wait        ${NAMESPACE_PREFIX}    iow

    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/iow#    
    Input Text with wait        ${NAMESPACE_LABEL}    namesapce_iow
    Click Element with wait     ${NAMESPACE_CREATE}
    Save Model

    Wait Until Page Contains    http://uri.suomi.fi/datamodel/ns/iow#    
    Wait Until Page Contains    namesapce_iow    
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    uusiluokka10
    Save Class

    Wait Until Page Contains Element    //*[contains(@id,'Uusiluokka10_tabset_link')]    
    Add Class    Rooli    ${NAMESPACE_1}

    Confirm All Properties For Class And Save
    Wait Until Page Contains Element    //*[contains(@id,'Rooli_tabset_link')]    

222. Change ID for class and predicate
    [Documentation]    Create new profile, class, attribute and association.
    ...    Check that changing ID for class, attribute and association is successful. YTI-821.
    [Tags]    regression    tietomallit    200    test
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka    
    Select And Edit Class    Testiluokka
    Input Text with wait     ${CLASS_ID}    Testiluokka_123    timeout=60
    Save Class

    Wait Until Page Contains Element    //*[contains(text(), "autom:Testiluokka_123")]    timeout=60
    Create New Attribute    testiattribuutti
    Select And Edit Predicate    ${ATTRIBUTE_TAB}    testiattribuutti
    Input Text with wait     ${PREDICATE_ID}    testiattribuutti_123    timeout=60
    Save Predicate

    Wait Until Page Contains Element    //*[contains(text(), "autom:testiattribuutti_123")]    timeout=60
    Create new association    testiassosiaatio
    Select And Edit Predicate    ${ASSOCIATION_TAB}    testiassosiaatio
    Input Text with wait    ${PREDICATE_ID}    testiassosiaatio_123    timeout=60
    Save Predicate

    Wait Until Page Contains Element    //*[contains(text(), "autom:testiassosiaatio_123")]

223. Add property pairs
    [Documentation]    Create new profile and class. Add three new attributes for class and
    ...    add property pairs for attribute. Delete one attribute and check that removed attribute
    ...    can not be added as property pair.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Vertailuluokka1
    Add Property For Class    testi arvo
    Add Property For Class    max arvo
    Add Property For Class    min arvo

    Add Property Pair    ${PROPERTY_EQUALS_BTN}    autom#maxarvo
    Add Property Pair    ${PROPERTY_LESS_THAN_BTN}    autom#maxarvo
    Add Property Pair    ${PROPERTY_LESS_THAN_OR_EQUALS_BTN}    autom#maxarvo

    Click Element with wait    id=class_property_TestiArvo_accordion_button     timeout=60
    Click Element with wait    //*[contains(text(), "Poista attribuutti")]
    Click Element with wait    id=class_property_MinArvo_accordion_button       timeout=60
    Click Element with wait    ${PROPERTY_DISJOINT_BTN}
    Page Should Not Contain Element    //*[contains(@id,'autom#testiarvo_search_result_link')]

    Click Element with wait    //*[contains(@id,'autom#maxarvo_search_result_link')]
    Click Element with wait    //*[contains(text(), "Käytä attribuuttia")]
    Save Class

    Click Element with wait    //*[contains(text(), "Min arvo")]
    Wait Until Page Contains    Pienempi kuin                       
    Wait Until Page Contains    Eri kuin                            
    Wait Until Page Contains    Yhtä kuin                           
    Wait Until Page Contains    Pienempi tai yhtä suuri kuin        
    Wait Until Page Contains Element    //*[contains(text(), "autom:maxarvo")]              
    Wait Until Page Contains Element    //*[contains(@id,'Vertailuluokka1_tabset_link')]    timeout=60

224. Add equivalent class from URN namespace
    [Documentation]    Create new profile and create urn namespace. Add equivalent class from URN namespace for
    ...    class and check that equivalent class is displayed correctly. YTI-732.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Create New Namespace    testi urn    urn:testurn:testi    urn1
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    uusiluokka10
    Save Class

    Wait Until Element Is Enabled    //*[contains(@id,'Uusiluokka10_tabset_link')]    
    Select And Edit Class    Uusiluokka10
    Input Text with wait    //input[contains(@id,"equivalentClass")]    urn1:esimerkki
    Save Class

    Wait Until Page Contains    Vastaavat luokat    
    Wait Until Page Contains    urn1:esimerkki      
    Reload Page
    Wait Until Page Contains    Vastaavat luokat    
    Wait Until Page Contains    urn1:esimerkki      

225. Add sub class
    [Documentation]    Check that adding sub class is successful.
    ...    Check that super class information is shown in sub class information. YTI-166.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Add Sub Class    Kaikki tietomallit    Alue    jhs#Alue
    Save Class

    Wait Until Page Contains    Yläluokka       
    Wait Until Page Contains    jhs:Alue        

226. Add sub class without namespace
    [Documentation]    Check that adding sub class is successful when namespace is not added for model.
    ...    Check that super class information is shown in sub class information. YTI-166.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Add Sub Class    Kaikki tietomallit    Osoite    rak#Osoite
    Save Class

    Wait Until Page Contains    Yläluokka       
    Wait Until Page Contains    rak:Osoite      

227. Add super class
    [Documentation]    Check that adding super class is successful.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Add Super Class    Kaikki tietomallit    Alue    jhs#Alue
    Save Class

    Wait Until Page Contains    autom:Alue    

228. Copy class
    [Documentation]    Check that copying class is successful.
    [Tags]    regression    tietomallit    test    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Copy Class    Kaikki tietomallit    Alue    jhs#Alue
    Save Class

    Wait Until Page Contains    autom:Alue    

229. Add sub attribute
    [Documentation]    Check that adding sub attribute is successful.
    ...    Check that super attribute information is shown in sub attribute information. YTI-1047.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab          ${ATTRIBUTE_TAB}
    Add Sub Attribute    Kaikki tietomallit    Aihe    jhs#aihe
    Save Predicate

    Wait Until Page Contains    Yläattribuutti      
    Wait Until Page Contains    jhs:aihe            

230. Add super attribute
    [Documentation]    Check that adding super attribute is successful.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ATTRIBUTE_TAB}
    Add Super Attribute    Kaikki tietomallit    Aihe    jhs#aihe
    Save Predicate

    Wait Until Page Contains    Yläattribuutti    
    Wait Until Page Contains    autom:aihe    

231. Copy attribute
    [Documentation]    Check that adding super attribute is successful.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ATTRIBUTE_TAB}
    Copy Attribute    Kaikki tietomallit    Aihe    jhs#aihe
    Save Predicate

    Wait Until Page Contains    Yläattribuutti      
    Wait Until Page Contains    autom:aihe          

232. Add sub association
    [Documentation]    Check that adding sub association is successful.
    ...    Check that super association information is shown in sub association information.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ASSOCIATION_TAB}
    Add Sub Association    Kaikki tietomallit    Jäsen    jhs#jasen
    Save Predicate

    Wait Until Page Contains    Yläassosiaatio      
    Wait Until Page Contains    autom:jasen         
    Wait Until Page Contains    jhs:jasen           

233. Copy association
    [Documentation]    Check that copying association is successful.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab          ${ASSOCIATION_TAB}
    Copy Association    Kaikki tietomallit    Jäsen    jhs#jasen
    Save Predicate

    Wait Until Page Contains    Assosiaation tunniste   
    Wait Until Page Contains    autom:jasen             

234. Add super association
    [Documentation]    Check that adding super association is successful.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ASSOCIATION_TAB}
    Add Super Association    Kaikki tietomallit    Jäsen    jhs#jasen
    Save Predicate

    Wait Until Page Contains    Assosiaation tunniste       
    Wait Until Page Contains    autom:jasen                 

235. Convert sub attribute to association
    [Documentation]    Create sub attribute and convert it to association. YTI-1090.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ATTRIBUTE_TAB}
    Add Sub Attribute    Kaikki tietomallit    Aihe    jhs#aihe
    Save Predicate

    Wait Until Page Contains        Yläattribuutti      
    Wait Until Page Contains        jhs:aihe            
    Select And Edit Predicate       ${ATTRIBUTE_TAB}    aihe
    Convert To Association
    Save Predicate

    Select Tab    ${ASSOCIATION_TAB}
    Wait Until Page Contains Element    //*[contains(@id,'aihe_tabset_link')]    
    Select Tab    ${ATTRIBUTE_TAB}

    Page Should Not Contain Element    //*[contains(@id,'aihe_tabset_link')]

236. Check sub attribute history information
    [Documentation]    Create model and sub attribute and delete both. Check that history information
    ...    is visible after deleting and creating same model and sub attribute again. YTI-107.
    [Tags]    regression    test    tietomallit    200
    Select And Edit Profile    ${MODEL_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ATTRIBUTE_TAB}
    Add Sub Attribute    Kaikki tietomallit    Henkilötunnus    jhs#henkilotunnus
    Save Predicate

    Wait Until Page Contains    Yläattribuutti    
    Wait Until Page Contains    jhs:henkilotunnus    
    Show History    ${PREDICATE_HISTORY_BTN}

    Wait Until Page Contains Element    //*[contains(@id,'urn:')]    
    ${elements} =    Get WebElements    //*[contains(@id,'urn:')]
    ${element} =    Get From List    ${elements}    0
    ${elementId} =    Set Variable    ${element.get_attribute('id')}
    Log    ${elementId}
    Click Element with wait    ${elementId}
    Click Element with wait    ${CLOSE_HISTORY_VIEW_BTN}

    Go Back To Data Vocabularies Frontpage
    Delete Existing Profile And Create New    ${MODEL_1}    ${PREFIX_1}
    Modify Profile
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Select Tab    ${ATTRIBUTE_TAB}
    Add Sub Attribute    Kaikki tietomallit    Henkilötunnus    jhs#henkilotunnus
    Save Predicate

    Wait Until Page Contains    Yläattribuutti    
    Wait Until Page Contains    jhs:henkilotunnus    
    Show History    ${PREDICATE_HISTORY_BTN}

    Wait Until Page Contains Element    //*[contains(@id,'urn:')]    
    ${elements} =    Get WebElements    //*[contains(@id,'urn:')]
    ${element} =    Get From List    ${elements}    0
    ${elementId} =    Set Variable    ${element.get_attribute('id')}
    Log    ${elementId}
    Click Element with wait   ${elementId}
    Click Element with wait    ${CLOSE_HISTORY_VIEW_BTN}

237. Add association between two classes in core vocabulary
    [Documentation]    Add association between two classes in core vocabulary
    [Tags]    regression    tietomallit    test    200
    [Setup]   Test Case setup create Vocabulary     ${CORE_VOCABULARY_1}   ${PREFIX_2}

    Select And Edit Profile    ${CORE_VOCABULARY_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Uusiluokka
    Save Class

    Wait Until Page Contains    Uusiluokka          
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Wait Until Page Contains    Testiluokka         
    Add Association             Rekisteröinti

    Click Element with wait     ${VALUE_CLASS_BTN}
    Input Text with wait        ${SEARCH_CLASS_INPUT}    Uusiluokka
    Click Element with wait     //*[contains(@id, 'Uusiluokka_search_result_link')]
    Click Element with wait     ${SPECIALIZE_CLASS}

    Save Class
    Wait Until Page Contains    Rekisteröinti       
    Wait Until Page Contains    lib:Uusiluokka      

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

