*** Settings ***
Documentation     Resource file for terminology application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://sanastot-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    id=en_language_selection_link
${LANGUAGE_FI}    id=fi_language_selection_link
${VOCABULARY_1}    Testiautomaatiosanasto
${VOCABULARY_2}    Testiautomaatiosanasto2
${ORGANIZATION_1}    CSC - Tieteen tietotekniikan keskus
${ORGANIZATION_2}    Testiorganisaatio
${CLASSIFICATION_1}    Ympäristö
${CLASSIFICATION_2}    Eläkkeet
${PREFIX_1}       111
${PREFIX_2}       222
${TERM_1}         Automaatio
${REMOVE_ORGANIZATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[1]/dl/dd/app-organization-input/div/div[2]/a/i
${REMOVE_CLASSIFICATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/div/div[2]/a/i
#Frontpage Buttons and links
${LANGUAGE_DROPDOWN_BTN}    id=language_dropdown_link
${IMPERSONATE_USER_DROPDOWN}    id=fakeable_user_dropdown
${FRONTPAGE_SEARCH_BOX}    id=vocabularies_search_input
${ADD_VOCABULARY_BTN}    id=add_vocabulary_button
#Vocabulary buttons
${SHOW_VOCABULARY_DETAILS_BTN}    id=vocabulary_show_details_button
${EDIT_VOCABULARY_BTN}    id=editable_start_editing_button
${VOCABULARY_TITLE_TEXTAREA}    id=prefLabel_fi_0_input
${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    id=description_fi_0_textarea
${SAVE_VOCABULARY_BTN}    id=editable_save_edited_button
${ADD_TITLE_BTN}    id=prefLabel_add_button
${LANGUAGE_EN_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-property[1]/dl/dd/app-localized-input/div[1]/div/div/button[1]
${ADD_ORGANIZATION_BTN}    id=add_organization_button
${SEARCH_ORGANIZATION_INPUT}    id=search_organization_link
${ADD_CLASSIFICATION_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/button
${SEARCH_CLASSIFICATION_INPUT}    id=search_classification_link
${IMPORT_VOCABULARY_BTN}    id=fileElem
${VOCABULARY_TYPE_DDL}    id=selected_vocabulary_type_dropdown
${TITLE_INPUT_FI}    id=prefLabel_fi_0_input
${PREFIX_INPUT}    id=prefix_input
${ADD_NEW_CLASSIFICATION_BTN}    id=add_classification_button
${REMOVE_VOCABULARY_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/div/app-editable-buttons/div/button[4]/span
${CONFIRM_REMOVE_VOCABULARY_BTN}    //ngb-modal-window/div/div/app-delete-confirmation-modal/div[3]/button[1]
${ADD_DESCRIPTION_DDL}    id=description_add_button
${NEW_DESCRIPTION_FI}    id=add_new_description_fi_button
#Concept buttons
${ADD_NEW_CONCEPT_BTN}    id=concept_list_add_concept_button
${TERM_LITERAL_VALUE_INPUT}    id=prefLabel__fi_0_input
${SCOPE_INPUT}    id=scope__textarea
${SOURCE_INPUT}    id=source__textarea
${DRAFT_COMMENT_INPUT}    id=draftComment__textarea
${HISTORY_NOTE_INPUT}    id=historyNote__textarea
${CHANGENOTE_INPUT}    id=changeNote__textarea
${TERM_STATUS_DDL}    id=selected_status_input_dropdown
${SAVE_CONCEPT_BTN}    id=editable_save_edited_button
${REMOVE_CONCEPT_BTN}    id=editable_remove_button
${CONFIRM_REMOVE_CONCEPT_BTN}    id=delete_confirmation_yes_button
#CSV paths
${DATAFOLDER}     ${EXECDIR}${/}test_files
${test_concepts}    ${DATAFOLDER}${/}test_concepts_csv.csv

*** Keywords ***
Terminology Suite Setup
    Create Testiautomaatiosanasto and import vocabulary

Terminology Suite Teardown
    Delete Testiautomaatiosanasto

Test Case Setup
    Open Sanastot
    Set Selenium Speed    0.5
    Sleep    5
    Select user

Test Case Teardown
    Close All Browsers

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}

Select user
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=20
    Sleep    5

Open Sanastot
    Open Browser with Settings
    Wait until page contains    Sanastot    timeout=20
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=20

Go back to Sanastot frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]

Create Testiautomaatiosanasto and import vocabulary
    Test Case Setup
    Wait until page contains element    ${ADD_VOCABULARY_BTN}    timeout=30
    Click element    ${ADD_VOCABULARY_BTN}
    Wait until page contains element    ${VOCABULARY_TYPE_DDL}    timeout=30
    Click element    ${VOCABULARY_TYPE_DDL}
    Wait until page contains element    //*[contains(text(), "Terminologinen sanasto")]    timeout=20
    Click element    //*[contains(text(), "Terminologinen sanasto")]
    Wait until page contains element    ${TITLE_INPUT_FI}    timeout=30
    Input text    ${TITLE_INPUT_FI}    ${VOCABULARY_1}
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_2}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_2}")]
    Click element    //*[contains(text(), "${ORGANIZATION_2}")]
    Wait until page contains element    ${ADD_NEW_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_NEW_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_2}
    Wait until page contains element    //*[contains(text(), "${CLASSIFICATION_2}")]
    Click element    //*[contains(text(), "${CLASSIFICATION_2}")]
    Wait until page contains element    ${ADD_DESCRIPTION_DDL}    timeout=30
    Click element    ${ADD_DESCRIPTION_DDL}
    Click button    ${NEW_DESCRIPTION_FI}
    Wait until page contains element    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    timeout=30
    Input text    ${VOCABULARY_DESCRIPTION_TEXTAREA_FI}    Tämä on kuvaus
    Wait until page contains element    ${PREFIX_INPUT}    timeout=30
    Input text    ${PREFIX_INPUT}    ${PREFIX_1}
    Wait until page contains element    ${SAVE_VOCABULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCABULARY_BTN}
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains element    ${IMPORT_VOCABULARY_BTN}    timeout=30
    Choose file    ${IMPORT_VOCABULARY_BTN}    ${test_concepts}
    Sleep    3
    Click button    Kyllä
    Sleep    3
    Go back to Sanastot frontpage
    Close All Browsers

Delete Testiautomaatiosanasto
    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Wait until page contains element    ${REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${REMOVE_VOCABULARY_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_VOCABULARY_BTN}    timeout=30
    Click element    ${CONFIRM_REMOVE_VOCABULARY_BTN}
    Sleep    3
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Page should contain    sanastoa
    Sleep    1
    Close All Browsers
