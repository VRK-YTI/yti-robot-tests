*** Settings ***
Documentation     Resource file for Datamodel application
Library           SeleniumLibrary

*** Variables ***
${SLEEP_TIMEOUT}    0.5

${MODEL_1}        Testiautomaatiomalli
${MODEL_2}        Tilamalli

${PREFIX_1}       autom
${PREFIX_2}       lib
${PREFIX_3}       tatm
${PREFIX_4}       aeghi

${CORE_VOCABULARY_1}    Automaatiokirjasto

${NAMESPACE_1}    Julkishallinnon tietokomponentit
${DEV_suffix}     ?env=awsdev
${TEST_suffix}    ?env=awstest

#Frontpage
${ADD_MODEL_BTN}    id=model_creation_button
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${FRONTPAGE_SEARCH_BOX}    id=front_page_search_input
${TEXT_FILTER_SEARCH_INPUT}    id=text_filter_search_input
${NAVIGATION_MENU_DDL}    id=navigation_menu_dropdown

${GUIDE_BTN}                id=start_help_link
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
${ASSOCIATION_TAB}                          id=association_tab_heading_link
${CREATE_NEW_ASSOCIATION_LINK}              //*[contains(@id,'create_new_LisaaUusiAssosiaatio')]
${ADD_NEW_ASSOCIATION_BTN}                  id=add_new_association_button
${CREATE_NEW_ASSOCIATION_WITHOUT_REF_LINK}  id=create_new_LuoUusiAssosiaatioIlmanKasiteviitetta_link
${CREATE_NEW_ASSOCIATION_BTN}               id=searchConceptModalConfirmButton
${PREDICATE_EDIT_SAVE_BTN}                  id=predicate_edit_buttons_save
${PREDICATE_EDIT_BTN}                       id=predicate_edit_buttons_edit
${CONVERT_TO_ATTRIBUTE}                     id=predicate_change_type
${SUGGEST_ASSOCIATION_TO_TERMINOLOGIES}     //*[contains(@id,'create_new_Ehdota')]
${CREATE_AND_USE_ASSOCIATION}               id=confirm_predicate_button

#Core Vocabulary
${CORE_VOCABULARY_LABEL_INPUT}          id=modelLabel
${CORE_VOCABULARY_DESCRIPTION_INPUT}    id=modelComment
${CORE_VOCABULARY_PREFIX_INPUT}         id=modelPrefix
${VOCABULARY_ADD_CLASSIFICATION}        id=add_classification_button
${VOCABULARY_ADD_CONTRIBUTOR}           id=add_contributor_button
${SAVE_CORE_VOCABULARY_BTN}             id=model_edit_buttons_save
${SAVE_NEW_CORE_VOCABULARY_BTN}         id=save_new_model_button
${MODIFY_CORE_VOCABULARY_BTN}           id=model_edit_buttons_edit

#Export
${EXPORT_JSON_LD}               id=class_export_show_application_ld_json
${EXPORT_Turtle}                id=class_export_show_text_turtle
${EXPORT_RDF}                   id=class_export_show_application_rdf_xml
${EXPORT_XML}                   id=class_export_show_application_xml
${EXPORT_JSON_Schema}           id=class_export_show_application_schema_json
${EXPORT_MODEL_JSON_Schema}     id=model_export_show_application_schema_json
${EXPORT_JSON_LD_Context}       id=class_export_show_application_ld_json_context

#Versions
${CREATE_NEW_VERSION_BTN}       id=create_new_datamodel_version_button
${NEW_VERSION_PREFIX_INPUT}     id=new_datamodel_version_prefix_input
${SAVE_NEW_VERSION_BTN}         id=save_new_datamodel_version_button
${VERSION_MODAL}                class=app-new-datamodel-version-modal

#Error messages
${error_reserved_namespace_prefix}      Tunniste on jo käytössä tai on varattu
${namespace_in_use}                     Tunniste on jo käytössä

*** Keywords ***
Go Back To Data Vocabularies Frontpage
    Click Element with wait   ${MAIN_PAGE_LINK}  timeout=60

Create Profile
    [Arguments]    ${profile}    ${prefix}
    Create New Profile    ${profile}    ${prefix}
    Go Back To Data Vocabularies Frontpage

Create Core Vocabulary
    [Arguments]    ${core_vocabulary}    ${prefix}
    Create New Core Vocabulary    ${core_vocabulary}    ${prefix}
    Go Back To Data Vocabularies Frontpage

Create New Profile
    [Arguments]    ${profile}    ${prefix}
    Click Element with wait    ${ADD_MODEL_BTN}
    Click Element with wait    ${ADD_PROFILE_BTN}

    Input Text with wait    ${MODEL_LABEL_INPUT}    ${profile}
    Input Text with wait    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Input Text with wait    ${MODEL_PREFIX_INPUT}    ${prefix}

    Click Element with wait    ${ADD_CLASSIFICATION}
    Click Element with wait   //*[contains(text(), "Asuminen")]
    Click Element with wait   ${ADD_CONTRIBUTOR}
    Click Element with wait   //*[contains(text(), "Testiorganisaatio")]
    Click Element with wait   ${SAVE_NEW_MODEL_BTN}
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=60

Delete Existing Profile And Create New
    [Arguments]    ${profile}    ${prefix}
    Click Element with wait   //*[contains(text(), "${profile}")]
    Click Element with wait   ${MODEL_DETAILS_TAB}
    Click Element with wait   ${REMOVE_MODEL_BTN}
    Click Element with wait   ${CONFIRM_REMOVE_MODEL_BTN}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${profile}       timeout=60
    Page Should Not Contain Element    //*[contains(text(), "${profile}")]

    Create New Profile    ${profile}    ${prefix}

Create New Core Vocabulary
    [Arguments]    ${core_vocabulary}    ${prefix}
    Click Element with wait     ${ADD_MODEL_BTN}
    Click Element with wait     ${ADD_LIBRARY_BTN}

    Input Text with wait    ${CORE_VOCABULARY_LABEL_INPUT}    ${core_vocabulary}
    Input Text with wait    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Tämä on kuvaus
    Input Text with wait    ${CORE_VOCABULARY_PREFIX_INPUT}    ${prefix}

    Click Element with wait    ${VOCABULARY_ADD_CLASSIFICATION}
    Click Element with wait    //*[contains(text(), "Asuminen")]
    Click Element with wait   ${VOCABULARY_ADD_CONTRIBUTOR}
    Click Element with wait    //*[contains(text(), "Testiorganisaatio")]
    Click Element with wait    ${SAVE_NEW_CORE_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${MODEL_DATA_TAB}    timeout=60

Delete Existing Core Vocabulary And Create New
    [Arguments]    ${core_vocabulary}    ${prefix}
    Click Element with wait             //*[contains(text(), "${core_vocabulary}")]
    Click Element with wait             ${MODEL_DETAILS_TAB}
    Click Element with wait             ${REMOVE_MODEL_BTN}
    Click Element with wait             ${CONFIRM_REMOVE_MODEL_BTN}
    Input Text with wait                ${FRONTPAGE_SEARCH_BOX}    ${core_vocabulary}       timeout=60
    Page Should Not Contain Element     //*[contains(text(), "${core_vocabulary}")]
    Create New Core Vocabulary          ${core_vocabulary}    ${prefix}

Select model
    [Arguments]    ${model}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${model}       timeout=60
    Click Element with wait    //*[contains(text(), "${model}")]

Select And Edit Profile
    [Arguments]    ${model}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${model}     timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${model}")]
    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Click Element with wait    ${MODIFY_MODEL}

Select and edit Testiautomaatio profile
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}       timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${MODEL_1}")]
    Click Element with wait    ${MODEL_DETAILS_TAB}     timeout=60
    Click Element with wait    ${MODIFY_MODEL}

Select And Edit Core Vocabulary
    [Arguments]    ${vocabulary}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}     timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "Automaatiokirjasto")]
    Click Element with wait    ${MODEL_DETAILS_TAB}             timeout=60
    Click Element with wait    ${MODIFY_CORE_VOCABULARY_BTN}

Select and edit Automaatiokirjasto Core Vocabulary
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}     timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "Automaatiokirjasto")]
    Click Element with wait    ${MODEL_DETAILS_TAB}                               timeout=60
    Click Element with wait    ${MODIFY_CORE_VOCABULARY_BTN}

Add Information Domain
    [Arguments]    ${information_domain}
    Click Element with wait    ${ADD_CLASSIFICATION}
    Click Element with wait    //*[contains(text(), "${information_domain}")]

Add Contributor
    [Arguments]    ${contributor}
    Click Element with wait    ${ADD_CONTRIBUTOR}
    Click Element with wait    //*[contains(text(), "${contributor}")]

Add vocabulary
    [Arguments]    ${vocabulary}
    Click Element with wait    ${ADD_VOCABULARY}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_VOCABULARY_INPUT}    ${vocabulary}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${vocabulary}")]       timeout=60

Import Namespace
    [Arguments]    ${namespace}
    Click Element with wait    ${IMPORT_NAMESPACE}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_NAMESPACE_INPUT}    ${namespace}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${namespace}")]        timeout=60

Save Model
    Click Element with wait    ${SAVE_MODEL_BTN}
    Wait Until Element Is Visible    ${MODIFY_MODEL}    timeout=60

Add Class
    [Arguments]    ${class}    ${model}
    Click Element with wait    ${ADD_NEW_CLASS}
    Click Element with wait    ${CLASS_MODEL_DDL}   timeout=60
    Click Element with wait    //*[contains(text(), "${model}")]        timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${class}")]        timeout=60
    Click Element with wait    ${SPECIALIZE_CLASS}

Add several classes
    [Arguments]    @{class_items}
    FOR    ${class_item}    IN    @{class_items}
        Click Element with wait    ${ADD_NEW_CLASS}
        Sleep  ${SLEEP_TIMEOUT}
        Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class_item}
        Sleep  ${SLEEP_TIMEOUT}
        Click Element with wait    //*[contains(@id,'${class_item}_search_class_link')]     timeout=60
        Sleep  ${SLEEP_TIMEOUT}
        Click Element with wait    ${SPECIALIZE_CLASS}
        Confirm All Properties For Class And Save
    END

Add Sub Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Click Element with wait    ${ADD_NEW_CLASS}
    Click Element with wait    ${CLASS_MODEL_DDL}       timeout=60
    Click Element with wait    //*[contains(text(), "${model}")]        timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${class_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${CREATE_SUB_CLASS_BTN}

Add Super Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Click Element with wait    ${ADD_NEW_CLASS}
    Click Element with wait    ${CLASS_MODEL_DDL}       timeout=60
    Click Element with wait    //*[contains(text(), "${model}")]        timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${class_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${CREATE_SUPER_CLASS_BTN}

Copy Class
    [Arguments]    ${model}    ${class}    ${class_link}
    Click Element with wait    ${ADD_NEW_CLASS}
    Click Element with wait    ${CLASS_MODEL_DDL}       timeout=60
    Click Element with wait    //*[contains(text(), "${model}")]        timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${class_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${COPY_CLASS_BTN}

Save Class
    Click Element with wait    ${SAVE_CLASS}        timeout=60
    Wait Until Element Is Visible    ${MODIFY_CLASS}    timeout=60

Confirm All Properties For Class And Save
    run keyword and ignore error  Click Element with wait    ${CONFIRM_ADD_PROPERTIES}
    Click Element with wait    ${SAVE_CLASS}
    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=60

Deselect properties for class and save
    [Arguments]    @{class_properties}
    FOR    ${class_property}    IN    @{class_properties}
        Unselect Checkbox    ${class_property}
        Checkbox Should Not Be Selected    ${class_property}
    END
    Click Element with wait         ${CONFIRM_ADD_PROPERTIES}
    Click Element with wait         ${SAVE_CLASS}
    Wait Until Element Is Visible   ${MODIFY_CLASS}    timeout=60

Add Attribute
    [Arguments]    ${attribute}
    Click Element with wait    ${MODIFY_CLASS}
    Click Element with wait    ${ADD_PROPERTY_DDL}
    Click Element with wait    ${ADD_PROPERTY_BTN}
    Click Element with wait    ${ALL_TYPES_DDL}
    Click Element with wait    //*[contains(text(), "Attribuutti")]
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id, "create_new_LisaaUusiAttribuutti")]
    Wait Until Element Is Enabled    //*[contains(@id, "create_new_LuoUusiAttribuutti")]    timeout=30
    Click Element with wait    //*[contains(@id, "create_new_LuoUusiAttribuutti")]
    Click Element with wait    id=searchConceptModalConfirmButton
    Click Element with wait    ${CONFIRM_PREDICATE_BTN}

Add Existing Attribute
    [Arguments]    ${attribute}
    Click Element with wait    ${MODIFY_CLASS}
    Click Element with wait    ${ADD_PROPERTY_DDL}
    Click Element with wait    ${ADD_PROPERTY_BTN}
    Click Element with wait    ${ALL_TYPES_DDL}
    Click Element with wait    //*[contains(text(), "Attribuutti")]
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id, "search_result_link")]
    Click Element with wait    ${CONFIRM_PREDICATE_BTN}

Create New Attribute
    [Arguments]    ${attribute}
    Click Element with wait    ${ATTRIBUTE_TAB}
    Click Element with wait    ${ADD_NEW_ATTRIBUTE_BTN}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    ${CREATE_PREDICATE_BTN}
    Click Element with wait    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Click Element with wait    ${CREATE_NEW_ATTRIBUTE_BTN}
    Click Element with wait    ${PREDICATE_EDIT_SAVE_BTN}   timeout=60
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=60
    Wait Until Page Contains    ${attribute}    timeout=60

Add Sub Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Click Element with wait   ${ADD_NEW_ATTRIBUTE_BTN}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${attribute_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${CREATE_SUB_PREDICATE_BTN}

Add Super Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Click Element with wait    ${ADD_NEW_ATTRIBUTE_BTN}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${attribute_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${CREATE_SUPER_PREDICATE_BTN}

Copy Attribute
    [Arguments]    ${model}    ${attribute}    ${attribute_link}
    Click Element with wait    ${ADD_NEW_ATTRIBUTE_BTN}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${TEXT_FILTER_SEARCH_INPUT}    ${attribute}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(@id,'${attribute_link}_search_class_link')]     timeout=60
    Click Element with wait    ${ACTIONS_BTN}
    Click Element with wait    ${COPY_PREDICATE_BTN}

Create new association
    [Arguments]    ${association}
    Click Element with wait    ${ASSOCIATION_TAB}
    Click Element with wait    ${ADD_NEW_ASSOCIATION_BTN}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    ${CREATE_PREDICATE_BTN}
    Click Element with wait    ${CREATE_NEW_ASSOCIATION_WITHOUT_REF_LINK}
    Click Element with wait    ${CREATE_NEW_ASSOCIATION_BTN}
    Click Element with wait    ${PREDICATE_EDIT_SAVE_BTN}       timeout=60
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}    timeout=60
    Wait Until Page Contains    ${association}    timeout=60

Add Association
    [Arguments]    ${association}
    Click Element with wait     ${MODIFY_CLASS}
    Click Element with wait     ${ADD_PROPERTY_DDL}
    Click Element with wait     ${ADD_PROPERTY_BTN}
    Click Element with wait     ${ALL_TYPES_DDL}
    Click Element with wait     //*[contains(text(), "Assosiaatio")]
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${SEARCH_ATTRIBUTE_INPUT}    ${association}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     //*[contains(@id, "create_new_LisaaUusiAssosiaatio")]
    Click Element with wait     //*[contains(@id, "create_new_LuoUusiAssosiaatio")]
    Click Element with wait     id=searchConceptModalConfirmButton
    Click Element with wait     ${CONFIRM_PREDICATE_BTN}

Add Sub Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Click Element with wait     ${ADD_NEW_ASSOCIATION_BTN}
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     //*[contains(@id,'${association_link}_search_class_link')]       timeout=60
    Click Element with wait     ${ACTIONS_BTN}
    Click Element with wait     ${CREATE_SUB_PREDICATE_BTN}

Copy Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Click Element with wait     ${ADD_NEW_ASSOCIATION_BTN}
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     //*[contains(@id,'${association_link}_search_class_link')]       timeout=60
    Click Element with wait     ${ACTIONS_BTN}
    Click Element with wait     ${COPY_PREDICATE_BTN}

Add Super Association
    [Arguments]    ${model}    ${association}    ${association_link}
    Click Element with wait     ${ADD_NEW_ASSOCIATION_BTN}
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${TEXT_FILTER_SEARCH_INPUT}    ${association}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     //*[contains(@id,'${association_link}_search_class_link')]       timeout=60
    Click Element with wait     ${ACTIONS_BTN}
    Click Element with wait     ${CREATE_SUPER_PREDICATE_BTN}

Change concept for class
    [Arguments]    ${concept}
    Click Element with wait    ${CHANGE_CONCEPT}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CONCEPT_DB_INPUT}    ${concept}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    //*[contains(text(), "${concept}")]
    Click Element with wait    ${USE_CONCEPT_BTN}

Create New Class Without Referencing Concept
    [Arguments]    ${class}
    Click Element with wait    ${ADD_NEW_CLASS}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    ${CREATE_NEW_CLASS_LINK}                     timeout=60
    Click Element with wait    ${CREATE_NEW_CLASS_WITHOUT_REF_LINK}         timeout=60
    Click Element with wait    ${CREATE_NEW_CLASS_BTN}

    Wait Until Element Is Enabled    ${MODIFY_CLASS}    timeout=60

Create new class and suggest concept to terminologies
    [Arguments]    ${class}    ${concept_definition}
    Click Element with wait     ${ADD_NEW_CLASS}
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${SEARCH_CLASS_INPUT}           ${class}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     ${CREATE_NEW_CLASS_LINK}
    Click Element with wait     ${SUGGEST_CONCEPT_TO_TERMINOLOGIES}
    Sleep                       ${SLEEP_TIMEOUT}
    Input Text with wait        ${CONCEPT_DEFINITION_INPUT}    ${concept_definition}
    Sleep                       ${SLEEP_TIMEOUT}
    Click Element with wait     ${CREATE_NEW_CLASS_BTN}

Create New Shape By Referencing External Uri
    [Arguments]    ${external_uri}    ${class}
    Click Element with wait    ${ADD_NEW_CLASS}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${SEARCH_CLASS_INPUT}    ${class}
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    ${CREATE_NEW_SHAPE_BY_REF_URI}
    Sleep  ${SLEEP_TIMEOUT}
    Input Text with wait    ${EXTERNAL_URI_INPUT}    ${external_uri}        timeout=60
    Sleep  ${SLEEP_TIMEOUT}
    Click Element with wait    ${USE_SELECTION_BTN}

Delete profile
    [Arguments]    ${profile}
    Input Text with wait        ${FRONTPAGE_SEARCH_BOX}    ${profile}       timeout=60

    Click Element with wait     //*[contains(text(), "${profile}")]
    Click Element with wait     ${MODEL_DETAILS_TAB}                     timeout=60
    Click Element with wait     ${REMOVE_MODEL_BTN}
    Click Element with wait     ${CONFIRM_REMOVE_MODEL_BTN}
    Input Text with wait        ${FRONTPAGE_SEARCH_BOX}    ${profile}       timeout=60

Select And Edit Predicate
    [Arguments]    ${predicate_tab}    ${predicate}
    Click Element with wait    ${predicate_tab}
    Click Element with wait    //*[contains(@id,'${predicate}_tabset_link')]
    Click Element with wait    ${PREDICATE_EDIT_BTN}

Save Predicate
    Click Element with wait          ${PREDICATE_EDIT_SAVE_BTN}     timeout=60
    Wait Until Element Is Visible    ${PREDICATE_EDIT_BTN}          timeout=60

Select And Edit Class
    [Arguments]    ${class}
    Click Element with wait    ${CLASS_TAB}         timeout=60
    Click Element with wait    //*[contains(@id,'${class}_tabset_link')]
    Click Element with wait    ${MODIFY_CLASS}      timeout=60

Add Property For Class
    [Arguments]    ${property}
    Click Element with wait    ${ADD_PROPERTY_DDL}
    Click Element with wait    ${ADD_PROPERTY_BTN}
    Input Text with wait       ${TEXT_FILTER_SEARCH_INPUT}    ${property}
    Click Element with wait    ${CREATE_NEW_ATTRIBUTE_LINK}
    Click Element with wait    ${CREATE_NEW_ATTRIBUTE_WITHOUT_REF_LINK}
    Click Element with wait    ${CREATE_NEW_ATTRIBUTE_BTN}
    Click Element with wait    ${CREATE_AND_USE_ATTRIBUTE}

Add Property Pair
    [Arguments]    ${button}    ${property}
    Click Element with wait    ${button}
    Click Element with wait    //*[contains(@id,'${property}_search_result_link')]
    Click Element with wait    //*[contains(text(), "Käytä attribuuttia")]

Create New Namespace
    [Arguments]    ${label}    ${namespace}    ${prefix}
    Click Element with wait    ${IMPORT_NAMESPACE}
    Click Element with wait    ${CREATE_NEW_NAMESPACE}

    Input Text with wait    ${NAMESPACE_LABEL}      ${label}
    Input Text with wait    ${NAMESPACE_VALUE}      ${namespace}
    Input Text with wait    ${NAMESPACE_PREFIX}     ${prefix}

    Click Element with wait         ${NAMESPACE_CREATE}

Add Link
    [Arguments]    ${url}    ${name}    ${description}
    Click Element with wait     ${ADD_LINK}
    Input Text with wait        ${LINK_URL_INPUT}            ${url}
    Input Text with wait        ${LINK_NAME_INPUT}           ${name}
    Input Text with wait        ${LINK_DESCRIPTION_INPUT}    ${description}
    Click Element with wait     ${CREATE_NEW_LINK}
    Wait Until Page Does Not Contain Element    ${OPEN_LINK_MODAL}    timeout=120

Select Datamodel Definition Tab
    Click Element with wait    ${MODEL_DATA_TAB}

Select Model Tab
    [Arguments]    ${tab}
    Click Element with wait    ${tab}

Select Tab
    [Arguments]    ${tab}
    Click Element with wait    ${tab}

Convert To Attribute
    Click Element with wait    ${CONVERT_TO_ATTRIBUTE}

Convert To Association
    Click Element with wait    ${CONVERT_TO_ASSOCIATION}

Show History
    [Arguments]    ${element}
    Click Element with wait    ${element}

Modify Profile
    Click Element with wait    ${MODEL_DETAILS_TAB}  timeout=60
    Click Element with wait    ${MODIFY_MODEL}

Add Email Subscription For Datamodel
    Click Element with wait    ${MODEL_ACTION_MENU}
    Click Element with wait    ${ADD_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Remove Email Subscription For Datamodel
    Click Element with wait    ${MODEL_ACTION_MENU}
    Click Element with wait    ${DELETE_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait    ${NAVIGATION_MENU_DDL}
    Click Element with wait    //*[contains(text(), "${navigation_menu_link}")]

Change Profile Status
    [Arguments]    ${profile_status}
    Click Element with wait    ${MODEL_STATE_DDL}
    Click Element with wait    //*[contains(text(), "${profile_status}")]

Enforce Resource Status Change
    Select Checkbox    ${CHANGE_RESOURCES_STATUSES_CHECKBOX}
    Checkbox Should Be Selected    ${CHANGE_RESOURCES_STATUSES_CHECKBOX}

Confirm Action
    Click Element with wait    ${CONFIRMATION_YES_BTN}

Confirm Alert
    Click Element with wait    ${CONFIRM_ALERT_BTN}

Change All Resource Statuses
    [Arguments]    ${status_enforce}    ${starting_status}    ${target_status}
    Click Element with wait    ${MODEL_ACTION_MENU}
    Click Element with wait    ${MASS_MIGRATE_STATUSES_BTN}
    Run Keyword If    '${status_enforce}' == 'True'    Click Element with wait    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}
    Click Element with wait    ${STARTING_STATUS_DDL}
    Click Element with wait    ${starting_status}
    Click Element with wait    ${TARGET_STATUS_DDL}
    Click Element with wait    ${target_status}
    Click Element with wait    ${SAVE_MIGRATE_RESOURCE_STATUSES}

Mass Migrate Statuses
    Click Element with wait    ${MODEL_ACTION_MENU}
    Click Element with wait    ${MASS_MIGRATE_STATUSES_BTN}

Enforce Status Transition Rules
    Click Element with wait    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}
    Checkbox Should Be Selected    ${ENFORCE_STATUS_TRANSITION_RULES_CHECKBOX}

Set Startig Status
    [Arguments]    ${starting_status}
    Click Element with wait    ${STARTING_STATUS_DDL}
    Click Element with wait    ${starting_status}

Set Target Status
    [Arguments]    ${target_status}
    Click Element with wait    ${TARGET_STATUS_DDL}
    Click Element with wait    ${target_status}

Save Migrate Resource Statuses
    Click Element with wait    ${SAVE_MIGRATE_RESOURCE_STATUSES}

Create New Version
    [Arguments]    ${prefix}
    Click Element with wait     ${MODEL_ACTION_MENU}
    Click Element with wait     ${CREATE_NEW_VERSION_BTN}
    Input Text with wait        ${NEW_VERSION_PREFIX_INPUT}    ${prefix}
    Click Element with wait     ${SAVE_NEW_VERSION_BTN}
    Click Element with wait     ${CONFIRM_ALERT_BTN}