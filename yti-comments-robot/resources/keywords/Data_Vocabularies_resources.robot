*** Settings ***
Documentation     Resource file for Data Vocabularies tool
Library           SeleniumLibrary

*** Variables ***
${DATA_VOCABULARIES_USER_1}    id=impersonate_user_testiadmin@localhost_link
${MODEL_1}        Testiautomaatio
${CORE_VOCABULARY_1}    Automaatiokirjasto
${REMOVE_Asuminen}    id=classifications_Asuminen_remove_editable_button
${REMOVE_Kulttuuri}    id=classifications_Kulttuuri_remove_editable_button
${REMOVE_Testiorganisaatio}    id=contributors_Testiorganisaatio_remove_editable_button
${REMOVE_Väestörekisterikeskus}    id=contributors_Vaestorekisterikeskus_remove_editable_button
${REMOVE_LINK}    id=links_Www.suomi.fi/etusivu/_remove_editable_button
${NAMESPACE_1}    Julkishallinnon tietokomponentit
${CREATE_NEW_CLASS_LINK}    id=create_class_button
${CREATE_NEW_CLASS_BTN}    id=searchConceptModalConfirmButton
${class_2}        automobiili
#Frontpage
${ADD_MODEL_BTN}    id=model_creation_button
${DATA_VOCABULARIES_USER_DROPDOWN}    id=impersonate_user_link
${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    id=front_page_search_input
${TEXT_FILTER_SEARCH_INPUT}    id=text_filter_search_input
${FRONTPAGE_ADVANCED_SEARCH}    id=advanced_search_link
${NAVIGATION_MENU_DDL}    id=navigation_menu_dropdown
${GUIDE_BTN}      id=start_help_link
${GUIDE_CORE_VOCABULARY}    id=OhjeUudenTietokomponenttikirjastonLuomiseen_help_link
${GUIDE_APPLICATION_PROFILE}    id=OhjeUudenSoveltamisprofiilinLuomiseen_help_link
${GUIDE_NAMESPACE}    id=NimiavaruudenLisaamisenOhjeistus_help_link
${GUIDE_CREATE_CLASS}    id=UudenLuokanLuomisenOhjeistus_help_link
${GUIDE_SPECIALIZE_CLASS}    id=LuokanErikoistamisenOhjeistus_help_link
${GUIDE_ADD_ATTRIBUTE}    id=AttribuutinLisaamisenOhjeistus_help_link
${GUIDE_ADD_ASSOCIATION}    id=AssosiaationLisaamisenOhjeistus_help_link
${GUIDE_NEXT_BTN}    id=help_popover_next_button
${GUIDE_CLOSE_BTN}    id=help_popover_close_button
${MAIN_PAGE_LINK}    id=main_page_link
#Buttons and links
${ADD_CLASS_BTN}    id=add_new_class_button
${USAGE_BTN}      id=model_http://uri.suomi.fi/datamodel/ns/test_accordion_button
#Model
${MODEL_DETAILS_TAB}    id=modelDetailsTab
${MODEL_DATA_TAB}    id=dataTab
${MODEL_LABEL_INPUT}    id=modelLabel
${MODEL_DESCRIPTION_INPUT}    id=modelComment
${MODEL_PREFIX_INTPUT}    id=modelPrefix
${ADD_CLASSIFICATION}    id=add_classification_button
${ADD_CONTRIBUTOR}    id=add_contributor_button
${ADD_VOCABULARY}    id=add_vocabulary_button
${SAVE_NEW_MODEL_BTN}    id=save_new_model_button
${SAVE_MODEL_BTN}    id=model_edit_buttons_save
${REMOVE_MODEL_BTN}    id=model_edit_buttons_remove
${CONFIRM_REMOVE_MODEL_BTN}    id=confirm_modal_template_button
${ADD_LINK}       id=add_link_button
${LINK_URL_INPUT}    id=add_link_url_input
${LINK_NAME_INPUT}    id=add_link_title_input
${LINK_DESCRIPTION_INPUT}    id=add_link_description_textarea
${MODIFY_MODEL}    id=model_edit_buttons_edit
${CREATE_NEW_LINK}    id=create_link_button
${IMPORT_NAMESPACE}    id=add_imported_namespace_button
${SEARCH_NAMESPACE_INPUT}    id=text_filter_search_input
${SEARCH_VOCABULARY_INPUT}    id=text_filter_search_input
${ADD_REF_DATA_BTN}    id=add_reference_data_button
${REF_DATA_FILTER_DDL}    id=reference_data_status_filter_dropdown
${SEARCH_REF_DATA_INPUT}    id=text_filter_search_input
${USE_SELCTION_BTN}    //div[1]/div/div/form/div[3]/button[1]/span[2]
${ADD_PROFILE_BTN}    id=add_profile_button
${ADD_LIBRARY_BTN}    id=add_library_button
${SAVE_NEW_MODEL_BTN}    id=save_new_model_button
#Class
${ADD_NEW_CLASS}    id=add_new_class_button
${SEARCH_CLASS_INPUT}    id=text_filter_search_input
${SPECIALIZE_CLASS}    //div[1]/div/div/form/div[3]/button[1]
${CONFIRM_ADD_PROPERTIES}    id=confirm_properties_from_class_button
${SAVE_CLASS}     id=class_edit_buttons_save
${MODIFY_CLASS}    id=class_edit_buttons_edit
${ADD_PROPERTY_DDL}    id=class_options_button_add_property_dropdown_title
${ADD_PROPERTY_BTN}    id=class_options_button_add_property_LisaaAttribuuttiTaiAssosiaatio_dropdown_option
${SEARCH_ATTRIBUTE_INPUT}    id=text_filter_search_input
${USE_SELECTION_BTN}    //div[1]/div/div/form/div[3]/button[1]
${ALL_TYPES_DDL}    id=type
${ASSOCIATION_TYPE}    //*[@id="type"]/option[3]
${ATTRIBUTE_TYPE}    //*[@id="type"]/option[2]
${VALUE_CLASS_BTN}    //*[contains(@id,'_valueClass_choose_class_uri_select_button')]
${CREATE_NEW_CLASS_WITHOUT_REF_LINK}    id=create_new_LuoUusiLuokkaIlmanKasiteviitetta_link
${CREATE_NEW_SHAPE_BY_REF_URI}    id=create_new_LuoUusiTarkennettuLuokkaViittaamallaUlkoiseenTunnisteeseen_link
${EXTERNAL_URI_INPUT}    id=externalUri
${CHANGE_CONCEPT}    id=class_subject_change_concept_button
${SEARCH_CONCEPT_DB_INPUT}    id=text_filter_search_input
${SHOW_CLASS_HISTORY_BTN}    id=class_edit_buttons_history
${CLOSE_HISTORY_BTN}    //div[1]/div/div/div[3]/button
${REMOVE_CLASS_BTN}    id=class_edit_buttons_remove
${CLASS_MODEL_DDL}    id=model
#Core Vocabulary
${CORE_VOCABULARY_LABEL_INPUT}    id=modelLabel
${CORE_VOCABULARY_DESCRIPTION_INPUT}    id=modelComment
${CORE_VOCABULARY_PREFIX_INPUT}    id=modelPrefix
${VOCABULARY_ADD_CLASSIFICATION}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/classifications-view/h4/button/span
${VOCABULARY_ADD_CONTRIBUTOR}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/contributors-view/h4/button/span
${SAVE_CORE_VOCABULARY_BTN}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[1]/button[2]/span
${MODIFY_CORE_VOCABULARY_BTN}    //*[@id="'model'"]/div/form/fieldset/div/editable-entity-buttons/div/button[3]/span

*** Keywords ***
Data Vocabularies Setup
    Test Case Setup Create Profile

Data Vocabularies Teardown
    Delete Data Vocabularies Profile

Data Vocabularies Setup With New Class
    Test Case Setup Create Profile
    Create New Class For Profile    ${class_2}

Test Case Setup
    Open Tietomallit
    Set Selenium Speed      ${SELENIUM_SPEED}
    Data Vocabularies Select user

Data Vocabularies Select user
    Wait Until Page Contains Element    ${DATA_VOCABULARIES_USER_DROPDOWN}    timeout=30
    Click element with wait  ${DATA_VOCABULARIES_USER_DROPDOWN}
    Wait Until Page Contains Element    ${DATA_VOCABULARIES_USER_1}    timeout=60
    Click element with wait  ${DATA_VOCABULARIES_USER_1}
    Wait Until Page Contains    Test Admin    timeout=20
    Sleep    2

Go back to Data Vocabularies frontpage and close browsers
    Wait Until Element Is Visible    ${MAIN_PAGE_LINK}    timeout=30
    Click element with wait  ${MAIN_PAGE_LINK}
    Sleep    2
    Close All Browsers

Go back to Data Vocabularies frontpage
    Wait Until Element Is Visible    ${MAIN_PAGE_LINK}    timeout=60
    Sleep    3
    Click element with wait  ${MAIN_PAGE_LINK}
    Sleep    2

Test Case Setup Create Profile
    Test Case Setup
    Wait Until Page Contains Element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    ${model_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatio")]    limit=1
    Run Keyword If    ${model_exists}    Delete existing profile and create new
    ...    ELSE    Create Data Vocabulary Profile
    Go back to Data Vocabularies frontpage

Test Case Teardown Delete Testiautomaatio profile
    Delete Testiautomaatio profile

Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Test Case Setup
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    ${model_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Automaatiokirjasto")]    limit=1
    Run Keyword If    ${model_exists}    Delete existing core vocabulary and create new
    ...    ELSE    Create Automaatiokirjasto Core Vocabulary
    Go back to Data Vocabularies frontpage

Test Case Teardown Delete Automaatiokirjasto Core Vocabulary
    Delete Automaatiokirjasto Core Vocabulary

Create Data Vocabulary Profile
    Wait Until Page Contains Element    ${ADD_MODEL_BTN}    timeout=30
    Click element with wait  ${ADD_MODEL_BTN}
    Wait Until Page Contains Element    ${ADD_PROFILE_BTN}    timeout=30
    Click element with wait  ${ADD_PROFILE_BTN}
    Wait Until Page Contains Element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    ${MODEL_1}
    Wait Until Page Contains Element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait Until Page Contains Element    ${MODEL_PREFIX_INTPUT}    timeout=30
    Input Text    ${MODEL_PREFIX_INTPUT}    cmts_autom
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION}    timeout=30
    Click element with wait  ${ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "Asuminen")]    timeout=30
    Click element with wait  //*[contains(text(), "Asuminen")]
    Wait Until Page Contains Element    ${ADD_CONTRIBUTOR}    timeout=30
    Click element with wait  ${ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click element with wait  //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_NEW_MODEL_BTN}    timeout=30
    Click element with wait  ${SAVE_NEW_MODEL_BTN}
    Wait Until Page Contains Element    ${MODEL_DATA_TAB}    timeout=90
    Log To Console    Testiautomaatio profile created
    Sleep    2

Delete Data Vocabularies Profile
    Test Case Setup
    Wait Until Page Contains Element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click element with wait  //*[contains(text(), "Testiautomaatio")]
    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Click element with wait  ${REMOVE_MODEL_BTN}
    Click element with wait  ${CONFIRM_REMOVE_MODEL_BTN}

    Wait Until Page Contains Element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains    tietomallia    timeout=30

    Close All Browsers

Delete existing profile and create new
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click element with wait  //*[contains(text(), "Testiautomaatio")]

    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60

    Click element with wait  ${REMOVE_MODEL_BTN}
    Click element with wait  ${CONFIRM_REMOVE_MODEL_BTN}

    Wait Until Page Contains Element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains    tietomallia    timeout=30

    Create Data Vocabulary Profile

Create Automaatiokirjasto Core Vocabulary
    Wait Until Page Contains Element    ${ADD_MODEL_BTN}    timeout=30
    Click element with wait  ${ADD_MODEL_BTN}
    Wait Until Page Contains Element    ${ADD_LIBRARY_BTN}    timeout=30
    Click element with wait  ${ADD_LIBRARY_BTN}
    Wait Until Page Contains Element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait Until Page Contains Element    ${CORE_VOCABULARY_PREFIX_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_PREFIX_INPUT}    lib
    Wait Until Page Contains Element    ${VOCABULARY_ADD_CLASSIFICATION}    timeout=30
    Click element with wait  ${VOCABULARY_ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "Asuminen")]    timeout=30
    Click element with wait  //*[contains(text(), "Asuminen")]
    Wait Until Page Contains Element    ${VOCABULARY_ADD_CONTRIBUTOR}    timeout=30
    Click element with wait  ${VOCABULARY_ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click element with wait  //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_CORE_VOCABULARY_BTN}    timeout=30
    Click element with wait  ${SAVE_CORE_VOCABULARY_BTN}
    Log To Console    Automaatiokirjasto Core Vocabulary created
    Sleep    2

Delete Automaatiokirjasto Core Vocabulary
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click element with wait  //*[contains(text(), "Automaatiokirjasto")]

    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Click element with wait  ${REMOVE_MODEL_BTN}
    Click element with wait  ${CONFIRM_REMOVE_MODEL_BTN}

    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains    tietomallia    timeout=30

    Close All Browsersd

Delete existing core vocabulary and create new
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click element with wait  //*[contains(text(), "Automaatiokirjasto")]
    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60

    Click element with wait  ${REMOVE_MODEL_BTN}
    Click element with wait  ${CONFIRM_REMOVE_MODEL_BTN}

    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains    tietomallia    timeout=30

    Create Automaatiokirjasto Core Vocabulary

Select model
    [Arguments]    ${model}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${model}
    Wait Until Page Contains Element    //*[contains(text(), "${model}")]    timeout=30
    Sleep    1
    Click element with wait  //*[contains(text(), "${model}")]
    Wait Until Page Contains    ${model}    timeout=30
    Log To Console    ${model} selected
    Sleep    1

Select and edit Testiautomaatio profile
    Wait Until Page Contains Element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${MODEL_1}

    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click element with wait  //*[contains(text(), "Testiautomaatio")]

    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Wait Until Page Contains Element    ${MODIFY_MODEL}    timeout=30
    Click element with wait  ${MODIFY_MODEL}

Select and edit Automaatiokirjasto Core Vocabulary
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click element with wait  //*[contains(text(), "Automaatiokirjasto")]

    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Wait Until Page Contains Element    ${MODIFY_CORE_VOCABULARY_BTN}    timeout=30
    Click element with wait  ${MODIFY_CORE_VOCABULARY_BTN}

Add classification
    [Arguments]    ${classification}
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION}    timeout=30
    Click element with wait  ${ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "${classification}")]    timeout=30
    Click element with wait  //*[contains(text(), "${classification}")]
    Sleep    2
    Log To Console    New classification ${classification} added

Add contributor
    [Arguments]    ${contributor}
    Wait Until Page Contains Element    ${ADD_CONTRIBUTOR}    timeout=30
    Click element with wait  ${ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "${contributor}")]    timeout=30
    Click element with wait  //*[contains(text(), "${contributor}")]
    Sleep    2
    Log To Console    New contributor ${contributor} added

Add vocabulary
    [Arguments]    ${vocabulary}
    Wait Until Page Contains Element    ${ADD_VOCABULARY}    timeout=30
    Click element with wait  ${ADD_VOCABULARY}
    Wait Until Page Contains Element    ${SEARCH_VOCABULARY_INPUT}    timeout=30
    Input Text    ${SEARCH_VOCABULARY_INPUT}    ${vocabulary}
    Click element with wait  //*[contains(text(), "${vocabulary}")]
    Sleep    2
    Wait Until Page Contains Element    //*[contains(text(), "${vocabulary}")]    timeout=30
    Click element with wait  //*[contains(text(), "${vocabulary}")]
    Sleep    2

Import namespace
    [Arguments]    ${namespace}
    Wait Until Page Contains Element    ${IMPORT_NAMESPACE}    timeout=30
    Click element with wait  ${IMPORT_NAMESPACE}
    Wait Until Page Contains Element    ${SEARCH_NAMESPACE_INPUT}    timeout=30
    Input Text    ${SEARCH_NAMESPACE_INPUT}    ${namespace}
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "${namespace}")]    timeout=30
    Click element with wait  //*[contains(text(), "${namespace}")]
    Sleep    2
    Log To Console    New namespace ${namespace} added

Save model
    Wait Until Page Contains Element    //*[contains(text(), "Tallenna")]    timeout=30
    Click element with wait  //*[contains(text(), "Tallenna")]
    Wait Until Element Is Visible    ${MODIFY_MODEL}    timeout=60
    Sleep    2

Add class
    [Arguments]    ${class}    ${model}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click element with wait  ${ADD_NEW_CLASS}
    Wait Until Element Is Visible    ${CLASS_MODEL_DDL}    timeout=60
    Click element with wait  ${CLASS_MODEL_DDL}
    Wait Until Element Is Visible    //*[contains(text(), "${model}")]    timeout=60
    Click element with wait  //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Wait Until Element Is Visible    //*[contains(text(), "${class}")]    timeout=60
    Click element with wait  //*[contains(text(), "${class}")]
    Sleep    2
    Wait Until Page Contains Element    ${SPECIALIZE_CLASS}    timeout=30
    Click element with wait  ${SPECIALIZE_CLASS}
    Sleep    2

Add several classes
    [Arguments]    @{class_items}
    FOR    ${class_item}    IN    @{class_items}
        Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
        Click element with wait  ${ADD_NEW_CLASS}
        Wait Until Page Contains element    ${SEARCH_CLASS_INPUT}    timeout=30
        Input Text    ${SEARCH_CLASS_INPUT}    ${class_item}
        Click element with wait  //*[contains(text(), "${class_item}")]
        Sleep    2
        Wait Until Page Contains element    ${SPECIALIZE_CLASS}    timeout=30
        Click element with wait  ${SPECIALIZE_CLASS}
        Sleep    1
        Confirm all properties for class and save
        Sleep    2
    END

Save class
    Wait Until Page Contains element    ${SAVE_CLASS}    timeout=30
    Click element with wait  ${SAVE_CLASS}
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Confirm all properties for class and save
    Wait Until Page Contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click element with wait  ${CONFIRM_ADD_PROPERTIES}
    Sleep    2
    Wait Until Page Contains element    ${SAVE_CLASS}    timeout=30
    Click element with wait  ${SAVE_CLASS}
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Deselect properties for class and save
    [Arguments]    @{class_properties}
    FOR    ${class_property}    IN    @{class_properties}
        Unselect Checkbox    ${class_property}
        Checkbox Should Not Be Selected    ${class_property}
    END
    Wait Until Page Contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click element with wait  ${CONFIRM_ADD_PROPERTIES}
    Wait Until Page Contains element    ${SAVE_CLASS}    timeout=30
    Click element with wait  ${SAVE_CLASS}
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Add attribute
    [Arguments]    ${attribute}
    Wait Until Page Contains element    ${MODIFY_CLASS}    timeout=30
    Click element with wait  ${MODIFY_CLASS}
    Wait Until Page Contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click element with wait  ${ADD_PROPERTY_DDL}
    Wait Until Page Contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click element with wait  ${ADD_PROPERTY_BTN}
    Sleep    4
    Wait Until Page Contains element    ${ALL_TYPES_DDL}    timeout=30
    Click element with wait  ${ALL_TYPES_DDL}
    Sleep    2
    Click element with wait  //*[contains(text(), "Attribuutti")]
    Wait Until Page Contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Click element with wait  //*[contains(text(), "${attribute}")]
    Wait Until Page Contains element    ${USE_SELECTION_BTN}    timeout=30
    Click element with wait  ${USE_SELECTION_BTN}
    Sleep    2

Add association
    [Arguments]    ${association}
    Wait Until Page Contains element    ${MODIFY_CLASS}    timeout=30
    Click element with wait  ${MODIFY_CLASS}
    Wait Until Page Contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click element with wait  ${ADD_PROPERTY_DDL}
    Wait Until Page Contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click element with wait  ${ADD_PROPERTY_BTN}
    Sleep    4
    Wait Until Page Contains element    ${ALL_TYPES_DDL}    timeout=30
    Click element with wait  ${ALL_TYPES_DDL}
    Sleep    2
    Click element with wait  //*[contains(text(), "Assosiaatio")]
    Wait Until Page Contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${association}
    Click element with wait  //*[contains(text(), "${association}")]
    Wait Until Page Contains element    ${USE_SELECTION_BTN}    timeout=30
    Click element with wait  ${USE_SELECTION_BTN}
    Sleep    2

Change concept for class
    [Arguments]    ${concept}
    Wait Until Page Contains element    ${CHANGE_CONCEPT}    timeout=30
    Click element with wait  ${CHANGE_CONCEPT}
    Wait Until Page Contains element    ${SEARCH_CONCEPT_DB_INPUT}    timeout=30
    Input Text    ${SEARCH_CONCEPT_DB_INPUT}    ${concept}
    Wait Until Page Contains element    //*[contains(text(), "${concept}")]    timeout=30
    Click element with wait  //*[contains(text(), "${concept}")]
    Sleep    2
    Wait Until Page Contains element    ${USE_SELECTION_BTN}    timeout=30
    Click element with wait  ${USE_SELECTION_BTN}
    Sleep    2

Create new class without referencing concept
    [Arguments]    ${class_2}
    Wait Until Page Contains element    ${ADD_NEW_CLASS}    timeout=30
    Click element with wait  ${ADD_NEW_CLASS}
    Wait Until Page Contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class_2}
    Sleep    2
    Wait Until Page Contains element    ${CREATE_NEW_CLASS_LINK}    timeout=30
    Click element with wait  ${CREATE_NEW_CLASS_LINK}
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}    timeout=60
    Click element with wait  ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}
    sleep    2
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_BTN}    timeout=30
    Click element with wait  ${CREATE_NEW_CLASS_BTN}
    Log To Console    New class without referencing concept created
    Sleep    2

Create new shape by referencing external uri
    [Arguments]    ${external_uri}    ${class}
    Wait Until Page Contains element    ${ADD_NEW_CLASS}    timeout=30
    Click element with wait  ${ADD_NEW_CLASS}
    Wait Until Page Contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    2
    Click element with wait  ${CREATE_NEW_SHAPE_BY_REF_URI}
    Sleep    2
    Input Text    ${EXTERNAL_URI_INPUT}    ${external_uri}
    Sleep    3
    Wait Until Element Is Visible    ${USE_SELECTION_BTN}    timeout=30
    Click element with wait  ${USE_SELECTION_BTN}
    Sleep    2

Delete profile
    [Arguments]    ${profile}
    Test Case Setup
    Wait Until Page Contains element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains element    //*[contains(text(), "${profile}")]    timeout=30
    Click element with wait  //*[contains(text(), "${profile}")]
    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60

    Click element with wait  ${REMOVE_MODEL_BTN}
    Click element with wait  ${CONFIRM_REMOVE_MODEL_BTN}

    Wait Until Page Contains element    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${DATA_VOCABULARIES_FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains    tietomallia    timeout=30

    Close All Browsers

Create New Class For Profile
    [Arguments]    ${class_2}
    Select and edit Testiautomaatio profile
    Log To Console    Testiautomaatio profile selected
    Import namespace    Julkishallinnon tietokomponentit
    Save model
    Wait Until Page Contains element    ${MODEL_DATA_TAB}    timeout=30
    Click element with wait  ${MODEL_DATA_TAB}
    Create new class without referencing concept    ${class_2}
    Save class
    Wait Until Page Contains    Automobiili    timeout=30
    Log To Console    Class "Automobiili" added without referencing concept
    Go back to Data Vocabularies frontpage
