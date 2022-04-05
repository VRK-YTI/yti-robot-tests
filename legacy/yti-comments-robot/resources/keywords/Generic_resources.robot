*** Variables ***
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${SUPER_USER_ID}    id=testisuperuser@localhost
${ADMIN_USER_NAME}    Test Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Test Superuser
${LANGUAGE_EN}    id=en
${LANGUAGE_FI}    id=fi
${LANGUAGE_SV}    På svenska (SV)
${ORGANIZATION_1}    Testiorganisaatio
${CONTENT_LANGUAGE_EN}    id=en_content_lang_dropdown_button

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

${CODE_LIST_8}          codelist_for_comments_1
${CODE_LIST_8_CODE}     6000

*** Keywords ***
Return To Comments Frontpage
    Click Element with wait   ${FRONTPAGE_LINK}     timeout=60

Create Comment Round
    [Arguments]    ${tool}    ${source}    ${round_name}    ${description}    ${only_selected_resources}    ${allow_new_comment_threads}
    Click Element with wait     ${CREATE_COMMENT_ROUND_BTN}
    Click Element with wait     ${SELECT_TOOL_DDL}
    Click Element with wait     ${tool}

    Input Text with wait        ${SEARCH_LINKED_SOURCE_INPUT}    ${source}

    Click Element with wait    //*[@id='undefined_resource_link']//*[contains(text(), "${source}")]

    Input Text with wait    ${COMMENTROUND_NAME_INPUT}           ${round_name}
    Input Text with wait    ${COMMENTROUND_DESCRIPTION_INPUT}    ${description}

    Run Keyword if    '${only_selected_resources}' == 'True'    Uncheck Only Selected Resources Checkbox
    Run Keyword if    '${allow_new_comment_threads}' == 'True'    Allow New Comment Threads

    Click Element with wait     ${COMMENTROUND_ADD_ORGANIZATION}
    Input Text with wait        ${COMMENTROUND_ORGANIZATION_INPUT}    Testiorganisaatio
    Click Element that contains text    Testiorganisaatio
    Click Element with wait     ${SAVE_COMMENTROUND}

    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=60

Uncheck Only Selected Resources Checkbox
    Click Element with wait            ${ONLY_SELCTED_RESOURCES_CHECKBOX}
    Checkbox Should Not Be Selected    ${ONLY_SELCTED_RESOURCES_CHECKBOX}

Allow New Comment Threads
    Click Element with wait         ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}
    Checkbox Should Be Selected     ${ALLOW_NEW_COMMENT_THREADS_CHECKBOX}

Delete Comment Round
    [Arguments]    ${comment_round_name}    ${state}
    Select Comment Round State    ${state}
    Click Element that contains text    ${comment_round_name}       timeout=60
    Wait Until Page Contains Element    //*[contains(text(), "${comment_round_name}")]    timeout=60

    Click Element with wait    ${COMMENTROUND_DDL}
    Click Element with wait    ${DELETE_COMMENTROUND_BTN}
    Click Element with wait    ${CONFIRM_BTN}

    Wait Until Page Contains Element    ${CREATE_COMMENT_ROUND_BTN}    timeout=20
    Select Comment Round State    ${state}

    Wait Until Page Does Not Contain Element    //*[contains(text(), "${comment_round_name}")]    timeout=20

Add Resource For Comment Round
    [Arguments]    ${resource}    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Click Element with wait    ${RESOURCES_TAB}     timeout=60
    Click Element with wait    ${EDIT_COMMENTROUND}
    Click Element with wait    ${ADD_NEW_RESOURCE_BTN}

    Input Text with wait    ${SEARCH_LINKED_SOURCE_INPUT}    ${resource}
    Click Element with wait   //*[contains(text(), "${resource}")]
    Click Element with wait    ${SELECT_RESOURCE_BTN}       timeout=60
    Input Text with wait   ${comment_box}    ${comment}

    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Click Element with wait   ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30

Create New Suggestion
    [Arguments]    ${suggestion_label}    ${suggestion_description}
    Click Element with wait    ${RESOURCES_TAB}     timeout=60
    Click Element with wait   ${EDIT_COMMENTROUND}
    Click Element with wait    ${ADD_NEW_RESOURCE_BTN}
    Click Element with wait   ${CREATE_SUGGESTION_BTN}

    Input Text with wait    //*[contains(@id, '_label_text_input')]    ${suggestion_label}      timeout=30
    Input Text with wait   //*[contains(@id, '_description_text_input')]    ${suggestion_description}       timeout=30

    Click Element with wait          ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}

Add Resource Status
    [Arguments]    ${status_ddl}    ${status}
    Click Element with wait     ${status_ddl}
    Click Element with wait     ${status}

Start Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}
    Click Element with wait    ${START_COMMENT_ROUND_BTN}
    Click Element with wait    ${CONFIRM_BTN}
    Wait Until Page Contains    Käynnissä

Close Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}
    Click Element with wait    ${CLOSE_COMMENT_ROUND_BTN}
    Click Element with wait    ${CONFIRM_BTN}
    Wait Until Page Contains    Suljettu    timeout=20

Comment On Resource
    [Arguments]    ${comment_box}    ${comment}    ${status_ddl}    ${status}
    Click Element with wait    ${COMMENTS_TAB}
    Click Element with wait    ${START_COMMENTING_BTN}
    Input Text with wait   ${comment_box}    ${comment}
    ${status_length}=    Get Length    ${status_ddl}
    Run Keyword If    ${status_length} > 0    Add Resource Status    ${status_ddl}    ${status}
    Click Element with wait   ${SEND_COMMENTS_BTN}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30

Start Commenting
    Click Element with wait   ${COMMENTS_TAB}
    Click Element with wait    ${START_COMMENTING_BTN}

Comment On Resource 0
    [Arguments]    ${comment}    ${status}
    Input Text with wait   ${COMMENT_TEXT_INPUT_0}    ${comment}        timeout=30
    Click Element with wait   ${STATUS_DDL_0}
    Click Element with wait   ${status}

Comment On Resource 1
    [Arguments]    ${comment}    ${status}
    Input Text with wait    ${COMMENT_TEXT_INPUT_1}    ${comment}       timeout=30
    Click Element with wait    ${STATUS_DDL_1}
    Click Element with wait    ${status}

Send Comments
    Click Element with wait    ${SEND_COMMENTS_BTN}
    Wait Until Element Is Enabled    ${START_COMMENTING_BTN}    timeout=30

Send Inline Comment For Comment Thread
    [Arguments]    ${id}    ${comment}
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_BTN_SUFFIX}
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}
    Input Text with wait       ${INLINE_COMMENT_PREFIX}${id}${INLINE_REPLY_INPUT_SUFFIX}    ${comment}
    Click Element with wait    ${INLINE_COMMENT_PREFIX}${id}${INLINE_SEND_REPLY_BTN_SUFFIX}

Search Comment Round
    [Arguments]    ${comment_round}
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${comment_round}     timeout=30

Select Comment Round
    [Arguments]    ${comment_round}
    Click Element with wait    //*[contains(text(), "${comment_round}")]

Search and select comment round
    [Arguments]    ${comment_round}
    Search Comment Round    ${comment_round}
    Select Comment Round    ${comment_round}

Add Email Subscription For Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}
    Click Element with wait    ${ADD_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Remove Email Subscription For Comment Round
    Click Element with wait    ${COMMENTROUND_DDL}
    Click Element with wait    ${DELETE_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Select Navigation Menu Link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait    ${NAVIGATION_MENU_DDL}
    Click Element with wait    //*[contains(text(), "${navigation_menu_link}")]

Restore Finnish Language
    Click Element with wait    ${LANGUAGE_DROPDOWN_BTN}
    Click Element with wait    ${LANGUAGE_FI}
    Wait Until Page Contains    Kommentit - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Luo uusi kommentointikierros             timeout=30
    Wait Until Page Contains    Kaikki työkalut                          timeout=20
    Wait Until Page Contains    Kaikki organisaatiot                     timeout=20
    Wait Until Page Contains    Kaikki tilat                             timeout=20

Select Tab
    [Arguments]    ${tab}
    Click Element with wait    ${tab}

Edit Comment Round
    Click Element with wait    ${EDIT_COMMENTROUND}

Add Temporary Users
    [Arguments]    ${firstname}    ${lastname}    ${email}
    Click Element with wait   ${ADD_TEMP_USER_BTN}
    Input Text with wait    ${USER_0_FIRSTNAME_INPUT}    ${firstname}
    Input Text with wait    ${USER_0_LASTNAME_INPUT}    ${lastname}
    Input Text with wait    ${USER_0_EMAIL_INPUT}    ${email}
    Click Element with wait    ${ADD_USERS_BTN}
    Wait Until Page Does Not Contain Element    ${USERS_MODAL_OPEN}    timeout=120

Save Comment Round
    Click Element with wait    ${SAVE_COMMENTROUND}
    Wait Until Element Is Enabled    ${EDIT_COMMENTROUND}    timeout=60

Select Comment Round State
    [Arguments]    ${state}
    Click Element with wait    ${STATUS_DROPDOWN_BTN}
    Click Element with wait    ${state}