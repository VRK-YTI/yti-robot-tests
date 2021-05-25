*** Variables ***
${SELENIUM_SPEED}    0.5
${BROWSER}        chrome
${COMMENTS_ENVIRONMENT_URL}    https://kommentit.test.yti.cloud.vrk.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${SUPER_USER_ID}    id=testisuperuser@localhost
${ADMIN_USER_NAME}    Test Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Test Superuser
${TESTGROUP_USER_ID}    id=testtestgroup@localhost
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
${ENVIRONMENT_IDENTIFIER}    AWSDEV
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
${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}    id=commentround_openthreads_input
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
${RESOURCES_TAB}    id=commentround_resources_tab
${INFO_TAB}       id=commentround_information_tab
${START_COMMENT_ROUND_BTN}    id=start_commentround_button
${CLOSE_COMMENT_ROUND_BTN}    id=end_commentround_button
${COMMENT_TEXT_INPUT_0}    id=commentthread_proposed_text_input_0
${COMMENT_TEXT_INPUT_1}    id=commentthread_proposed_text_input_1
${COMMENT_TEXT_INPUT_2}    id=commentthread_proposed_text_input_2
${STATUS_DDL_0}    id=selected_proposed_status_0
${STATUS_DDL_1}    id=selected_proposed_status_1
${STATUS_DDL_2}    id=selected_proposed_status_2
${CONFIRMATION_BTN}    id=confirm_confirmation_modal_button
${SELECT_RESOURCE_BTN}    id=select_modal_button
${CREATE_SUGGESTION_BTN}    id=create_suggestion_button
${NEW_SUGGESTION_LABEL_INPUT_0}    id=commenthread_0_label_text_input
${NEW_SUGGESTION_DESCRIPTION_INPUT_0}    id=commenthread_0_description_text_input
${NEW_SUGGESTION_LABEL_INPUT_1}    id=commenthread_1_label_text_input
${NEW_SUGGESTION_DESCRIPTION_INPUT_1}    id=commenthread_1_description_text_input
#Comment round state
${COMMENT_ROUND_STATE_CLOSED}    id=CLOSED_status_filter_dropdown
${COMMENT_ROUND_STATE_IN_PROGRESS}    id=INPROGRESS_status_filter_dropdown
${COMMENT_ROUND_STATE_ALL}    id=all_selected_status_filter_dropdown
${COMMNET_ROUND_STATE_INCOMPLETE}  id=INCOMPLETE_status_filter_dropdown
#Email subscription
${ADD_SUBSCRIPTION_BTN}    id=add_subscription_button
${DELETE_SUBSCRIPTION_BTN}    id=delete_subscription_button
${CONFIRMATION_YES_BTN}    id=confirm_confirmation_modal_button
${SUBSCRIPTION_BELL_ICON}    //*[@class="subscription-icon icon-bell"]
${USER_DETAILS_SUBSCRIPTIONS_TAB}    id=user_details_subscriptions_tab
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
#Temporary users
${ADD_TEMP_USER_BTN}    id=add_tempuser_button
${USER_0_FIRSTNAME_INPUT}    id=user_0_firstname_input
${USER_0_LASTNAME_INPUT}    id=user_0_lastname_input
${USER_0_EMAIL_INPUT}    id=user_0_email_input
${ADD_USERS_BTN}    id=add_users_button
${USERS_MODAL_OPEN}    class=modal-content

*** Keywords ***
Test Case Setup Admin
    Open Comments
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select User    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Test Case Setup Superuser
    Open Comments
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select User    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select User
    [Arguments]    ${user_id}    ${user_name}
    Wait Until Element Is Enabled    ${IMPERSONATE_USER_DROPDOWN}    timeout=60
    Click Element    ${IMPERSONATE_USER_DROPDOWN}
    Wait Until element Is Enabled    ${user_id}    timeout=30
    Click Element    ${user_id}
    Wait Until Page Contains    ${user_name}    timeout=60
    Sleep    1

Open Chrome to URL
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${url}

Open Comments
    Open Browser with Settings
    Wait Until Page Contains    Kommentit    timeout=60
    Wait Until Page Contains    KIRJAUDU SISÄÄN    timeout=60

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${COMMENTS_ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${COMMENTS_ENVIRONMENT_URL}

Return To Comments Frontpage
    Wait Until Page Contains Element    ${FRONTPAGE_LINK}    timeout=60
    Click Element    ${FRONTPAGE_LINK}
    Sleep    1

Create Comment Round
    [Arguments]    ${tool}    ${source}    ${round_name}    ${description}    ${only_selected_resources}    ${allow_new_comment_threads}
    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${CREATE_COMMENT_ROUND_BTN}
    Wait Until Page Contains Element    ${SELECT_TOOL_DDL}    timeout=20
    Click Element    ${SELECT_TOOL_DDL}
    Wait Until Page Contains Element    ${tool}    timeout=30
    Click Element    ${tool}
    Wait Until Page Contains Element    ${SEARCH_LINKED_SOURCE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_SOURCE_INPUT}    ${source}
    Sleep    3
    Wait Until Element Is Enabled    //*[@id='undefined_resource_link']//*[contains(text(), "${source}")]    timeout=30
    Click Element    //*[@id='undefined_resource_link']//*[contains(text(), "${source}")]
    Wait Until Page Contains Element    ${COMMENTROUND_NAME_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_NAME_INPUT}    ${round_name}
    Wait Until Page Contains Element    ${COMMENTROUND_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${COMMENTROUND_DESCRIPTION_INPUT}    ${description}
    Run Keyword if    '${only_selected_resources}' == 'True'    Uncheck Only Selected Resources Checkbox
    Run Keyword if    '${allow_new_comment_threads}' == 'True'    Allow New Comment Threads
    Wait Until Page Contains Element    ${COMMENTROUND_ADD_ORGANIZATION}    timeout=20
    Click Element    ${COMMENTROUND_ADD_ORGANIZATION}
    Wait Until Element Is Enabled    ${COMMENTROUND_ORGANIZATION_INPUT}    timeout=20
    Input Text    ${COMMENTROUND_ORGANIZATION_INPUT}    Testiorganisaatio
    Wait Until Element Is Enabled    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait Until Element Is Enabled    ${SAVE_COMMENTROUND}    timeout=20
    Click Element    ${SAVE_COMMENTROUND}
    Sleep    1
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=60
    Log To Console    Comment round created

Uncheck Only Selected Resources Checkbox
    Wait Until Page Contains Element    ${ONLY_SELCTED_RESOURCES_CHECKBOX}    timeout=30
    Click Element    ${ONLY_SELCTED_RESOURCES_CHECKBOX}
    Checkbox Should Not Be Selected    ${ONLY_SELCTED_RESOURCES_CHECKBOX}

Allow New Comment Threads
    Wait Until Page Contains Element    ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}    timeout=30
    Click Element    ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}
    Checkbox Should Be Selected    ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}

Delete Comment Round
    [Arguments]    ${comment_round_name}    ${state}
    Test Case Setup Superuser
    Select Comment Round State    ${state}
    Wait Until Page Contains Element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Click Element    //*[contains(text(), "${comment_round_name}")]
    Wait Until Page Contains Element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Wait Until Page Contains Element    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait Until Page Contains Element    ${DELETE_COMMENTROUND_BTN}    timeout=20
    Click Element    ${DELETE_COMMENTROUND_BTN}
    Wait Until Page Contains Element    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Select Comment Round State    ${state}
    Wait Until Page Does Not Contain Element    //*[contains(text(), "${comment_round_name}")]    timeout=20
    Log To Console    ${comment_round_name} Deleted

Add Resource For Comment Round
    [Arguments]    ${resource}    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Wait Until Element Is Enabled    ${RESOURCES_TAB}    timeout=60
    Click Element    ${RESOURCES_TAB}
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=30
    Click Element    ${EDIT_COMMENTROUND}
    Wait Until Element Is Enabled    ${ADD_NEW_RESOURCE_BTN}    timeout=30
    Click Element    ${ADD_NEW_RESOURCE_BTN}
    Wait Until Element Is Enabled    ${SEARCH_LINKED_SOURCE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_SOURCE_INPUT}    ${resource}
    Wait Until Element Is Enabled    //*[contains(text(), "${resource}")]    timeout=30
    Click Element    //*[contains(text(), "${resource}")]
    Wait Until Element Is Enabled    ${SELECT_RESOURCE_BTN}    timeout=60
    Click Element    ${SELECT_RESOURCE_BTN}
    Wait Until Page Contains Element    ${comment_box}    timeout=30
    Input Text    ${comment_box}    ${comment}
    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Wait Until Element Is Enabled    ${SAVE_COMMENTROUND}    timeout=30
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    ${resource} added for comment round

Create New Suggestion
    [Arguments]    ${suggestion_label}    ${suggestion_description}
    Wait Until Element Is Enabled    ${RESOURCES_TAB}    timeout=60
    Click Element    ${RESOURCES_TAB}
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=30
    Click Element    ${EDIT_COMMENTROUND}
    Wait Until Element Is Enabled    ${ADD_NEW_RESOURCE_BTN}    timeout=30
    Click Element    ${ADD_NEW_RESOURCE_BTN}
    Wait Until Element Is Enabled    ${CREATE_SUGGESTION_BTN}    timeout=30
    Click Element    ${CREATE_SUGGESTION_BTN}
    Wait Until Element Is Enabled    //*[contains(@id,'_label_text_input')]    timeout=30
    Input Text    //*[contains(@id, '_label_text_input')]    ${suggestion_label}
    Wait Until Element Is Enabled    //*[contains(@id, '_description_text_input')]    timeout=30
    Input Text    //*[contains(@id, '_description_text_input')]    ${suggestion_description}
    Wait Until Element Is Enabled    ${SAVE_COMMENTROUND}    timeout=30
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    New suggestion ${suggestion_label} added for comment round

Add Resource Status
    [Arguments]    ${status_ddl}    ${status}
    Wait Until Page Contains Element    ${status_ddl}    timeout=30
    Click Element    ${status_ddl}
    Wait Until Page Contains Element    ${status}    timeout=30
    Click Element    ${status}

Start Comment Round
    Wait Until Element Is Enabled    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait Until Element Is Enabled    ${START_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${START_COMMENT_ROUND_BTN}
    Wait Until Element Is Enabled    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait Until Page Contains    Käynnissä    timeout=20
    Log To Console    Comment round started

Close Comment Round
    Wait Until Page Contains Element    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait Until Page Contains Element    ${CLOSE_COMMENT_ROUND_BTN}    timeout=20
    Click Element    ${CLOSE_COMMENT_ROUND_BTN}
    Wait Until Page Contains Element    ${CONFIRM_BTN}    timeout=20
    Click Element    ${CONFIRM_BTN}
    Wait Until Page Contains    Suljettu    timeout=20

Comment On Resource
    [Arguments]    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Wait Until Element Is Enabled    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Enabled    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait Until Page Contains Element    ${comment_box}    timeout=30
    Input Text    ${comment_box}    ${comment}
    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Wait Until Page Contains Element    ${SEND_COMMENTS_BTN}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Comment added

Start Commenting
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}

Comment On Resource 0
    [Arguments]    ${comment}    ${status}
    Wait Until Element Is Enabled    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    ${comment}
    Wait Until Page Contains Element    ${STATUS_DDL_0}    timeout=30
    Click Element    ${STATUS_DDL_0}
    Wait Until Page Contains Element    ${status}    timeout=30
    Click Element    ${status}

Comment On Resource 1
    [Arguments]    ${comment}    ${status}
    Wait Until Element Is Enabled    ${COMMENT_TEXT_INPUT_1}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_1}    ${comment}
    Wait Until Page Contains Element    ${STATUS_DDL_1}    timeout=30
    Click Element    ${STATUS_DDL_1}
    Wait Until Page Contains Element    ${status}    timeout=30
    Click Element    ${status}

Send Comments
    Wait Until Element Is Enabled    ${SEND_COMMENTS_BTN}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN}
    Sleep    2
    Wait Until Element Is Enabled    ${START_COMMENTING_BTN}    timeout=30

Send Inline Comment For Comment Thread
    [Arguments]    ${id}    ${comment}
    Wait Until Element Is Enabled    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}
    Wait Until Element Is Enabled    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}
    Input Text    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    ${comment}
    Wait Until Element Is Enabled    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}

Search Comment Round
    [Arguments]    ${comment_round}
    Wait Until Element Is Enabled    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${comment_round}

Select Comment Round
    [Arguments]    ${comment_round}
    Wait Until Element Is Enabled    //*[contains(text(), "${comment_round}")]    timeout=30
    Click Element    //*[contains(text(), "${comment_round}")]

Add Email Subscription For Comment Round
    Wait Until Element Is Enabled    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait Until Element Is Enabled    ${ADD_SUBSCRIPTION_BTN}    timeout=20
    Click Element    ${ADD_SUBSCRIPTION_BTN}
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20
    Log To Console    Email subscription added

Remove Email Subscription For Comment Round
    Wait Until Element Is Enabled    ${COMMENTROUND_DDL}    timeout=20
    Click Element    ${COMMENTROUND_DDL}
    Wait Until Element Is Enabled    ${DELETE_SUBSCRIPTION_BTN}    timeout=20
    Click Element    ${DELETE_SUBSCRIPTION_BTN}
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20
    Log To Console    Email subscription removed

Select Navigation Menu Link
    [Arguments]    ${navigation_menu_link}
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2

Restore Finnish Language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Element Is Visible    ${LANGUAGE_FI}    timeout=20
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    Kommentit - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Luo uusi kommentointikierros    timeout=30
    Wait Until Page Contains    Kaikki työkalut    timeout=20
    Wait Until Page Contains    Kaikki organisaatiot    timeout=20
    Wait Until Page Contains    Kaikki tilat    timeout=20
    Close All Browsers

Select Tab
    [Arguments]    ${tab}
    Wait Until Page Contains Element    ${tab}    timeout=20
    Click Element    ${tab}

Edit Comment Round
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=20
    Click Element    ${EDIT_COMMENTROUND}

Add Temporary Users
    [Arguments]    ${firstname}    ${lastname}    ${email}
    Wait Until Element Is Enabled    ${ADD_TEMP_USER_BTN}    timeout=20
    Click Element    ${ADD_TEMP_USER_BTN}
    Wait Until Element Is Enabled    ${USER_0_FIRSTNAME_INPUT}    timeout=20
    Input Text    ${USER_0_FIRSTNAME_INPUT}    ${firstname}
    Wait Until Element Is Enabled    ${USER_0_LASTNAME_INPUT}    timeout=20
    Input Text    ${USER_0_LASTNAME_INPUT}    ${lastname}
    Wait Until Element Is Enabled    ${USER_0_EMAIL_INPUT}    timeout=20
    Input Text    ${USER_0_EMAIL_INPUT}    ${email}
    Wait Until Element Is Enabled    ${ADD_USERS_BTN}    timeout=20
    Click Element    ${ADD_USERS_BTN}
    Wait Until Page Does Not Contain Element    ${USERS_MODAL_OPEN}    timeout=120

Save Comment Round
    Wait Until Element Is Enabled    ${SAVE_COMMENTROUND}    timeout=30
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=60

Select Comment Round State
    [Arguments]    ${state}
    Wait Until Element Is Enabled    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click Element    ${STATUS_DROPDOWN_BTN}
    Wait Until Element Is Enabled    ${state}    timeout=10
    Click Element    ${state}
    Sleep    1

Test Case Setup Reference Data
    [Arguments]    ${codelist}    ${codelist_name}
    Reference Data Setup    ${codelist}    ${codelist_name}
    Test Case Setup Superuser

Test Case Setup Reference Data And Code Without prefLabel
    Reference Data Setup And Code Without prefLabel
    Test Case Setup Superuser

Test Case Teardown Reference Data
    [Arguments]    ${codelist_name}    ${comment_round_name}    ${state}
    Reference Data Test Case Setup Superuser
    Reference Data Teardown    ${codelist_name}
    Delete Comment Round    ${comment_round_name}    ${state}

Test Case Setup Terminology
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Terminology
    [Arguments]    ${comment_round_name}    ${state}
    Terminology Teardown
    Delete Comment Round    ${comment_round_name}    ${state}

Test Case Setup Data Vocabularies
    Data Vocabularies Setup
    Test Case Setup Superuser

Test Case Setup Data Vocabularies With New Class
    Data Vocabularies Setup With New Class
    Test Case Setup Superuser

Test Case Teardown Data Vocabularies
    [Arguments]    ${comment_round_name}    ${state}
    Data Vocabularies Teardown
    Delete Comment Round    ${comment_round_name}    ${state}
