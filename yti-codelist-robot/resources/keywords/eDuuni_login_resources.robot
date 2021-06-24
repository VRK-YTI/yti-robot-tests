*** Settings ***
Documentation     Resource file for eDuuni login

*** Variables ***
${SELENIUM_SPEED}    0.5
#Buttons and links
${PROVIDER_DDL}    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList
${CONTINUE_LOGIN_BTN}    id=ContentPlaceHolder1_Button1
${ID_ELEMENT_HOOK_2}    id=Email
${ID_NEXT_ELEMENT_HOOK_2}    id=next
${PASSWORD_ELEMENT_HOOK_2}    //*[contains(@type,'password')]
${SIGN_IN_HOOK_2}    //*[contains(@type,'submit')]
${ID_ELEMENT_HOOK}    id=identifierId
${PASSWORD_ELEMENT_HOOK}    //*[contains(@name,'password')]
${ID_NEXT_ELEMENT_HOOK}    id=identifierNext
${PASSWORD_NEXT_ELEMENT_HOOK}    id=passwordNext
${GOOGLE_LOGIN_SELECTION}    https://googlelogin.eduuni.fi
${NAVIGATION_LOGIN_LINK}    id=navigation_login_link
${LOGIN_LINK}     id=log_in_link
${LOGIN_MODAL_BTN}    id=login_modal_button
${TOOL}           Koodistot

*** Keywords ***
Open Tool
    [Arguments]    ${environment_url}
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment    ${environment_url}
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment    ${environment_url}
    ...    ELSE    Open Browser    ${environment_url}    browser=${BROWSER}
    Set Selenium Speed    ${SELENIUM_SPEED}
    Sleep    2
    ${has_eDuuni_login}=    Run Keyword And Return Status    Page Should Contain    Sign In
    Run Keyword If    ${has_eDuuni_login}    eDuuni Login
    ...    ELSE    Login

Login
    ${login_link}=    Get WebElement    //*[contains(@id,'in_link')]
    Wait Until Element Is Enabled    ${login_link}    timeout=30
    Click Element    ${login_link}
    Wait Until Element Is Enabled    ${LOGIN_MODAL_BTN}    timeout=30
    Click Element    ${LOGIN_MODAL_BTN}
    eDuuni Login

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
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK}    timeout=20
    Sleep    1
    Input Text    ${ID_ELEMENT_HOOK}    ${TEST_EMAIL}
    Wait Until Element Is Enabled    ${ID_NEXT_ELEMENT_HOOK}    timeout=20
    Click Element    ${ID_NEXT_ELEMENT_HOOK}
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK}    timeout=20
    Sleep    1
    Input Text    ${PASSWORD_ELEMENT_HOOK}    ${TEST_PASSWORD}
    Wait Until Element Is Enabled    ${PASSWORD_NEXT_ELEMENT_HOOK}    timeout=20
    Click Element    ${PASSWORD_NEXT_ELEMENT_HOOK}

Login With Id Field Option 2
    Wait Until Element Is Enabled    ${ID_ELEMENT_HOOK_2}    timeout=20
    Sleep    1
    Input Text    ${ID_ELEMENT_HOOK_2}    ${TEST_EMAIL}
    Wait Until Element Is Enabled    ${ID_NEXT_ELEMENT_HOOK_2}    timeout=20
    Click Element    ${ID_NEXT_ELEMENT_HOOK_2}
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK_2}    timeout=20
    Sleep    1
    Input Text    ${PASSWORD_ELEMENT_HOOK_2}    ${TEST_PASSWORD}
    Wait Until Element Is Enabled    ${SIGN_IN_HOOK_2}    timeout=20
    Click Element    ${SIGN_IN_HOOK_2}