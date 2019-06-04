*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://kommentit-dev.suomi.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${SUPER_USER_ID}    id=testisuperuser@localhost
${ADMIN_USER_NAME}    Testi Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Testi Superuser
${TESTGROUP_USER_ID}    id=dummy2@localhost
${TESTGROUP_USER_NAME}    Test TestGroup
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
${ENVIRONMENT_IDENTIFIER}    DEV
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
#Comment resource status
${VALID_0}        id=VALID_0
${VALID_1}        id=VALID_1
${VALID_2}        id=VALID_2
${RETIRED_0}      id=RETIRED_0
${RETIRED_1}      id=RETIRED_1
${RETIRED_2}      id=RETIRED_2
${SUPERSEDED_0}    id=SUPERSEDED_0
${SUPERSEDED_1}    id=SUPERSEDED_1
${SUPERSEDED_2}    id=SUPERSEDED_2
${INVALID_0}      id=INVALID_0
${INVALID_1}      id=INVALID_1
${INVALID_2}      id=INVALID_2
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
${CONFIRM_BTN}    id=confirm_confirmation_modal_button
${COMMENTROUND_DDL}    id=commentRoundDropdown
${ADD_NEW_RESOURCE_BTN}    id=create_commentthread_button
${COMMENT_TEXT_INPUT}    id=commentthread_proposed_text_input
${PROPOSED_STATUS_DDL}    id=selected_proposed_status_undefined
${COMMENTS_TAB}    id=commentround_comments_tab
${RESOURCES_TAB}    id=commentround_resources_tab-panel
${START_COMMENT_ROUND_BTN}    id=start_commentround_button
${CLOSE_COMMENT_ROUND_BTN}    id=end_commentround_button
${COMMENT_TEXT_INPUT_0}    id=commentthread_proposed_text_input_0
${COMMENT_TEXT_INPUT_1}    id=commentthread_proposed_text_input_1
${COMMENT_TEXT_INPUT_2}    id=commentthread_proposed_text_input_2
${STATUS_DDL_0}    id=selected_proposed_status_0
${STATUS_DDL_1}    id=selected_proposed_status_1
${STATUS_DDL_2}    id=selected_proposed_status_2
${CONFIRMATION_BTN}    id=confirm_confirmation_modal_button
#Commenting
${START_COMMENTING_BTN}    id=start_commenting_button
${SEND_COMMENTS_BTN_BOTTOM}    id=send_comments_button_bottom
${SEND_COMMENTS_BTN}    id=send_comments_button
${REMOVE_COMMENT_THREAD_0_BTN}    id=remove_commentthread_0_button
${REMOVE_COMMENT_THREAD_1_BTN}    id=remove_commentthread_1_button
${REMOVE_COMMENT_THREAD_2_BTN}    id=remove_commentthread_2_button
#Inline comments
${VIEW_COMMENT_BUBLE_0}    id=view_commentthread_0_comments_button
${INLINE_COMMENT_PREFIX}    id=comment_
${INLINE_REPLY_BTN_SUFFIX}    _reply_button
${INLINE_REPLY_INPUT_SUFFIX}    _input
${INLINE_SEND_REPLY_BTN_SUFFIX}    _send_button
${CLOSE_INLINE_COMMENT_0_BTN}    id=close_commentthread_0_comments_button

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
    [Arguments]    ${tool}    ${source}    ${round_name}    ${description}    ${only_selected_resources}
    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${CREATE_COMMENT_ROUND_BTN}
    Wait Until Page Contains Element    ${SELECT_TOOL_DDL}    timeout=20
    Click Element    ${SELECT_TOOL_DDL}
    Wait Until Page Contains Element    ${tool}    timeout=30
    Click Element    ${tool}
    Wait Until Page Contains Element    ${SEARCH_LINKED_SOURCE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_SOURCE_INPUT}    ${source}
    Wait Until Page Contains Element    //*[contains(text(), "${source}")]    timeout=30
    Click Element    //*[contains(text(), "${source}")]
    Wait Until Page Contains Element    ${COMMENTROUND_NAME_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_NAME_INPUT}    ${round_name}
    Wait Until Page Contains Element    ${COMMENTROUND_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_DESCRIPTION_INPUT}    ${description}
    Run Keyword if    '${only_selected_resources}' == 'True'    Uncheck Only Selected Resources Checkbox    ${only_selected_resources}
    Wait Until Page Contains Element    ${COMMENTROUND_ADD_ORGANIZATION}    timeout=20
    Click Element    ${COMMENTROUND_ADD_ORGANIZATION}
    Wait Until Page Contains Element    ${COMMENTROUND_ORGANIZATION_INPUT}    timeout=20
    Input Text    ${COMMENTROUND_ORGANIZATION_INPUT}    Testiorganisaatio
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait Until Page Contains Element    ${SAVE_COMMENTROUND}    timeout=20
    Click Element    ${SAVE_COMMENTROUND}
    Sleep    1
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    Comment round created

Uncheck Only Selected Resources Checkbox
    [Arguments]    ${only_selected_resources}
    Wait Until Page Contains Element    ${ONLY_SELCTED_RESOURCES_CHECKBOX}    timeout=30
    Click element    ${ONLY_SELCTED_RESOURCES_CHECKBOX}
    Checkbox Should Not Be Selected    ${ONLY_SELCTED_RESOURCES_CHECKBOX}

Delete Comment Round
    [Arguments]    ${comment_round_name}
    Test Case Setup Superuser
    Wait until page contains element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Click Element    //*[contains(text(), "${comment_round_name}")]
    Wait until page contains element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Wait until page contains element    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait until page contains element    ${DELETE_COMMENTROUND_BTN}    timeout=20
    Click Element    ${DELETE_COMMENTROUND_BTN}
    Wait until page contains element    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait until page contains element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Wait until page does not contain element    //*[contains(text(), "${comment_round_name}")]    timeout=10
    Log To Console    ${comment_round_name} Deleted

Add Resource For Comment Round
    [Arguments]    ${resource}    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Click Element    ${EDIT_COMMENTROUND}
    Wait until page contains element    ${ADD_NEW_RESOURCE_BTN}    timeout=30
    Click element    ${ADD_NEW_RESOURCE_BTN}
    Wait Until Page Contains Element    //*[contains(text(), "${resource}")]    timeout=30
    Click element    //*[contains(text(), "${resource}")]
    Wait until page contains element    ${comment_box}    timeout=30
    Input Text    ${comment_box}    ${comment}
    ${status_length}=    Get Length    ${status_ddl}
    run keyword if    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Wait until page contains element    ${SAVE_COMMENTROUND}    timeout=30
    Click Element    ${SAVE_COMMENTROUND}
    Wait until element is visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    ${resource} added for comment round

Add Resource Status
    [Arguments]    ${status_ddl}    ${status}
    Wait until page contains element    ${status_ddl}    timeout=30
    Click element    ${status_ddl}
    Wait until page contains element    ${status}    timeout=30
    Click Element    ${status}

Start Comment Round
    Wait until page contains element    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait until page contains element    ${START_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${START_COMMENT_ROUND_BTN}
    Wait until page contains element    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait until page contains    Käynnissä    timeout=20

Close Comment Round
    Wait until page contains element    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait until page contains element    ${CLOSE_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${CLOSE_COMMENT_ROUND_BTN}
    Wait until page contains element    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait until page contains    Suljettu    timeout=20

Comment On Resource
    [Arguments]    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${comment_box}    timeout=30
    Input Text    ${comment_box}    ${comment}
    ${status_length}=    Get Length    ${status_ddl}
    run keyword if    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Comment added

Start Commenting
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}

Comment On Resource 0
    [Arguments]    ${comment}    ${status}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    ${comment}
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${status}    timeout=30
    Click Element    ${status}

Comment On Resource 1
    [Arguments]    ${comment}    ${status}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_1}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_1}    ${comment}
    Wait until page contains element    ${STATUS_DDL_1}    timeout=30
    Click element    ${STATUS_DDL_1}
    Wait until page contains element    ${status}    timeout=30
    Click Element    ${status}

Send Comments
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30

Send Inline Comment For Comment Thread
    [Arguments]    ${id}    ${comment}
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}
    Input Text    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    ${comment}
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}

Test Case Setup Reference Data
    Reference Data Setup
    Test Case Setup Superuser

Test Case Setup Reference Data And Code Without prefLabel
    Reference Data Setup And Code Without prefLabel
    Test Case Setup Superuser

Test Case Teardown Reference Data
    [Arguments]    ${comment_round_name}
    Reference Data Test Case Setup Superuser
    Reference Data Teardown
    Delete Comment Round    ${comment_round_name}

Test Case Setup Terminology
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Terminology
    [Arguments]    ${comment_round_name}
    Terminology Teardown
    Delete Comment Round    ${comment_round_name}

Test Case Setup Data Vocabularies
    Data Vocabularies Setup
    Test Case Setup Superuser

Test Case Setup Data Vocabularies With New Class
    Data Vocabularies Setup With New Class
    Test Case Setup Superuser

Test Case Teardown Data Vocabularies
    [Arguments]    ${comment_round_name}
    Data Vocabularies Teardown
    Delete Comment Round    ${comment_round_name}
