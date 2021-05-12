*** Settings ***
Documentation     Resource file for Datamodel application
Library           SeleniumLibrary

*** Variables ***
${SELENIUM_SPEED}    0.5
${BROWSER}        chrome
${DATA_VOCABULARIES_ENVIRONMENT_URL}    https://tietomallit.dev.yti.cloud.vrk.fi/
${USER_1}         id=impersonate_user_testiadmin@localhost_link
${LANGUAGE_EN}    id=en_ui_language_dropdown
${LANGUAGE_FI}    id=fi_ui_language_dropdown
${MODEL_1}        Testiautomaatiomalli
${MODEL_2}        Tilamalli
${PREFIX_1}       autom
${PREFIX_2}       lib
${PREFIX_3}       tatm
${PREFIX_4}       aeghi
${CORE_VOCABULARY_1}    Automaatiokirjasto
${REMOVE_Asuminen}    id=classifications_Asuminen_remove_editable_button
${REMOVE_Kulttuuri}    id=classifications_Kulttuuri_remove_editable_button
${REMOVE_Testiorganisaatio}    id=contributors_Testiorganisaatio_remove_editable_button
${REMOVE_Väestörekisterikeskus}    id=contributors_Vaestorekisterikeskus_remove_editable_button
${REMOVE_LINK}    id=links_Www.suomi.fi/etusivu/_remove_editable_button
${NAMESPACE_1}    Julkishallinnon tietokomponentit
${ENVIRONMENT_IDENTIFIER}    AWSDEV
${DEV_suffix}     ?env=awsdev
${TEST_suffix}    ?env=awstest
#Users
${TEST_ADMIN_ID}    id=impersonate_user_testiadmin@localhost_link
${TEST_ADMIN_NAME}    Test Admin
${TEST_SUPERUSER_ID}    id=impersonate_user_testisuperuser@localhost_link
${TEST_SUPERUSER_NAME}    Test Superuser
${TEST_DATAMODEL_ID}    id=impersonate_user_testdatamodel@localhost_link
${TEST_DATAMODEL_NAME}    Test Datamodel
#Frontpage
${ADD_MODEL_BTN}    id=model_creation_button
${LANGUAGE_DROPDOWN_BTN}    id=ui_language_dropdown
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${FRONTPAGE_SEARCH_BOX}    id=front_page_search_input
${TEXT_FILTER_SEARCH_INPUT}    id=text_filter_search_input
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
${FRONTPAGE_LINK}    id=Etusivu_breadcrumb_link
${MAIN_PAGE_LINK}    id=main_page_link
${LICENSE_ICON_TEXT_LINK}    id=licence_icon_text_link
${EUPL_LICENSE_LINK}    id=license_link
${INFORMATION_LINK}    id=information_link
${DESCRIPTION_OF_FILE_LINK}    id=description_of_file_link
#Buttons and links
${ADD_CLASS_BTN}    id=add_new_class_button
${USAGE_BTN}      id=model_http://uri.suomi.fi/datamodel/ns/test_accordion_button
${CLOSE_BTN}      //div[1]/div/div/div[3]/button
${CONFIRM_ALERT_BTN}    id=confirm_alert_modal_button
#Model
${MODEL_DETAILS_TAB}    id=modelDetailsTab
${MODEL_DATA_TAB}    id=dataTab
${MODEL_LABEL_INPUT}    id=modelLabel
${MODEL_DESCRIPTION_INPUT}    id=modelComment
${MODEL_PREFIX_INPUT}    id=modelPrefix
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
${CREATE_NEW_LINK}    id=create_link_button
${IMPORT_NAMESPACE}    id=add_imported_namespace_button
${SEARCH_NAMESPACE_INPUT}    id=text_filter_search_input
${SEARCH_VOCABULARY_INPUT}    id=text_filter_search_input
${HIDE_MODEL_DETAILS_BTN}    id=hide_model_details_button
${ADD_REF_DATA_BTN}    id=add_reference_data_button
${REF_DATA_FILTER_DDL}    id=reference_data_status_filter_dropdown
${SEARCH_REF_DATA_INPUT}    id=text_filter_search_input
${USE_SELCTION_BTN}    //div[1]/div/div/form/div[3]/button[1]/span[2]
${ADD_PROFILE_BTN}    id=add_profile_button
${ADD_LIBRARY_BTN}    id=add_library_button
${MODIFY_MODEL}    id=model_edit_buttons_edit
${SHOW_HISTORY_BTN}    id=model_edit_buttons_history
${MAXIMAXE_BTN}    id=maximize_button
${DOWNLOAD_DDL}    id=download_dropdown
${PNG_DOWNLOAD}    id=PNG_download_dropdown
${SVG_DOWNLOAD}    id=SVG_download_dropdown
${EXPORT_MODEL_DDL}    id=model_export_dropdown
${OPEN_LINK_MODAL}    class=modal-body
${CLOSE_HISTORY_VIEW_BTN}    id=close_history_view_button
${MODEL_ACTION_MENU}    id=model_action_menu
${ADD_SUBSCRIPTION_BTN}    id=add_subscription_button
${DELETE_SUBSCRIPTION_BTN}    id=remove_subscription_button
${CONFIRMATION_YES_BTN}    id=confirm_confirmation_modal_button
${SUBSCRIPTION_BELL_ICON}    //*[@class="subscription-icon icon-bell"]
${USER_DETAILS_SUBSCRIPTIONS_TAB}    id=user_details_subscriptions_tab
${CHANGE_RESOURCES_STATUSES_CHECKBOX}    id=change_resource_statuses_too_checkbox
${MODEL_CONTACT_INPUT}    id=modelContact
#Status
${MODEL_STATE_DDL}    id=modelState_item_select
${MODEL_STATE_INCOMPLETE}    id=modelState_INCOMPLETE
${MODEL_STATE_DRAFT}    id=modelState_DRAFT
${MODEL_STATE_VALID}    id=modelState_VALID
${MODEL_STATE_SUPERSEDED}    id=modelState_SUPERSEDED
${MODEL_STATE_RETIRED}    id=modelState_RETIRED
${MODEL_STATE_INVALID}    id=modelState_INVALID
${MASS_MIGRATE_STATUSES_BTN}    id=mass_migrate_datamodel_statuses_button
${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}    id=enforce_status_transition_rules_checkbox
${STARTING_STATUS_DDL}    id=selected_migrate_resource_statuses_from_status_input_dropdown
${TARGET_STATUS_DDL}    id=selected_migrate_resource_statuses_to_status_input_dropdown
${STARTING_STATUS_INCOMPLETE}    id=INCOMPLETE_migrate_resource_statuses_from_status_input_dropdown
${STARTING_STATUS_DRAFT}    id=DRAFT_migrate_resource_statuses_from_status_input_dropdown
${STARTING_STATUS_VALID}    id=VALID_migrate_resource_statuses_from_status_input_dropdown
${STARTING_STATUS_SUPERSEDED}    id=SUPERSEDED_migrate_resource_statuses_from_status_input_dropdown
${STARTING_STATUS_RETIRED}    id=RETIRED_migrate_resource_statuses_from_status_input_dropdown
${STARTING_STATUS_INVALID}    id=INVALID_migrate_resource_statuses_from_status_input_dropdown
${TARGET_STATUS_INCOMPLETE}    id=INCOMPLETE_migrate_resource_statuses_to_status_input_dropdown
${TARGET_STATUS_DRAFT}    id=DRAFT_migrate_resource_statuses_to_status_input_dropdown
${TARGET_STATUS_VALID}    id=VALID_migrate_resource_statuses_to_status_input_dropdown
${TARGET_STATUS_SUPERSEDED}    id=SUPERSEDED_migrate_resource_statuses_to_status_input_dropdown
${TARGET_STATUS_RETIRED}    id=RETIRED_migrate_resource_statuses_to_status_input_dropdown
${TARGET_STATUS_INVALID}    id=INVALID_migrate_resource_statuses_to_status_input_dropdown
${SAVE_MIGRATE_RESOURCE_STATUSES}    id=migrate_resource_statuses_button
${CLASS_STATE_DDL}    id=classState_item_select
${CLASS_STATE_INCOMPLETE}    id=classState_INCOMPLETE
${CLASS_STATE_DRAFT}    id=classState_DRAFT
${CLASS_STATE_VALID}    id=classState_VALID
${CLASS_STATE_SUPERSEDED}    id=classState_SUPERSEDED
${CLASS_STATE_RETIRED}    id=classState_RETIRED
${CLASS_STATE_INVALID}    id=classState_INVALID
${PREDICATE_STATE_INCOMPLETE}    id=predicateState_INCOMPLETE
${PREDICATE_STATE_DRAFT}    id=predicateState_DRAFT
${PREDICATE_STATE_VALID}    id=predicateState_VALID
${PREDICATE_STATE_SUPERSEDED}    id=predicateState_SUPERSEDED
${PREDICATE_STATE_RETIRED}    id=predicateState_RETIRED
${PREDICATE_STATE_INVALID}    id=predicateState_INVALID
${PREDICATE_STATE_DDL}    id=predicateState_item_select
#namespace
${CREATE_NEW_NAMESPACE}    id=create_new_namespace_button
${NAMESPACE_LABEL}    id=label
${NAMESPACE_PREFIX}    id=prefix
${NAMESPACE_CREATE}    id=add_new_namespace_confirm_button
${NAMESPACE_VALUE}    id=namespace
${CANCEL_NAMESPACE_CREATION}    id=add_edit_namespace_cancel_button
${CANCEL_SEARCH_NAMESPACE}    //div[1]/div/div/div/div[3]/button
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
${USE_SELECTION_BTN}    id=confirm_class_button
${ALL_TYPES_DDL}    id=type
${ASSOCIATION_TYPE}    //*[@id="type"]/option[3]
${ATTRIBUTE_TYPE}    //*[@id="type"]/option[2]
${VALUE_CLASS_BTN}    //*[contains(@id,'_valueClass_choose_class_uri_select_button')]
${CREATE_NEW_CLASS_WITHOUT_REF_LINK}    id=create_new_LuoUusiLuokkaIlmanKasiteviitetta_link
${CREATE_NEW_SHAPE_BY_REF_URI}    id=create_shape_button
${EXTERNAL_URI_INPUT}    id=externalUri
${CHANGE_CONCEPT}    id=class_subject_change_concept_button
${SEARCH_CONCEPT_DB_INPUT}    id=text_filter_search_input
${SHOW_CLASS_HISTORY_BTN}    id=class_edit_buttons_history
${CLOSE_HISTORY_BTN}    //div[1]/div/div/div[3]/button
${REMOVE_CLASS_BTN}    id=class_edit_buttons_remove
${CLASS_MODEL_DDL}    id=model
${CREATE_NEW_CLASS_LINK}    id=create_class_button
${CLASS_TAB}      id=class_tab_heading_link
${CLASS_STATE_INCOMPLETE}    id=classState_INCOMPLETE
${SUGGEST_CONCEPT_TO_TERMINOLOGIES}    //*[contains(@id,'create_new_Ehdota')]
${CONCEPT_DEFINITION_INPUT}    id=conceptDefinition
${EXPORT_CLASS_DDL}    id=class_export_dropdown
${DEACTIVATED_CHECKBOX}    id=deactivated
${CLASS_ID}       id=classId
${EQUIVALENT_CLASS_INPUT}    id=equivalentClass
${CREATE_NEW_CLASS_BTN}    id=searchConceptModalConfirmButton
${USE_CONCEPT_BTN}    id=searchConceptModalConfirmButton
${ACTIONS_BTN}    //*[contains(@id,'_actions_button')]
${CREATE_SUB_CLASS_BTN}    //*[contains(@id,'create_sub_class')]
${CREATE_SUPER_CLASS_BTN}    //*[contains(@id,'create_super_class')]
${COPY_CLASS_BTN}    //*[contains(@id,'copy_class')]
#Attributes
${ATTRIBUTE_TAB}    id=attribute_tab_heading_link
${ADD_NEW_ATTRIBUTE_BTN}    id=add_new_attribute_button
${CREATE_NEW_ATTRIBUTE_LINK}    //*[contains(@id,'create_new_LisaaUusiAttribuutti')]
${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}    id=create_new_LuoUusiAttribuuttiIlmanKasiteviitetta_link
${CREATE_NEW_ATTRIBUTE_BTN}    id=searchConceptModalConfirmButton
${PREDICATE_EDIT_SAVE_BTN}    id=predicate_edit_buttons_save
${PREDICATE_EDIT_BTN}    id=predicate_edit_buttons_edit
${PREDICATE_REMOVE_BTN}    id=predicate_edit_buttons_remove
${CONVERT_TO_ASSOCIATION}    id=predicate_change_type
${PREDICATE_EDIT_CANCEL_BTN}    id=predicate_edit_buttons_cancel
${PREDICATE_STATE_INCOMPLETE}    id=predicateState_INCOMPLETE
${CREATE_AND_USE_ATTRIBUTE}    id=confirm_predicate_button
${SUGGEST_ATTRIBUTE_TO_TERMINOLOGIES}    //*[contains(@id,'create_new_Ehdota')]
${PREDICATE_ID}    id=predicateId
${PROPERRTY_DISJOINT_INPUT}    id=disjoint
${PROPERTY_EQUALS_INPUT}    id=equals
${PROPERTY_LESS_THAN_INPUT}    id=lessThan
${PROPERTY_LESS_THAN_OR_EQUALS_INPUT}    id=lessThanOrEquals
${PROPERTY_LESS_THAN_BTN}    id=lessThan_choose_attribute_multiple_uri_select_button
${PROPERTY_LESS_THAN_OR_EQUALS_BTN}    id=lessThanOrEquals_choose_attribute_multiple_uri_select_button
${PROPERTY_DISJOINT_BTN}    id=disjoint_choose_attribute_multiple_uri_select_button
${PROPERTY_EQUALS_BTN}    id=equals_choose_attribute_multiple_uri_select_button
${CONFIRM_PREDICATE_BTN}    id=confirm_predicate_button
${CREATE_PREDICATE_BTN}    id=create_predicate_button
${CREATE_SUB_PREDICATE_BTN}    //*[contains(@id,'create_sub_predicate')]
${CREATE_SUPER_PREDICATE_BTN}    //*[contains(@id,'create_super_predicate')]
${COPY_PREDICATE_BTN}    //*[contains(@id,'copy_predicate')]
${PREDICATE_HISTORY_BTN}    id=predicate_edit_buttons_history
#Associations
${ASSOCIATION_TAB}    id=association_tab_heading_link
${CREATE_NEW_ASSOCIATION_LINK}    //*[contains(@id,'create_new_LisaaUusiAssosiaatio')]
${ADD_NEW_ASSOCIATION_BTN}    id=add_new_association_button
${CREATE_NEW_ASSOCIATION_WITHOUT_REF_LINK}    id=create_new_LuoUusiAssosiaatioIlmanKasiteviitetta_link
${CREATE_NEW_ASSOCIATION_BTN}    id=searchConceptModalConfirmButton
${PREDICATE_EDIT_SAVE_BTN}    id=predicate_edit_buttons_save
${PREDICATE_EDIT_BTN}    id=predicate_edit_buttons_edit
${CONVERT_TO_ATTRIBUTE}    id=predicate_change_type
${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}    //*[contains(@id,'create_new_Ehdota')]
${CREATE_AND_USE_ASSOCIATION}    id=confirm_predicate_button
#Core Vocabulary
${CORE_VOCABULARY_LABEL_INPUT}    id=modelLabel
${CORE_VOCABULARY_DESCRIPTION_INPUT}    id=modelComment
${CORE_VOCABULARY_PREFIX_INPUT}    id=modelPrefix
${VOCABULARY_ADD_CLASSIFICATION}    id=add_classification_button
${VOCABULARY_ADD_CONTRIBUTOR}    id=add_contributor_button
${SAVE_CORE_VOCABULARY_BTN}    id=model_edit_buttons_save
${SAVE_NEW_CORE_VOCABULARY_BTN}    id=save_new_model_button
${MODIFY_CORE_VOCABULARY_BTN}    id=model_edit_buttons_edit
#Export
${EXPORT_JSON_LD}    id=class_export_show_application_ld_json
${EXPORT_Turtle}    id=class_export_show_text_turtle
${EXPORT_RDF}     id=class_export_show_application_rdf_xml
${EXPORT_XML}     id=class_export_show_application_xml
${EXPORT_JSON_Schema}    id=class_export_show_application_schema_json
${EXPORT_MODEL_JSON_Schema}    id=model_export_show_application_schema_json
${EXPORT_JSON_LD_Context}    id=class_export_show_application_ld_json_context
#Versions
${CREATE_NEW_VERSION_BTN}    id=create_new_datamodel_version_button
${NEW_VERSION_PREFIX_INPUT}    id=new_datamodel_version_prefix_input
${SAVE_NEW_VERSION_BTN}    id=save_new_datamodel_version_button
${VERSION_MODAL}    class=app-new-datamodel-version-modal
#Error messages
${error_reserved_namespace_prefix}    Tunniste on jo käytössä tai on varattu
${namespace_in_use}    Tunniste on jo käytössä

*** Keywords ***
Test Case Setup
    [Arguments]    ${user_id}    ${user_name}
    Open Tietomallit
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select user    ${user_id}    ${user_name}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Wait Until Element Is Enabled    ${IMPERSONATE_USER_DROPDOWN}    timeout=60
    Click Element    ${IMPERSONATE_USER_DROPDOWN}
    Wait Until Element Is Visible    ${user_id}    timeout=30
    Click Element    ${user_id}
    Sleep    0.5
    Wait Until Page Contains Element    xpath://*[contains(@class, 'logged-in')]/*[contains(text(), '${user_name}')]    timeout=20

Open Tietomallit
    Open Browser with Settings
    Wait Until Page Contains    Tietomallit    timeout=20
    Wait Until Page Contains    KIRJAUDU SISÄÄN    timeout=20

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${DATA_VOCABULARIES_ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${DATA_VOCABULARIES_ENVIRONMENT_URL}

Go back to Data Vocabularies frontpage and close browsers
    Wait Until Element Is Visible    ${MAIN_PAGE_LINK}    timeout=30
    Click Element    ${MAIN_PAGE_LINK}
    Sleep    2
    Close All Browsers

Go Back To Data Vocabularies Frontpage
    Wait Until Element Is Visible    ${MAIN_PAGE_LINK}    timeout=60
    Click Element    ${MAIN_PAGE_LINK}
    Sleep    2

Create Profile
    [Arguments]    ${profile}    ${prefix}
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    ${model_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${profile}")]    limit=1
    run keyword if    ${model_exists}    Delete Existing Profile And Create New    ${profile}    ${prefix}
    ...    ELSE    Create New Profile    ${profile}    ${prefix}
    Go Back To Data Vocabularies Frontpage

Test Case Teardown Delete Testiautomaatio profile
    Delete Testiautomaatio profile

Create Core Vocabulary
    [Arguments]    ${core_vocabulary}    ${prefix}
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${core_vocabulary}
    ${model_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${core_vocabulary}")]    limit=1
    run keyword if    ${model_exists}    Delete Existing Core Vocabulary And Create New    ${core_vocabulary}    ${prefix}
    ...    ELSE    Create New Core Vocabulary    ${core_vocabulary}    ${prefix}
    Go Back To Data Vocabularies Frontpage

Test Case Teardown Delete Automaatiokirjasto Core Vocabulary
    Delete Automaatiokirjasto Core Vocabulary

Create New Profile
    [Arguments]    ${profile}    ${prefix}
    Wait Until Element Is Enabled    ${ADD_MODEL_BTN}    timeout=30
    Click Element    ${ADD_MODEL_BTN}
    Wait Until Page Contains Element    ${ADD_PROFILE_BTN}    timeout=30
    Click Element    ${ADD_PROFILE_BTN}
    Wait Until Page Contains Element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    ${profile}
    Wait Until Page Contains Element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait Until Page Contains Element    ${MODEL_PREFIX_INPUT}    timeout=30
    Input Text    ${MODEL_PREFIX_INPUT}    ${prefix}
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait Until Page Contains Element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_NEW_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_NEW_MODEL_BTN}
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=60
    Log To Console    ${profile} profile created
    Sleep    2

Delete Testiautomaatio profile
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains Element    //*[contains(text(), "${MODEL_1}")]    timeout=30
    Click Element    //*[contains(text(), "${MODEL_1}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains    tietomallia    timeout=30
    Log To Console    ${MODEL_1} profile deleted
    Sleep    2
    Close All Browsers

Delete Existing Profile And Create New
    [Arguments]    ${profile}    ${prefix}
    Wait Until Element Is Enabled    //*[contains(text(), "${profile}")]    timeout=30
    Click Element    //*[contains(text(), "${profile}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${profile}")]
    Log To Console    ${profile} profile deleted
    Create New Profile    ${profile}    ${prefix}

Create New Core Vocabulary
    [Arguments]    ${core_vocabulary}    ${prefix}
    Wait Until Element Is Enabled    ${ADD_MODEL_BTN}    timeout=30
    Click Element    ${ADD_MODEL_BTN}
    Wait Until Page Contains Element    ${ADD_LIBRARY_BTN}    timeout=30
    Click Element    ${ADD_LIBRARY_BTN}
    Wait Until Page Contains Element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    ${core_vocabulary}
    Wait Until Page Contains Element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait Until Page Contains Element    ${CORE_VOCABULARY_PREFIX_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_PREFIX_INPUT}    ${prefix}
    Wait Until Page Contains Element    ${VOCABULARY_ADD_CLASSIFICATION}    timeout=30
    Click Element    ${VOCABULARY_ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait Until Page Contains Element    ${VOCABULARY_ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${VOCABULARY_ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_NEW_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_NEW_CORE_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=60
    Log To Console    ${core_vocabulary} core vocabulary created
    Sleep    2

Delete Automaatiokirjasto Core Vocabulary
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains    tietomallia    timeout=30
    Log To Console    Automaatiokirjasto Core Vocabulary deleted
    Sleep    2
    Close All Browsers

Delete Existing Core Vocabulary And Create New
    [Arguments]    ${core_vocabulary}    ${prefix}
    Wait Until Page Contains Element    //*[contains(text(), "${core_vocabulary}")]    timeout=30
    Click Element    //*[contains(text(), "${core_vocabulary}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${core_vocabulary}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${core_vocabulary}")]
    Log To Console    ${core_vocabulary} Core Vocabulary deleted
    Create New Core Vocabulary    ${core_vocabulary}    ${prefix}

Select model
    [Arguments]    ${model}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${model}
    Wait Until Page Contains Element    //*[contains(text(), "${model}")]    timeout=30
    Sleep    1
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains    ${model}    timeout=30
    Log To Console    ${model} selected
    Sleep    1

Select And Edit Profile
    [Arguments]    ${model}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${model}
    Wait Until Page Contains Element    //*[contains(text(), "${model}")]    timeout=30
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=60
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}
    Log To Console    ${model} profile selected for editing

Select and edit Testiautomaatio profile
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains Element    //*[contains(text(), "${MODEL_1}")]    timeout=30
    Click Element    //*[contains(text(), "${MODEL_1}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=60
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}

Select And Edit Core Vocabulary
    [Arguments]    ${vocabulary}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=60
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${MODIFY_CORE_VOCABULARY_BTN}

Select and edit Automaatiokirjasto Core Vocabulary
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains Element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=60
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${MODIFY_CORE_VOCABULARY_BTN}

Add Information Domain
    [Arguments]    ${information_domain}
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait Until Page Contains Element    //*[contains(text(), "${information_domain}")]    timeout=30
    Click Element    //*[contains(text(), "${information_domain}")]
    Sleep    2
    Log To Console    New information domain ${information_domain} added

Add Contributor
    [Arguments]    ${contributor}
    Wait Until Page Contains Element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait Until Page Contains Element    //*[contains(text(), "${contributor}")]    timeout=30
    Click Element    //*[contains(text(), "${contributor}")]
    Sleep    2
    Log To Console    New contributor ${contributor} added

Add vocabulary
    [Arguments]    ${vocabulary}
    Wait Until Page Contains Element    ${ADD_VOCABULARY}    timeout=30
    Click Element    ${ADD_VOCABULARY}
    Wait Until Page Contains Element    ${SEARCH_VOCABULARY_INPUT}    timeout=30
    Input Text    ${SEARCH_VOCABULARY_INPUT}    ${vocabulary}
    Wait Until Page Contains Element    //*[contains(text(), "${vocabulary}")]    timeout=60
    Click Element    //*[contains(text(), "${vocabulary}")]
    Sleep    1
    Log To Console    New vocabulary ${vocabulary} added

Import Namespace
    [Arguments]    ${namespace}
    Wait Until Page Contains Element    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait Until Page Contains Element    ${SEARCH_NAMESPACE_INPUT}    timeout=30
    Input Text    ${SEARCH_NAMESPACE_INPUT}    ${namespace}
    Wait Until Page Contains Element    //*[contains(text(), "${namespace}")]    timeout=60
    Click Element    //*[contains(text(), "${namespace}")]
    Sleep    1
    Log To Console    New namespace ${namespace} added

Save Model
    Sleep    1
    Wait Until Element Is Enabled    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Wait Until Element Is Visible    ${MODIFY_MODEL}    timeout=60
    Sleep    2

Add Class
    [Arguments]    ${class}    ${model}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Element Is Visible    ${CLASS_MODEL_DDL}    timeout=60
    Click Element    ${CLASS_MODEL_DDL}
    Wait Until Element Is Visible    //*[contains(text(), "${model}")]    timeout=60
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    1
    Wait Until Element Is Enabled    //*[contains(text(), "${class}")]    timeout=60
    Click Element    //*[contains(text(), "${class}")]
    Sleep    2
    Wait Until Element Is Enabled    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2

Add several classes
    [Arguments]    @{class_items}
    FOR    ${class_item}    IN    @{class_items}
        Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
        Click Element    ${ADD_NEW_CLASS}
        Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
        Input Text    ${SEARCH_CLASS_INPUT}    ${class_item}
        Wait Until Page Contains Element    //*[contains(@id,'${class_item}_search_class_link')]    timeout=60
        Click Element    //*[contains(@id,'${class_item}_search_class_link')]
        Sleep    2
        Wait Until Page Contains Element    ${SPECIALIZE_CLASS}    timeout=30
        Click Element    ${SPECIALIZE_CLASS}
        Sleep    1
        Confirm All Properties For Class And Save
        Sleep    2
    END

Add Sub Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Element Is Visible    ${CLASS_MODEL_DDL}    timeout=60
    Click Element    ${CLASS_MODEL_DDL}
    Wait Until Element Is Visible    //*[contains(text(), "${model}")]    timeout=60
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Wait Until Element Is Enabled    //*[contains(@id,'${class_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${class_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Log To Console    "Click actions"
    Wait Until Element Is Enabled    ${CREATE_SUB_CLASS_BTN}    timeout=30
    Click Element    ${CREATE_SUB_CLASS_BTN}
    Log To Console    "Click create subclass"

Add Super Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Element Is Visible    ${CLASS_MODEL_DDL}    timeout=60
    Click Element    ${CLASS_MODEL_DDL}
    Wait Until Element Is Visible    //*[contains(text(), "${model}")]    timeout=60
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Wait Until Element Is Enabled    //*[contains(@id,'${class_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${class_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUPER_CLASS_BTN}    timeout=30
    Click Element    ${CREATE_SUPER_CLASS_BTN}

Copy Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Element Is Visible    ${CLASS_MODEL_DDL}    timeout=60
    Click Element    ${CLASS_MODEL_DDL}
    Wait Until Element Is Visible    //*[contains(text(), "${model}")]    timeout=60
    Click Element    //*[contains(text(), "${model}")]
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Wait Until Element Is Enabled    //*[contains(@id,'${class_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${class_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${COPY_CLASS_BTN}    timeout=30
    Click Element    ${COPY_CLASS_BTN}

Save Class
    Wait Until Element Is Enabled    ${SAVE_CLASS}    timeout=60
    Click Element    ${SAVE_CLASS}
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Confirm All Properties For Class And Save
    Wait Until Element Is Enabled    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Sleep    2
    Wait Until Element Is Enabled    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Deselect properties for class and save
    [Arguments]    @{class_properties}
    FOR    ${class_property}    IN    @{class_properties}
        Unselect Checkbox    ${class_property}
        Checkbox Should Not Be Selected    ${class_property}
    END
    Wait Until Page Contains Element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Wait Until Page Contains Element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Add Attribute
    [Arguments]    ${attribute}
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Log To Console    "Click modify class"
    Wait Until Element Is Enabled    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Log To Console    "Click add property dropdown"
    Wait Until Element Is Enabled    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Log To Console    "Click add property"
    Sleep    2
    Wait Until Element Is Enabled    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    Log To Console    "Click types"
    Sleep    2
    Wait Until Element Is Enabled    //*[contains(text(), "Attribuutti")]    timeout=30
    Click Element    //*[contains(text(), "Attribuutti")]
    Log To Console    "Click contains attribute"
    Wait Until Element Is Enabled    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Log To Console    "Input text"
    Wait Until Element Is Enabled    //*[contains(@id, "create_new_LisaaUusiAttribuutti")]    timeout=30
    Click Element    //*[contains(@id, "create_new_LisaaUusiAttribuutti")]
    Log To Console    "Click contains attribute 2"
    Wait Until Element Is Enabled    //*[contains(@id, "create_new_LuoUusiAttribuutti")]    timeout=30
    Click Element    //*[contains(@id, "create_new_LuoUusiAttribuutti")]
    Log To Console    "Click luo uusi"
    Wait Until Element Is Enabled    id=searchConceptModalConfirmButton    timeout=30
    Click Element    id=searchConceptModalConfirmButton
    Log To Console    "Click confirm 1"
    Wait Until Element Is Enabled    ${CONFIRM_PREDICATE_BTN}    timeout=30
    Click Element    ${CONFIRM_PREDICATE_BTN} 
    Log To Console    "Click confirm 2"
    Sleep    2

Add Existing Attribute
    [Arguments]    ${attribute}
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Log To Console    "Click modify class"
    Wait Until Element Is Enabled    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Log To Console    "Click add property dropdown"
    Wait Until Element Is Enabled    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Log To Console    "Click add property"
    Sleep    2
    Wait Until Element Is Enabled    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    Log To Console    "Click types"
    Sleep    2
    Wait Until Element Is Enabled    //*[contains(text(), "Attribuutti")]    timeout=30
    Click Element    //*[contains(text(), "Attribuutti")]
    Log To Console    "Click contains attribute"
    Wait Until Element Is Enabled    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Log To Console    "Input text"
    Wait Until Element Is Enabled    //*[contains(@id, "search_result_link")]    timeout=30
    Click Element    //*[contains(@id, "search_result_link")]
    Log To Console    "Click search result""
    Wait Until Element Is Enabled    ${CONFIRM_PREDICATE_BTN}    timeout=30
    Click Element    ${CONFIRM_PREDICATE_BTN} 
    Log To Console    "Click confirm"
    Sleep    2

Create New Attribute
    [Arguments]    ${attribute}
    Wait Until Page Contains Element    ${ATTRIBUTE_TAB}    timeout=30
    Click Element    ${ATTRIBUTE_TAB}
    Wait Until Page Contains Element    ${ADD_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${ADD_NEW_ATTRIBUTE_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Wait Until Element Is Visible    ${CREATE_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_PREDICATE_BTN}
    Wait Until Page Contains Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Wait Until Page Contains Element    ${CREATE_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_BTN}
    Sleep    1
    Wait Until Element Is Enabled    ${PREDICATE_EDIT_SAVE_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=60
    Wait Until Page Contains    ${attribute}    timeout=60
    Log To Console    New attribute "${attribute}" added
    Sleep    1

Add Sub Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Wait Until Page Contains Element    ${ADD_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${ADD_NEW_ATTRIBUTE_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Wait Until Element Is Enabled    //*[contains(@id,'${attribute_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${attribute_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUB_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_SUB_PREDICATE_BTN}

Add Super Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Wait Until Page Contains Element    ${ADD_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${ADD_NEW_ATTRIBUTE_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Wait Until Element Is Enabled    //*[contains(@id,'${attribute_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${attribute_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUPER_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_SUPER_PREDICATE_BTN}

Copy Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Wait Until Page Contains Element    ${ADD_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${ADD_NEW_ATTRIBUTE_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Wait Until Element Is Enabled    //*[contains(@id,'${attribute_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${attribute_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${COPY_PREDICATE_BTN}    timeout=30
    Click Element    ${COPY_PREDICATE_BTN}

Create new association
    [Arguments]    ${association}
    Wait Until Page Contains Element    ${ASSOCIATION_TAB}    timeout=30
    Click Element    ${ASSOCIATION_TAB}
    Wait Until Page Contains Element    ${ADD_NEW_ASSOCIATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_ASSOCIATION_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Wait Until Element Is Visible    ${CREATE_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_PREDICATE_BTN}
    Wait Until Page Contains Element    ${CREATE_NEW_ASSOCIATION_WITHOUT_REF_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ASSOCIATION_WITHOUT_REF_LINK}
    Wait Until Page Contains Element    ${CREATE_NEW_ASSOCIATION_BTN}    timeout=30
    Click Element    ${CREATE_NEW_ASSOCIATION_BTN}
    Sleep    1
    Wait Until Element Is Enabled    ${PREDICATE_EDIT_SAVE_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=60
    Wait Until Page Contains    ${association}    timeout=60
    Log To Console    New association "${association}" added
    Sleep    1

Add Association
    [Arguments]    ${association}
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait Until Element Is Enabled    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Log To Console    "Click add property 1"
    Wait Until Element Is Enabled    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Log To Console    "Click add property 2"
    Sleep    3
    Wait Until Element Is Enabled    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    Sleep    3
    Log To Console    "Click types"
    Wait Until Element Is Enabled    //*[contains(text(), "Assosiaatio")]    timeout=30
    Click Element    //*[contains(text(), "Assosiaatio")]
    Log To Console    "Click contains assosiaatio"
    Wait Until Page Contains Element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${association}
    Log To Console    "Input text"

    Wait Until Element Is Enabled    //*[contains(@id, "create_new_LisaaUusiAssosiaatio")]    timeout=30
    Click Element    //*[contains(@id, "create_new_LisaaUusiAssosiaatio")]
    Log To Console    "Click contains attribute 2"
    Wait Until Element Is Enabled    //*[contains(@id, "create_new_LuoUusiAssosiaatio")]    timeout=30
    Click Element    //*[contains(@id, "create_new_LuoUusiAssosiaatio")]
    Log To Console    "Click luo uusi"
    Wait Until Element Is Enabled    id=searchConceptModalConfirmButton    timeout=30
    Click Element    id=searchConceptModalConfirmButton
    Log To Console    "Click confirm 1"
    Wait Until Element Is Enabled    ${CONFIRM_PREDICATE_BTN}    timeout=30
    Click Element    ${CONFIRM_PREDICATE_BTN} 
    Log To Console    "Click confirm 2"

    # Wait Until Element Is Enabled    //*[contains(text(), "${association}")]    timeout=30
    # Click Element    //*[contains(text(), "${association}")]
    # Log To Console    "Click contains association"
    # Wait Until Element Is Enabled    ${CONFIRM_PREDICATE_BTN}    timeout=30
    # Click Element    ${CONFIRM_PREDICATE_BTN}

    Sleep    2

Add Sub Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Wait Until Page Contains Element    ${ADD_NEW_ASSOCIATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_ASSOCIATION_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Wait Until Element Is Enabled    //*[contains(@id,'${association_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${association_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUB_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_SUB_PREDICATE_BTN}

Copy Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Wait Until Page Contains Element    ${ADD_NEW_ASSOCIATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_ASSOCIATION_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Wait Until Element Is Enabled    //*[contains(@id,'${association_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${association_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${COPY_PREDICATE_BTN}    timeout=30
    Click Element    ${COPY_PREDICATE_BTN}

Add Super Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Wait Until Page Contains Element    ${ADD_NEW_ASSOCIATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_ASSOCIATION_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Wait Until Element Is Enabled    //*[contains(@id,'${association_link}_search_class_link')]    timeout=60
    Click Element    //*[contains(@id,'${association_link}_search_class_link')]
    Wait Until Element Is Enabled    ${ACTIONS_BTN}    timeout=30
    Click Element    ${ACTIONS_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUPER_PREDICATE_BTN}    timeout=30
    Click Element    ${CREATE_SUPER_PREDICATE_BTN}

Change concept for class
    [Arguments]    ${concept}
    Wait Until Page Contains Element    ${CHANGE_CONCEPT}    timeout=30
    Click Element    ${CHANGE_CONCEPT}
    Wait Until Page Contains Element    ${SEARCH_CONCEPT_DB_INPUT}    timeout=30
    Input Text    ${SEARCH_CONCEPT_DB_INPUT}    ${concept}
    Wait Until Page Contains Element    //*[contains(text(), "${concept}")]    timeout=30
    Click Element    //*[contains(text(), "${concept}")]
    Sleep    2
    Wait Until Element Is Visible    ${USE_CONCEPT_BTN}    timeout=30
    Click Element    ${USE_CONCEPT_BTN}
    Sleep    2

Create New Class Without Referencing Concept
    [Arguments]    ${class}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    2
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_LINK}    timeout=60
    Click Element    ${CREATE_NEW_CLASS_LINK}
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}    timeout=60
    Click Element    ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}
    Sleep    1
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_BTN}    timeout=30
    Click Element    ${CREATE_NEW_CLASS_BTN}
    Log To Console    New class without referencing concept created
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=60
    Sleep    2

Create new class and suggest concept to terminologies
    [Arguments]    ${class}    ${concept_definition}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    2
    Wait Until Element Is Enabled    ${CREATE_NEW_CLASS_LINK}    timeout=30
    Click Element    ${CREATE_NEW_CLASS_LINK}
    Wait Until Page Contains Element    ${SUGGEST_CONCEPT_TO_TERMINOLOGIES}    timeout=30
    Click Element    ${SUGGEST_CONCEPT_TO_TERMINOLOGIES}
    Wait Until Page Contains Element    ${CONCEPT_DEFINITION_INPUT}    timeout=30
    Input Text    ${CONCEPT_DEFINITION_INPUT}    ${concept_definition}
    Wait Until Page Contains Element    ${CREATE_NEW_CLASS_BTN}    timeout=30
    Click Element    ${CREATE_NEW_CLASS_BTN}
    Sleep    2

Create New Shape By Referencing External Uri
    [Arguments]    ${external_uri}    ${class}
    Wait Until Page Contains Element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait Until Page Contains Element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep    3
    Wait Until Element Is Enabled    ${CREATE_NEW_SHAPE_BY_REF_URI}    timeout=30
    Sleep    1
    Click Element    ${CREATE_NEW_SHAPE_BY_REF_URI}
    Sleep    3
    Wait Until Page Contains Element    ${EXTERNAL_URI_INPUT}    timeout=60
    Input Text    ${EXTERNAL_URI_INPUT}    ${external_uri}
    Sleep    3
    Wait Until Element Is Visible    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Delete profile
    [Arguments]    ${profile}
    Select user    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Sleep    1
    Wait Until Element Is Enabled    //*[contains(text(), "${profile}")]    timeout=30
    Click Element    //*[contains(text(), "${profile}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains    tietomallia    timeout=30
    Log To Console    "${profile}" profile deleted
    Sleep    2
    Close All Browsers

Delete Profile And Leave Browser Open
    [Arguments]    ${profile}
    Select user    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains Element    //*[contains(text(), "${profile}")]    timeout=30
    Click Element    //*[contains(text(), "${profile}")]
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Page Contains    tietomallia    timeout=30
    Log To Console    "${profile}" profile deleted
    Sleep    2

Select And Edit Predicate
    [Arguments]    ${predicate_tab}    ${predicate}
    Wait Until Element Is Enabled    ${predicate_tab}    timeout=60
    Click Element    ${predicate_tab}
    Wait Until Element Is Enabled    //*[contains(@id,'${predicate}_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'${predicate}_tabset_link')]
    Wait Until Element Is Enabled    ${PREDICATE_EDIT_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_BTN}
    Wait Until Element Is Enabled    ${PREDICATE_EDIT_SAVE_BTN}    timeout=30

Save Predicate
    Sleep    1
    Wait Until Element Is Enabled    ${PREDICATE_EDIT_SAVE_BTN}    timeout=60
    Click Element    ${PREDICATE_EDIT_SAVE_BTN}
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=60
    Sleep    1

Select And Edit Class
    [Arguments]    ${class}
    Wait Until Element Is Enabled    ${CLASS_TAB}    timeout=60
    Click Element    ${CLASS_TAB}
    Wait Until Element Is Enabled    //*[contains(@id,'${class}_tabset_link')]    timeout=30
    Click Element    //*[contains(@id,'${class}_tabset_link')]
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=60
    Click Element    ${MODIFY_CLASS}
    Wait Until Element Is Enabled    ${SAVE_CLASS}    timeout=30

Add Property For Class
    [Arguments]    ${property}
    Wait Until Element Is Enabled    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait Until Element Is Enabled    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait Until Page Contains Element    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    ${property}
    Wait Until Element Is Enabled    ${CREATE_NEW_ATTRIBUTE_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_LINK}
    Wait Until Element Is Enabled    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Wait Until Element Is Enabled    ${CREATE_NEW_ATTRIBUTE_BTN}    timeout=30
    Click Element    ${CREATE_NEW_ATTRIBUTE_BTN}
    Wait Until Element Is Enabled    ${CREATE_AND_USE_ATTRIBUTE}    timeout=30
    Click Element    ${CREATE_AND_USE_ATTRIBUTE}
    Log To Console    Property for class added
    Sleep    1

Add Property Pair
    [Arguments]    ${button}    ${property}
    Wait Until Element Is Enabled    ${button}    timeout=30
    Click Element    ${button}
    Wait Until Element Is Enabled    //*[contains(@id,'${property}_search_result_link')]    timeout=30
    Click Element    //*[contains(@id,'${property}_search_result_link')]
    Wait Until Element Is Enabled    //*[contains(text(), "Käytä attribuuttia")]
    Click Element    //*[contains(text(), "Käytä attribuuttia")]
    Log To Console    Property pair added
    Sleep    1

Create New Namespace
    [Arguments]    ${label}    ${namespace}    ${prefix}
    Wait Until Element Is Enabled    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait Until Element Is Enabled    ${CREATE_NEW_NAMESPACE}    timeout=30
    Click Element    ${CREATE_NEW_NAMESPACE}
    Wait Until Element Is Enabled    ${NAMESPACE_LABEL}    timeout=30
    Input Text    ${NAMESPACE_LABEL}    ${label}
    Wait Until Element Is Enabled    ${NAMESPACE_VALUE}    timeout=30
    Input Text    ${NAMESPACE_VALUE}    ${namespace}
    Wait Until Element Is Enabled    ${NAMESPACE_PREFIX}    timeout=30
    Input Text    ${NAMESPACE_PREFIX}    ${prefix}
    Wait Until Element Is Enabled    ${NAMESPACE_CREATE}    timeout=30
    Click Element    ${NAMESPACE_CREATE}

Add Link
    [Arguments]    ${url}    ${name}    ${description}
    Wait Until Element Is Enabled    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait Until Element Is Enabled    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    ${url}
    Wait Until Element Is Enabled    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    ${name}
    Wait Until Element Is Enabled    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    ${description}
    Wait Until Element Is Enabled    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Wait Until Page Does Not Contain Element    ${OPEN_LINK_MODAL}    timeout=120
    Log To Console    New link added

Select Datamodel Definition Tab
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=30
    Click Element    ${MODEL_DATA_TAB}

Select Model Tab
    [Arguments]    ${tab}
    Wait Until Element Is Enabled    ${tab}    timeout=30
    Click Element    ${tab}

Select Tab
    [Arguments]    ${tab}
    Wait Until Element Is Enabled    ${tab}    timeout=30
    Click Element    ${tab}

Convert To Attribute
    Wait Until Element Is Enabled    ${CONVERT_TO_ATTRIBUTE}    timeout=30
    Click Element    ${CONVERT_TO_ATTRIBUTE}

Convert To Association
    Wait Until Element Is Enabled    ${CONVERT_TO_ASSOCIATION}    timeout=30
    Click Element    ${CONVERT_TO_ASSOCIATION}

Show History
    [Arguments]    ${element}
    Wait Until Element Is Enabled    ${element}    timeout=30
    Click Element    ${element}

Modify Profile
    Wait Until Page Contains Element    ${MODEL_DETAILS_TAB}    timeout=60
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Page Contains Element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}

Add Email Subscription For Datamodel
    Wait Until Element Is Enabled    ${MODEL_ACTION_MENU}    timeout=20
    Click Element    ${MODEL_ACTION_MENU}
    Wait Until Element Is Enabled    ${ADD_SUBSCRIPTION_BTN}    timeout=20
    Click Element    ${ADD_SUBSCRIPTION_BTN}
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20
    Log To Console    Email subscription added

Remove Email Subscription For Datamodel
    Wait Until Element Is Enabled    ${MODEL_ACTION_MENU}    timeout=20
    Click Element    ${MODEL_ACTION_MENU}
    Wait Until Element Is Enabled    ${DELETE_SUBSCRIPTION_BTN}    timeout=20
    Click Element    ${DELETE_SUBSCRIPTION_BTN}
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20
    Log To Console    Email subscription removed

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2

Change Profile Status
    [Arguments]    ${profile_status}
    Wait Until Element Is Enabled    ${MODEL_STATE_DDL}    timeout=20
    Click Element    ${MODEL_STATE_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${profile_status}")]    timeout=30
    Click Element    //*[contains(text(), "${profile_status}")]

Enforce Resource Status Change
    Wait Until Element Is Enabled    ${CHANGE_RESOURCES_STATUSES_CHECKBOX}    timeout=30
    Select Checkbox    ${CHANGE_RESOURCES_STATUSES_CHECKBOX}
    Sleep    1
    Checkbox Should Be Selected    ${CHANGE_RESOURCES_STATUSES_CHECKBOX}
    Log To Console    Change resource statuses checkbox selected

Confirm Action
    Wait Until Page Contains Element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Sleep    1

Confirm Alert
    Wait Until Page Contains Element    ${CONFIRM_ALERT_BTN}    timeout=20
    Click Element    ${CONFIRM_ALERT_BTN}
    Sleep    1

Change All Resource Statuses
    [Arguments]    ${status_enforce}    ${starting_status}    ${target_status}
    Wait Until Element Is Enabled    ${MODEL_ACTION_MENU}    timeout=20
    Click Element    ${MODEL_ACTION_MENU}
    Wait Until Element Is Enabled    ${MASS_MIGRATE_STATUSES_BTN}    timeout=20
    Click Element    ${MASS_MIGRATE_STATUSES_BTN}
    Run Keyword If    '${status_enforce}' == 'True'    Click Element    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}
    Wait Until Element Is Enabled    ${STARTING_STATUS_DDL}    timeout=20
    Click Element    ${STARTING_STATUS_DDL}
    Wait Until Element Is Enabled    ${starting_status}    timeout=30
    Click Element    ${starting_status}
    Sleep    1
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Enabled    ${target_status}    timeout=30
    Click Element    ${target_status}
    Wait Until Element Is Enabled    ${SAVE_MIGRATE_RESOURCE_STATUSES}    timeout=30
    Click Element    ${SAVE_MIGRATE_RESOURCE_STATUSES}
    Log To Console    Resource statuses changed

Mass Migrate Statuses
    Wait Until Element Is Enabled    ${MODEL_ACTION_MENU}    timeout=20
    Click Element    ${MODEL_ACTION_MENU}
    Wait Until Element Is Enabled    ${MASS_MIGRATE_STATUSES_BTN}    timeout=20
    Click Element    ${MASS_MIGRATE_STATUSES_BTN}

Enforce Status Transition Rules
    Wait Until Element Is Enabled    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}    timeout=20
    Click Element    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}
    Sleep    1
    Checkbox Should Be Selected    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}
    Log To Console    Status transition rules checkbox selected

Set Startig Status
    [Arguments]    ${starting_status}
    Wait Until Element Is Enabled    ${STARTING_STATUS_DDL}    timeout=20
    Click Element    ${STARTING_STATUS_DDL}
    Wait Until Element Is Enabled    ${starting_status}    timeout=30
    Click Element    ${starting_status}
    Log To Console    Starting status selected

Set Target Status
    [Arguments]    ${target_status}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Enabled    ${target_status}    timeout=30
    Click Element    ${target_status}
    Log To Console    Target status selected

Save Migrate Resource Statuses
    Wait Until Element Is Enabled    ${SAVE_MIGRATE_RESOURCE_STATUSES}    timeout=30
    Click Element    ${SAVE_MIGRATE_RESOURCE_STATUSES}
    Log To Console    Resource status change saved

Create New Version
    [Arguments]    ${prefix}
    Wait Until Element Is Enabled    ${MODEL_ACTION_MENU}    timeout=20
    Click Element    ${MODEL_ACTION_MENU}
    Wait Until Element Is Enabled    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Element    ${CREATE_NEW_VERSION_BTN}
    Wait Until Element Is Enabled    ${NEW_VERSION_PREFIX_INPUT}    timeout=20
    Input Text    ${NEW_VERSION_PREFIX_INPUT}    ${prefix}
    Wait Until Element Is Enabled    ${SAVE_NEW_VERSION_BTN}    timeout=20
    Click Element    ${SAVE_NEW_VERSION_BTN}
    Wait Until Element Is Enabled    ${CONFIRM_ALERT_BTN}    timeout=20
    Click Element    ${CONFIRM_ALERT_BTN}
    Log To Console    New version of datamodel created

Delete Versions
    [Arguments]    ${profile}
    Select user    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Wait Until Element Is Enabled    //*[contains(text(), "${profile}")]    timeout=30
    Click Element    //*[contains(text(), "${profile}")]
    Wait Until Element Is Enabled    ${MODEL_DETAILS_TAB}    timeout=30
    Click Element    ${MODEL_DETAILS_TAB}
    Wait Until Element Is Enabled    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait Until Element Is Enabled    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Log To Console    Profile version deleted
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${profile}
    Sleep    1
    ${profileExists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${profile}")]
    Run Keyword If    ${profileExists}    Delete Versions    ${profile}
    ...    ELSE    Close All Browsers
