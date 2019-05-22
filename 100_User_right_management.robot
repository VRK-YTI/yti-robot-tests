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
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait until page contains    Tietoa yhteentoimivuusalustan oikeuksienhallinnasta (käyttövaltuuksien hallinnasta)
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Go back to RHP frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[3]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[3]/a
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Yhteentoimivuusalustan oikeuksienhallinta
    ...    ELSE    Select Window    title=DEV - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    rhp
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Yhteentoimivuusalustan oikeuksienhallinta
    ...    ELSE    Select Window    title=DEV - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_EN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    ORGANIZATIONS    timeout=20
    Wait until page contains    USERS    timeout=20
    [Teardown]    Restore Finnish language

104. Search organization
    [Documentation]    Search for organization with frontpage search function.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${ORGANIZATION_1}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_1}")]    timeout=30
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait until page contains    ${ORGANIZATION_1}    timeout=30
    Wait until page contains element    ${EDIT_ORGANIZATION_BTN}    timeout=30
    [Teardown]    Go back to RHP frontpage

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot    timeout=40
    Wait until page contains    Nimi    timeout=40
    Wait until page contains    Sähköposti    timeout=40
    Wait until page contains    Organisaatio ja roolit    timeout=40
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Yhteentoimivuusalustan oikeuksienhallinta
    ...    ELSE    Select Window    title=DEV - Yhteentoimivuusalustan oikeuksienhallinta
    Select navigation menu link    Suomi.fi-sanastot
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Sanastot
    ...    ELSE    Select Window    title=DEV - Sanastot
    Wait until page contains    Sanastot    timeout=40
    Wait until page contains    Hae sanastoja    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Yhteentoimivuusalustan oikeuksienhallinta
    ...    ELSE    Select Window    title=DEV - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Tietomallit
    ...    ELSE    Select Window    title=DEV - Tietomallit
    Wait until page contains    Tietomallit    timeout=40
    Wait until page contains    Etusivu    timeout=40
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://rhp-test.suomi.fi/"    Select Window    title=TEST - Yhteentoimivuusalustan oikeuksienhallinta
    ...    ELSE    Select Window    title=DEV - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_FI}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    ORGANISAATIOT    timeout=20
    Wait until page contains    KÄYTTÄJÄT    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
