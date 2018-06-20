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
${CLASSIFICATION_1}    id=remove_P8_classification_link
${CLASSIFICATION_2}    id=remove_P6_classification_link
${CLASSIFICATION_3}    id=remove_P1_classification_link
${REGISTRY_1}     Testirekisteri
${CCBY4.0}        id=CreativeCommonsNimea4.0Kansainvalinen(CCBY4.0)_Https://creativecommons.org/licenses/by/4.0/_external_reference_input
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}    id=navigation_groupmanagement_link
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${STATUS_DROPDOWN_BTN}    id=selected_status_filter_dropdown
${SEARCH_CODE_CHECKBOX}    id=search_code_details_checkbox
#Code list buttons
${ADD_CLASSIFICATION_BTN}    id=add_classification_button
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
${ADD_DEFAULTCODE_BTN}    id=add_code_button
${REMOVE_DEFAULTCODE}    id=remove_code_link
${SEARCH_DEFAULTCODE_INPUT}    id=search_linked_code_input
${SAVE_CODE_LIST_MOD_BTN}    id=editable_save_button
${CANCEL_CREATION_BTN}    id=cancel_modal_button
${SEARCH_CONCEPT_INPUT}    id=search_concept_input
${VOCABULARY_SELECTION_DDL}    id=selected_vocabulary_selection_dropdown
${CLONE_CODE_LIST_BTN}    id=clone_codelist_button
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
${ADD_LINK_TO_CODE_BTN}    id=add_link_button
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
${CODE_1}         koodi01 - Koodi01
${CODE_2}         koodi1006
${TEST_CODE_1}    T100 - Automaatiokoodi
${TEST_CODE_2}    testikoodi02 - Testikoodi 02
${TEST_CODE_3}    Koodi1006 - Koodi1006
${TEST_CODE_4}    T52 - Testi02
${TEST_CODE_5}    T56 - Testi06
${TEST_CODE_6}    testcode25 - Testikoodi 25
${CODE_LIST_VALUE_1}    Koodisto6000
${CODE_LIST_VALUE_2}    t100
${CODE_LIST_VALUE_3}    Koodisto7001
#Status
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
#Code list export
${EXPORT_TYPE_EXCEL}    id=codelist_export_excel_link
${EXPORT_TYPE_CSV}    id=codelist_export_csv_link
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
#Excel paths
${DATAFOLDER}     ${EXECDIR}${/}test_files
${testiautomaatiokoodisto_with_code}    ${DATAFOLDER}${/}testiautomaatiokoodisto_with_code.xlsx
${testiautomaatiokoodisto2_with_code}    ${DATAFOLDER}${/}testiautomaatiokoodisto2_with_code.xlsx
${testiautomaatiokoodisto1_with_codes}    ${DATAFOLDER}${/}testiautomaatiokoodisto1_with_codes.xlsx
${Testikoodisto_T200}    ${DATAFOLDER}${/}Testikoodisto_T200.xlsx
${Code_filter}    ${DATAFOLDER}${/}Code_filter.xlsx

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
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Sleep    1
    Click element    ${user_id}
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

Create testiautomaatiokoodisto with one code
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
    Choose file    ${FILE_UPLOAD_BTN}    ${testiautomaatiokoodisto_with_code}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains    ${TEST_CODE_1}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Remove testiautomaatiokoodisto with one code
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    T100
    Page should contain    testiautomaatiokoodisto
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_4}
    #Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Page should not contain element    //*[contains(text(), "testiautomaatiokoodisto")]
    Close All Browsers

Create testiautomaatiokoodisto 2 with one code
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
    Choose file    ${FILE_UPLOAD_BTN}    ${testiautomaatiokoodisto2_with_code}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${CODE_LIST_6}
    Wait until page contains    ${CODE_1}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Remove testiautomaatiokoodisto 2 with one code
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_6}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_6}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_6}")]
    Wait until page contains    ${CODE_LIST_6}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    testiautomaatiokoodisto2
    Page should contain    testiautomaatiokoodisto 2
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_6}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Create testiautomaatiokoodisto1 with codes
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
    Choose file    ${FILE_UPLOAD_BTN}    ${testiautomaatiokoodisto1_with_codes}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains    Koodi1000 - Koodi1000
    Wait until page contains    Koodi1003 - Koodi1003
    Wait until page contains    Koodi1006 - Koodi1006
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Remove testiautomaatiokoodisto1 with codes
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    testiautomaatiokoodisto
    Page should contain    testiautomaatiokoodisto1
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_2}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Create Testikoodisto T200
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
    Choose file    ${FILE_UPLOAD_BTN}    ${Testikoodisto_T200}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    Testikoodisto T200
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Remove Testikoodisto T200
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_7}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_7}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_7}")]
    Wait until page contains    ${CODE_LIST_7}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    T200
    Page should contain    Testikoodisto T200
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_7}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Create Code filter codelist
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
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_filter}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${CODE_LIST_13}
    Wait until page contains    T51 - Testi01
    Wait until page contains    T54 - Testi04
    Wait until page contains    T57 - Testi07
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Remove Code filter codelist
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_13}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_13}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_13}")]
    Wait until page contains    ${CODE_LIST_13}
    Page should contain    T51 - Testi01
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_13}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Page should not contain element    //*[contains(text(), "Sisällön filteröinti")]
    Close All Browsers
