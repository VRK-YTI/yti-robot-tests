*** Settings ***
Documentation     Resource file for terminology application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://sanastot-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    //app-root/app-navigation-bar/nav/ul/li[3]/div/a[2]/span
${LANGUAGE_FI}    //app-root/app-navigation-bar/nav/ul/li[3]/div/a[1]/span
${VOCABULARY_1}    Testiautomaatiosanasto
${VOCABULARY_2}    Testiautomaatiosanasto2
${ORGANIZATION_1}    CSC - Tieteen tietotekniikan keskus
${CLASSIFICATION_1}    Ympäristö
${PREFIX_2}       222
${REMOVE_ORGANIZATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[1]/dl/dd/app-organization-input/div/div[2]/a/i
${REMOVE_CLASSIFICATION_1}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/div/div[2]/a/i
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    //app-root/app-navigation-bar/nav/ul/li[3]/a
${IMPERSONATE_USER_DROPDOWN}    //app-root/app-navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    //app-root/div/app-frontpage/app-vocabularies/div/div[1]/div/div/input
${SHOW_VOCABULARY_DETAILS_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div/div/h2/button[1]
${ADD_NEW_CONCEPT_BTN}    //button[@class='btn btn-action mb-3']//span
${ADD_VOCABULARY_BTN}    //app-root/div/app-frontpage/app-vocabularies/div/div[2]/div[2]/div[1]/div/button/span
#vocabulary buttons
${EDIT_VOCABULARY_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/div/app-editable-buttons/div/button[3]/span
${VOCABULARY_TITLE_TEXTAREA}    id=prefLabel
${VOCABULARY_DESCRIPTION_TEXTAREA}    id=description
${SAVE_VOCABULARY_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/div/app-editable-buttons/div/button[2]/span
${ADD_TITLE_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-property[1]/dl/dd/app-localized-input/div[1]/div/button
${LANGUAGE_EN_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-property[1]/dl/dd/app-localized-input/div[1]/div/div/button[1]
${ADD_ORGANIZATION_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[1]/dl/dd/app-organization-input/button
${SEARCH_ORGANIZATION_INPUT}    //ngb-modal-window/div/div/app-search-organization-modal/div[2]/div[1]/div/div/input
${ADD_CLASSIFICATION_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/button
${SEARCH_CLASSIFICATION_INPUT}    //ngb-modal-window/div/div/app-search-group-modal/div[2]/div[1]/div/div/input
${IMPORT_VOCABULARY_BTN}    id=fileElem
${VOCABULARY_TYPE_DDL}    //app-root/div/app-new-vocabulary/div/div/form/div/div[1]/div/app-dropdown/div/button
${TITLE_INPUT_FI}    id=prefLabel
${PREFIX_INPUT}    id=prefix
${ADD_NEW_ORGANIZATION_BTN}    //app-root/div/app-new-vocabulary/div/div/form/app-vocabulary-form/div/app-reference[1]/dl/dd/app-organization-input/button
${ADD_NEW_CLASSIFICATION_BTN}    //app-root/div/app-new-vocabulary/div/div/form/app-vocabulary-form/div/app-reference[2]/dl/dd/app-group-input/button
${SAVE_NEW_VOCABULARY_BTN}    //app-root/div/app-new-vocabulary/div/div/form/div/div[2]/div/app-editable-buttons/div/button[2]/span
${REMOVE_VOCABULARY_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div[2]/form/div/app-editable-buttons/div/button[4]/span
${CONFIRM_REMOVE_VOCABULARY_BTN}    //ngb-modal-window/div/div/app-delete-confirmation-modal/div[3]/button[1]

*** Keywords ***
Test Case Setup
    Open Sanastot
    Set Selenium Speed    0.5
    Sleep    5
    Select user

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
    Sleep    2
