*** Variables ***
${SELENIUM_SPEED}    0.5
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
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}    id=navigation_groupmanagement_link
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
    Select Admin

Test Case Setup Superuser
    Open Comments
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select Superuser

Open Comments
    Open Browser with Settings      ${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains    Kommentit    timeout=60
    Wait Until Page Contains    KIRJAUDU SISÄÄN    timeout=60

Return To Comments Frontpage
    Click Element with wait   ${FRONTPAGE_LINK}     timeout=60

Create Comment Round
    [Arguments]    ${tool}    ${source}    ${round_name}    ${description}    ${only_selected_resources}    ${allow_new_comment_threads}
    Click Element with wait     ${CREATE_COMMENT_ROUND_BTN}         timeout=20
    Click Element with wait     ${SELECT_TOOL_DDL}                  timeout=20
    Click Element with wait     ${tool}                             timeout=30
    Input Text with wait        ${SEARCH_LINKED_SOURCE_INPUT}    ${source}   timeout=30
    Click Element with wait    //*[@id='undefined_resource_link']//*[contains(text(), "${source}")]     timeout=30
    Input Text with wait   ${COMMENTROUND_NAME_INPUT}    ${round_name}      timeout=30
    Input Text with wait    ${COMMENTROUND_DESCRIPTION_INPUT}    ${description}     timeout=30
    Run Keyword if    '${only_selected_resources}' == 'True'    Uncheck Only Selected Resources Checkbox
    Run Keyword if    '${allow_new_comment_threads}' == 'True'    Allow New Comment Threads
    Click Element with wait   ${COMMENTROUND_ADD_ORGANIZATION}      timeout=20
    Input Text with wait    ${COMMENTROUND_ORGANIZATION_INPUT}    Testiorganisaatio     timeout=20
    Click Element that contains text    Testiorganisaatio       timeout=30
    Click Element with wait   ${SAVE_COMMENTROUND}      timeout=20
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=60
    Log To Console    Comment round created

Uncheck Only Selected Resources Checkbox
    Click Element with wait            ${ONLY_SELCTED_RESOURCES_CHECKBOX}       timeout=30
    Checkbox Should Not Be Selected    ${ONLY_SELCTED_RESOURCES_CHECKBOX}

Allow New Comment Threads
    Click Element with wait   ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}     timeout=30
    Checkbox Should Be Selected    ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}

Delete Comment Round
    [Arguments]    ${comment_round_name}    ${state}
    Test Case Setup Superuser
    Select Comment Round State    ${state}
    Click Element that contains text    ${comment_round_name}       timeout=60
    Wait Until Page Contains Element    //*[contains(text(), "${comment_round_name}")]    timeout=60
    Click Element with wait    ${COMMENTROUND_DDL}      timeout=20
    Click Element with wait    ${DELETE_COMMENTROUND_BTN}       timeout=20
    Click Element with wait   ${CONFIRM_BTN}    timeout=20
    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Select Comment Round State    ${state}
    Wait Until Page Does Not Contain Element    //*[contains(text(), "${comment_round_name}")]    timeout=20
    Log To Console    ${comment_round_name} Deleted

Add Resource For Comment Round
    [Arguments]    ${resource}    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Click Element with wait    ${RESOURCES_TAB}     timeout=60
    Click Element with wait    ${EDIT_COMMENTROUND}     timeout=30
    Click Element with wait    ${ADD_NEW_RESOURCE_BTN}      timeout=30
    Input Text with wait    ${SEARCH_LINKED_SOURCE_INPUT}    ${resource}    timeout=30
    Click Element with wait   //*[contains(text(), "${resource}")]      timeout=30
    Click Element with wait    ${SELECT_RESOURCE_BTN}       timeout=60
    Input Text with wait   ${comment_box}    ${comment}     timeout=30
    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Click Element with wait   ${SAVE_COMMENTROUND}      timeout=30
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    ${resource} added for comment round

Create New Suggestion
    [Arguments]    ${suggestion_label}    ${suggestion_description}
    Click Element with wait    ${RESOURCES_TAB}     timeout=60
    Click Element with wait   ${EDIT_COMMENTROUND}      timeout=30
    Click Element with wait    ${ADD_NEW_RESOURCE_BTN}      timeout=30
    Click Element with wait   ${CREATE_SUGGESTION_BTN}      timeout=30
    Input Text with wait    //*[contains(@id, '_label_text_input')]    ${suggestion_label}      timeout=30
    Input Text with wait   //*[contains(@id, '_description_text_input')]    ${suggestion_description}       timeout=30
    Click Element with wait    ${SAVE_COMMENTROUND}     timeout=30
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Log To Console    New suggestion ${suggestion_label} added for comment round

Add Resource Status
    [Arguments]    ${status_ddl}    ${status}
    Click Element with wait   ${status_ddl}     timeout=30
    Click Element with wait    ${status}        timeout=30

Start Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}      timeout=20
    Click Element with wait    ${START_COMMENT_ROUND_BTN}       timeout=20
    Click Element with wait    ${CONFIRM_BTN}       timeout=20
    Wait Until Page Contains    Käynnissä    timeout=20
    Log To Console    Comment round started

Close Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}      timeout=20
    Click Element with wait    ${CLOSE_COMMENT_ROUND_BTN}        timeout=20
    Click Element with wait    ${CONFIRM_BTN}       timeout=20
    Wait Until Page Contains    Suljettu    timeout=20

Comment On Resource
    [Arguments]    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Click Element with wait    ${COMMENTS_TAB}      timeout=30
    Click Element with wait    ${START_COMMENTING_BTN}      timeout=30
    Input Text with wait   ${comment_box}    ${comment}     timeout=30
    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Click Element with wait   ${SEND_COMMENTS_BTN}      timeout=30
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Comment added

Start Commenting
    Click Element with wait   ${COMMENTS_TAB}       timeout=30
    Click Element with wait    ${START_COMMENTING_BTN}      timeout=30

Comment On Resource 0
    [Arguments]    ${comment}    ${status}
    Input Text with wait   ${COMMENT_TEXT_INPUT_0}    ${comment}        timeout=30
    Click Element with wait   ${STATUS_DDL_0}       timeout=30
    Click Element with wait   ${status}     timeout=30

Comment On Resource 1
    [Arguments]    ${comment}    ${status}
    Input Text with wait    ${COMMENT_TEXT_INPUT_1}    ${comment}       timeout=30
    Click Element with wait    ${STATUS_DDL_1}      timeout=30
    Click Element with wait    ${status}        timeout=30

Send Comments
    Click Element with wait    ${SEND_COMMENTS_BTN}             timeout=30
    Wait Until Element Is Enabled    ${START_COMMENTING_BTN}    timeout=30

Send Inline Comment For Comment Thread
    [Arguments]    ${id}    ${comment}
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}          timeout=30
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}        timeout=30
    Input Text with wait       ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    ${comment}     timeout=30
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}     timeout=30

Search Comment Round
    [Arguments]    ${comment_round}
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${comment_round}     timeout=30

Select Comment Round
    [Arguments]    ${comment_round}
    Click Element with wait    //*[contains(text(), "${comment_round}")]     timeout=30

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
    Click Element with wait    ${COMMENTROUND_DDL}      timeout=20
    Click Element with wait    ${DELETE_SUBSCRIPTION_BTN}       timeout=20
    Click Element with wait    ${CONFIRMATION_YES_BTN}      timeout=20
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20
    Log To Console    Email subscription removed

Select Navigation Menu Link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait    ${NAVIGATION_MENU_DDL}       timeout=20
    Click Element with wait    //*[contains(text(), "${navigation_menu_link}")]     timeout=30

Restore Finnish Language
    Click Element with wait    ${LANGUAGE_DROPDOWN_BTN}     timeout=20
    Click Element with wait    ${LANGUAGE_FI}               timeout=20
    Wait Until Page Contains    Kommentit - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Luo uusi kommentointikierros    timeout=30
    Wait Until Page Contains    Kaikki työkalut    timeout=20
    Wait Until Page Contains    Kaikki organisaatiot    timeout=20
    Wait Until Page Contains    Kaikki tilat    timeout=20
    Close All Browsers

Select Tab
    [Arguments]    ${tab}
    Click Element with wait    ${tab}       timeout=20

Edit Comment Round
    Click Element with wait    ${EDIT_COMMENTROUND}     timeout=20

Add Temporary Users
    [Arguments]    ${firstname}    ${lastname}    ${email}
    Click Element with wait   ${ADD_TEMP_USER_BTN}     timeout=20
    Input Text with wait    ${USER_0_FIRSTNAME_INPUT}    ${firstname}     timeout=20
    Input Text with wait    ${USER_0_LASTNAME_INPUT}    ${lastname}     timeout=20
    Input Text with wait    ${USER_0_EMAIL_INPUT}    ${email}     timeout=20
    Click Element with wait    ${ADD_USERS_BTN}     timeout=20
    Wait Until Page Does Not Contain Element    ${USERS_MODAL_OPEN}    timeout=120

Save Comment Round
    Click Element with wait    ${SAVE_COMMENTROUND}     timeout=30
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=60

Select Comment Round State
    [Arguments]    ${state}
    Click Element with wait    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click Element with wait    ${state}    timeout=10

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
