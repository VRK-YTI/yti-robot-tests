*** Settings ***
Documentation     Resource file for User right management application
Library           SeleniumLibrary

*** Variables ***
${LANGUAGE_EN}    id=en_available_language
${LANGUAGE_FI}    id=fi_available_language
${ORGANIZATION_1}    Testiorganisaatio
#Buttons and links
${INFORMATION_LINK}    id=information_link
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
${NAVIGATION_MENU_DDL}    id=app_menu_dropdown
${NAVIGATION_LOGIN_LINK}    id=navigation_login_link
${LOGIN_LINK}     id=log_in_link
${LOGIN_MODAL_BTN}    id=login_modal_button
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
${EUPL_LICENCE_LINK}    id=license_link

*** Keywords ***
Test Case Setup
    Open RHP
    Click Element that contains text        Esiinny käyttäjänä
    Click Element that contains text         Test Admin

Open RHP
    Open Browser with Settings      ${GROUPMANAGEMENT_ENVIRONMENT_URL}
    Set Selenium Speed    0.5

eDuuni Login
    Click Element with wait    ${PROVIDER_DDL}                                          timeout=30
    Select From List By Value    ${PROVIDER_DDL}    ${GOOGLE_LOGIN_SELECTION}
    Click Element with wait   ${CONTINUE_LOGIN_BTN}                                     timeout=30
    ${has_id_element}=    Run Keyword And Return Status    Page Should Contain Element    ${ID_ELEMENT_HOOK}    limit=1
    Run Keyword If    ${has_id_element}    Login With Id Field Option 1
    ...    ELSE    Login With Id Field Option 2

Login With Id Field Option 1
    Input Text with wait    ${ID_ELEMENT_HOOK}    ${TEST_EMAIL}                 timeout=20
    Click Element with wait    ${ID_NEXT_ELEMENT_HOOK}                          timeout=20
    Wait Until Element Is Enabled    ${PASSWORD_ELEMENT_HOOK}                   timeout=20
    Input Text with wait    ${PASSWORD_ELEMENT_HOOK}    ${TEST_PASSWORD}        timeout=20
    Click Element with wait   ${PASSWORD_NEXT_ELEMENT_HOOK}                     timeout=20

Login With Id Field Option 2
    Input Text with wait   ${ID_ELEMENT_HOOK_2}    ${TEST_EMAIL}                timeout=20
    Click Element witha wait    ${ID_NEXT_ELEMENT_HOOK_2}                       timeout=20
    Input Text with wait   ${PASSWORD_ELEMENT_HOOK_2}    ${TEST_PASSWORD}       timeout=20
    Click Element with wait    ${SIGN_IN_HOOK_2}                                timeout=20

Login
    Click Element with wait   ${LOGIN_LINK}             timeout=30
    Click Element with wait   ${LOGIN_MODAL_BTN}        timeout=30
