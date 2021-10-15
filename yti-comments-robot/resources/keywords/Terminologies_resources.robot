*** Variables ***
${USER_1}         id=testiadmin@localhost_fakeable_user_link
${LANGUAGE_EN}    id=en_language_selection_link
${LANGUAGE_FI}    id=fi_language_selection_link
${VOCABULARY_1}    Testiautomaatiosanasto
${VOCABULARY_2}    Testiautomaatiosanasto2
${VOCABULARY_3}    Testiautomaatioasiasanasto
${ORGANIZATION_1}    CSC - Tieteen tietotekniikan keskus
${ORGANIZATION_2}    Testiorganisaatio
${CLASSIFICATION_1}    Ympäristö
${TERMINOLOGY_CLASSIFICATION_2}    Eläkkeet
${PREFIX_1}       111
${PREFIX_2}       222
${PREFIX_3}       333
${TERM_1}         Automaatio
${TERM_2}         tutkimus
${REMOVE_ORGANIZATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[1]/dl/dd/app-organization-input/div/div[2]/a/i
${REMOVE_CLASSIFICATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/div/div[2]/a/i
${OPEN_MODAL}     class=modal-open
#Frontpage Buttons and links
${LANGUAGE_DROPDOWN_BTN}    id=language_dropdown_link
${TERMINOLOGY_USER_DROPDOWN}    id=fakeable_user_dropdown
${FRONTPAGE_SEARCH_BOX}    id=vocabularies_search_input
${ADD_VOCABULARY_BTN}    id=add_vocabulary_button
${TERMINOLOGY_MAIN_PAGE_LINK}    id=main_page_link
#Vocabulary buttons
${EDIT_VOCABULARY_BTN}    id=vocabulary_editable_start_editing_button
${VOCABULARY_TITLE_TEXTAREA}    id=vocabulary_prefLabel_fi_0_input
${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    id=vocabulary_description_fi_0_textarea
${SAVE_VOCABULARY_BTN}    id=vocabulary_editable_save_edited_button
${ADD_TITLE_BTN}    id=prefLabel_add_button
${LANGUAGE_EN_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-property[1]/dl/dd/app-localized-input/div[1]/div/div/button[1]
${ADD_VOCABULARY_ORGANIZATION_BTN}    id=vocabulary_contributor_add_organization_button
${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    id=search_organization_link
${ADD_CLASSIFICATION_BTN}    id=vocabulary_inGroup_add_domain_button
${TERMINOLOGY_CLASSIFICATION_INPUT}    id=search_domain_link
${IMPORT_VOCABULARY_BTN}    id=vocabulary_import_button
${VOCABULARY_TYPE_DDL}    id=selected_vocabulary_type_dropdown
${TITLE_INPUT_FI}    id=vocabulary_prefLabel_fi_0_input
${PREFIX_INPUT}    id=vocabulary_prefix_input
${ADD_NEW_CLASSIFICATION_BTN}    id=vocabulary_inGroup_add_domain_button
${REMOVE_VOCABULARY_BTN}    id=vocabulary_editable_remove_button
${CONFIRM_REMOVE_VOCABULARY_BTN}    id=delete_confirmation_yes_button
${ADD_DESCRIPTION_DDL}    id=vocabulary_description_add_button
${NEW_DESCRIPTION_FI}    id=add_new_vocabulary_description_fi_button
${FILE_UPLOAD_INPUT}    id=fileupload_input
${UPLOAD_FILE}    id=upload_file_button
${IMPORT_YES_BTN}    id=import_yes_button
${TERMINOLOGY_TAB}    id=terminologyTab
${CONCEPTS_TAB}    id=conceptsTab
${VOCABULARY_DDL}    id=vocabularyDropdown
#Concept buttons
${ADD_NEW_CONCEPT_BTN}    id=concept_list_add_concept_button
${TERM_LITERAL_VALUE_INPUT}    id=concept_prefLabelXl_0_prefLabel_fi_0_input
${SCOPE_INPUT}    id=concept_prefLabelXl_0_scope_textarea
${SOURCE_INPUT}    id=concept_prefLabelXl_0_source_textarea
${DRAFT_COMMENT_INPUT}    id=concept_prefLabelXl_0_draftComment_textarea
${HISTORY_NOTE_INPUT}    id=concept_prefLabelXl_0_historyNote_textarea
${CHANGENOTE_INPUT}    id=concept_prefLabelXl_0_changeNote_textarea
${TERM_STATUS_DDL}    id=selected_concept_prefLabelXl_0_status_input_dropdown
${SAVE_CONCEPT_BTN}    id=concept_editable_save_edited_button
${REMOVE_CONCEPT_BTN}    id=concept_editable_remove_button
${CONFIRM_REMOVE_CONCEPT_BTN}    id=delete_confirmation_yes_button
${IMPORT_CANCEL_BTN}    id=import_cancel_button
${IMPORT_YES_BTN}    id=import_yes_button
${CONCEPT_LIST_SEARCH_INPUT}    id=concept_list_search_concept_input

*** Keywords ***
Terminology Setup
    Test Case Setup Create Terminology

Terminology Teardown
    Delete Terminology

Terminology Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Terminology Select user

Terminology Test Case Teardown
    Close All Browsers

Terminology Select user
    Wait Until Page Contains Element    ${TERMINOLOGY_USER_DROPDOWN}    timeout=60
    Switch window with wait  ${TERMINOLOGY_USER_DROPDOWN}
    Wait Until Page Contains Element    ${USER_1}    timeout=60
    Switch window with wait  ${USER_1}
    Wait Until Page Contains    Test Admin    timeout=60
    Sleep    1

Go back to Sanastot frontpage
    Wait Until Page Contains Element    ${TERMINOLOGY_MAIN_PAGE_LINK}    timeout=60
    Sleep    2
    Switch window with wait  ${TERMINOLOGY_MAIN_PAGE_LINK}
    Sleep    1

Test Case Setup Create Terminology
    Terminology Test Case Setup
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatiosanasto")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new
    ...    ELSE    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage

Delete existing terminological vocabulary and create new
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Switch window with wait  //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Switch window with wait  ${TERMINOLOGY_TAB}
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=20
    Wait Until Page Contains Element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Log To Console    Testiautomaatiosanasto deleted
    Create Testiautomaatiosanasto and import vocabulary

Create Testiautomaatiosanasto and import vocabulary
    Terminology Test Case Setup
    Wait Until Page Contains Element    ${ADD_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${ADD_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${TITLE_INPUT_FI}    timeout=30
    Input Text    ${TITLE_INPUT_FI}    ${VOCABULARY_1}
    Wait Until Page Contains Element    ${ADD_VOCABULARY_ORGANIZATION_BTN}    timeout=30
    Switch window with wait  ${ADD_VOCABULARY_ORGANIZATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    timeout=30
    Input Text    ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Wait Until Page Contains Element    //*[contains(text(), "${ORGANIZATION_2}")]
    Switch window with wait  //*[contains(text(), "${ORGANIZATION_2}")]
    Wait Until Page Contains Element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Switch window with wait  ${ADD_NEW_CLASSIFICATION_BTN}
    Wait Until Page Contains Element    ${TERMINOLOGY_CLASSIFICATION_INPUT}    timeout=30
    Input Text    ${TERMINOLOGY_CLASSIFICATION_INPUT}    ${TERMINOLOGY_CLASSIFICATION_2}
    Wait Until Page Contains Element    //*[contains(text(), "${TERMINOLOGY_CLASSIFICATION_2}")]
    Switch window with wait  //*[contains(text(), "${TERMINOLOGY_CLASSIFICATION_2}")]
    Wait Until Page Contains Element    ${ADD_DESCRIPTION_DDL}    timeout=30
    Switch window with wait  ${ADD_DESCRIPTION_DDL}
    Click Button    ${NEW_DESCRIPTION_FI}
    Wait Until Page Contains Element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input Text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait Until Page Contains Element    ${PREFIX_INPUT}    timeout=30
    Input Text    ${PREFIX_INPUT}    ${PREFIX_1}
    Wait Until Page Contains Element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${VOCABULARY_DDL}    timeout=30
    Switch window with wait  ${VOCABULARY_DDL}
    Wait Until Element Is Visible    ${IMPORT_VOCABULARY_BTN}    timeout=60
    Switch window with wait  ${IMPORT_VOCABULARY_BTN}
    Choose File    ${FILE_UPLOAD_INPUT}    ${test_concepts}
    Wait Until Page Contains Element    ${UPLOAD_FILE}    timeout=30
    Switch window with wait  ${UPLOAD_FILE}
    Wait Until Page Contains Element    ${IMPORT_YES_BTN}    timeout=30
    Switch window with wait  ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Wait Until Element Is Visible    ${ADD_NEW_CONCEPT_BTN}    timeout=90
    Log To Console    Terminology created and concepts imported

Delete Terminology
    Terminology Test Case Setup
    Log To Console    Terminology test case setup done
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    1
    Wait Until Element Is Enabled    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Switch window with wait  //*[contains(text(), "${VOCABULARY_1}")]
    Wait Until Page Contains    ${VOCABULARY_1}    timeout=30
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Switch window with wait  ${TERMINOLOGY_TAB}
    Wait Until Page Contains    Testiautomaatiosanasto    timeout=20
    Wait Until Page Contains Element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Switch window with wait  ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Log To Console    Vocabulary remove done
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    1
    Page Should Not Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Sleep    1
    Log To Console    Testiautomaatiosanasto deleted
    Close All Browsers
