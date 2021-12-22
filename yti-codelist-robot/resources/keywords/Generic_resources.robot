*** Variables ***

#Generic
${LANGUAGE_EN}                  id=en
${LANGUAGE_FI}                  id=fi
${LANGUAGE_SV}                  På svenska (SV)
${MUNICIPALITY_NAME_SV}         Helsingfors
${CLASSIFICATION_1}             id=remove_P8_infodomain_link
${CLASSIFICATION_2}             id=remove_P6_infodomain_link
${CLASSIFICATION_3}             id=remove_P1_infodomain_link
${REGISTRY_1}                   Testirekisteri
${REGISTRY_2}                   Automaatiorekisteri
${ORGANIZATION_1}               Testiorganisaatio
${CCBY4.0}                      id=CreativeCommonsNimea4.0Kansainvalinen(CCBY4.0)_Https://creativecommons.org/licenses/by/4.0/_external_reference_link
${Koodisto6000_variant}         id=test_Koodisto6000_variant_link
${DRAFT_STATUS}                 id=DRAFT_status_input_dropdown
${VALID_STATUS}                 id=VALID_status_input_dropdown
${CONTENT_LANGUAGE_EN}          id=en_content_lang_dropdown_button
${CONTENT_LANGUAGE_FI}          id=fi_content_lang_dropdown_button
${CONTENT_LANGUAGE_SV}          id=sv_content_lang_dropdown_button
${CONTENT_LANGUAGE_AR_SO}       id=ar-SO_content_lang_dropdown_button
${CONTENT_LANGUAGE_SW_UG}       id=sw-UG_content_lang_dropdown_button

${EUPL_LICENCE_PAGE}            id=license_link
${ALL_LANGUAGE_BTN}             id=all_languages_content_lang_dropdown_button
${REMOVE_AB_LANGUAGE}           id=remove_ab_languagecode_link
${REMOVE_EN_LANGUAGE}           id=remove_en_languagecode_link
${REMOVE_FI_LANGUAGE}           id=remove_fi_languagecode_link
${REMOVE_TT_LANGUAGE}           id=remove_tt_languagecode_link
${CONFIRM_ALERT_MODAL_BTN}      id=confirm_alert_modal_button
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}                        id=navigation_groupmanagement_link
${STATUS_DROPDOWN_BTN}                          id=selected_status_filter_dropdown
${SEARCH_CODE_CHECKBOX}                         id=search_code_details_checkbox
${FRONTPAGE_LINK}                               id=main_page_link
${NAVIGATION_MENU_DDL}                          id=navigation_menu_dropdown
${NAVIGATION_MENU_REGISTRIES}                   id=navigation_link_registries
${REGISTRY_FILTER_DDL}                          id=selected_registry_filter_dropdown
${SEARCH_BOX_INPUT}                             id=search_box_input
${SEARCH_EXTENSION_CHECKBOX}                    id=search_extension_details_checkbox
${PROPERTYTYPE_FILTER_DDL}                      id=selected_propertytype_filter_dropdown
${PROPERTYTYPE_CROSSREFERENCELIST_FILTER}       id=Extension_crossReferenceList_propertytype_filter_dropdown
${PROPERTYTYPE_CALCULATIONHIERARCHY_FILTER}     id=Extension_calculationHierarchy_propertytype_filter_dropdown
${PROPERTYTYPE_DEFINITIONHIERARCHY_FILTER}      id=Extension_definitionHierarchy_propertytype_filter_dropdown
${USER_DETAILS_LINK}                            id=navigation_link_user_details
${USER_DETAILS_SUBSCRIPTIONS_TAB}               id=user_details_subscriptions_tab
#Registry
${CREATE_REGISTRY_BTN}                  id=create_registry_button
${REGISTRY_VALUE_INPUT}                 id=registry_value_input
${REGISTRY_NAME_INPUT}                  id=registry_name_input
${REGISTRY_DESCRIPTION_INPUT}           id=registry_description_textarea
${ADD_ORGANIZATION_BTN}                 id=add_organization_button
${SEARCH_ORGANIZATION_INPUT}            id=search_linked_organization_input
${SAVE_REGISTRY}                        id=editable_save_button
${DELETE_REGISTRY}                      id=delete_registry_button
${REGISTRY_DDL}                         id=registryDropdown
#Code list buttons
${ADD_CLASSIFICATION_BTN}               id=add_infodomain_button
${CODE_LIST_START_DATE_BTN}             id=start_date_input_toggle_calendar_button
${CODE_LIST_END_DATE_BTN}               id=end_date_input_toggle_calendar_button
${CODE_LIST_STATUS_DDL}                 id=selected_status_input_dropdown
${CODE_LIST_NAME_INPUT}                 id=codelist_name_input_fi
${CODE_LIST_NAME_INPUT_AB}              id=codelist_name_input_ab
${CODE_LIST_NAME_INPUT_AF_NA}           id=codelist_name_input_af-NA
${CODE_LIST_NAME_INPUT_BEM}             id=codelist_name_input_bem
${CODE_LIST_NAME_INPUT_EN}              id=codelist_name_input_en
${CODE_LIST_NAME_INPUT_NDS}             id=codelist_name_input_nds
${CODE_LIST_NAME_INPUT_SV}              id=codelist_name_input_sv
${CODE_LIST_NAME_INPUT_TT}              id=codelist_name_input_tt
${CODE_LIST_DESCRIPTION_INPUT_BEM}      id=codelist_description_textarea_bem
${CODE_LIST_DESCRIPTION_INPUT_SV}       id=codelist_description_textarea_sv
${CODE_LIST_DEFINITION_INPUT_BEM}       id=codelist_definition_textarea_bem
${CODE_LIST_CHANGENOTE_INPUT_BEM}       id=codelist_changenote_textarea_af-NA
${CODE_LIST_VALUE_INPUT}                id=codelist_value_input
${CODE_LIST_DESC_INPUT}                 id=codelist_description_textarea_fi
${CODE_LIST_DEF_INPUT}                  id=codelist_definition_textarea_fi
${CODE_LIST_CHANGENOTE_INPUT}           id=codelist_changenote_textarea_fi
${CODE_LIST_FEEDBACK_INPUT_NDS}         id=codelist_feedback_channel_textarea_nds
${MODIFY_CODE_LIST}                     id=editable_edit_button
${SEARCH_CLASSIFICATION_INPUT}          id=search_linked_code_input
${NEW_CLASSIFICATION}                   //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/div/div[2]/a/i
${CLOSE_ERROR_MESSAGE_BTN}              id=close_error_modal_button
${FILE_FORMAT_Excel}                    id=excel_format_dropdown_button
${FILE_FORMAT_CSV}                      id=csv_format_dropdown_button
${ADD_CODE_LIST_BTN}                    id=import_codelist_button
${IMPORT_CODE_LIST_BTN}                 id=import_from_file_button
${SELECT_REGISTRY_BTN}                  id=selected_codeRegistry_dropdown
${FILE_FORMAT_BTN}                      id=file_format_dropdown_button
${FILE_UPLOAD_BTN}                      id=fileupload_input
${CANCEL_IMPORT_CODE_LIST_BTN}          id=cancel_upload_button
${DELETE_CODE_LIST_BTN}                 id=delete_codelist_button
${REMOVE_CODE_LIST_CONF_BTN}            id=confirm_confirmation_modal_button
${CREATE CODE_LIST_BTN}                 id=create_new_codelist_button
${SEARCH_CODE_BOX_INPUT}                id=search_code_box_input
${CODELIST_INFO_TAB}                    id=codelist_info_tab            #//span[text() = 'TIEDOT' or text() = 'INFORMATION' or text() = 'UPPGIFTER']
${CODELIST_CODES_TAB}                   id=codelist_codes_tab           #//span[text() = 'KOODIT' or text() = 'CODES' or text() = 'KODER']
${CODELIST_VARIANTS_TAB}                id=codelist_variants_tab        #//span[text() = 'Variantit']  # or text() = '' or text() = '']
${ADD_DEFAULTCODE_BTN}                  id=add_code_button
${REMOVE_DEFAULTCODE}                   id=remove_code_link
${SEARCH_DEFAULTCODE_INPUT}             id=search_linked_code_input
${SAVE_CODE_LIST_MOD_BTN}               id=editable_save_button
${CANCEL_CREATION_BTN}                  id=cancel_modal_button
${SEARCH_CONCEPT_INPUT}                 id=search_concept_input
${VOCABULARY_SELECTION_DDL}             id=selected_vocabulary_selection_dropdown
${CREATE_NEW_VERSION_BTN}               id=clone_codelist_button
${ATTACH_VARIANT_BTN}                   id=attach_variant_button
${SEARCH_VARIANT_INPUT}                 id=search_variant_input
${START_DATE_INPUT}                     id=start_date_input
${END_DATE_INPUT}                       id=end_date_input
${CODE_LIST_DDL}                        id=codeSchemeDropdown
${EXPORT_DDL}                           id=exportDropdown
${VERSION_TAB}                          id=codelist_versionhistory_tab        #//span[text() = 'Versiohistoria']
${CLOSE_ERROR_MODAL_BTN}                id=close_error_modal_button
${OPEN_TERMINOLOGY_MODAL_BTN}           id=open_terminology_modal_button_for_concept_suggestion
${CONFIRMATION_YES_BTN}                 id=confirm_confirmation_modal_button
${CLOSE_MODAL_LINK}                     id=close_modal_link
${CONCEPT_DEFINITION_INPUT}             id=concept_suggestion_definition_input
${SAVE_CONCEPT_SUGGESTION_BTN}          id=save_concept_suggestion_button
${CONTENT_LANGUAGE_DDL}                 id=content_language_dropdown_button
${CREATE_CODELIST_VERSION_AS_EMPTY}     id=new_codescheme_version_create_as_empty
${CREATE_CODELIST_VERSION_FROM_FILE}    id=clone_codelist_from_file_button
${CONCEPT_SUGGESTION_NAME_INPUT}        id=concept_suggestion_name_input
${CREATE_CUMULATIVE_CODE_LIST}          id=create_new_codescheme_as_cumulative
${MARK_CUMULATIVE_CODE_LIST_CHECKBOX}   id=mark_codelist_cumulative_checkbox
${UPDATE_CODE_LIST_FROM_FILE_BTN}       id=update_codelist_from_file_button
${CHANGE_CODE_STATUSES_CHECKBOX}        id=change_code_statuses_too_checkbox
${CODE_LIST_FEEDBACK_INPUT}             id=codelist_feedback_channel_textarea_fi
${ADD_SUBSCRIPTION_BTN}                 id=add_subscription_button
${DELETE_SUBSCRIPTION_BTN}              id=delete_subscription_button
${SUBSCRIPTION_BELL_ICON}               //*[@class="subscription-icon icon-bell"]
#Extensions
${EXTENSION_DDL}                    id=extensionDropdown
${IMPORT_EXTENSIONS_BTN}            id=import_extensions_button
${EXTENSIONS_TAB}                   id=codelist_extensions_tab         #//span[text() = 'LAAJENNUKSET']
${ADD_MEMBER_BTN}                   id=add_member_button
${SEARCH_EXTENSION_INPUT}           id=search_linked_extension_input
${EXTENSION_FILE_UPLOAD}            id=fileupload_input
${CREATE_MEMBER_BTN}                id=create_member_button
${IMPORT_MEMBERS_BTN}               id=import_members_button
${MEMBER_FILE_UPLOAD}               id=upload_file_button
${FILE_FORMAT_UPLOAD}               id=file_format_dropdown_button
${EXTENSION_UPLOAD_BTN}             id=upload_file_button
${MEMBER_UPLOAD_BTN}                id=upload_file_button
${MEMBERVALUE_1_INPUT}              id=member_membervalue1_input
${MEMBER_NAME_INPUT}                id=member_name_input_fi
${SAVE_EXTENSION}                   id=editable_save_button
${SAVE_MEMBER}                      id=editable_save_button
${EXTENSION_VALUE_INPUT}            id=extension_codevalue_input
${EXTENSION_NAME_INPUT}             id=extension_name_input_fi
${ADD_CODE_TO_MEMBER_BTN}           id=add_code_button
${SEARCH_CODE_TO_MEMBER_INPUT}      id=search_linked_code_input
${EXTENSION_DELETE_BTN}             id=delete_extension_button
${CONFIRM_DELETE_EXTENSION_BTN}     id=confirm_confirmation_modal_button
${MEMBER_DELETE_BTN}                id=member_delete_button
${MODIFY_EXTENSION_SCHEME_BTN}      id=editable_edit_button
${MODIFY_EXTENSION_BTN}             id=editable_edit_button
${REMOVE_MEMBER_LINK}               id=remove_member_link
${EXTENSION_SCHEME_TYPE}            id=propertytype_dropdown_button
${SEARCH_LINKED_CODE_INPUT}         id=search_linked_code-scheme_input
${ADD_CODE_LIST_TO_EXTENSION_BTN}   id=add_codelist_button
${EXTENSION_STATUS_DDL}             id=selected_status_input_dropdown
${MEMBER_DDL}                       id=memberDropdown
${EXTENSION_BACK_BTN}               id=extension_back_button
${MODIFY_MEMBER_BTN}                id=editable_edit_button
${SEARCH_MEMBER_INPUT}              id=search_linked_member_input
${MEMBER_BACK_BTN}                  id=member_back_button
${COMPARISON_OPERATOR_INPUT}        id=member_membervalue_comparisonOperator_input
${UNARY_OPERATOR_INPUT}             id=member_membervalue_unaryOperator_input
${CALC_HIERARCHY_TAB}               id=codelist_extension_calculationHierarchy_tab
${DEF_HIERARCHY_TAB}                id=codelist_extension_definitionHierarchy_tab
${EXTENSION_INFO_TAB}               id=extension_info_tab
${CROSS_REFERENCE_LIST_TAB}         id=codelist_extension_crossReferenceList_tab
${MEMBERS_TAB}                      id=extension_members_tab                #//span[text() = 'JÄSENET']
${MEMBER_INFO_TAB}                  id=member_info_tab                      #//span[text() = 'TIEDOT' or text() = 'INFORMATION' or text() = 'UPPGIFTER']
${AUTO_CREATE_MEMBERS_CHECKBOX}     id=auto_create_members_checkbox
${CREATE_MISSING_MEMBERS_BTN}       id=create_missing_members_button
${CLOSE_ALERT_MODAL_LINK}           id=close_alert_modal_link
#DPM extensions
#DPM Metric
${CREATE_DPM_METRIC_BTN}            id=create_extension_dpmmetric_button
${DPM_BALANCE_TYPE_INPUT}           id=code_inline_membervalue_dpmMetric_dpmBalanceType_input
${DPM_METRIC_DATA_TYPE_INPUT}       id=code_inline_membervalue_dpmMetric_dpmMetricDataType_input
${DPM_DOMAIN_REFERENCE_INPUT}       id=code_inline_membervalue_dpmMetric_dpmDomainReference_input
${DPM_FLOW_TYPE_INPUT}              id=code_inline_membervalue_dpmMetric_dpmFlowType_input
${DPM_HIERARCHY_REFERENCE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmHierarchyReference_input
#DPM Explicit domain
${CREATE_DPM_EXPLICIT_DOMAIN_BTN}   id=create_extension_dpmexplicitdomain_button
${DPM_EXPLICIT_DOMAIN_INPUT}        id=code_inline_membervalue_dpmExplicitDomain_dpmMemberXBRLCodePrefix_input
#DPM Dimension
${CREATE_DPM_DIMENSION_BTN}                 id=create_extension_dpmdimension_button
${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}     id=code_inline_membervalue_dpmDimension_dpmDomainReference_input
#DPM Typed Domain
${CREATE_DPM_TYPED_DOMAIN_BTN}      id=create_extension_dpmdtypeddomain_button
${DPM_DATA_TYPE_INPUT}              id=code_inline_membervalue_dpmTypedDomain_dpmDomainDataType_input
#Code buttons
${EXPAND_ALL_BTN}           id=expand_all_button
${COLLAPSE_ALL_BTN}         id=collapse_all_button
${CODE_BACK_BTN}            id=code_back_button
${IMPORT_CREATE_BACK_BTN}   id=import_create_back_button
${CANCEL_CODE_MOD_BTN}      id=editable_cancel_button
${MODIFY_CODE_BTN}          id=editable_edit_button
${CODE_NAME_INPUT}          id=code_name_input_fi
${CODE_NAME_INPUT_EN}       id=code_name_input_en
${CODE_NAME_INPUT_SV}       id=code_name_input_sv
${CODE_CODEVALUE_INPUT}     id=code_value_input
${CODE_DESC_INPUT}          id=code_description_textarea_fi
${CODE_SHORT_NAME_INPUT}    id=code_shortname_input
${SAVE_CODE_MOD_BTN}        id=editable_save_button
${ADD_LINK_DDL}             id=add_link_propertytype_dropdown
${CODE_START_DATE_BTN}      id=start_date_input_toggle_calendar_button
${CODE_END_DATE_BTN}        id=end_date_input_toggle_calendar_button
${CODE_START_DATE_INPUT}    id=start_date_input
${CODE_END_DATE_INPUT}      id=end_date_input
${IMPORT_CODES_BTN}         id=import_codes_button
${IMPORT_BTN}               id=upload_codes_file_button
${UPLOAD_FILE_BTN}          id=upload_file_button
${SAVE_NEW_CODE_LIST}       id=editable_save_button
${CREATE_CODE_BTN}          id=create_code_button
${SAVE_NEW_CODE_BTN}        id=editable_save_button
${REMOVE_CODE_BTN}          id=code_info_delete_button
${REMOVE_CODE_CONF_BTN}     id=confirm_confirmation_modal_button
${CANCEL_CODE_CREATE_BTN}   id=editable_cancel_button
${EXTENSION_BACK_BTN}       id=extension_back_button
${CODE_STATUS_DDL}          id=selected_status_input_dropdown
${CODE_DDL}                 id=codeDropdown
${CODE_SCHEME_DDL_BTN}      id=code_scheme_dropdown_button
${SUB_CODE_LIST_BTN}                id=add_codelist_button
${SEARCH_SUB_CODE_LIST_INPUT}       id=search_linked_code-scheme_input
${ADD_BROADER_CODE}                 id=add_code_button
#Code status change mass function
${CHANGE_CODE_STATUSES_BTN}         id=mass_migrate_codelist_codes_statuses_button
${ORIGINAL_STATUS_DDL}              id=selected_migrate_code_statuses_from_status_input_dropdown
${TARGET_STATUS_DDL}                id=selected_migrate_code_statuses_to_status_input_dropdown
${INCOMPLETE_STATUS_ORGIGINAL}      id=INCOMPLETE_migrate_code_statuses_from_status_input_dropdown
${INCOMPLETE_STATUS_TARGET}         id=INCOMPLETE_migrate_code_statuses_to_status_input_dropdown
${DRAFT_STATUS_ORIGINAL}            id=DRAFT_migrate_code_statuses_from_status_input_dropdown
${DRAFT_STATUS_TARGET}              id=DRAFT_migrate_code_statuses_to_status_input_dropdown
${SUGGESTED_STATUS_ORIGINAL}        id=SUGGESTED_migrate_code_statuses_from_status_input_dropdown
${SUGGESTED_STATUS_TARGET}          id=SUGGESTED_migrate_code_statuses_to_status_input_dropdown
${VALID_STATUS_ORIGINAL}            id=VALID_migrate_code_statuses_from_status_input_dropdown
${VALID_STATUS_TARGET}              id=VALID_migrate_code_statuses_to_status_input_dropdown
${SUPERSEDED_STATUS_ORIGINAL}       id=SUPERSEDED_migrate_code_statuses_from_status_input_dropdown
${SUPERSEDED_STATUS_TARGET}         id=SUPERSEDED_migrate_code_statuses_to_status_input_dropdown
${RETIRED_STATUS_ORIGINAL}          id=RETIRED_migrate_code_statuses_from_status_input_dropdown
${RETIRED_STATUS_TARGET}            id=RETIRED_migrate_code_statuses_to_status_input_dropdown
${INVALID_STATUS_ORIGINAL}          id=INVALID_migrate_code_statuses_from_status_input_dropdown
${INVALID_STATUS_TARGET}            id=INVALID_migrate_code_statuses_to_status_input_dropdown
${SAVE_CODE_STATUS_CHANGE_BTN}      id=migrate_code_statuses_button
${CANCEL_CODE_STATUS_CHANGE_BTN}    id=cancel_migrate_code_statuses_button
${ENFORCE_STATUS_TRANSITION_CHECKBOX}    id=enforce_status_transition_rules_checkbox
#Code lists and Codes
${CODE_LIST_KUNNAT}    Kunnat 2018
${CODE_LIST_KUNNAT_EN}    Municipalities 2018
${CODE_LIST_2}      testiautomaatiokoodisto1
${CODE_LIST_3}      Palveluluokitus
${CODE_LIST_4}      testiautomaatiokoodisto
${CODE_LIST_5}      Ammattiluokitus 2010
${CODE_LIST_6}      testiautomaatiokoodisto 2
${CODE_LIST_7}      T200
${CODE_LIST_8}      koodisto6000
${CODE_LIST_9}      koodisto7000
${CODE_LIST_10}     koodisto7001
${CODE_LIST_11}     koodisto7002
${CODE_LIST_12}     koodisto7003
${CODE_LIST_13}     Sisällön filteröinti
${CODE_LIST_14}     Testikoodisto2 pitkillä arvoilla
${CODE_LIST_15}     Vakiokoodikoodisto
${CODE_LIST_16}     Koodisto600
${CODE_LIST_17}     Koodisto700
${CODE_LIST_18}     Koodisto701
${CODE_LIST_19}     Testikoodisto3 pitkillä arvoilla
${CODE_LIST_20}     Testi dcat
${CODE_LIST_21}     Linkkikoodisto
${CODE_LIST_22}     Koodisto800
${CODE_LIST_23}     Koodisto300
${CODE_LIST_24}     Koodisto606
${CODE_LIST_25}     Koodisto100
${CODE_LIST_26}     xyztesti
${CODE_LIST_27}     Koodisto3000
${CODE_1}           koodi01 - Koodi01
${CODE_2}           koodi1006
${CODE_1000}        Koodi1000 - Koodi1000
${TEST_CODE_1}      T100 - Automaatiokoodi
${TEST_CODE_2}      testikoodi02 - Testikoodi 02
${TEST_CODE_3}      Koodi1006 - Koodi1006
${TEST_CODE_4}      T52 - Testi02
${TEST_CODE_5}      T56 - Testi06
${TEST_CODE_6}      testcode25 - Testikoodi 25
${CODE_LIST_VALUE_1}    Koodisto6000
${CODE_LIST_VALUE_2}    t100
${CODE_LIST_VALUE_3}    Koodisto7001
${CODE_LIST_VALUE_4}    testiautomaatiokoodisto
${CODE_LIST_VALUE_5}    O1234567890123456789012345678901234567333
${EXTENSION_VALUE_1}    extension1
${EXTENSION_NAME_1}     Extension 1
${EXTENSION_VALUE_2}    extension2
${EXTENSION_NAME_2}     Extension 2
${MEMBER_VALUE_1}       member1
${MEMBER_NAME_1}        Member 1
${COMPARISON_OPERATOR_1}    <=
${UNARY_OPERATOR_1}         -
#Status
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
#Code list export
${EXPORT_TYPE_EXCEL}                id=codelist_export_excel_link
${EXPORT_TYPE_CSV}                  id=codelist_export_codes_csv_link
${EXPORT_MEMBERS_TYPE_CSV}          id=codelist_export_csv_link
${EXPORT_CROSS_REFERENCE_EXCEL}     id=codelist_export_cross_reference_excel_link
${EXPORT_CROSS_REFERENCE_CSV}       id=codelist_export_cross_reference_csv_link
${EXPORT_JSON_AS_FILE_BTN}          id=codelist_export_json_inline_link
${EXPORT_JSON}                      id=codelist_export_json_as_file_link
#link buttons
${ADD_NEW_LINK_BTN}                 id=add_new_link_button
${LINK_TYPE_DROPDOWN}               id=propertytype_dropdown_button
${DROPDOWN_ITEM_LINK}               id=ExternalReference_link_propertytype_dropdown_button
${LINK_URL_INPUT}                   id=link_url_input
${ADD_BTN}                          id=create_link_button
${LINK_1}                           //a[@target='_blank'][contains(text(),'https://www.suomi.fi/etusivu/')]
${LINK_MODAL_OK_BTN}                id=close_modal_button
${DELETE_LINK_ICON}                 //*[@class="icon icon-trash"]
${REMOVE_LINK_CONF_BTN}             id=confirm_confirmation_modal_button
${SELECT_LINK_BTN}                  id=select_link_button
${MODIFY_LINK_ICON}                 //*[@class="icon icon-pencil"]
${LINK_NAME_INPUT_FI}               id=link_title_input_fi
${LINK_NAME_INPUT_AB}               id=link_title_input_ab
${SAVE_LINK_MODIFY_BTN}             id=save_button
${LINK_BTN}                         id=ExternalReference_link_propertytype_dropdown_button
${LICENSE_BTN}                      id=ExternalReference_license_propertytype_dropdown_button

#Error messages
${Error_registry_with_codelists}        Rekisterillä on koodistoja. Poista koodistot ennen rekisterin poistamista.
${Error_end_date_before_start_date}     Loppupäivä ennen alkupäivää.
${Error_remove_linked_code}             Koodia ei voi poistaa, koska se on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/600/extension/koodiliitoslaajennus/member/
${Error_no_code_status_changes}         Tilaa ei vaihdettu yhteenkään koodiin. Ei löytynyt koodeja vaihdettavassa tilassa.
${Error_remove_languages}               abhaasi, englanti, suomi, tataari
#JSON Export
${Json_export_dcat}                     ["AGRI","ECON","EDUC","ENER","ENVI","GOVE","HEAL","INTR","JUST","REGI","SOCI","TECH","TRAN"]

*** Keywords ***
Return to Koodistot frontpage
    Click element with wait         ${FRONTPAGE_LINK}       timeout=60
    Wait Until Element Is Enabled   ${SEARCH_BOX_INPUT}     timeout=60

Remove list of codes
    [Arguments]    @{code_list_items}
    Return to Koodistot frontpage
    FOR    ${code_list_item}    IN    @{code_list_items}
        Input text with wait                ${SEARCH_BOX_INPUT}     ${code_list_item}       timeout=30

        Click element that contains text    ${code_list_item}                               timeout=60
        Wait Until Page Contains            ${code_list_item}                               timeout=60

        Click element with wait             ${CODE_LIST_DDL}                                timeout=20
        Click element with wait             ${DELETE_CODE_LIST_BTN}                         timeout=20
        Click element with wait             ${REMOVE_CODE_LIST_CONF_BTN}                    timeout=20

        Input text with wait                ${SEARCH_BOX_INPUT}   ${code_list_item}         timeout=60

        Wait Until Page Contains                     Rajaa hakutuloksia            timeout=90
        Wait until page does not contain element     //a[contains(@class, 'name') and text() = '${code_list_item}']      timeout=10
    END

Create code list
    [Arguments]    ${registry}    ${cumulative}    ${codelist_value}    ${organization}    ${codelist_name}    ${classification}
    Click element with wait     ${ADD_CODE_LIST_BTN}                                    timeout=60
    Click element with wait     ${CREATE CODE_LIST_BTN}                                 timeout=60

    ${vocabularies_error}=    Run Keyword And Return Status    Page should contain    Ei yhteyttä Sanastoihin.
    Run Keyword If    ${vocabularies_error}    Close error modal

    Click element with wait             ${CANCEL_CREATION_BTN}                          timeout=20
    Click element with wait             ${SELECT_REGISTRY_BTN}                          timeout=60
    Click element that contains text    ${registry}                                     timeout=60

    Run Keyword If    '${cumulative}' == 'Cumulative'    Select Cumulative Code List Checkbox    ${cumulative}

    Input text with wait        ${CODE_LIST_VALUE_INPUT}   ${codelist_value}                timeout=20
    Click element with wait     ${ADD_ORGANIZATION_BTN}                                     timeout=20

    Input text with wait                ${SEARCH_ORGANIZATION_INPUT}   ${organization}      timeout=20
    Click element that contains text    ${organization}                                     timeout=60

    Input text with wait        ${CODE_LIST_NAME_INPUT}    ${codelist_name}                 timeout=20
    Click Button                ${ADD_CLASSIFICATION_BTN}

    Input text with wait        ${SEARCH_CLASSIFICATION_INPUT}     ${classification}        timeout=20
    Click element that contains text    ${classification}                                   timeout=20

    Sleep    1
    ${code_value_exists}=    Run Keyword And Return Status    Page should contain    Koodiston tunnus on jo käytössä tässä rekisterissä.
    Run Keyword If    ${code_value_exists}    Cancel code list creation
    ...    ELSE    Save code list after creation    ${codelist_name}

Create Code List With All Languages
    [Arguments]    ${registry}    ${cumulative}    ${codelist_value}    ${organization}    ${codelist_name_fi}    ${codelist_name_en}    ${codelist_name_sv}    ${classification}
    Click element with wait     ${ADD_CODE_LIST_BTN}                            timeout=60
    Click element with wait     ${CREATE CODE_LIST_BTN}                         timeout=60

    ${vocabularies_error}=    Run Keyword And Return Status    Page should contain    Ei yhteyttä Sanastoihin.
    Run Keyword If    ${vocabularies_error}    Close error modal

    Click element with wait     ${CANCEL_CREATION_BTN}                          timeout=20

    Change Content Language    ${ALL_LANGUAGE_BTN}

    Click element with wait             ${SELECT_REGISTRY_BTN}                  timeout=60
    Click element that contains text    ${registry}                             timeout=60

    Run Keyword If    '${cumulative}' == 'Cumulative'    Select Cumulative Code List Checkbox    ${cumulative}

    Input text with wait    ${CODE_LIST_VALUE_INPUT}   ${codelist_value}        timeout=20

    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}                 timeout=20
    Click Button    ${ADD_ORGANIZATION_BTN}

    Input text with wait    ${SEARCH_ORGANIZATION_INPUT}   ${organization}      timeout=20

    Click element that contains text    ${organization}                         timeout=20

    Input text with wait    ${CODE_LIST_NAME_INPUT}     ${codelist_name_fi}      timeout=20
    Input text with wait    ${CODE_LIST_NAME_INPUT_EN}  ${codelist_name_en}      timeout=20
    Input text with wait    ${CODE_LIST_NAME_INPUT_SV}  ${codelist_name_sv}      timeout=20

    Click Button    ${ADD_CLASSIFICATION_BTN}

    Input text with wait    ${SEARCH_CLASSIFICATION_INPUT}  ${classification}    timeout=20

    Click element that contains text    ${classification}                           timeout=20

    Sleep    1
    ${code_value_exists}=    Run Keyword And Return Status    Page should contain    Koodiston tunnus on jo käytössä tässä rekisterissä.
    Run Keyword If    ${code_value_exists}    Cancel code list creation
    ...    ELSE    Save code list after creation    ${codelist_name_fi}

Create Code List Version From File
    [Arguments]    ${file_format}    ${codelist}    ${codelist_name}
    Click element with wait             ${CODE_LIST_DDL}                        timeout=60
    Click element with wait             ${CREATE_CODELIST_VERSION_FROM_FILE}    timeout=20
    Click element with wait             ${FILE_FORMAT_BTN}                      timeout=20
    Click element with wait             ${file_format}                          timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}                      timeout=20
    Upload codelist                     ${codelist}    ${codelist_name}
    Wait Until Page Does Not Contain Element    //app-ajax-loading-indicator                timeout=90

Select Cumulative Code List Checkbox
    [Arguments]    ${cumulative}
    Click element with wait             ${CREATE_CUMULATIVE_CODE_LIST}          timeout=30
    Checkbox Should Be Selected         ${CREATE_CUMULATIVE_CODE_LIST}

Save code list after creation
    [Arguments]    ${codelist_name}
    Click element with wait             ${SAVE_NEW_CODE_LIST}                   timeout=30
    Wait Until Element Is Visible       ${CODE_LIST_DDL}                        timeout=120

Cancel code list creation
    Click element with wait             ${CANCEL_CODE_CREATE_BTN}               timeout=30

Save code list
    Click element with wait             ${SAVE_NEW_CODE_LIST}                   timeout=30

Save Code List With Confirmation
    Click element with wait             ${SAVE_NEW_CODE_LIST}                   timeout=30
    Click element with wait             ${CONFIRMATION_YES_BTN}                 timeout=20
    Wait Until Element Is Enabled       ${MODIFY_CODE_LIST}                     timeout=30

Close error modal
    Click element with wait             ${CLOSE_ERROR_MODAL_BTN}                timeout=20

Upload codelist
    [Arguments]    ${codelist}    ${codelist_name}
    Choose File    ${FILE_UPLOAD_BTN}    ${codelist}

    Wait Until Element Is Enabled       ${UPLOAD_FILE_BTN}                              timeout=20
    Click Button                        ${UPLOAD_FILE_BTN}

    Wait Until Element Is Visible       ${CODE_LIST_DDL}                                timeout=120

Update code list
    [Arguments]    ${code_list}    ${codelist_name}    ${file_format}
    Click element with wait             ${CODE_LIST_DDL}                        timeout=20
    Click element with wait             ${UPDATE_CODE_LIST_FROM_FILE_BTN}       timeout=20
    Click element with wait             ${FILE_FORMAT_BTN}                      timeout=20
    Click element with wait             ${file_format}                          timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}                      timeout=20
    Choose File                         ${FILE_UPLOAD_BTN}  ${code_list}

    Click element with wait             ${UPLOAD_FILE_BTN}                      timeout=20

    Wait Until Page Does Not Contain Element    //app-ajax-loading-indicator                timeout=90
    Wait Until Element Is Enabled               ${CODE_LIST_DDL}                            timeout=120
    Wait Until Page Contains Element            //*[contains(text(), "${codelist_name}")]   timeout=30

Import code list in Excel format
    Click element with wait             ${ADD_CODE_LIST_BTN}        timeout=60
    Click element with wait             ${IMPORT_CODE_LIST_BTN}     timeout=60
    Click element with wait             ${SELECT_REGISTRY_BTN}      timeout=60

    Click Button                        ${REGISTRY_1}

    Click element with wait             ${FILE_FORMAT_BTN}          timeout=60
    Click element with wait             ${FILE_FORMAT_Excel}        timeout=60

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}          timeout=60

Import code list in CSV format
    Click element with wait         ${IMPORT_CODE_LIST_BTN}         timeout=60
    Click element with wait         ${SELECT_REGISTRY_BTN}          timeout=60

    Click Button                    ${REGISTRY_1}

    Click element with wait         ${FILE_FORMAT_BTN}              timeout=60
    Click element with wait         ${FILE_FORMAT_CSV}              timeout=60

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}          timeout=60

Upload codes
    [Arguments]    ${codes}
    Choose File    ${FILE_UPLOAD_BTN}    ${codes}

    Wait Until Page Contains Element    ${IMPORT_BTN}                           timeout=20
    Click Button                        ${IMPORT_BTN}

    Wait Until Page Does Not Contain Element    //app-ajax-loading-indicator    timeout=90
    Wait Until Element Is Visible               ${CODE_LIST_DDL}                timeout=120

Cancel code import
    Click Button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait Until Page Contains Element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Import codes in Excel format
    Click element with wait         ${CODE_LIST_DDL}        timeout=20
    Click element with wait         ${IMPORT_CODES_BTN}     timeout=20
    Click element with wait         ${FILE_FORMAT_BTN}      timeout=20
    Click element with wait         ${FILE_FORMAT_Excel}    timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}  timeout=20

Import codes in CSV format
    Click element with wait         ${CODE_LIST_DDL}        timeout=20
    Click element with wait         ${IMPORT_CODES_BTN}     timeout=20
    Click element with wait         ${FILE_FORMAT_BTN}      timeout=20
    Click element with wait         ${FILE_FORMAT_CSV}      timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20

Create new code to code list
    [Arguments]    ${code_value}    ${code_name}    ${code_status}    ${sub_code_list}
    Click element with wait         ${CODE_LIST_DDL}                        timeout=20
    Click element with wait         ${CREATE_CODE_BTN}                      timeout=20

    ${vocabularies_error}=    Run Keyword And Return Status    Page should contain    Ei yhteyttä Sanastoihin.
    Run Keyword If    ${vocabularies_error}    Close error modal

    Click element with wait     ${CANCEL_CREATION_BTN}                      timeout=20

    Input text with wait        ${CODE_CODEVALUE_INPUT}    ${code_value}    timeout=60
    Input text with wait        ${CODE_NAME_INPUT}         ${code_name}     timeout=20

    Click element with wait     ${CODE_STATUS_DDL}                          timeout=20
    Click element with wait     ${code_status}                              timeout=20

    Run Keyword If  "${sub_code_list}"!="${EMPTY}"    Add sub code list    ${sub_code_list}

    Click element with wait             ${SAVE_NEW_CODE_BTN}                timeout=20

    Wait Until Page Contains Element    ${MODIFY_CODE_BTN}                  timeout=60

Create New Code With All Languages
    [Arguments]    ${code_value}    ${code_name_fi}    ${code_name_en}    ${code_name_sv}    ${code_status}    ${sub_code_list}
    Click element with wait         ${CODE_LIST_DDL}    timeout=20
    Click element with wait         ${CREATE_CODE_BTN}    timeout=20

    ${vocabularies_error}=    Run Keyword And Return Status    Page should contain    Ei yhteyttä Sanastoihin.
    Run Keyword If    ${vocabularies_error}    Close error modal

    Click element with wait         ${CANCEL_CREATION_BTN}    timeout=20

    Change Content Language         ${ALL_LANGUAGE_BTN}

    Input text with wait    ${CODE_CODEVALUE_INPUT}    ${code_value}      timeout=60
    Input text with wait    ${CODE_NAME_INPUT}         ${code_name_fi}    timeout=20
    Input text with wait    ${CODE_NAME_INPUT_EN}      ${code_name_en}    timeout=20
    Input text with wait    ${CODE_NAME_INPUT_SV}      ${code_name_sv}    timeout=20

    Click element with wait         ${CODE_STATUS_DDL}      timeout=20
    Click element with wait         ${code_status}          timeout=20

    Run Keyword If  "${sub_code_list}"!="${EMPTY}"     Add sub code list    ${sub_code_list}

    Click element with wait         ${SAVE_NEW_CODE_BTN}        timeout=20
    Wait Until Page Contains Element    ${MODIFY_CODE_BTN}      timeout=60

Add sub code list
    [Arguments]    ${sub_code_list}
    Click element with wait     ${SUB_CODE_LIST_BTN}                                timeout=20
    Input text with wait        ${SEARCH_LINKED_CODE_INPUT}    ${sub_code_list}     timeout=30
    Click element with wait     //*[contains(text(), "${sub_code_list}")]           timeout=30

Remove code
    [Arguments]    ${code}
    Click element with wait             //*[contains(text(), "${code}")]    timeout=20
    Click element with wait             ${CODE_DDL}    timeout=20
    Click element with wait             ${REMOVE_CODE_BTN}    timeout=20
    Click element with wait             ${REMOVE_CODE_CONF_BTN}    timeout=20

    Wait Until Element Is Enabled       ${CODELIST_INFO_TAB}    timeout=60
    Page Should Not Contain Element     ${code}

Delete registery
    [Arguments]    ${registry}
    Click element with wait         ${NAVIGATION_MENU_DDL}    timeout=20
    Click element with wait         ${NAVIGATION_MENU_REGISTRIES}
    Click element with wait         //*[contains(text(), "${registry}")]    timeout=30
    Click element with wait         ${REGISTRY_DDL}    timeout=30
    Click element with wait         ${DELETE_REGISTRY}    timeout=30
    Click element with wait         ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20

Delete empty registry
    [Arguments]    ${registry}
    Close all browsers
    Open koodistot
    Select superuser user
    Delete registery                    ${registry}

    Click element with wait             ${REGISTRY_FILTER_DDL}      timeout=20
    Page Should Not Contain Element     //*[contains(text(), "Automaatiorekisteri")]

Create registry
    [Arguments]    ${registry_value}    ${registry_name}    ${organization}    ${registry_description}
    Click element with wait     ${NAVIGATION_MENU_DDL}          timeout=20
    Click element with wait     ${NAVIGATION_MENU_REGISTRIES}   timeout=20
    Click element with wait     ${REGISTRY_DDL}                 timeout=60
    Click element with wait     ${CREATE_REGISTRY_BTN}          timeout=60

    Input text with wait        ${REGISTRY_VALUE_INPUT}     ${registry_value}       timeout=20
    Input text with wait        ${REGISTRY_NAME_INPUT}      ${registry_name}        timeout=20

    Click element with wait     ${ADD_ORGANIZATION_BTN}         timeout=20h
    Input text with wait        ${SEARCH_ORGANIZATION_INPUT}   ${organization}      timeout=20
    Click element with wait     //*[@id="${organization}_organization_link"]    timeout=20

    Sleep    5
    ${code_value_exists}=   Run Keyword And Return Status   Page Should Contain         Rekisterin tunnus on jo käytössä.
    Run Keyword If          ${code_value_exists}            Cancel registry creation
    ...    ELSE             Continue registry creation      ${registry_description}     ${registry_name}

Continue registry creation
    [Arguments]    ${registry_description}    ${registry_name}
    Input text with wait            ${REGISTRY_DESCRIPTION_INPUT}  ${registry_description}      timeout=20
    Click element with wait         ${SAVE_REGISTRY}                                            timeout=30
    Wait Until Element Is Enabled   ${REGISTRY_DDL}                                             timeout=30

Cancel registry creation
    Click element with wait         ${CANCEL_CODE_MOD_BTN}    timeout=20

    Return to Koodistot frontpage

Create new version of code list
    [Arguments]    ${codelist_value}    ${codelist_name}    ${classification}
    Click element with wait         ${CODE_LIST_DDL}                            timeout=20
    Click element with wait         ${CREATE_NEW_VERSION_BTN}                   timeout=20

    Input text with wait    ${CODE_LIST_VALUE_INPUT}    ${codelist_value}       timeout=20
    Input text with wait    ${CODE_LIST_NAME_INPUT}     ${codelist_name}         timeout=20

    Click element with wait         ${ADD_CLASSIFICATION_BTN}

    Input text with wait                ${SEARCH_CLASSIFICATION_INPUT}  ${classification}    timeout=20
    Click Element that contains text    ${classification}   timeout=20

    Save code list

Modify code list
    Click element with wait         ${CODELIST_INFO_TAB}                timeout=20
    Click element with wait         ${MODIFY_CODE_LIST}                 timeout=20
    Wait Until Element Is Enabled   ${SAVE_CODE_LIST_MOD_BTN}

Cancel code list import
    Click element with wait         ${CLOSE_ERROR_MESSAGE_BTN}          timeout=20
    Click element with wait         ${CANCEL_IMPORT_CODE_LIST_BTN}      timeout=20

Upload codelist in Excel format
    [Arguments]    ${codelist}    ${codelist_name}
    Click element with wait         ${ADD_CODE_LIST_BTN}                                timeout=20
    Click element with wait         ${IMPORT_CODE_LIST_BTN}                             timeout=20
    Click element with wait         ${SELECT_REGISTRY_BTN}                              timeout=20
    Click element with wait         //*[contains(text(), "${REGISTRY_1}")]              timeout=60
    Click element with wait         ${FILE_FORMAT_BTN}                                  timeout=60
    Click element with wait         ${FILE_FORMAT_Excel}                                timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}                              timeout=20
    Choose File                         ${FILE_UPLOAD_BTN}    ${codelist}

    Click element with wait             ${UPLOAD_FILE_BTN}                              timeout=60

    Wait Until Page Does Not Contain Element    //app-ajax-loading-indicator            timeout=90
    Wait Until Page Contains Element    //*[contains(text(), "${codelist_name}")]       timeout=60

Upload codelist in CSV format
    [Arguments]    ${codelist}    ${codelist_name}
    Click element with wait         ${ADD_CODE_LIST_BTN}        timeout=20
    Click element with wait         ${IMPORT_CODE_LIST_BTN}     timeout=20
    Click element with wait         ${SELECT_REGISTRY_BTN}      timeout=20
    Click Button                    ${REGISTRY_1}

    Click element with wait             ${FILE_FORMAT_BTN}      timeout=20
    Click element with wait             ${FILE_FORMAT_CSV}      timeout=20
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}      timeout=20
    Choose File                         ${FILE_UPLOAD_BTN}      ${codelist}

    Click element with wait             ${UPLOAD_FILE_BTN}      timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${codelist_name}")]    timeout=60

Change Content Language
    [Arguments]    ${language}
    Click element with wait         ${CONTENT_LANGUAGE_DDL}     timeout=20
    Click element with wait         ${language}                 timeout=20

Change UI Language
    [Arguments]    ${language}
    Click element with wait         ${LANGUAGE_DROPDOWN_BTN}    timeout=20
    Click element with wait         ${language}                 timeout=20

Save code modification
    Click element with wait         ${SAVE_CODE_MOD_BTN}        timeout=20
    Wait Until Element Is Visible   ${MODIFY_CODE_BTN}          timeout=90

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Click element with wait     ${NAVIGATION_MENU_DDL}                              timeout=60
    Click element with wait     //*[contains(text(), "${navigation_menu_link}")]    timeout=60

Modify code
    Click element with wait     ${MODIFY_CODE_BTN}          timeout=60

Click Confirmation
    Click element with wait     ${CONFIRM_ALERT_MODAL_BTN}  timeout=60

Click Yes Confirmation
    Click element with wait     ${CONFIRMATION_YES_BTN}     timeout=30

Click Code List Info Tab
    Click element with wait     ${CODELIST_INFO_TAB}        timeout=60

Search For Code List
    [Arguments]    ${code_list}
    Input text with wait    ${SEARCH_BOX_INPUT}    ${code_list}

Search and open codelist
    [Arguments]    ${code_list}
    Search For Code List    ${code_list}
    Select Code List        ${code_list}

Add Email Subscription For Code List
    Click element with wait                     ${CODE_LIST_DDL}                timeout=20
    Click element with wait                     ${ADD_SUBSCRIPTION_BTN}         timeout=20
    Click element with wait                     ${CONFIRMATION_YES_BTN}         timeout=20

    Wait Until Page Contains Element            ${SUBSCRIPTION_BELL_ICON}       timeout=20

Remove Email Subscription For Code List
    Click element with wait                     ${CODE_LIST_DDL}                timeout=20
    Click element with wait                     ${DELETE_SUBSCRIPTION_BTN}      timeout=20
    Click element with wait                     ${CONFIRMATION_YES_BTN}         timeout=20

    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}       timeout=20

Select Code List
    [Arguments]    ${code_list}
    Click element that contains text    ${code_list}

Select Tab
    [Arguments]    ${tab}
    Click element with wait             ${tab}                     timeout=30

