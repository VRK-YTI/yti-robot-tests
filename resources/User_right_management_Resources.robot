*** Settings ***
Documentation     Resource file for User right management application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${GROUPMANAGEMENT_ENVIRONMENT_URL}    https://rhp.dev.yti.cloud.vrk.fi/
${LANGUAGE_EN}    id=en_available_language
${LANGUAGE_FI}    id=fi_available_language
${ORGANIZATION_1}    Testiorganisaatio
#Buttons and links
${INFORMATION_LINK}    id=information_link
${PROVIDER_DDL}    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList
${CONTINUE_LOGIN_BTN}    id=ContentPlaceHolder1_Button1
${ID_ELEMENT_HOOK_2}    id=Email
${ID_NEXT_ELEMENT_HOOK_2}    id=next
${PASSWORD_ELEMENT_HOOK_2}    id=Passwd-hidden
${SIGN_IN_HOOK_2}    id=signIn
${ID_ELEMENT_HOOK}    id=identifierId
${PASSWORD_ELEMENT_HOOK}    //*[contains(@name,'password')]
${ID_NEXT_ELEMENT_HOOK}    id=identifierNext
${PASSWORD_NEXT_ELEMENT_HOOK}    id=passwordNext
${GOOGLE_LOGIN_SELECTION}    https://googlelogin.eduuni.fi
${NAVIGATION_MENU_DDL}    id=app_menu_dropdown
${NAVIGATION_LOGIN_LINK}    id=navigation_login_link
${LOGIN_LINK}     id=log_in_link
${LOGIN_MODAL_BTN}    id=login_modal_button
${ENVIRONMENT_IDENTIFIER}    AWSDEV
${TOOL}           Koodistot
${LANGUAGE_DROPDOWN_BTN}    id=lang_selection_dropdown
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
${NAVIGATION_LOGIN_LINK}    id=log_in_link
${LOGIN_MODAL_BTN}    id=login_modal_button
${ENVIRONMENT_IDENTIFIER}    AWSDEV
${EUPL_LICENCE_LINK}    id=license_link

*** Keywords ***
Test Case Setup
    Open RHP

Open RHP
    Open Browser with Settings
    Set Selenium Speed    0.5
    ${has_eDuuni_login}=    Run Keyword And Return Status    Page Should Contain    Sign In
    Run Keyword If    ${has_eDuuni_login}    eDuuni Login
    ...    ELSE    Login

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${GROUPMANAGEMENT_ENVIRONMENT_URL}    browser=${BROWSER}

eDuuni Login
    Wait Until Element Is Enabled    ${PROVIDER_DDL}    timeout=30
    Click Element    ${PROVIDER_DDL}
    Select From List By Value    ${PROVIDER_DDL}    ${GOOGLE_LOGIN_SELECTION}
    Wait Until Element Is Enabled    ${CONTINUE_LOGIN_BTN}    timeout=30
    Click Element    ${CONTINUE_LOGIN_BTN}
    ${has_id_element}=    Run Keyword And Return Status    Page Should Contain Element    ${ID_ELEMENT_HOOK}    limit=1
    Run Keyword If    ${has_id_element}    Login With Id Field Option 1
    ...    ELSE    Login With Id Field Option 2

Login With Id Field Option 1
    Log Elements
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK}    timeout=20
    Input Text    ${ID_ELEMENT_HOOK}    ${TEST_EMAIL}
    Wait Until Element Is Enabled    ${ID_NEXT_ELEMENT_HOOK}    timeout=20
    Click Element    ${ID_NEXT_ELEMENT_HOOK}
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK}    timeout=20
    Input Text    ${PASSWORD_ELEMENT_HOOK}    ${TEST_PASSWORD}
    Wait Until Element Is Enabled    ${PASSWORD_NEXT_ELEMENT_HOOK}    timeout=20
    Click Element    ${PASSWORD_NEXT_ELEMENT_HOOK}

Login With Id Field Option 2
    Log Elements
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK_2}    timeout=20
    Input Text    ${ID_ELEMENT_HOOK_2}    ${TEST_EMAIL}
    Wait Until Element Is Enabled    ${ID_NEXT_ELEMENT_HOOK_2}    timeout=20
    Click Element    ${ID_NEXT_ELEMENT_HOOK_2}
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK_2}    timeout=20
    Input Text    ${PASSWORD_ELEMENT_HOOK_2}    ${TEST_PASSWORD}
    Wait Until Element Is Enabled    ${SIGN_IN_HOOK_2}    timeout=20
    Click Element    ${SIGN_IN_HOOK_2}

Login
    Wait Until Page Contains Element    ${LOGIN_LINK}    timeout=30
    Click Element    ${LOGIN_LINK}
    Wait Until Page Contains Element    ${LOGIN_MODAL_BTN}    timeout=30
    Click Element    ${LOGIN_MODAL_BTN}
    eDuuni Login

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${GROUPMANAGEMENT_ENVIRONMENT_URL}

Go back to RHP frontpage
    Wait Until Page Contains Element    //*[contains(text(), "Etusivu")]    timeout=20
    Click Element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers

Log Elements
    ${elements}=    Get WebElements    //input
    Log To Console    Input elements
    FOR    ${element}    IN    @{elements}
        Log To Console    ID: ${element.get_attribute('id')}
        Log To Console    Type: ${element.get_attribute('type')}
    END
