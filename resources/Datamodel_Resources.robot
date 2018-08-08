*** Settings ***
Documentation     Resource file for Datamodel application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://tietomallit-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item ng-binding ng-scope'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    //application/ng-container/navigation-bar/nav/ul/li[3]/div/a[2]/span
${LANGUAGE_FI}    //application/ng-container/navigation-bar/nav/ul/li[3]/div/a[1]/span
${MODEL_1}        Testiautomaatio
${CORE_VOCABULARY_1}    Automaatiokirjasto
#Frontpage
${ADD_MODEL_BTN}    id=modelCreation
${LANGUAGE_DROPDOWN_BTN}    //application/ng-container/navigation-bar/nav/ul/li[3]/a
${IMPERSONATE_USER_DROPDOWN}    //application/ng-container/navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    //application/ng-container/div/div/front-page/div/div[1]/div/div/input
#Buttons and links
${ADD_CLASS_BTN}    id=add_new_class_button
${USAGE_BTN}      id=model_http://uri.suomi.fi/datamodel/ns/test_accordion_button
#Model
${SHOW_MODEL_DETAILS_BTN}    id=show_model_details_button
${MODEL_LABEL_INPUT}    id=modelLabel
${MODEL_DESCRIPTION_INPUT}    id=modelComment
${MODEL_PREFIX_INTPUT}    id=modelPrefix
${ADD_CLASSIFICATION}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/classifications-view/h4/button/span
${ADD_CONTRIBUTOR}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/contributors-view/h4/button/span
${SAVE_MODEL_BTN}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[1]/button[2]/span
${REMOVE_MODEL_BTN}    //*[@id="'model'"]/div/form/fieldset/div/editable-entity-buttons/div/button[4]/span
${CONFIRM_REMOVE_MODEL_BTN}    //div[1]/div/div/div/modal-template/div[3]/div[2]/button[1]
${MODEL_LANGUAGE_INTPUT}    id=modelLanguage
${REMOVE_CLASSIFICATION}    //*[@id="ctrl.id"]/div/div[2]/classifications-view/editable-table/table/tbody/tr/td[2]/i
${REMOVE_CONTRIBUTOR}    //*[@id="ctrl.id"]/div/div[2]/contributors-view/editable-table/table/tbody/tr/td[2]/i
${ADD_LINK}       //*[@id="ctrl.id"]/div/div[2]/links-view/h4/button/span
${LINK_URL_INPUT}    //div[1]/div/div/form/modal-template/div[2]/div/modal-body/editable[1]/div/div/input
${LINK_NAME_INPUT}    //div[1]/div/div/form/modal-template/div[2]/div/modal-body/editable[2]/div/div/input
${LINK_DESCRIPTION_INPUT}    //div[1]/div/div/form/modal-template/div[2]/div/modal-body/editable[3]/div/div/textarea
${MODIFY_MODEL}    //*[@id="'model'"]/div/form/fieldset/div/editable-entity-buttons/div/button[3]/span
${CREATE_NEW_LINK}    //div[1]/div/div/form/modal-template/div[3]/div/modal-buttons/button[1]
${REMOVE_LINK}    //*[@id="ctrl.id"]/div/div[2]/links-view/editable-table/table/tbody/tr/td[3]/i
${IMPORT_NAMESPACE}    //*[@id="ctrl.id"]/div/div[2]/imported-namespaces-view/h4/button/span
${SEARCH_NAMESPACE_INPUT}    //div[1]/div/div/div/div[2]/div[1]/div/text-filter/div/input
#Class
${ADD_NEW_CLASS}    //*[@id="add_new_class_button"]/span
${SEARCH_CLASS_INPUT}    //div[1]/div/div/form/div[2]/div[1]/div/text-filter/div/input
${SPECIALIZE_CLASS}    //div[1]/div/div/form/div[3]/button[1]
${CONFIRM_ADD_PROPERTIES}    //div[1]/div/div/modal-template/div[3]/div/modal-buttons/button[1]
${SAVE_CLASS}     //*[@id="'class'"]/form/fieldset/div/selection-view/div/div[2]/editable-entity-buttons/div/button[2]/span
#Core Vocabulary
${CORE_VOCABULARY_LABEL_INPUT}    id=modelLabel
${CORE_VOCABULARY_DESCRIPTION_INPUT}    id=modelComment
${CORE_VOCABULARY_PREFIX_INPUT}    id=modelPrefix
${VOCABULARY_ADD_CLASSIFICATION}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/classifications-view/h4/button/span
${VOCABULARY_ADD_CONTRIBUTOR}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[2]/div[2]/contributors-view/h4/button/span
${SAVE_CORE_VOCABULARY_BTN}    //application/ng-container/div/div/new-model-page/div/form/fieldset/div[1]/button[2]/span
${MODIFY_CORE_VOCABULARY_BTN}    //*[@id="'model'"]/div/form/fieldset/div/editable-entity-buttons/div/button[3]/span

*** Keywords ***
Test Case Setup
    Open Tietomallit
    Set Selenium Speed    0.5
    Sleep    5
    Select user

Select user
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=20
    Sleep    2

Open Tietomallit
    Open Browser with Settings
    Wait until page contains    Tietomallit    timeout=20
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=20

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

Go back to Data Vocabularies frontpage and close browsers
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers

Go back to Data Vocabularies frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2

Test Case Setup Create Testiautomaatio profile
    Test Case Setup
    Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage

Test Case Teardown Delete Testiautomaatio profile
    Delete Testiautomaatio profile

Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Test Case Setup
    Create Automaatiokirjasto Core Vocabulary
    Go back to Data Vocabularies frontpage

Test Case Teardown Delete Automaatiokirjasto Core Vocabulary
    Delete Automaatiokirjasto Core Vocabulary

Create Testiautomaatio profile
    Wait until page contains element    ${ADD_MODEL_BTN}    timeout=30
    Click Element    ${ADD_MODEL_BTN}
    Click Button    Lisää soveltamisprofiili
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    ${MODEL_1}
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${MODEL_PREFIX_INTPUT}    timeout=30
    Input Text    ${MODEL_PREFIX_INTPUT}    test
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Sleep    2

Delete Testiautomaatio profile
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains    tietomallia    timeout=30
    Log to Console    Testiautomaatio profile deleted
    Sleep    2
    Close All Browsers

Create Automaatiokirjasto Core Vocabulary
    Wait until page contains element    ${ADD_MODEL_BTN}    timeout=30
    Click Element    ${ADD_MODEL_BTN}
    Click Button    Lisää tietokomponenttikirjasto
    Wait until page contains element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    ${CORE_VOCABULARY_1}
    Wait until page contains element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${CORE_VOCABULARY_PREFIX_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_PREFIX_INPUT}    lib
    Wait until page contains element    ${VOCABULARY_ADD_CLASSIFICATION}    timeout=30
    Click Element    ${VOCABULARY_ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${VOCABULARY_ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${VOCABULARY_ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${SAVE_CORE_VOCABULARY_BTN}
    Sleep    2

Delete Automaatiokirjasto Core Vocabulary
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait Until Page Contains    tietomallia    timeout=30
    Log to Console    Automaatiokirjasto Core Vocabulary deleted
    Sleep    2
    Close All Browsers
