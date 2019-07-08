*** Settings ***
Documentation     Test Suite for basic functionality of User right management application
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/User_right_management_Resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=20
    Click Element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait Until Page Contains    Tietoa yhteentoimivuusalustan oikeuksienhallinnasta (käyttövaltuuksien hallinnasta)
    Wait Until Page Contains    Katso myös
    Wait Until Page Contains    Ota yhteyttä
    [Teardown]    Go back to RHP frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    //app-root/app-footer/div/div[2]/div[3]/a    timeout=20
    Click Element    //app-root/app-footer/div/div[2]/div[3]/a
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait Until Page Contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    rhp
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a    timeout=20
    Click Element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Page Contains Element    ${LANGUAGE_EN}
    Click Element    ${LANGUAGE_EN}
    Wait Until Page Contains    ORGANIZATIONS    timeout=20
    Wait Until Page Contains    USERS    timeout=20
    [Teardown]    Restore Finnish language

104. Search organization
    [Documentation]    Search for organization with frontpage search function.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${ORGANIZATION_1}
    Wait Until Page Contains Element    //*[contains(text(), "${ORGANIZATION_1}")]    timeout=30
    Click Element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait Until Page Contains    ${ORGANIZATION_1}    timeout=30
    Wait Until Page Contains Element    ${EDIT_ORGANIZATION_BTN}    timeout=30
    [Teardown]    Go back to RHP frontpage

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=40
    Wait Until Page Contains    Nimi    timeout=40
    Wait Until Page Contains    Sähköposti    timeout=40
    Wait Until Page Contains    Organisaatio ja roolit    timeout=40
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Sanastot    timeout=40
    Wait Until Page Contains    Hae sanastoja    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Page Contains Element    ${LANGUAGE_FI}
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    ORGANISAATIOT    timeout=20
    Wait Until Page Contains    KÄYTTÄJÄT    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
