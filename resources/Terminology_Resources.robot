*** Settings ***
Documentation     Resource file for terminology application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${TERMINOLOGIES_ENVIRONMENT_URL}    https://sanastot.dev.yti.cloud.vrk.fi/
${ENVIRONMENT_IDENTIFIER}    AWSDEV
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Test Admin')]
${LANGUAGE_EN}    id=en_language_selection_link
${LANGUAGE_FI}    id=fi_language_selection_link
${VOCABULARY_1}    Testiautomaatiosanasto
${VOCABULARY_2}    Testiautomaatiosanasto2
${ORGANIZATION_1}    CSC - Tieteen tietotekniikan keskus
${ORGANIZATION_2}    Testiorganisaatio
${CLASSIFICATION_1}    Ympäristö
${CLASSIFICATION_2}    Eläkkeet
${PREFIX_1}       898
${PREFIX_2}       222
${PREFIX_3}       333
${TERM_1}         Automaatio
${TERM_2}         tutkimus
${REMOVE_ORGANIZATION_1}    //*[contains(@id,'_CSC-TieteenTietotekniikanKeskus_remove_organization_reference_link')]
${REMOVE_CLASSIFICATION_1}    //*[@id="vocabulary_inGroup_http://urn.fi/URN:NBN:fi:au:ptvl/v1184_remove_domain_reference_link"]
${SELENIUM_SPEED}    0.5
#Generic locators
${OPEN_MODAL}     class=modal-open
#Frontpage Buttons and links
${LANGUAGE_DROPDOWN_BTN}    id=language_dropdown_link
${IMPERSONATE_USER_DROPDOWN}    id=fakeable_user_dropdown
${FRONTPAGE_SEARCH_BOX}    id=vocabularies_search_input
${FRONTPAGE_CONCEPT_DEEP_SEARCH}    id=search_concepts_checkbox
${ADD_VOCABULARY_BTN}    id=add_vocabulary_button
${NAVIGATION_MENU_DDL}    id=nav_item_dropdown_link
${LICENSE_ICON_TEXT_LINK}    id=licence_icon_text_link
${EUPL_LICENCE_LINK}    id=license_link
#Vocabulary buttons
${SHOW_VOCABULARY_DETAILS_BTN}    id=vocabulary_show_details_button
${EDIT_VOCABULARY_BTN}    id=vocabulary_editable_start_editing_button
${VOCABULARY_TITLE_TEXTAREA}    id=vocabulary_prefLabel_fi_0_input
${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    id=vocabulary_description_fi_0_textarea
${SAVE_VOCABULARY_BTN}    id=vocabulary_editable_save_edited_button
${ADD_TITLE_BTN}    id=prefLabel_add_button
${LANGUAGE_EN_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-property[1]/dl/dd/app-localized-input/div[1]/div/div/button[1]
${ADD_ORGANIZATION_BTN}    id=vocabulary_contributor_add_organization_button
${SEARCH_ORGANIZATION_INPUT}    id=search_organization_link
${ADD_CLASSIFICATION_BTN}    id=vocabulary_inGroup_add_domain_button
${SEARCH_CLASSIFICATION_INPUT}    id=search_domain_link
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
${FILE_UPLOAD_BTN}    id=upload_file_button
${FILE_FORMAT_DROPDOWN_BTN}    id=file_format_dropdown_button
${CSV_FORMAT_BTN}    id=csv_format_dropdown_button
${XML_FORMAT_BTN}    id=ntrf_xml_format_dropdown_button
${TERMINOLOGY_TAB}    id=terminologyTab
${CONCEPTS_TAB}    id=conceptsTab
#Concept buttons
${ADD_NEW_CONCEPT_BTN}    id=concept_list_add_concept_button
${TERM_LITERAL_VALUE_INPUT}    id=concept_prefLabelXl_0_prefLabel_fi_0_input
${ADD_NEW_CONCEPT}    id=add_new_concept_prefLabelXl_0_source_value_button
${SCOPE_INPUT}    id=concept_prefLabelXl_0_scope_textarea
${SOURCE_INPUT}    id=concept_prefLabelXl_0_source_0_textarea
${DRAFT_COMMENT_INPUT}    id=concept_prefLabelXl_0_draftComment_textarea
${HISTORY_NOTE_INPUT}    id=concept_prefLabelXl_0_historyNote_textarea
${CHANGENOTE_INPUT}    id=concept_prefLabelXl_0_changeNote_textarea
${TERM_STATUS_DDL}    id=selected_concept_prefLabelXl_0_status_input_dropdown
${SAVE_CONCEPT_BTN}    id=concept_editable_save_edited_button
${REMOVE_CONCEPT_BTN}    id=concept_editable_remove_button
${CONFIRM_REMOVE_CONCEPT_BTN}    id=delete_confirmation_yes_button
${IMPORT_CANCEL_BTN}    id=import_cancel_button
${IMPORT_YES_BTN}    id=import_yes_button
${EDIT_CONCEPT_BTN}    id=concept_editable_start_editing_button
${CONCEPT_LIST_SEARCH_INPUT}    id=concept_list_search_concept_input
${REMOVE_LINK_CONFIRMATION_BTN}    id=remove_link_confirmation_yes_button
${CONCEPTS_COLLECTION_TAB}    id=concepts_collection_tab
${ADD_COLLECTION_BTN}    id=collection_list_add_collection_button
${COLLECTION_PREFLABE_INPUT}    id=collection_prefLabel_fi_0_input
${COLLECTION_BROADER_CONCEPT_BTN}    id=collection_broader_concept_reference_add_reference_button
${COLLECTION_MEMBER_CONCEPT_BTN}    id=collection_member_concept_reference_add_reference_button
${COLLECTION_DEFINITION_ADD_BTN}    id=collection_definition_add_button
${COLLECTION_DEFINITION_FI_BTN}    id=add_new_collection_definition_fi_button
${COLLECTION_DEFINITION_FI_TEXTAREA}    id=collection_definition_fi_0_textarea
${SEARCH_CONCEPT_CONFIRM_BTN}    id=search_concept_confirm_button
${SAVE_COLLECTION_BTN}    id=collection_editable_save_edited_button
${EDIT_COLLECTION_BTN}    id=collection_editable_start_editing_button
${REMOVE_COLLECTION_BTN}    id=collection_editable_remove_button
${CONFIRM_REMOVE_BTN}    id=delete_confirmation_yes_button
${CONCEPTS_ALPHABETICAL_TAB}    id=concepts_alphabetic_tab
${CONCEPTS_HIERARCHIAL_TAB}    id=concepts_hierarchical_tab
${ADD_BROADER_CONCEPT_BTN}    id=concept_broader_concept_reference_add_reference_button
${SEARCH_CONCEPT_INPUT}    id=search_concept_search_input
${ADD_PREFERRED_TERM_BTN}    id=concept_prefLabelXl_add_term_button
${ADD_PREFERRED_TERM_SV}    id=concept_prefLabelXl_sv_add_term_button
${PREFERRED_TERM}    id=concept_prefLabelXl_2_term_acc
${PREFERRED_TERM_INPUT}    id=concept_prefLabelXl_2_prefLabel_sv_0_input
${PREFERRED_TERM_2_REORDER_HANDLE}    id=concept_prefLabelXl_2_term_reorder_handle
${PREFERRED_TERM_0_REORDER_HANDLE}    id=concept_prefLabelXl_0_term_reorder_handle
${ADD_SYNONYM_BTN}    id=concept_altLabelXl_add_term_button
${ADD_SYNONYM_EN}    id=concept_altLabelXl_en_add_term_button
${SYNONYM_INPUT}    id=concept_altLabelXl_1_prefLabel_en_0_input
${NOT_SYNONYM_BTN}    id=concept_notRecommendedSynonym_add_term_button
${NOT_SYNONYM_EN}    id=concept_notRecommendedSynonym_en_add_term_button
${NOT_SYNONYM_INPUT}    id=concept_notRecommendedSynonym_0_prefLabel_en_0_input
${ADD_HIDDEN TERM_BTN}    id=concept_hiddenTerm_add_term_button
${ADD_HIDDEN TERM_FI}    id=concept_hiddenTerm_fi_add_term_button
${HIDDEN TERM_INPUT}    id=concept_hiddenTerm_0_prefLabel_fi_0_input
${ADD_HIDDEN_TERM_SOURCE_BTN}    id=add_new_concept_hiddenTerm_0_source_value_button
${HIDDEN_TERM_SOURCE_INPUT}    id=concept_hiddenTerm_0_source_0_textarea
${HIDDEN_TERM_SCOPE_INPUT}    id=concept_hiddenTerm_0_scope_textarea
${HIDDEN_TERM_STYLE_INPUT}    id=concept_hiddenTerm_0_termStyle_input
${HIDDEN_TERM_FAMILY_INPUT}    id=concept_hiddenTerm_0_termFamily_input
${HIDDEN_TERM_CONJUGATION_INPUT}    id=concept_hiddenTerm_0_termConjugation_input
${HIDDEN_TERM_EQUIVALENCY_INPUT}    id=concept_hiddenTerm_0_termEquivalency_input
${HIDDEN_TERM_WORD_CLASS_INPUT}    id=concept_hiddenTerm_0_wordClass_input
${HIDDEN_TERM_HOMOGRPAH_INPUT}    id=concept_hiddenTerm_0_termHomographNumber_input
${HIDDEN_TERM_NOTE_BTN}    id=add_new_concept_hiddenTerm_0_editorialNote_value_button
${HIDDEN_TERM_NOTE_INPUT}    id=concept_hiddenTerm_0_editorialNote_0_textarea
${HIDDEN_TERM_COMMENT_INPUT}    id=concept_hiddenTerm_0_draftComment_textarea
${HIDDEN_TERM_HISTORY_INPUT}    id=concept_hiddenTerm_0_historyNote_textarea
${HIDDEN_TERM_CHANGENOTE_INPUT}    id=concept_hiddenTerm_0_changeNote_textarea
${HIDDEN_TERM_STATUS_DDL}    id=selected_concept_hiddenTerm_0_status_input_dropdown
${HIDDEN_TERM_STATUS_VALID}    id=VALID_concept_hiddenTerm_0_status_input_dropdown
${HIDDEN_TERM}    id=concept_hiddenTerm_0_term_accordion_chevron
${ADD_CONCEPT_DEFINITION_BTN}    id=concept_definition_add_button
${CONCEPT_DEFINITION_EN}    id=add_new_concept_definition_en_button
${CONCEPT_DEFINITION_FI_0_INPUT}    id=concept_definition_fi_0_semantic_text_input
${CONCEPT_DEFINITION_EN_1_INPUT}    id=concept_definition_en_1_semantic_text_input
${ADD_CONCEPT_NOTE_BTN}    id=concept_note_add_button
${CONCEPT_NOTE_EN}    id=add_new_concept_note_en_button
${CONCEPT_NOTE_FI}    id=add_new_concept_note_fi_button
${CONCEPT_NOTE_INPUT}    id=concept_note_en_1_semantic_text_input
${CONCEPT_NOTE_FI_1_INPUT}    id=concept_note_fi_1_semantic_text_input
${ADD_CONCEPT_EDITORIAL_NOTE_BTN}    id=add_new_concept_editorialNote_value_button
${CONCEPT_EDITORIAL_NOTE_INPUT}    id=concept_editorialNote_0_textarea
${CONCEPT_EXAMPLE_ADD_BTN}    id=concept_example_add_button
${CONCEPT_EXAMPLE_EN}    id=add_new_concept_example_en_button
${CONCEPT_EXAMPLE_EN_TEXTAREA}    id=concept_example_en_1_textarea
${CONCEPT_DEFINITION_FI}    id=add_new_concept_definition_fi_button
${CONCEPT_DEFINITION_FI_1_INPUT}    id=concept_definition_fi_1_semantic_text_input
${CONCEPT_SCOPE_INPUT}    id=concept_conceptScope_textarea
${CONCEPT_SCOPE_CLASS_INPUT}    id=concept_conceptClass_input
${CONCEPT_WORD_CLASS_INPUT}    id=concept_wordClass_input
${CONCEPT_CHNAGE NOTE_INPUT}    id=concept_changeNote_textarea
${CONCEPT_HISTORY_NOTE_INPUT}    id=concept_historyNote_textarea
${CONCEPT_CONCEPT_NOTATION_INPUT}    id=concept_notation_input
${CONCEPT_STATUS_DDL}    id=selected_concept_status_input_dropdown
${CONCEPT_STATUS_VALID}    id=VALID_concept_status_input_dropdown
${CONCEPT_FILTER_BTN}    id=concept_list_filter_results_tooltip_overlay
${CONCEPT_FILTER_DDL}    id=selected_status_filter_dropdown
${CONCEPT_INCOMPLETE_STATUS}    id=INCOMPLETE_status_filter_dropdown
${CONCEPT_DRAFT_STATUS}    id=DRAFT_status_filter_dropdown
${ADD_LINK}       id=concept_definition_fi_0_semantic_text_input_extlink_popover_button
${ADD_CONCEPT_REFERENCE}    id=concept_definition_fi_0_semantic_text_input_link_popover_button
${ADD_CONCEPT_REFERENCE_1}    id=concept_definition_fi_1_semantic_text_input_link_popover_button
${ADD_CONCEPT_NOTE_REFERENCE_1}    id=concept_note_fi_1_semantic_text_input_link_popover_button
${SELECT_LINK_CONFRIM_BTN}    id=select_link_target_confirm_button
${SELECT_LINK_URL_INPUT}    id=select_link_target_url_input
${SELECT_CONCEPT_REFERENCE_DDL}    id=selected_select_concept_reference_dropdown
${BROADER_CONCEPT_BTN}    id=HierarkkinenYlakasite_select_concept_reference_dropdown
${SELECT_CONCEPT_CONFIRM_BTN}    id=select_concept_confirm_button
${CSV_DELIMITER_BTN}    id=csv_delimiter_dropdown_button
${COMMA_DELIMITER_BTN}    id=comma_delimiter_dropdown_button
${SEMICOLON_DELIMITER_BTN}    id=semicolon_delimiter_dropdown_button
${CONCEPTS_LIST}    id=concept_list_selectable_concepts_list
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
${test_concepts_for_status_filter}    ${DATAFOLDER}${/}test_concepts_filter_csv.csv
${concept_reference}    ${DATAFOLDER}${/}Concept_reference_csv.csv
#xml paths
${tax}            ${DATAFOLDER}${/}Verotussanasto_xml.xml
${Concepts_with_dropped_items}    ${DATAFOLDER}${/}Concepts_with_dropped_items_xml.xml
${Concepts_with_semicolon_delimiter}    ${DATAFOLDER}${/}test_concepts_semicolon_delimiter_csv.csv

*** Keywords ***
Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select User

Create Terminological Vocabulary with concepts
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Sleep    2
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new    ${terminology}
    ...    ELSE    Create Terminological Dictionary and import vocabulary    ${terminology}
    Go Back To Sanastot Frontpage

Create Terminological Vocabulary without concepts
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Sleep    2
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new without concepts    ${terminology}
    ...    ELSE    Create Terminological Dictionary without concepts    ${terminology}
    Go Back To Sanastot Frontpage

Test Case Teardown
    Close All Browsers

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${TERMINOLOGIES_ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${TERMINOLOGIES_ENVIRONMENT_URL}

Select User
    Wait Until Page Contains Element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click Element    ${IMPERSONATE_USER_DROPDOWN}
    Wait Until Element Is Visible    ${USER_1}    timeout=30
    Click Element    ${USER_1}
    Wait Until Page Contains Element    xpath://*[contains(@class, 'logged-in')]/*[contains(text(), 'Test Admin')]    timeout=20

Open Sanastot
    Open Browser with Settings
    Wait Until Page Contains    Sanastot    timeout=20
    Wait Until Page Contains    KIRJAUDU SISÄÄN    timeout=20

Go Back To Sanastot Frontpage
    Wait Until Page Contains Element    //*[contains(text(), "Etusivu")]    timeout=20
    Click Element    //*[contains(text(), "Etusivu")]

Delete Terminology
    [Arguments]    ${terminology}
    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "${terminology}")]    timeout=20
    # Cut teardown execution if terminology does not exist
    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${terminology} did not find the terminology to delete
    ...    AND    Return From Keyword
    Click Element    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Wait Until Element Is Visible    ${TERMINOLOGY_TAB}    timeout=30
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Element Is Visible    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element    ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]
    Log To Console    ${terminology} deleted
    Close All Browsers

Delete existing terminological vocabulary and create new
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    //*[contains(text(), "${terminology}")]    timeout=30
    Click Element    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Wait Until Element Is Visible    ${TERMINOLOGY_TAB}    timeout=60
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Page Contains    ${terminology}    timeout=20
    Wait Until Element Is Visible    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element    ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]
    Log To Console    ${terminology} deleted
    Create Terminological Dictionary and import vocabulary    ${terminology}

Delete existing terminological vocabulary and create new without concepts
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    //*[contains(text(), "${terminology}")]    timeout=30
    Click Element    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Wait Until Element Is Visible    ${TERMINOLOGY_TAB}    timeout=60
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Page Contains    ${terminology}    timeout=20
    Wait Until Element Is Visible    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element    ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]
    Log To Console    ${terminology} deleted
    Create Terminological Dictionary without concepts    ${terminology}

Create Terminological Dictionary and import vocabulary
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click Element    ${ADD_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${TITLE_INPUT_FI}    timeout=30
    Input Text    ${TITLE_INPUT_FI}    ${terminology}
    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click Element    ${ADD_ORGANIZATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input Text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Wait Until Page Contains Element    //*[contains(text(), "${ORGANIZATION_2}")]
    Click Element    //*[contains(text(), "${ORGANIZATION_2}")]
    Wait Until Page Contains Element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_CLASSIFICATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_2}
    Wait Until Page Contains Element    //*[contains(text(), "${CLASSIFICATION_2}")]
    Click Element    //*[contains(text(), "${CLASSIFICATION_2}")]
    Wait Until Page Contains Element    ${ADD_DESCRIPTION_DDL}    timeout=30
    Click Element    ${ADD_DESCRIPTION_DDL}
    Click button    ${NEW_DESCRIPTION_FI}
    Wait Until Page Contains Element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input Text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait Until Page Contains Element    ${PREFIX_INPUT}    timeout=30
    Input Text    ${PREFIX_INPUT}    ${PREFIX_2}
    Wait Until Element Is Enabled    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${IMPORT_VOCABULARY_BTN}    timeout=60
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}
    Choose File    ${FILE_UPLOAD_INPUT}    ${test_concepts}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=30
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Wait Until Element Is Enabled    ${IMPORT_VOCABULARY_BTN}    timeout=1
    Log To Console    ${terminology} created

Create Terminological Dictionary without concepts
    [Arguments]    ${terminology}
    Wait Until Page Contains Element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click Element    ${ADD_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${TITLE_INPUT_FI}    timeout=30
    Input Text    ${TITLE_INPUT_FI}    ${terminology}
    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click Element    ${ADD_ORGANIZATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input Text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Wait Until Page Contains Element    //*[contains(text(), "${ORGANIZATION_1}")]
    Click Element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait Until Page Contains Element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Click Element    ${ADD_NEW_CLASSIFICATION_BTN}
    Wait Until Page Contains Element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Wait Until Page Contains Element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Click Element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait Until Page Contains Element    ${PREFIX_INPUT}    timeout=30
    Input Text    ${PREFIX_INPUT}    ${PREFIX_2}
    Wait Until Element Is Enabled    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${IMPORT_VOCABULARY_BTN}    timeout=60
    Sleep    1
    Log To Console    ${terminology} without concepts created

Edit Concept
    [Arguments]    ${concept}
    Wait Until Page Contains Element    //*[contains(text(), "${concept}")]    timeout=30
    Click Element    //*[contains(text(), "${concept}")]
    Wait Until Page Contains Element    //h3[contains(text(), "${concept}")]    timeout=10
    Wait Until Page Contains Element    ${EDIT_CONCEPT_BTN}    timeout=30
    Click Element    ${EDIT_CONCEPT_BTN}
    Sleep    1

Delete Terminological Dictionary
    [Arguments]    ${dictionary}
    Wait Until Page Contains Element    //*[contains(text(), "${dictionary}")]    timeout=30
    Click Element    //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains    ${dictionary}    timeout=30
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Page Contains    ${dictionary}    timeout=20
    Wait Until Element Is Visible    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element    ${REMOVE_VOCABULARY_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=60
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${dictionary}
    Sleep    2
    Page Should Not Contain Element    //*[contains(text(), "${dictionary}")]
    Sleep    1
    Log To Console    ${dictionary} Terminological Dictionary deleted
    Close All Browsers

Select Dictionary
    [Arguments]    ${dictionary}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${dictionary}
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "${dictionary}")]    timeout=30
    Click Element    //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains Element    xpath://h2[@id='vocabulary_main_label' and .='${dictionary}']
    Log To Console    ${dictionary} selected

Select And Edit Dictionary
    [Arguments]    ${dictionary}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Unselect Checkbox    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${dictionary}
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "${dictionary}")]    timeout=30
    Click Element    //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains Element    xpath://h2[@id='vocabulary_main_label' and .='${dictionary}']
    Wait Until Element Is Enabled    ${TERMINOLOGY_TAB}    timeout=30
    Click Element    ${TERMINOLOGY_TAB}
    Wait Until Element Is Enabled    ${EDIT_VOCABULARY_BTN}    timeout=30
    Click Element    ${EDIT_VOCABULARY_BTN}
    Log To Console    ${dictionary} selected for editing

Save Concept
    Wait Until Page Contains Element    ${SAVE_CONCEPT_BTN}    timeout=30
    Click Element    ${SAVE_CONCEPT_BTN}
    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}    timeout=60
    Sleep    1

Add Collection For Vocabulary
    [Arguments]    ${collection}    ${definition}
    Wait Until Page Contains Element    ${CONCEPTS_COLLECTION_TAB}    timeout=30
    Click Element    ${CONCEPTS_COLLECTION_TAB}
    Wait Until Page Contains Element    ${ADD_COLLECTION_BTN}    timeout=30
    Click Element    ${ADD_COLLECTION_BTN}
    Wait Until Page Contains Element    ${COLLECTION_PREFLABE_INPUT}    timeout=30
    Input Text    ${COLLECTION_PREFLABE_INPUT}    ${collection}
    Wait Until Page Contains Element    ${COLLECTION_DEFINITION_ADD_BTN}    timeout=30
    Click Element    ${COLLECTION_DEFINITION_ADD_BTN}
    Click Element    ${COLLECTION_DEFINITION_FI_BTN}
    Wait Until Page Contains Element    ${COLLECTION_DEFINITION_FI_TEXTAREA}    timeout=30
    Input Text    ${COLLECTION_DEFINITION_FI_TEXTAREA}    ${definition}
    Wait Until Element Is Enabled    ${SAVE_COLLECTION_BTN}    timeout=30
    Click Element    ${SAVE_COLLECTION_BTN}
    Wait Until Element Is Enabled    ${EDIT_COLLECTION_BTN}    timeout=60

Save Collection
    Wait Until Element Is Visible    ${SAVE_COLLECTION_BTN}    timeout=30
    Wait Until Element Is Enabled    ${SAVE_COLLECTION_BTN}    timeout=30
    Click Element    ${SAVE_COLLECTION_BTN}
    Wait Until Element Is Visible    ${EDIT_COLLECTION_BTN}    timeout=30

Edit Collection
    Wait Until Page Contains Element    ${EDIT_COLLECTION_BTN}    timeout=30
    Click Element    ${EDIT_COLLECTION_BTN}

Add Broader Concepts For Collection
    [Arguments]    @{concept_items}
    : FOR    ${concept_item}    IN    @{concept_items}
    \    Wait Until Page Contains Element    ${COLLECTION_BROADER_CONCEPT_BTN}    timeout=30
    \    Click Element    ${COLLECTION_BROADER_CONCEPT_BTN}
    \    Wait Until Page Contains Element    //*[contains(text(), "${concept_item}")]    timeout=30
    \    Click Element    //*[contains(text(), "${concept_item}")]
    \    Wait Until Page Contains    ${concept_item}    timeout=30
    \    Wait Until Element Is Enabled    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=20
    \    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}

Add Members For Collection
    [Arguments]    @{concept_items}
    : FOR    ${concept_item}    IN    @{concept_items}
    \    Wait Until Page Contains Element    ${COLLECTION_MEMBER_CONCEPT_BTN}    timeout=30
    \    Click Element    ${COLLECTION_MEMBER_CONCEPT_BTN}
    \    Wait Until Page Contains Element    //*[contains(text(), "${concept_item}")]    timeout=30
    \    Click Element    //*[contains(text(), "${concept_item}")]
    \    Wait Until Page Contains    ${concept_item}    timeout=30
    \    Wait Until Element Is Enabled    ${SEARCH_CONCEPT_CONFIRM_BTN}    timeout=20
    \    Click Element    ${SEARCH_CONCEPT_CONFIRM_BTN}

Import Concepts
    [Arguments]    ${file_format}    ${file}    ${delimiter}
    Wait Until Element Is Enabled    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${FILE_FORMAT_DROPDOWN_BTN}    timeout=30
    Click Element    ${FILE_FORMAT_DROPDOWN_BTN}
    Wait Until Element Is Enabled    ${file_format}    timeout=30
    Click Element    ${file_format}
    ${delimiter_length}=    Get Length    ${delimiter}
    Run Keyword If    ${delimiter_length} > 0    Select Delimiter    ${delimiter}
    Choose File    ${FILE_UPLOAD_INPUT}    ${file}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}
    Wait Until Element Is Enabled    ${IMPORT_YES_BTN}    timeout=120
    Click Element    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120
    Wait Until Element Is Enabled    ${IMPORT_VOCABULARY_BTN}    timeout=10
    Log To Console    Concept import ok

Select Delimiter
    [Arguments]    ${delimiter}
    Wait Until Element Is Enabled    ${CSV_DELIMITER_BTN}    timeout=30
    Click Element    ${CSV_DELIMITER_BTN}
    Wait Until Element Is Enabled    ${delimiter}    timeout=30
    Click Element    ${delimiter}

Concept Import Without Confirmation
    [Arguments]    ${file_format}    ${file}
    Wait Until Element Is Enabled    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Click Element    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${FILE_FORMAT_DROPDOWN_BTN}    timeout=30
    Click Element    ${FILE_FORMAT_DROPDOWN_BTN}
    Wait Until Element Is Enabled    ${file_format}    timeout=30
    Click Element    ${file_format}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_INPUT}    timeout=30
    Choose File    ${FILE_UPLOAD_INPUT}    ${file}
    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=30
    Click Element    ${FILE_UPLOAD_BTN}

Cancel Concept Import
    Wait Until Page Contains Element    ${IMPORT_CANCEL_BTN}    timeout=30
    Click Element    ${IMPORT_CANCEL_BTN}

Select Concept
    [Arguments]    ${concept}
    Wait Until Page Contains Element    ${CONCEPT_LIST_SEARCH_INPUT}    timeout=30
    Input Text    ${CONCEPT_LIST_SEARCH_INPUT}    ${concept}
    Wait Until Page Contains Element    //*[contains(text(), "${concept}")]
    Click Element    //*[contains(text(), "${concept}")]
    Log To Console    Concept ${concept} selected
    Sleep    1

Delete Concept
    [Arguments]    ${concept}
    Wait Until Page Contains Element    //*[contains(text(), "${concept}")]    timeout=30
    Click Element    //*[contains(text(), "${concept}")]
    Wait Until Page Contains Element    ${REMOVE_CONCEPT_BTN}    timeout=30
    Click Element    ${REMOVE_CONCEPT_BTN}
    Wait Until Page Contains Element    ${CONFIRM_REMOVE_CONCEPT_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_CONCEPT_BTN}
    Wait Until Element Is Enabled    ${EDIT_CONCEPT_BTN}    timeout=60
    Log To Console    ${concept} removed
    Sleep    1
