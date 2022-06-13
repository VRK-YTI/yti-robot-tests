*** Settings ***
Documentation     Resource file for terminology application
Library           SeleniumLibrary

*** Variables ***
${VOCABULARY_1}    Testiautomaatiosanasto
${VOCABULARY_2}    Testiautomaatiosanasto2
${VOCABULARY_3}    Abc123
${VOCABULARY_4}    Abc456
${VOCABULARY_5}    Abc789
${CLASSIFICATION_1}    Ympäristö
${CLASSIFICATION_2}    Eläkkeet
${PREFIX_1}       898
${PREFIX_2}       222
${PREFIX_3}       333
${TERM_1}         Automaatio
${TERM_2}         tutkimus
${REMOVE_ORGANIZATION_2}    id=vocabulary_contributor_YhteentoimivuusalustanYllapito_remove_organization_reference_link
${REMOVE_CLASSIFICATION_1}    //*[@id="vocabulary_inGroup_http://urn.fi/URN:NBN:fi:au:ptvl/v1184_remove_domain_reference_link"]
#Organizations
${ORGANIZATION_1}    Testiorganisaatio
${ORGANIZATION_2}    Yhteentoimivuusalustan ylläpito
${TESTIORGANISAATIO}    id=Testiorganisaatio_organization_select
${AUTOMAATIOTESTAUS}    id=Automaatiotestaus_organization_select
#Generic locators
${OPEN_MODAL}     class=modal-open
${CONFIRMATION_YES_BTN}    id=confirm_confirmation_modal_button
#Frontpage Buttons and links
${FRONTPAGE_SEARCH_BOX}    id=vocabularies_search_input
${FRONTPAGE_CONCEPT_DEEP_SEARCH}    id=search_concepts_checkbox
${ADD_VOCABULARY_BTN}    id=add_vocabulary_button
${LICENSE_ICON_TEXT_LINK}    id=licence_icon_text_link
${EUPL_LICENCE_LINK}    id=license_link
${FRONTPAGE_ORGANIZATION_FILTER}    id=organization_filter_dropdown
${FRONTPAGE_STATUS_FILTER}    id=selected_status_filter_dropdown
${SEARCH_INPUT}    id=vocabularies_search_input
${ALL_ORGANIZATIONS}    id=all_selected_organization_filter_dropdown
${INCOMPLETE_STATUS}    id=INCOMPLETE_status_filter_dropdown
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
${FILE_UPLOAD_BTN}    id=upload_file_button
${FILE_FORMAT_DROPDOWN_BTN}    id=file_format_dropdown_button
${CSV_FORMAT_BTN}    id=csv_format_dropdown_button
${XML_FORMAT_BTN}    id=ntrf_xml_format_dropdown_button
${TERMINOLOGY_TAB}    id=terminologyTab
${CONCEPTS_TAB}    id=conceptsTab
${VOCABULARY_STATUS_DDL}    id=selected_vocabulary_status_input_dropdown
${VOCABULARY_STATUS_INCOMPLETE}    id=INCOMPLETE_vocabulary_status_input_dropdown
${VOCABULARY_STATUS_DRAFT}    id=DRAFT_vocabulary_status_input_dropdown
${VOCABULARY_DDL}    id=vocabularyDropdown
${ADD_SUBSCRIPTION_BTN}    id=add_subscription_button
${DELETE_SUBSCRIPTION_BTN}    id=delete_subscription_button
${SUBSCRIPTION_BELL_ICON}    //*[@class="subscription-icon icon-bell"]
${USER_DETAILS_SUBSCRIPTIONS_TAB}    id=user_details_subscriptions_tab
${VOCABULARY_SOURCE_INPUT}    id=vocabulary_source_input
${VOCABULARY_CONTACT_TEXTAREA}    id=vocabulary_contact_textarea
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

*** Keywords ***
Create Terminological Vocabulary with concepts
    [Arguments]    ${terminology}
    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait   ${FRONTPAGE_SEARCH_BOX}    ${terminology}    timeout=30
    Sleep    2
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new    ${terminology}
    ...    ELSE    Create Terminological Dictionary and import vocabulary    ${terminology}
    Go Back To Sanastot Frontpage

Create Terminological Vocabulary without concepts
    [Arguments]    ${terminology}
    Unselect Checkbox with wait       ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}  timeout=30

    Create Terminological Dictionary without concepts    ${terminology}
    Go Back To Sanastot Frontpage

Go Back To Sanastot Frontpage
    Click Element that contains text    Etusivu  timeout=20

Delete Terminology
    [Arguments]    ${terminology}
    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}

    Wait Until Page Contains Element    //*[contains(text(), "${terminology}")]    timeout=20
    # Cut teardown execution if terminology does not exist
    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${terminology} did not find the terminology to delete
    ...    AND    Return From Keyword
    Click Element with wait     //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30

    Click Element with wait     ${TERMINOLOGY_TAB}
    Click Element with wait     ${REMOVE_VOCABULARY_BTN}      timeout=60
    Click Element with wait     ${CONFIRM_REMOVE_VOCABULARY_BTN}

    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]

Delete Terminologies
    [Arguments]    @{terminology_items}
    Go Back To Sanastot Frontpage
    Select superuser user
    FOR    ${terminology_item}    IN    @{terminology_items}
        Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
        Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology_item}
        Wait Until Page Contains Element    //*[contains(text(), "${terminology_item}")]    timeout=60
        ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology_item}")]
        Run Keyword Unless    ${terminology_exists}    Run Keywords    Log To Console    Delete Terminology ${terminology_item} did not find the terminology to delete
        ...    AND    Return From Keyword
        Click Element with wait    //*[contains(text(), "${terminology_item}")]
        Wait Until Page Contains    ${terminology_item}    timeout=60

        Click Element with wait    ${TERMINOLOGY_TAB}
        Click Element with wait    ${REMOVE_VOCABULARY_BTN}
        Click Element with wait    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    END

Delete existing terminological vocabulary and create new
    [Arguments]    ${terminology}
    Click Element with wait    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Click Element with wait     ${TERMINOLOGY_TAB}    timeout=60
    Wait Until Page Contains    ${terminology}    timeout=20

    Click Element with wait    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element with wait    ${CONFIRM_REMOVE_VOCABULARY_BTN}

    Unselect Checkbox with wait                ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]

    Create Terminological Dictionary and import vocabulary    ${terminology}

Delete existing terminological vocabulary and create new without concepts
    [Arguments]    ${terminology}
    Click Element with wait    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Click Element with wait    ${TERMINOLOGY_TAB}    timeout=60
    Wait Until Page Contains    ${terminology}    timeout=20
    Click Element with wait    ${REMOVE_VOCABULARY_BTN}    timeout=60
    Click Element with wait    ${CONFIRM_REMOVE_VOCABULARY_BTN}

    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}

    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]
    Log To Console    ${terminology} deleted
    Create Terminological Dictionary without concepts    ${terminology}

Create Terminological Dictionary and import vocabulary
    [Arguments]    ${terminology}
    Click Element with wait    ${ADD_VOCABULARY_BTN}
    Input Text with wait    ${TITLE_INPUT_FI}    ${terminology}
    Click Element with wait    ${ADD_ORGANIZATION_BTN}
    Input Text with wait    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Click Element with wait    //*[contains(text(), "${ORGANIZATION_1}")]
    Click Element with wait    ${ADD_NEW_CLASSIFICATION_BTN}

    Sleep                       1
    Input Text with wait        ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_2}
    Sleep                       1

    Click Element with wait     //*[contains(text(), "${CLASSIFICATION_2}")]
    Click Element with wait     ${ADD_DESCRIPTION_DDL}

    Click Button    ${NEW_DESCRIPTION_FI}
    Input Text with wait    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Input Text with wait    ${PREFIX_INPUT}    ${PREFIX_2}
    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Click Element with wait    ${VOCABULARY_DDL}    timeout=90

    Click Element with wait    ${IMPORT_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${FILE_UPLOAD_INPUT}    timeout=30

    ${csv_file_path}=   Create terminology test concepts csv
    Choose File    ${FILE_UPLOAD_INPUT}    ${csv_file_path}

    Click Element with wait    ${FILE_UPLOAD_BTN}
    Click Element with wait    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120

Create Terminological Dictionary without concepts
    [Arguments]    ${terminology}
    Click Element with wait    ${ADD_VOCABULARY_BTN}
    Input Text with wait    ${TITLE_INPUT_FI}    ${terminology}
    Click Element with wait    ${ADD_ORGANIZATION_BTN}
    Input Text with wait    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}

    Click Element with wait    //*[contains(text(), "${ORGANIZATION_1}")]
    Click Element with wait    ${ADD_NEW_CLASSIFICATION_BTN}
    Input Text with wait    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}

    Click Element with wait    //*[contains(text(), "${CLASSIFICATION_1}")]
    Input Text with wait    ${PREFIX_INPUT}    ${PREFIX_2}
    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Enabled    ${VOCABULARY_DDL}    timeout=90

Edit Concept
    [Arguments]    ${concept}
    Click Element with wait    //*[contains(text(), "${concept}")]
    Wait Until Page Contains Element    //h3[contains(text(), "${concept}")]    timeout=10
    Click Element with wait    ${EDIT_CONCEPT_BTN}

Delete Terminological Dictionary
    [Arguments]    ${dictionary}
    Click Element with wait     //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains    ${dictionary}    timeout=30
    Click Element with wait     ${TERMINOLOGY_TAB}
    Wait Until Page Contains    ${dictionary}    timeout=20
    Click Element with wait     ${REMOVE_VOCABULARY_BTN}
    Click Element with wait     ${CONFIRM_REMOVE_VOCABULARY_BTN}

Select Dictionary
    [Arguments]    ${dictionary}
    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${dictionary}

    Click Element with wait    //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains Element    xpath://h2[@id='vocabulary_main_label' and .='${dictionary}']

Select And Edit Dictionary
    [Arguments]    ${dictionary}
    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${dictionary}

    Click Element with wait    //*[contains(text(), "${dictionary}")]
    Wait Until Page Contains Element    xpath://h2[@id='vocabulary_main_label' and .='${dictionary}']
    Click Element with wait    ${TERMINOLOGY_TAB}
    Click Element with wait    ${EDIT_VOCABULARY_BTN}

Save Concept
    Click Element with wait    ${SAVE_CONCEPT_BTN}
    Wait Until Element Is Visible    ${EDIT_CONCEPT_BTN}    timeout=60

Add Collection For Vocabulary
    [Arguments]    ${collection}    ${definition}
    Click Element with wait    ${CONCEPTS_COLLECTION_TAB}
    Click Element with wait    ${ADD_COLLECTION_BTN}
    Input Text with wait    ${COLLECTION_PREFLABE_INPUT}    ${collection}
    Click Element with wait    ${COLLECTION_DEFINITION_ADD_BTN}
    Click Element with wait    ${COLLECTION_DEFINITION_FI_BTN}
    Input Text with wait    ${COLLECTION_DEFINITION_FI_TEXTAREA}    ${definition}
    Click Element with wait    ${SAVE_COLLECTION_BTN}
    Wait Until Element Is Enabled    ${EDIT_COLLECTION_BTN}    timeout=60

Save Collection
    Click Element with wait         ${SAVE_COLLECTION_BTN}
    Wait Until Element Is Visible    ${EDIT_COLLECTION_BTN}    timeout=30

Edit Collection
    Click Element with wait    ${EDIT_COLLECTION_BTN}

Add Broader Concepts For Collection
    [Arguments]    @{concept_items}
    FOR    ${concept_item}    IN    @{concept_items}
        Click Element with wait    ${COLLECTION_BROADER_CONCEPT_BTN}
        Click Element with wait    //*[contains(text(), "${concept_item}")]
        Wait Until Page Contains    ${concept_item}    timeout=30
        Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    END

Add Members For Collection
    [Arguments]    @{concept_items}
    FOR    ${concept_item}    IN    @{concept_items}
        Click Element with wait    ${COLLECTION_MEMBER_CONCEPT_BTN}
        Click Element with wait    //*[contains(text(), "${concept_item}")]
        Wait Until Page Contains    ${concept_item}    timeout=30
        Click Element with wait    ${SEARCH_CONCEPT_CONFIRM_BTN}
    END

Import Concepts
    [Arguments]    ${file_format}    ${file}    ${delimiter}
    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}
    Click Element with wait    ${FILE_FORMAT_DROPDOWN_BTN}
    Click Element with wait    ${file_format}
    ${delimiter_length}=    Get Length    ${delimiter}
    Run Keyword If    ${delimiter_length} > 0    Select Delimiter    ${delimiter}
    Choose File    ${FILE_UPLOAD_INPUT}    ${file}
    Click Element with wait    ${FILE_UPLOAD_BTN}
    Click Element with wait    ${IMPORT_YES_BTN}
    Wait Until Page Does Not Contain Element    ${OPEN_MODAL}    timeout=120

Select Delimiter
    [Arguments]    ${delimiter}
    Click Element with wait    ${CSV_DELIMITER_BTN}
    Click Element with wait    ${delimiter}

Concept Import Without Confirmation
    [Arguments]    ${file_format}    ${file}
    Click Element with wait   ${VOCABULARY_DDL}
    Click Element with wait    ${IMPORT_VOCABULARY_BTN}
    Click Element with wait    ${FILE_FORMAT_DROPDOWN_BTN}
    Click Element with wait    ${file_format}

    Wait Until Element Is Enabled    ${FILE_UPLOAD_INPUT}    timeout=30
    Choose File    ${FILE_UPLOAD_INPUT}    ${file}

    Click Element with wait    ${FILE_UPLOAD_BTN}

Cancel Concept Import
    Click Element with wait    ${IMPORT_CANCEL_BTN}

Select Concept
    [Arguments]    ${concept}
    Input Text with wait    ${CONCEPT_LIST_SEARCH_INPUT}    ${concept}
    Click Element with wait    //*[contains(text(), "${concept}")]

Delete Concept
    [Arguments]    ${concept}
    Click Element with wait    //*[contains(text(), "${concept}")]
    Click Element with wait    ${REMOVE_CONCEPT_BTN}
    Click Element with wait    ${CONFIRM_REMOVE_CONCEPT_BTN}
    Wait Until Element Is Enabled    ${EDIT_CONCEPT_BTN}    timeout=60

Select Tab
    [Arguments]    ${tab}
    Click Element with wait    ${tab}

Modify Terminology
    Click Element with wait    ${EDIT_VOCABULARY_BTN}

Change Terminology Status
    [Arguments]    ${status}
    Click Element with wait    ${VOCABULARY_STATUS_DDL}
    Click Element with wait    ${status}

Save Terminology
    Click Element with wait    ${SAVE_VOCABULARY_BTN}

Create New Terminology With Parameters
    [Arguments]    ${terminology}    ${status}    ${organization}    ${information_domain}    ${prefix}
    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}

    ${terminology_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "${terminology}")]
    Run Keyword If    ${terminology_exists}    Remove Terminology And Leave Browser Open    ${terminology}

    Click Element with wait    ${ADD_VOCABULARY_BTN}
    Input Text with wait    ${TITLE_INPUT_FI}    ${terminology}
    Click Element with wait    ${VOCABULARY_STATUS_DDL}
    Click Element with wait    ${status}
    Click Element with wait    ${ADD_ORGANIZATION_BTN}
    Click Element with wait    //*[contains(text(), "${organization}")]
    Click Element with wait    ${ADD_NEW_CLASSIFICATION_BTN}
    Input Text with wait    ${SEARCH_CLASSIFICATION_INPUT}    ${information_domain}

    Click Element with wait    //*[contains(text(), "${information_domain}")]
    Input Text with wait    ${PREFIX_INPUT}    ${prefix}
    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${VOCABULARY_DDL}    timeout=60

Remove Terminology And Leave Browser Open
    [Arguments]    ${terminology}
    Click Element with wait    //*[contains(text(), "${terminology}")]
    Wait Until Page Contains    ${terminology}    timeout=30
    Click Element with wait    ${TERMINOLOGY_TAB}
    Click Element with wait    ${REMOVE_VOCABULARY_BTN}
    Click Element with wait    ${CONFIRM_REMOVE_VOCABULARY_BTN}

    Unselect Checkbox with wait    ${FRONTPAGE_CONCEPT_DEEP_SEARCH}

    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${terminology}
    Page Should Not Contain Element    //*[contains(text(), "${terminology}")]

Set Frontpage Filters
    [Arguments]    ${search_term}    ${organization}    ${status}
    ${search_input_length}=    Get Length    ${search_term}
    Run Keyword If    ${search_input_length} > 0    Set Frontpage Search Term    ${search_term}
    Click Element with wait     ${FRONTPAGE_ORGANIZATION_FILTER}
    Click Element with wait     ${organization}
    Click Element with wait     ${FRONTPAGE_STATUS_FILTER}
    Click Element with wait     ${status}

Set Frontpage Search Term
    [Arguments]    ${search_term}
    Input Text with wait    ${SEARCH_INPUT}    ${search_term}

Add Email Subscription For Terminology
    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${ADD_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Remove Email Subscription For Terminology
    Click Element with wait    ${VOCABULARY_DDL}
    Click Element with wait    ${DELETE_SUBSCRIPTION_BTN}
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Does Not Contain Element    ${SUBSCRIPTION_BELL_ICON}    timeout=20

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait    ${NAVIGATION_MENU_DDL}
    Click Element with wait   //*[contains(text(), "${navigation_menu_link}")]

Find and select vocabulary with deeb search
    [Arguments]  ${vocabulary}
    Unselect Checkbox with wait           ${FRONTPAGE_CONCEPT_DEEP_SEARCH}
    Input Text with wait        ${FRONTPAGE_SEARCH_BOX}    ${vocabulary}
    Click Element with wait     //*[contains(text(), "${vocabulary}")]
    Wait Until Page Contains    ${vocabulary}

Restore organization and classification for DRAFT vocabulary
    Click Element with wait    ${TERMINOLOGY_TAB}
    Click Element with wait    ${EDIT_VOCABULARY_BTN}
    Click Element with wait    ${REMOVE_ORGANIZATION_2}
    Click Element with wait    ${REMOVE_CLASSIFICATION_1}
    Click Element with wait    ${SAVE_VOCABULARY_BTN}
    Wait Until Element Is Visible    ${EDIT_VOCABULARY_BTN}    timeout=60

    Page should not contain    ${ORGANIZATION_2}
    Page should not contain    ${CLASSIFICATION_1}