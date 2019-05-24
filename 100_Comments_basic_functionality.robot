*** Settings ***
Documentation     Test Suite for Comment Round Tool basic functionality
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait until page contains element    ${INFORMATION_LINK}    timeout=30
    Click element    ${INFORMATION_LINK}
    Wait until page contains    Tietoa Kommentointikierroksesta
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Return to Comments frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait until page contains element    ${LICENSE_LINK}    timeout=20
    Click element    ${LICENSE_LINK}
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2    timeout=20
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly
    [Tags]    local
    [Setup]    Test Case Setup Admin
    Wait until page contains element    ${DESCRIPTION_OF_FILE_LINK}    timeout=20
    Click element    ${DESCRIPTION_OF_FILE_LINK}
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    1
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    ...    Check that language settings do not change in page reload.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}    timeout=20
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Element Is Visible    ${LANGUAGE_EN}    timeout=20
    Click element    ${LANGUAGE_EN}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://kommentit-test.suomi.fi/"    Wait until page contains    Comments - TEST    timeout=30
    ...    ELSE    Wait until page contains    Comments - DEV    timeout=30
    Wait until page contains    Add new comment round    timeout=30
    Wait until page contains    All tools    timeout=30
    Wait until page contains    All organizations    timeout=30
    Wait until page contains    All statuses    timeout=30
    Reload Page
    Wait until page contains    Add new comment round    timeout=30
    Wait until page contains    All tools    timeout=30
    Wait until page contains    All organizations    timeout=30
    Wait until page contains    All statuses    timeout=30
    Sleep    1
    [Teardown]    Restore Finnish language

104. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Sähköposti    timeout=20
    Wait until page contains    Organisaatiot ja toolkit    timeout=20
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit
    Select navigation menu link    Suomi.fi-koodistot
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Koodistot
    Wait until page contains    Koodistot    timeout=40
    Wait until page contains    Hae koodistoa    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Sanastot
    Wait until page contains    Sanastot    timeout=40
    Wait until page contains    Hae sanastoja    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Tietomallit
    Wait until page contains    Tietomallit    timeout=40
    Wait until page contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Kommentit
    Sleep    1
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Element Is Visible    ${LANGUAGE_FI}    timeout=20
    Click element    ${LANGUAGE_FI}
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://kommentit-test.suomi.fi/"    Wait until page contains    Kommentit - TEST    timeout=30
    ...    ELSE    Wait until page contains    Kommentit - DEV    timeout=30
    Wait until page contains    Luo uusi kommentointikierros    timeout=30
    Wait until page contains    Kaikki työkalut    timeout=20
    Wait until page contains    Kaikki organisaatiot    timeout=20
    Wait until page contains    Kaikki tilat    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
