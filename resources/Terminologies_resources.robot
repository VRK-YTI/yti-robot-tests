*** Variables ***
${BROWSER}        chrome
${TERMINOLOGIES_ENVIRONMENT_URL}    https://sanastot-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Testi Admin')]
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
${SELENIUM_SPEED}    0.5
${FRONTPAGE_LINK}    id=0_breadcrumb_link
#Frontpage Buttons and links
${LANGUAGE_DROPDOWN_BTN}    id=language_dropdown_link
${TERMINOLOGY_USER_DROPDOWN}    id=fakeable_user_dropdown
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
${IMPORT_VOCABULARY_BTN}    id=vocabulary_import_label
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
${DATAFOLDER}     ${EXECDIR}${/}test_files
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
Terminology Setup
    Test Case Setup Create Testiautomaatiosanasto

Terminology Teardown
    Delete Testiautomaatiosanasto

Terminology Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Terminology Select user

Terminology Test Case Teardown
    Close All Browsers

Terminology Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Terminology Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Terminology Open Chrome to Environment
    ...    ELSE    Open Browser    ${TERMINOLOGIES_ENVIRONMENT_URL}    browser=${BROWSER}

Terminology Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    #Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${TERMINOLOGIES_ENVIRONMENT_URL}

Terminology Select user
    Wait until page contains element    ${TERMINOLOGY_USER_DROPDOWN}    timeout=60
    Click element    ${TERMINOLOGY_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}    timeout=60
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=60
    Sleep    1

Open Sanastot
    Terminology Open Browser with Settings
    Wait until page contains    Sanastot    timeout=90
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=90

Go back to Sanastot frontpage
    Sleep    1
    Wait Until Element Is Enabled    ${FRONTPAGE_LINK}    timeout=60
    Click element    ${FRONTPAGE_LINK}

Test Case Setup Create Testiautomaatiosanasto
    Terminology Test Case Setup
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatiosanasto")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new
    ...    ELSE    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage

Delete existing terminological vocabulary and create new
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Click element    ${TERMINOLOGY_TAB}
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Log To Console    Testiautomaatiosanasto deleted
    Create Testiautomaatiosanasto and import vocabulary

Create Testiautomaatiosanasto and import vocabulary
    Terminology Test Case Setup
    Wait until page contains element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_BTN}
    Wait until page contains element    ${TITLE_INPUT_FI}    timeout=30
    Input Text    ${TITLE_INPUT_FI}    ${VOCABULARY_1}
    Wait until page contains element    ${ADD_VOCABULARY_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    timeout=30
    Input Text    ${SEARCH_VOCABULARY_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_2}")]
    Click element    //*[contains(text(), "${ORGANIZATION_2}")]
    Wait until page contains element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_NEW_CLASSIFICATION_BTN}
    Wait until page contains element    ${TERMINOLOGY_CLASSIFICATION_INPUT}    timeout=30
    Input Text    ${TERMINOLOGY_CLASSIFICATION_INPUT}    ${TERMINOLOGY_CLASSIFICATION_2}
    Wait until page contains element    //*[contains(text(), "${TERMINOLOGY_CLASSIFICATION_2}")]
    Click element    //*[contains(text(), "${TERMINOLOGY_CLASSIFICATION_2}")]
    Wait until page contains element    ${ADD_DESCRIPTION_DDL}    timeout=30
    Click element    ${ADD_DESCRIPTION_DDL}
    Click Button    ${NEW_DESCRIPTION_FI}
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input Text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait until page contains element    ${PREFIX_INPUT}    timeout=30
    Input Text    ${PREFIX_INPUT}    ${PREFIX_1}
    Wait Until Element Is Enabled    ${SAVE_VOCABULARY_BTN}    timeout=60
    Click element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${IMPORT_VOCABULARY_BTN}    timeout=90
    Click element    ${IMPORT_VOCABULARY_BTN}
    Choose File    ${FILE_UPLOAD_INPUT}    ${concepts_from_controlled_vocabularies}
    Wait Until Element Is Enabled    ${UPLOAD_FILE}    timeout=30
    Click element    ${UPLOAD_FILE}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click element    ${IMPORT_YES_BTN}
    Wait Until Element Is Enabled    ${ADD_NEW_CONCEPT_BTN}    timeout=90
    Sleep    2
    Log To Console    Testiautomaatiosanasto created

Delete Testiautomaatiosanasto
    Terminology Test Case Setup
    Log To Console    Terminology test case setup done
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    # Cut teardown execution if terminology does not exist
    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${VOCABULARY_1} did not find the terminology to delete
    ...    AND    Return From Keyword
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${TERMINOLOGY_TAB}    timeout=30
    Click element    ${TERMINOLOGY_TAB}
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Log To Console    Vocabulary remove done
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    1
    Page Should Not Contain Element    //*[contains(text(), "${VOCABULARY_1}")]
    Log To Console    Testiautomaatiosanasto deleted
    Close All Browsers

Check concept suggestion in Terminologies
    Terminology Test Case Setup
    Log To Console    Terminology Test Case Setup done
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Sleep    3
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Log To Console    Vocabulary found
    Wait until page contains element    ${CONCEPT_LIST_SEARCH_INPUT}    timeout=30
    Input Text    ${CONCEPT_LIST_SEARCH_INPUT}    automobiili
    Wait until page contains element    //*[contains(text(), "automobiili")]
    Click element    //*[contains(text(), "automobiili")]
    Wait until page contains    Ehdotus    timeout=20
    Wait until page contains    Tämä on kulkuneuvo    timeout=20
    Wait until page contains    Testi Superuser    timeout=20
    Log To Console    Concept found
    Log To Console    Concept suggestion ok in Terminologies
    Sleep    1
    Close All Browsers
