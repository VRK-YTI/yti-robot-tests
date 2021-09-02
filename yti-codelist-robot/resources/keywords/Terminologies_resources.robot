*** Variables ***
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Test Admin')]
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
${SELENIUM_SPEED}    0.5
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
${test_concepts}    ${DATAFOLDER}${/}test_concepts_csv.csv
${invalid_related_concepts}    ${DATAFOLDER}${/}test_concepts_invalid_related_concepts_csv.csv
${empty_related_concepts}    ${DATAFOLDER}${/}empty_related_concepts_csv.csv
${concepts_with_empty_status}    ${DATAFOLDER}${/}test_concept_with_empty_status_csv.csv
${concepts_with_missing_status}    ${DATAFOLDER}${/}test_concept_with_missing_status_column_csv.csv
${concepts_with_invalid_column}    ${DATAFOLDER}${/}test_concepts_invalid_column_csv.csv
${concepts_with_invalid_status_value}    ${DATAFOLDER}${/}test_concepts_invalid_status_value_csv.csv
${concepts_with_duplicate_definition_columns}    ${DATAFOLDER}${/}test_concepts_duplicate_definition_columns_csv.csv
${concepts_with_isPartOf_and_status}    ${DATAFOLDER}${/}test_concepts_to_thesaurus_with_isPartOf_status_csv.csv
${test_concepts_to_thesaurus}    ${DATAFOLDER}${/}test_concept_import_to_thesaurus_csv.csv
${test_concepts_to_thesaurus_invalid_column}    ${DATAFOLDER}${/}test_concepts_thesaurus_invalid_column_name_csv.csv
${test_concepts_to_thesaurus_incorrect_column}    ${DATAFOLDER}${/}test_concepts_thesaurus_incorrect_column_name_csv.csv
${concepts_from_controlled_vocabularies}    ${DATAFOLDER}${/}concepts_from_controlled_vocabularies_csv.csv

*** Keywords ***
Terminology Select user
    Wait until page contains element    ${TERMINOLOGY_USER_DROPDOWN}    timeout=60
    Click element    ${TERMINOLOGY_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}    timeout=60
    Click element    ${USER_1}
    Wait Until Page Contains    Test Admin    timeout=60
    Sleep    1

Open Sanastot
    Open Browser with Settings  ${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait until page contains    Sanastot            timeout=90
    Wait until page contains    KIRJAUDU SISÄÄN     timeout=90

Go back to Sanastot frontpage
    Click element with wait     ${FRONTPAGE_LINK}    timeout=60

Delete existing terminological vocabulary and create new
    Click element that contains text    ${VOCABULARY_1}                     timeout=30
    Wait until page contains            ${VOCABULARY_1}                     timeout=30
    Click element with wait             ${TERMINOLOGY_TAB}                  timeout=30
    Wait until page contains            Testiautomaatiosanasto              timeout=20
    Click element with wait             ${REMOVE_VOCABULARY_BTN}            timeout=30
    Click element with wait             ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30

    Input Text with wait                ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}  timeout=30
    Page Should Not Contain Element     //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Log To Console    Testiautomaatiosanasto deleted
    Create Testiautomaatiosanasto and import vocabulary

Create Testiautomaatiosanasto and import vocabulary
    Terminology Test Case Setup
    Click element with wait             ${ADD_VOCABULARY_BTN}                   timeout=30
    Input Text with wait                ${TITLE_INPUT_FI}    ${VOCABULARY_1}    timeout=30
    Click element with wait             ${ADD_VOCABULARY_ORGANIZATION_BTN}      timeout=30
    Input Text with wait                ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    ${ORGANIZATION_2}    timeout=30
    Click element that contains text    ${ORGANIZATION_2}                       timeout=30
    Click element with wait             ${ADD_NEW_CLASSIFICATION_BTN}           timeout=30
    Input Text with wait                ${TERMINOLOGY_CLASSIFICATION_INPUT}    ${TERMINOLOGY_CLASSIFICATION_2}  timeout=30
    Click element that contains text    ${TERMINOLOGY_CLASSIFICATION_2}         timeout=30
    Click element with wait             ${ADD_DESCRIPTION_DDL}                  timeout=30

    Click Button    ${NEW_DESCRIPTION_FI}
    Input Text with wait                ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}       Tämä on kuvaus      timeout=30
    Input Text with wait                ${PREFIX_INPUT}                             ${PREFIX_1}         timeout=30
    Click element with wait             ${SAVE_VOCABULARY_BTN}                                          timeout=60
    Click element with wait             ${VOCABULARY_DDL}                                               timeout=90
    Click element with wait             ${IMPORT_VOCABULARY_BTN}                                        timeout=90
    Choose File                         ${FILE_UPLOAD_INPUT}    ${concepts_from_controlled_vocabularies}
    Click element with wait             ${UPLOAD_FILE}                                                  timeout=30
    Click element with wait             ${IMPORT_YES_BTN}                                               timeout=30
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}               timeout=120
    Wait Until Element Is Enabled               ${ADD_NEW_CONCEPT_BTN}      timeout=90
    Log To Console    Testiautomaatiosanasto created

Delete Testiautomaatiosanasto
    Terminology Test Case Setup
    Log To Console    Terminology test case setup done
    Input Text with wait             ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}     timeout=30

    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    # Cut teardown execution if terminology does not exist
    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${VOCABULARY_1} did not find the terminology to delete
    ...    AND    Return From Keyword
    Click element that contains text        ${VOCABULARY_1}                 timeout=30
    Wait until page contains                ${VOCABULARY_1}                     timeout=30
    Click element with wait                 ${TERMINOLOGY_TAB}                  timeout=30
    Wait until page contains                Testiautomaatiosanasto              timeout=20
    Click element with wait                 ${REMOVE_VOCABULARY_BTN}            timeout=30
    Click element with wait                 ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30

    Log To Console    Vocabulary remove done
    Wait Until Element Is Visible           ${FRONTPAGE_SEARCH_BOX}                     timeout=30
    Input Text with wait                    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}  timeout=30

    Page Should Contain Element             //*[contains(text(), "0 hakutulosta")]
    Log To Console                          Testiautomaatiosanasto deleted
    Close All Browsers

Check concept suggestion in Terminologies
    Terminology Test Case Setup
    Log To Console    Terminology Test Case Setup done
    Input Text with wait                        ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}      timeout=30
    Click element that contains text            ${VOCABULARY_1}                                 timeout=30

    Wait until page contains    ${VOCABULARY_1}             timeout=30
    Wait until page contains    Testiautomaatiosanasto      timeout=20
    Log To Console    Vocabulary found

    Input Text with wait                        ${CONCEPT_LIST_SEARCH_INPUT}    automobiili     timeout=30
    Click element that contains text            automobiili                                     timeout=20

    Wait until page contains    Ehdotus    timeout=20
    Wait until page contains    Tämä on kulkuneuvo    timeout=20
    Wait until page contains    Test Superuser    timeout=20
    Log To Console    Concept found
