*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://kommentit-dev.suomi.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${ADMIN_USER_NAME}    Testi Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Testi Superuser
${LANGUAGE_EN}    id=en
${LANGUAGE_FI}    id=fi
${LANGUAGE_SV}    På svenska (SV)
${ORGANIZATION_1}    Testiorganisaatio
${CONTENT_LANGUAGE_EN}    id=en_content_lang_dropdown_button
${2_BREADCRUMB_LINK}    id=2_breadcrumb_link
${3_BREADCRUMB_LINK}    id=3_breadcrumb_link
${REFERENCE_DATA_TOOL}    id=codelist_integration_container_type_filter_dropdown
${TERMINOLOGIES_TOOL}    id=terminology_integration_container_type_filter_dropdown
${DATA_VOCABULARIES_TOOL}    id=datamodel_integration_container_type_filter_dropdown
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}    id=navigation_groupmanagement_link
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${STATUS_DROPDOWN_BTN}    id=selected_status_filter_dropdown
${FRONTPAGE_LINK}    id=main_page_link
${NAVIGATION_MENU_DDL}    id=navigation_menu_dropdown
${SEARCH_BOX_INPUT}    id=search_box_input
${INFORMATION_LINK}    id=information_link
${NAVIGATION_MENU_USER_DETAILS}    id=navigation_link_user_details
${DESCRIPTION_OF_FILE_LINK}    id=description_of_file_link
${LICENSE_LINK}    id=license_link
#Status
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
${DRAFT_STATUS}    id=DRAFT_status_input_dropdown
${VALID_STATUS}    id=VALID_status_input_dropdown
#Comment round
${SEARCH_LINKED_SOURCE_INPUT}    id=search_linked_source_input
${INTEGRATION_FILTER_DDL}    id=selected_integration_filter_dropdown
${COMMENTROUND_NAME_INPUT}    id=commentround_name_input
${COMMENTROUND_DESCRIPTION_INPUT}    id=commentround_description_input
${COMMENTROUND_START_DATE_INPUT}    id=start_date_input
${COMMENTROUND_END_DATE_INPUT}    id=end_date_input
${ONLY_SELCTED_RESOURCES_CHECKBOX}    id=commentround_fixedthreads_textarea
${ALLOW_NEW_COMMENT_CHECKBOX}    id=commentround_openthreads_input
${COMMENTROUND_ADD_ORGANIZATION_BTN}    id=add_organization_button
${COMMENTROUND_ORGANIZATION_INPUT}    id=search_linked_organization_input
${SAVE_COMMENTROUND}    id=editable_save_button
${CANCEL_COMMENTROUND}    id=editable_cancel_button
${CREATE_COMMENT_ROUND_BTN}    id=create_commentround_button
${SELECT_TOOL_DDL}    id=selected_integration_container_type_filter_dropdown
${COMMENTROUND_ADD_ORGANIZATION}    id=add_organization_button
${EDIT_COMMENTROUND}    id=editable_edit_button
${DELETE_COMMENTROUND_BTN}    id=delete_commentround_button
${CONFIRM_COMMENTROUND_DELETE_BTN}    id=confirm_confirmation_modal_button

*** Keywords ***
Test Case Setup Admin
    Open Comments
    Set Selenium Speed    0.5
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Test Case Setup Superuser
    Open Comments
    Set Selenium Speed    0.5
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${user_id}    timeout=30
    Click element    ${user_id}
    Wait Until Page Contains    ${user_name}    timeout=60
    Sleep    1

Open Comments
    Open Browser with Settings
    Wait until page contains    Kommentit    timeout=60
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=60

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}

Return To Comments Frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=60
    Click element    ${FRONTPAGE_LINK}
    Sleep    1

Create Comment Round
    [Arguments]    ${tool}    ${code_list}    ${round_name}    ${description}
    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${CREATE_COMMENT_ROUND_BTN}
    Wait Until Page Contains Element    ${SELECT_TOOL_DDL}    timeout=20
    Click Element    ${SELECT_TOOL_DDL}
    Wait Until Page Contains Element    ${tool}    timeout=30
    Click Element    ${tool}
    Wait Until Page Contains Element    ${SEARCH_LINKED_SOURCE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_SOURCE_INPUT}    ${code_list}
    Wait Until Page Contains Element    //*[contains(text(), "${code_list}")]    timeout=30
    Click Element    //*[contains(text(), "${code_list}")]
    Wait Until Page Contains Element    ${COMMENTROUND_NAME_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_NAME_INPUT}    ${round_name}
    Wait Until Page Contains Element    ${COMMENTROUND_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_DESCRIPTION_INPUT}    ${description}
    Wait Until Page Contains Element    ${COMMENTROUND_ADD_ORGANIZATION}    timeout=20
    Click Element    ${COMMENTROUND_ADD_ORGANIZATION}
    Wait Until Page Contains Element    ${COMMENTROUND_ORGANIZATION_INPUT}    timeout=20
    Input Text    ${COMMENTROUND_ORGANIZATION_INPUT}    Testiorganisaatio
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_COMMENTROUND}    timeout=20
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    Comment round created

Delete Comment Round
    [Arguments]    ${comment_round_name}
    Test Case Setup Superuser
    Wait until page contains element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Click Element    //*[contains(text(), "${comment_round_name}")]
    Wait until page contains element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Wait until page contains element    ${DELETE_COMMENTROUND_BTN}    timeout=20
    Click Element    ${DELETE_COMMENTROUND_BTN}
    Wait until page contains element    ${CONFIRM_COMMENTROUND_DELETE_BTN}    timeout=20
    Click Element    ${CONFIRM_COMMENTROUND_DELETE_BTN}
    Wait until page contains element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Wait until page does not contain element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Log To Console    ${comment_round_name} Deleted

Test Case Setup Reference Data
    Reference Data Setup
    Test Case Setup Superuser

Test Case Teardown Reference Data
    [Arguments]    ${comment_round_name}
    Reference Data Test Case Setup Superuser
    Reference Data Teardown
    Delete Comment Round    ${comment_round_name}
