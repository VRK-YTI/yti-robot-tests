*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://koodistot-dev.suomi.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${ADMIN_USER_NAME}    Testi Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Testi Superuser
${LANGUAGE_EN}    id=en
${LANGUAGE_FI}    id=fi
${LANGUAGE_SV}    På svenska (SV)
${MUNICIPALITY_NAME_SV}    Helsingfors
${CLASSIFICATION_1}    id=remove_P8_infodomain_link
${CLASSIFICATION_2}    id=remove_P6_infodomain_link
${CLASSIFICATION_3}    id=remove_P1_infodomain_link
${REGISTRY_1}     Testirekisteri
${REGISTRY_2}     Automaatiorekisteri
${ORGANIZATION_1}    Testiorganisaatio
${CCBY4.0}        id=CreativeCommonsNimea4.0Kansainvalinen(CCBY4.0)_Https://creativecommons.org/licenses/by/4.0/_external_reference_link
${Koodisto6000_variant}    id=test_Koodisto6000_variant_link
${DRAFT_STATUS}    id=DRAFT_status_input_dropdown
${VALID_STATUS}    id=VALID_status_input_dropdown
${CONTENT_LANGUAGE_EN}    id=en_content_lang_dropdown_button
${2_BREADCRUMB_LINK}    id=2_breadcrumb_link
${3_BREADCRUMB_LINK}    id=3_breadcrumb_link
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}    id=navigation_groupmanagement_link
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${STATUS_DROPDOWN_BTN}    id=selected_status_filter_dropdown
${SEARCH_CODE_CHECKBOX}    id=search_code_details_checkbox
${FRONTPAGE_LINK}    id=main_page_link
${NAVIGATION_MENU_DDL}    id=navigation_menu_dropdown
${NAVIGATION_MENU_REGISTRIES}    id=navigation_link_registries
${REGISTRY_FILTER_DDL}    id=selected_registry_filter_dropdown
${SEARCH_BOX_INPUT}    id=search_box_input
#Registry
${CREATE_REGISTRY_BTN}    id=create_registry_button
${REGISTRY_VALUE_INPUT}    id=registry_value_input
${REGISTRY_NAME_INPUT}    id=registry_name_input
${REGISTRY_DESCRIPTION_INPUT}    id=registry_description_textarea
${ADD_ORGANIZATION_BTN}    id=add_organization_button
${SEARCH_ORGANIZATION_INPUT}    id=search_linked_organization_input
${SAVE_REGISTRY}    id=editable_save_button
${DELETE_REGISTRY}    id=delete_registry_button
${REGISTRY_DDL}    id=registryDropdown
#Code list buttons
${ADD_CLASSIFICATION_BTN}    id=add_infodomain_button
${CODE_LIST_START_DATE_BTN}    id=start_date_input_toggle_calendar_button
${CODE_LIST_END_DATE_BTN}    id=end_date_input_toggle_calendar_button
${CODE_LIST_STATUS_DDL}    id=selected_status_input_dropdown
${CODE_LIST_NAME_INPUT}    id=codelist_name_input
${CODE_LIST_VALUE_INPUT}    id=codelist_value_input
${CODE_LIST_DESC_INPUT}    id=codelist_description_textarea
${CODE_LIST_DEF_INPUT}    id=codelist_definition_textarea
${CODE_LIST_CHANGENOTE_INPUT}    id=codelist_changenote_textarea
${MODIFY_CODE_LIST}    id=editable_edit_button
${SEARCH_CLASSIFICATION_INPUT}    id=search_linked_code_input
${NEW_CLASSIFICATION}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/div/div[2]/a/i
${CLOSE_ERROR_MESSAGE_BTN}    id=close_error_modal_button
${FILE_FORMAT_Excel}    id=excel_format_dropdown_button
${FILE_FORMAT_CSV}    id=csv_format_dropdown_button
${ADD_CODE_LIST_BTN}    id=import_codelist_button
${IMPORT_CODE_LIST_BTN}    id=import_from_file_button
${SELECT_REGISTRY_BTN}    id=selected_codeRegistry_dropdown
${FILE_FORMAT_BTN}    id=file_format_dropdown_button
${FILE_UPLOAD_BTN}    id=fileupload_input
${CANCEL_IMPORT_CODE_LIST_BTN}    id=cancel_upload_button
${DELETE_CODE_LIST_BTN}    id=delete_codelist_button
${REMOVE_CODE_LIST_CONF_BTN}    id=confirm_confirmation_modal_button
${CREATE CODE_LIST_BTN}    id=create_new_codelist_button
${SEARCH_CODE_BOX_INPUT}    id=search_code_box_input
${CODELIST_INFO_TAB}    id=codelist_info_tab
${CODELIST_CODES_TAB}    id=codelist_codes_tabs
${CODELIST_VARIANTS_TAB}    id=codelist_variants_tab
${ADD_DEFAULTCODE_BTN}    id=add_code_button
${REMOVE_DEFAULTCODE}    id=remove_code_link
${SEARCH_DEFAULTCODE_INPUT}    id=search_linked_code_input
${SAVE_CODE_LIST_MOD_BTN}    id=editable_save_button
${CANCEL_CREATION_BTN}    id=cancel_modal_button
${SEARCH_CONCEPT_INPUT}    id=search_concept_input
${VOCABULARY_SELECTION_DDL}    id=selected_vocabulary_selection_dropdown
${CREATE_NEW_VERSION_BTN}    id=clone_codelist_button
${ATTACH_VARIANT_BTN}    id=attach_variant_button
${SEARCH_VARIANT_INPUT}    id=search_variant_input
${START_DATE_INPUT}    id=start_date_input
${END_DATE_INPUT}    id=end_date_input
${CODE_LIST_DDL}    id=codeSchemeDropdown
${EXPORT_DDL}     id=exportDropdown
${VERSION_TAB}    id=codelist_versionhistory_tab
${CLOSE_ERROR_MODAL_BTN}    id=close_error_modal_button
${OPEN_TERMINOLOGY_MODAL_BTN}    id=open_terminology_modal_button_for_concept_suggestion
${CONFIRMATION_YES_BTN}    id=confirm_confirmation_modal_button
${CLOSE_MODAL_LINK}    id=close_modal_link
${CONCEPT_DEFINITION_INPUT}    id=concept_suggestion_definition_input
${SAVE_CONCEPT_SUGGESTION_BTN}    id=save_concept_suggestion_button
${CONTENT_LANGUAGE_DDL}    id=content_language_dropdown_button
${CREATE_CODELIST_VERSION_AS_EMPTY}    id=new_codescheme_version_create_as_empty
${CREATE_CODELIST_VERSION_FROM_FILE}    id=clone_codelist_from_file_button
${CONCEPT_SUGGESTION_NAME_INPUT}    id=concept_suggestion_name_input
#Extensions
${EXTENSION_DDL}    id=extensionDropdown
${IMPORT_EXTENSIONS_BTN}    id=import_extensions_button
${EXTENSIONS_TAB}    id=codelist_extensions_tab
${ADD_MEMBER_BTN}    id=add_member_button
${SEARCH_EXTENSION_INPUT}    id=search_linked_extension_input
${EXTENSION_FILE_UPLOAD}    id=fileupload_input
${CREATE_MEMBER_BTN}    id=create_member_button
${IMPORT_MEMBERS_BTN}    id=import_members_button
${MEMBER_FILE_UPLOAD}    id=upload_file_button
${FILE_FORMAT_UPLOAD}    id=file_format_dropdown_button
${EXTENSION_UPLOAD_BTN}    id=upload_file_button
${MEMBER_UPLOAD_BTN}    id=upload_file_button
${MEMBERVALUE_1_INPUT}    id=member_membervalue1_input
${MEMBER_NAME_INPUT}    id=member_name_input
${SAVE_EXTENSION}    id=editable_save_button
${SAVE_MEMBER}    id=editable_save_button
${EXTENSION_VALUE_INPUT}    id=extension_codevalue_input
${EXTENSION_NAME_INPUT}    id=extension_name_input
${ADD_CODE_TO_MEMBER_BTN}    id=add_code_button
${SEARCH_CODE_TO_MEMBER_INPUT}    id=search_linked_code_input
${EXTENSION_DELETE_BTN}    id=delete_extension_button
${CONFIRM_DELETE_EXTENSION_BTN}    id=confirm_confirmation_modal_button
${MEMBER_DELETE_BTN}    id=member_delete_button
${MODIFY_EXTENSION_SCHEME_BTN}    id=editable_edit_button
${MODIFY_EXTENSION_BTN}    id=editable_edit_button
${REMOVE_MEMBER_LINK}    id=remove_member_link
${EXTENSION_SCHEME_TYPE}    id=propertytype_dropdown_button
${SEARCH_LINKED_CODE_INPUT}    id=search_linked_code-scheme_input
${ADD_CODE_LIST_TO_EXTENSION_BTN}    id=add_codelist_button
${EXTENSION_STATUS_DDL}    id=selected_status_input_dropdown
${MEMBER_DDL}     id=memberDropdown
${EXTENSION_BACK_BTN}    id=extension_back_button
${MODIFY_MEMBER_BTN}    id=editable_edit_button
${SEARCH_MEMBER_INPUT}    id=search_linked_member_input
${MEMBER_BACK_BTN}    id=member_back_button
${COMPARISON_OPERATOR_INPUT}    id=member_membervalue_comparisonOperator _input
${UNARY_OPERATOR_INPUT}    id=member_membervalue_unaryOperator _input
${CALC_HIERARCHY_TAB}    id=codelist_extension_L (0)_tab
${DEF_HIERARCHY_TAB}    id=codelist_extension_M (0)_tab
${EXTENSION_INFO_TAB}    id=extension_info_tab
${MEMBERS_TAB}    id=extension_members_tab
${MEMBER_INFO_TAB}    id=member_info_tab
${AUTO_CREATE_MEMBERS_CHECKBOX}    id=auto_create_members_checkbox
#DPM extensions
#DPM Metric
${CREATE_DPM_METRIC_BTN}    id=create_extension_dpmmetric_button
${DPM_BALANCE_TYPE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmBalanceType _input
${DPM_METRIC_DATA_TYPE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmMetricDataType _input
${DPM_DOMAIN_REFERENCE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmDomainReference _input
${DPM_FLOW_TYPE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmFlowType _input
${DPM_HIERARCHY_REFERENCE_INPUT}    id=code_inline_membervalue_dpmMetric_dpmHierarchyReference _input
#DPM Explicit domain
${CREATE_DPM_EXPLICIT_DOMAIN_BTN}    id=create_extension_dpmexplicitdomain_button
${DPM_EXPLICIT_DOMAIN_INPUT}    id=code_inline_membervalue_dpmExplicitDomain_dpmMemberXBRLCodePrefix _input
#DPM Dimension
${CREATE_DPM_DIMENSION_BTN}    id=create_extension_dpmdimension_button
${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    id=code_inline_membervalue_dpmDimension_dpmDomainReference _input
#DPM Typed Domain
${CREATE_DPM_TYPED_DOMAIN_BTN}    id=create_extension_dpmdtypeddomain_button
${DPM_DATA_TYPE_INPUT}    id=code_inline_membervalue_dpmTypedDomain_dpmDomainDataType _input
#Code buttons
${EXPAND_ALL_BTN}    id=expand_all_button
${COLLAPSE_ALL_BTN}    id=collapse_all_button
${CODE_BACK_BTN}    id=code_back_button
${IMPORT_CREATE_BACK_BTN}    id=import_create_back_button
${CANCEL_CODE_MOD_BTN}    id=editable_cancel_button
${MODIFY_CODE_BTN}    id=editable_edit_button
${CODE_NAME_INPUT}    id=code_name_input
${CODE_CODEVALUE_INPUT}    id=code_value_input
${CODE_DESC_INPUT}    id=code_description_textarea
${CODE_SHORT_NAME_INPUT}    id=code_shortname_input
${SAVE_CODE_MOD_BTN}    id=editable_save_button
${ADD_LINK_DDL}    id=add_link_propertytype_dropdown
${CODE_START_DATE_BTN}    id=start_date_input_toggle_calendar_button
${CODE_END_DATE_BTN}    id=end_date_input_toggle_calendar_button
${CODE_START_DATE_INPUT}    id=start_date_input
${CODE_END_DATE_INPUT}    id=end_date_input
${IMPORT_CODES_BTN}    id=import_codes_button
${IMPORT_BTN}     id=upload_codes_file_button
${UPLOAD_FILE_BTN}    id=upload_file_button
${SAVE_NEW_CODE_LIST}    id=editable_save_button
${CREATE_CODE_BTN}    id=create_code_button
${SAVE_NEW_CODE_BTN}    id=editable_save_button
${REMOVE_CODE_BTN}    id=code_info_delete_button
${REMOVE_CODE_CONF_BTN}    id=confirm_confirmation_modal_button
${CANCEL_CODE_CREATE_BTN}    id=editable_cancel_button
${EXTENSION_BACK_BTN}    id=extension_back_button
${CODE_STATUS_DDL}    id=selected_status_input_dropdown
${CODE_DDL}       id=codeDropdown
${CODE_SCHEME_DDL_BTN}    id=code_scheme_dropdown_button
${SUB_CODE_LIST_BTN}    id=add_codelist_button
${SEARCH_SUB_CODE_LIST_INPUT}    id=search_linked_code-scheme_input
#Code lists and Codes
${CODE_LIST_1}    Kunnat 2018
${CODE_LIST_1_EN}    Municipalities 2018
${CODE_LIST_2}    testiautomaatiokoodisto1
${CODE_LIST_3}    Palveluluokitus
${CODE_LIST_4}    testiautomaatiokoodisto
${CODE_LIST_5}    Ammattiluokitus 2010
${CODE_LIST_6}    testiautomaatiokoodisto 2
${CODE_LIST_7}    T200
${CODE_LIST_8}    koodisto6000
${CODE_LIST_9}    koodisto7000
${CODE_LIST_10}    koodisto7001
${CODE_LIST_11}    koodisto7002
${CODE_LIST_12}    koodisto7003
${CODE_LIST_13}    Sisällön filteröinti
${CODE_LIST_14}    Testikoodisto2 pitkillä arvoilla
${CODE_LIST_15}    Vakiokoodikoodisto
${CODE_LIST_16}    Koodisto600
${CODE_LIST_17}    Koodisto700
${CODE_LIST_18}    Koodisto701
${CODE_LIST_19}    Testikoodisto3 pitkillä arvoilla
${CODE_LIST_20}    Testi dcat
${CODE_LIST_21}    Linkkikoodisto
${CODE_LIST_22}    Koodisto800
${CODE_1}         koodi01 - Koodi01
${CODE_2}         koodi1006
${CODE_1000}      Koodi1000 - Koodi1000
${TEST_CODE_1}    T100 - Automaatiokoodi
${TEST_CODE_2}    testikoodi02 - Testikoodi 02
${TEST_CODE_3}    Koodi1006 - Koodi1006
${TEST_CODE_4}    T52 - Testi02
${TEST_CODE_5}    T56 - Testi06
${TEST_CODE_6}    testcode25 - Testikoodi 25
${CODE_LIST_VALUE_1}    Koodisto6000
${CODE_LIST_VALUE_2}    t100
${CODE_LIST_VALUE_3}    Koodisto7001
${CODE_LIST_VALUE_4}    testiautomaatiokoodisto
${CODE_LIST_VALUE_5}    O1234567890123456789012345678901234567333
${EXTENSION_VALUE_1}    extension1
${EXTENSION_NAME_1}    Extension 1
${MEMBER_VALUE_1}    member1
${MEMBER_NAME_1}    Member 1
${COMPARISON_OPERATOR_1}    <=
${UNARY_OPERATOR_1}    -
#Status
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
#Code list export
${EXPORT_TYPE_EXCEL}    id=codelist_export_excel_link
${EXPORT_TYPE_CSV}    id=codelist_export_csv_link
${EXPORT_CROSS_REFERENCE_EXCEL}    id=codelist_export_cross_reference_excel_link
${EXPORT_CROSS_REFERENCE_CSV}    id=codelist_export_cross_reference_csv_link
#link buttons
${ADD_NEW_LINK_BTN}    id=add_new_link_button
${LINK_TYPE_DROPDOWN}    id=propertytype_dropdown_button
${DROPDOWN_ITEM_LINK}    id=ExternalReference_link_propertytype_dropdown_button
${LINK_URL_INPUT}    id=link_url_input
${ADD_BTN}        id=create_link_button
${LINK_1}         //a[@target='_blank'][contains(text(),'https://www.suomi.fi/etusivu/')]
${LINK_MODAL_OK_BTN}    id=close_modal_button
${DELETE_LINK_ICON}    //*[@class="icon icon-trash"]
${REMOVE_LINK_CONF_BTN}    id=confirm_confirmation_modal_button
${SELECT_LINK_BTN}    id=select_link_button
${MODIFY_LINK_ICON}    //*[@class="icon icon-pencil"]
${LINK_NAME_INPUT}    id=link_title_input
${SAVE_LINK_MODIFY_BTN}    id=save_button
${LINK_BTN}       id=ExternalReference_link_propertytype_dropdown_button
${LICENSE_BTN}    id=ExternalReference_license_propertytype_dropdown_button
#Excel paths
${DATAFOLDER}     ${EXECDIR}${/}test_files
${testiautomaatiokoodisto_with_code}    ${DATAFOLDER}${/}testiautomaatiokoodisto_with_code.xlsx
${testiautomaatiokoodisto2_with_code}    ${DATAFOLDER}${/}testiautomaatiokoodisto2_with_code.xlsx
${testiautomaatiokoodisto1_with_codes}    ${DATAFOLDER}${/}testiautomaatiokoodisto1_with_codes.xlsx
${Testikoodisto_T200}    ${DATAFOLDER}${/}Testikoodisto_T200.xlsx
${Code_filter}    ${DATAFOLDER}${/}Code_filter.xlsx
${Code_list_Codes_new_version}    ${DATAFOLDER}${/}Code_list_and_codes_for_new_version_creation.xlsx
#Error messages
${Error_registry_with_codelists}    Rekisterillä on koodistoja. Poista koodistot ennen rekisterin poistamista.
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Keywords ***
Test Case Setup Admin
    Open Koodistot
    Set Selenium Speed    0.5
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Test Case Setup Superuser
    Open Koodistot
    Set Selenium Speed    0.5
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Sleep    1
    Click element    ${user_id}
    Sleep    5
    Wait Until Page Contains    ${user_name}
    Sleep    5

Open Koodistot
    Open Browser with Settings
    Sleep    5
    Page should contain    Koodistot
    Page should contain    KIRJAUDU SISÄÄN

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    #Call Method    ${chrome_options}    add_argument    --single-process
    #    Call Method    ${chrome_options}    add_argument    start-maximized
    #    Call Method    ${chrome_options}    add_argument    --disable-web-security
    #    Call Method    ${chrome_options}    add_argument    --allow-insecure-localhost
    #    Call Method    ${chrome_options}    add_argument    --dump-dom
    #    Call Method    ${chrome_options}    add_argument    --enable-crash-reporter
    #    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}

Return to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2

Remove code lists
    [Arguments]    @{code_list_items}
    : FOR    ${code_list_item}    IN    @{code_list_items}
    \    Return to Koodistot frontpage
    \    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    \    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    \    Input Text    ${SEARCH_BOX_INPUT}    ${code_list_item}
    \    Wait until page contains element    //*[contains(text(), "${code_list_item}")]    timeout=30
    \    Click element    //*[contains(text(), "${code_list_item}")]
    \    Wait until page contains    ${code_list_item}
    \    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    \    Click element    ${CODE_LIST_DDL}
    \    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    \    Click element    ${DELETE_CODE_LIST_BTN}
    \    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    \    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    \    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    \    Input Text    ${SEARCH_BOX_INPUT}    ${code_list_item}
    \    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    \    Log to Console    ${code_list_item} removed
    \    Sleep    6

Create code list
    [Arguments]    ${registry}    ${codelist_value}    ${organization}    ${codelist_name}    ${classification}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${codelist_name}
    ${code_list_exists}=    Run Keyword And Return Status    Page should not contain    Haulla ei löytynyt yhtään koodistoa.
    run keyword if    ${code_list_exists}    Remove code lists    ${codelist_name}
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    ${vocabularies_error}=    Run Keyword And Return Status    Page should contain    Ei yhteyttä Sanastoihin.
    run keyword if    ${vocabularies_error}    Close error modal
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Sleep    5
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${registry}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${codelist_value}
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${organization}
    Click element    //*[contains(text(), "${organization}")]
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${codelist_name}
    Click button    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${classification}
    Click element    //*[contains(text(), "${classification}")]
    Sleep    2
    ${code_value_exists}=    Run Keyword And Return Status    Page should contain    Koodiston tunnus on jo käytössä tässä rekisterissä.
    run keyword if    ${code_value_exists}    Cancel code list creation
    ...    ELSE    Save code list
    Sleep    5
    Log to Console    ${codelist_name} created

Cancel code list creation
    Wait until page contains element    ${CANCEL_CODE_CREATE_BTN}
    Click element    ${CANCEL_CODE_CREATE_BTN}
    Sleep    2

Save code list
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}

Close error modal
    Wait until page contains element    ${CLOSE_ERROR_MODAL_BTN}    timeout=20
    Click element    ${CLOSE_ERROR_MODAL_BTN}
    Sleep    1

Upload codelist
    [Arguments]    ${codelist}    ${codelist_name}
    Choose file    ${FILE_UPLOAD_BTN}    ${codelist}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${codelist_name}")]    timeout=30
    Log to Console    Code list ${codelist_name} imported

Import code list in Excel format
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    #Wait until page contains element    ${REGISTRY_1}    timeout=20
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Upload codes
    [Arguments]    ${codes}
    Choose file    ${FILE_UPLOAD_BTN}    ${codes}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    Tuo
    Log to Console    Codes imported
    Sleep    2

Cancel code import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Import codes in Excel format
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=20
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Import codes in CSV format
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=20
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=20
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Create new code to code list
    [Arguments]    ${code_value}    ${code_name}    ${code_status}    ${sub_code_list}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=20
    Click element    ${CREATE_CODE_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Sleep    5
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=20
    Input text    ${CODE_CODEVALUE_INPUT}    ${code_value}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    ${code_name}
    Wait until page contains element    ${CODE_STATUS_DDL}    timeout=20
    Click element    ${CODE_STATUS_DDL}
    Wait until page contains element    ${code_status}    timeout=20
    Click element    ${code_status}
    ${sub_code_list_length}=    Get Length    ${sub_code_list}
    run keyword if    ${sub_code_list_length} > 0    Add sub code list    ${sub_code_list}
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Log to Console    ${code_name} created
    Sleep    5

Add sub code list
    [Arguments]    ${sub_code_list}
    Wait until page contains element    ${SUB_CODE_LIST_BTN}    timeout=20
    Click element    ${SUB_CODE_LIST_BTN}
    Input text    ${SEARCH_LINKED_CODE_INPUT}    ${sub_code_list}
    Click element    //*[contains(text(), "${sub_code_list}")]
    Sleep    2

Remove code
    [Arguments]    ${code}
    Wait until page contains element    //*[contains(text(), "${code}")]    timeout=20
    Click element    //*[contains(text(), "${code}")]
    Wait until page contains element    ${CODE_DDL}    timeout=20
    Click element    ${CODE_DDL}
    Wait until page contains element    ${REMOVE_CODE_BTN}    timeout=20
    Click element    ${REMOVE_CODE_BTN}
    Wait until page contains element    ${REMOVE_CODE_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_CONF_BTN}
    Sleep    2
    Page should not contain element    ${code}
    Log to Console    ${code} removed

Delete registry with code lists
    [Arguments]    ${registry}    ${code_list}
    Return to Koodistot frontpage
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    //*[contains(text(), "${registry}")]
    Click element    //*[contains(text(), "${registry}")]
    Wait until page contains element    ${REGISTRY_DDL}
    Click element    ${REGISTRY_DDL}
    Wait until page contains element    ${DELETE_REGISTRY}
    Click element    ${DELETE_REGISTRY}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains    ${Error_registry_with_codelists}    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Remove code lists    ${code_list}
    Delete empty registry    ${registry}

Delete empty registry
    [Arguments]    ${registry}
    Return to Koodistot frontpage
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    //*[contains(text(), "${registry}")]
    Click element    //*[contains(text(), "${registry}")]
    Wait until page contains element    ${REGISTRY_DDL}
    Click element    ${REGISTRY_DDL}
    Wait until page contains element    ${DELETE_REGISTRY}
    Click element    ${DELETE_REGISTRY}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    2
    Wait until page contains element    ${REGISTRY_FILTER_DDL}    timeout=20
    Click element    ${REGISTRY_FILTER_DDL}
    Page should not contain element    //*[contains(text(), "Automaatiorekisteri")]
    Log to Console    ${registry} deleted
    Sleep    2

Create registry
    [Arguments]    ${registry_value}    ${registry_name}    ${registry_description}    ${organization}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    ${REGISTRY_DDL}    timeout=20
    Click element    ${REGISTRY_DDL}
    Wait until page contains element    ${CREATE_REGISTRY_BTN}    timeout=20
    Click element    ${CREATE_REGISTRY_BTN}
    Wait until page contains element    ${REGISTRY_VALUE_INPUT}    timeout=20
    Input Text    ${REGISTRY_VALUE_INPUT}    ${registry_value}
    ${code_value_exists}=    Run Keyword And Return Status    Page Should Contain    Rekisterin tunnus on jo käytössä.
    run keyword if    ${code_value_exists}    Cancel registry creation
    ...    ELSE    Continue registry creation    ${registry_name}    ${registry_description}    ${organization}

Continue registry creation
    [Arguments]    ${registry_name}    ${registry_description}    ${organization}
    Wait until page contains element    ${REGISTRY_NAME_INPUT}    timeout=20
    Input Text    ${REGISTRY_NAME_INPUT}    ${registry_name}
    Wait until page contains element    ${REGISTRY_DESCRIPTION_INPUT}    timeout=20
    Input text    ${REGISTRY_DESCRIPTION_INPUT}    ${registry_description}
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${organization}
    Click element    //*[contains(text(), "${organization}")]
    Wait until page contains element    ${SAVE_REGISTRY}
    Click element    ${SAVE_REGISTRY}
    Log to Console    ${registry_name} created
    Sleep    5

Cancel registry creation
    Sleep    1
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=20
    Click element    ${CANCEL_CODE_MOD_BTN}
    Log to Console    Cancel registry creation
    Sleep    5
    Return to Koodistot frontpage

Create new version of code list
    [Arguments]    ${codelist_value}    ${codelist_name}    ${classification}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click element    ${CREATE_NEW_VERSION_BTN}
    Sleep    2
    Input text    ${CODE_LIST_VALUE_INPUT}    ${codelist_value}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    ${codelist_name}
    Click button    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${classification}
    Click element    //*[contains(text(), "${classification}")]
    Sleep    2
    Save code list
    Log to Console    New version ${codelist_name} created
    Sleep    5

Modify code list
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Sleep    2

Cancel code list import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Upload codelist in Excel format
    [Arguments]    ${codelist}    ${codelist_name}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${codelist_name}
    ${code_list_exists}=    Run Keyword And Return Status    Page should not contain    Haulla ei löytynyt yhtään koodistoa.
    run keyword if    ${code_list_exists}    Remove code lists    ${codelist_name}
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose file    ${FILE_UPLOAD_BTN}    ${codelist}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${codelist_name}")]    timeout=30
    Log to Console    Code list ${codelist_name} imported

Upload codelist in CSV format
    [Arguments]    ${codelist}    ${codelist_name}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${codelist_name}
    ${code_list_exists}=    Run Keyword And Return Status    Page should not contain    Haulla ei löytynyt yhtään koodistoa.
    run keyword if    ${code_list_exists}    Remove code lists    ${codelist_name}
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=20
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose file    ${FILE_UPLOAD_BTN}    ${codelist}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${codelist_name}")]    timeout=30
    Log to Console    Code list ${codelist_name} imported
