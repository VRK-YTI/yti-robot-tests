*** Settings ***
Documentation     Resource file for User right management application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://rhp-dev.suomi.fi/
#${USER_1}        //a[@class='dropdown-item ng-binding ng-scope'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    id=en_available_language
${LANGUAGE_FI}    id=fi_available_language
${ORGANIZATION_1}    Testiorganisaatio
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    id=lang_selection_dropdown
#${IMPERSONATE_USER_DROPDOWN}    //application/ng-container/navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    id=search_organization_input
${ADD_ORGANIZATION_BTN}    id=add_new_organization_button
${EDIT_ORGANIZATION_BTN}    id=edit_organization_button
${ID_ELEMENT_HOOK_XPATH}    //div[1]/div[1]/div[2]/div[2]/div/div/div[2]/div/content/form/div[1]/div/div[1]/div/div[1]/input
${ID_ELEMENT_HOOK}    id=identifierId
${PASSWORD_ELEMENT_HOOK}    //*[contains(@name,'password')]
${ID_NEXT_ELEMENT_HOOK}    id=identifierNext
${PASSWORD_NEXT_ELEMENT_HOOK}    id=passwordNext
${GOOGLE_LOGIN_SELECTION}    https://googlelogin.eduuni.fi
${NAVIGATION_MENU_DDL}    id=app_menu_dropdown
${NAVIGATION_LOGIN_LINK}    id=navigation_login_link
${LOGIN_MODAL_BTN}    id=login_modal_button

*** Keywords ***
Test Case Setup
    Open RHP
    #Set Selenium Speed    0.5
    #eDuuni Login

eDuuni Login
    Set Selenium Speed    0.5
    Wait until page contains element    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList    timeout=30
    Click element    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList
    Select From List By Value    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList    ${GOOGLE_LOGIN_SELECTION}
    Wait Until Page Contains element    id=ContentPlaceHolder1_Button1    timeout=30
    Click element    id=ContentPlaceHolder1_Button1
    Sleep    5
    ${has_id_element}=    Run Keyword And Return Status    Page Should Contain Element    id=identifierId    limit=1
    run keyword if    ${has_id_element}    Login With Id Field Id
    ...    ELSE    Login With Id Field Xpath

Login With Id Field Id
    Wait Until Page Contains element    ${ID_ELEMENT_HOOK}
    Input text    ${ID_ELEMENT_HOOK}    ${TEST_EMAIL}
    Continue Login

Login With Id Field Xpath
    Wait Until Page Contains element    ${ID_ELEMENT_HOOK_XPATH}
    Input text    ${ID_ELEMENT_HOOK_XPATH}    ${TEST_EMAIL}
    Continue Login

Continue Login
    Sleep    5
    Wait Until Page Contains element    ${ID_NEXT_ELEMENT_HOOK}    timeout=20
    Click element    ${ID_NEXT_ELEMENT_HOOK}
    Sleep    5
    Wait Until Page Contains element    ${PASSWORD_ELEMENT_HOOK}    timeout=20
    Input text    ${PASSWORD_ELEMENT_HOOK}    ${TEST_PASSWORD}
    Sleep    5
    Wait Until Page Contains element    ${PASSWORD_NEXT_ELEMENT_HOOK}
    Click element    ${PASSWORD_NEXT_ELEMENT_HOOK}
    Sleep    5
    Wait Until Page Contains    Yhteentoimivuusalustan oikeuksienhallinta    timeout=20
    Sleep    5

Open RHP
    Open Browser with Settings
    Set Selenium Speed    0.5
    ${has_eDuuni_login}=    Run Keyword And Return Status    Page Should Contain    Sign In
    run keyword if    ${has_eDuuni_login}    eDuuni Login
    ...    ELSE    Login
    #Wait until page contains    Sign In    timeout=20

Login
    Wait until page contains element    ${NAVIGATION_LOGIN_LINK}    timeout=30
    Click element    ${NAVIGATION_LOGIN_LINK}
    Wait until page contains element    ${LOGIN_MODAL_BTN}    timeout=30
    Click element    ${LOGIN_MODAL_BTN}
    eDuuni Login

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

Go back to RHP frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers
