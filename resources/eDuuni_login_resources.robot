*** Settings ***
Documentation     Resource file for eDuuni login
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${REFERENCE_DATA_ENVIRONMENT_URL}    https://koodistot.suomi.fi/
${TERMINOLOGIES_ENVIRONMENT_URL}    https://sanastot.suomi.fi/
${DATA_VOCABULRIES_ENVIRONMENT_URL}    https://tietomallit.suomi.fi/
${COMMENTS_ENVIRONMENT_URL}    https://kommentit.suomi.fi/
${GROUPMANAGEMENT_ENVIRONMENT_URL}    https://rhp.suomi.fi/
${SELENIUM_SPEED}    0.5
#Buttons and links
${PROVIDER_DDL}    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList
${CONTINUE_LOGIN_BTN}    id=ContentPlaceHolder1_Button1
${ID_ELEMENT_HOOK_XPATH}    //*[@id="identifierId"]
${ID_ELEMENT_HOOK}    id=identifierId
${PASSWORD_ELEMENT_HOOK}    //*[contains(@name,'password')]
${ID_NEXT_ELEMENT_HOOK}    id=identifierNext
${PASSWORD_NEXT_ELEMENT_HOOK}    id=passwordNext
${GOOGLE_LOGIN_SELECTION}    https://googlelogin.eduuni.fi
${NAVIGATION_MENU_DDL}    id=app_menu_dropdown
${NAVIGATION_LOGIN_LINK}    id=navigation_login_link
${LOGIN_LINK}     id=log_in_link
${LOGIN_MODAL_BTN}    id=login_modal_button
${ENVIRONMENT_IDENTIFIER}    DEV
${TOOL}           Koodistot

*** Keywords ***
Open Tool
    [Arguments]    ${ENV}
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENV}    browser=${BROWSER}
    Set Selenium Speed    ${SELENIUM_SPEED}
    Sleep    2
    ${has_eDuuni_login}=    Run Keyword And Return Status    Page Should Contain    Sign In
    run keyword if    ${has_eDuuni_login}    eDuuni Login
    ...    ELSE    Login

Login
    ${login_link}=    Get WebElement    //*[contains(@id,'in_link')]
    Wait Until Element Is Enabled    ${login_link}    timeout=30
    Click element    ${login_link}
    Wait Until Element Is Enabled    ${LOGIN_MODAL_BTN}    timeout=30
    Click element    ${LOGIN_MODAL_BTN}
    eDuuni Login

eDuuni Login
    Wait Until Element Is Enabled    ${PROVIDER_DDL}    timeout=30
    Click Element    ${PROVIDER_DDL}
    Select From List By Value    ${PROVIDER_DDL}    ${GOOGLE_LOGIN_SELECTION}
    Wait Until Element Is Enabled    ${CONTINUE_LOGIN_BTN}    timeout=30
    Click Element    ${CONTINUE_LOGIN_BTN}
    ${has_id_element}=    Run Keyword And Return Status    Page Should Contain Element    ${ID_ELEMENT_HOOK}    limit=1
    run keyword if    ${has_id_element}    Login With Id Field Id
    ...    ELSE    Login With Id Field Xpath

Login With Id Field Id
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK}    timeout=20
    Input text    ${ID_ELEMENT_HOOK}    ${TEST_EMAIL}
    Continue Login

Login With Id Field Xpath
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK_XPATH}
    Input text    ${ID_ELEMENT_HOOK_XPATH}    ${TEST_EMAIL}
    Continue Login

Continue Login
    Wait Until Element Is Enabled    ${ID_NEXT_ELEMENT_HOOK}    timeout=20
    Click element    ${ID_NEXT_ELEMENT_HOOK}
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK}    timeout=20
    Input text    ${PASSWORD_ELEMENT_HOOK}    ${TEST_PASSWORD}
    Wait Until Element Is Enabled    ${PASSWORD_NEXT_ELEMENT_HOOK}    timeout=20
    Click Element    ${PASSWORD_NEXT_ELEMENT_HOOK}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENV}
