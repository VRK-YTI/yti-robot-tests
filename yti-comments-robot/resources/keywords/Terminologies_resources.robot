*** Variables ***
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
${FRONTPAGE_LINK}    id=0_breadcrumb_link
${OPEN_MODAL}     class=modal-open
#Frontpage Buttons and links
${FRONTPAGE_SEARCH_BOX}    id=vocabularies_search_input
${ADD_VOCABULARY_BTN}    id=add_vocabulary_button
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
#CSV paths
${test_concepts_csv}    ${DATAFOLDER}${/}test_concepts_csv.csv

*** Keywords ***
Go back to Sanastot frontpage
    Click element with wait     ${FRONTPAGE_LINK}    timeout=60

Check concept suggestion in Terminologies
    Terminology Test Case Setup

    Input Text with wait                ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}     timeout=60
    Click element that contains text    ${VOCABULARY_1}

    Wait until page contains            ${VOCABULARY_1}             timeout=30
    Wait until page contains            Testiautomaatiosanasto      timeout=20

    Input Text with wait                ${CONCEPT_LIST_SEARCH_INPUT}    automobiili
    Click element that contains text    automobiili

    Wait until page contains    Ehdotus                 timeout=20
    Wait until page contains    Tämä on kulkuneuvo      timeout=20
    Wait until page contains    Test Superuser          timeout=20

Delete existing terminological vocabulary and create new
    Click element that contains text    ${VOCABULARY_1}
    Wait until page contains            ${VOCABULARY_1}
    Click element with wait             ${TERMINOLOGY_TAB}
    Wait until page contains            Testiautomaatiosanasto              timeout=20

    Click element with wait             ${REMOVE_VOCABULARY_BTN}
    Click element with wait             ${CONFIRM_REMOVE_VOCABULARY_BTN}

    Create Testiautomaatiosanasto and import vocabulary

Create Testiautomaatiosanasto and import vocabulary
    Terminology Test Case Setup
    Click element with wait             ${ADD_VOCABULARY_BTN}
    Input Text with wait                ${TITLE_INPUT_FI}    ${VOCABULARY_1}
    Click element with wait             ${ADD_VOCABULARY_ORGANIZATION_BTN}
    Input Text with wait                ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Click element that contains text    ${ORGANIZATION_2}
    Click element with wait             ${ADD_NEW_CLASSIFICATION_BTN}
    Input Text with wait                ${TERMINOLOGY_CLASSIFICATION_INPUT}    ${TERMINOLOGY_CLASSIFICATION_2}
    Click element that contains text    ${TERMINOLOGY_CLASSIFICATION_2}
    Click element with wait             ${ADD_DESCRIPTION_DDL}

    Click Button                        ${NEW_DESCRIPTION_FI}
    Input Text with wait                ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}       Tämä on kuvaus
    Input Text with wait                ${PREFIX_INPUT}                             ${PREFIX_1}
    Click element with wait             ${SAVE_VOCABULARY_BTN}                                          timeout=60
    Click element with wait             ${VOCABULARY_DDL}                                               timeout=90
    Click element with wait             ${IMPORT_VOCABULARY_BTN}                                        timeout=90
    Choose File                         ${FILE_UPLOAD_INPUT}    ${test_concepts_csv}

    Click element with wait             ${UPLOAD_FILE}
    Click element with wait             ${IMPORT_YES_BTN}

    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}               timeout=120
    Wait Until Element Is Enabled               ${ADD_NEW_CONCEPT_BTN}      timeout=90

Delete Terminology
    [Arguments]    ${terminology}
    Input Text with wait                ${FRONTPAGE_SEARCH_BOX}    ${terminology}     timeout=60

    Wait until page contains element    //*[contains(text(), "${terminology}")]    timeout=30
    # Cut teardown execution if terminology does not exist
    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${terminology} did not find the terminology to delete
    ...    AND    Return From Keyword

    Click element that contains text    ${VOCABULARY_1}
    Wait until page contains            ${VOCABULARY_1}

    Click element with wait             ${TERMINOLOGY_TAB}
    Click element with wait             ${REMOVE_VOCABULARY_BTN}
    Click element with wait             ${CONFIRM_REMOVE_VOCABULARY_BTN}

