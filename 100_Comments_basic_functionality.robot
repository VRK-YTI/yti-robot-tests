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
    Wait Until Page Contains Element    ${INFORMATION_LINK}    timeout=30
    Click Element    ${INFORMATION_LINK}
    Wait Until Page Contains    Tietoa Kommentointikierroksesta
    Wait Until Page Contains    Katso myös
    Wait Until Page Contains    Ota yhteyttä
    [Teardown]    Return to Comments frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    ${LICENSE_LINK}    timeout=20
    Click Element    ${LICENSE_LINK}
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30
    Log To Console    EUPL licence page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly
    [Tags]    local
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    ${DESCRIPTION_OF_FILE_LINK}    timeout=20
    Click Element    ${DESCRIPTION_OF_FILE_LINK}
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    1
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    ...    Check that language settings do not change in page reload.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}    timeout=20
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Element Is Visible    ${LANGUAGE_EN}    timeout=20
    Click Element    ${LANGUAGE_EN}
    Wait Until Page Contains    Comments - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Add new comment round    timeout=30
    Wait Until Page Contains    All tools    timeout=30
    Wait Until Page Contains    All organizations    timeout=30
    Wait Until Page Contains    All statuses    timeout=30
    Reload Page
    Wait Until Page Contains    Add new comment round    timeout=30
    Wait Until Page Contains    All tools    timeout=30
    Wait Until Page Contains    All organizations    timeout=30
    Wait Until Page Contains    All statuses    timeout=30
    Sleep    1
    [Teardown]    Restore Finnish language

104. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Sähköposti    timeout=20
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=20
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Select navigation menu link    Suomi.fi-koodistot
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=40
    Wait Until Page Contains    Hae koodistoa    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Sanastot    timeout=40
    Wait Until Page Contains    Hae sanastoja    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Sleep    1
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Element Is Visible    ${LANGUAGE_FI}    timeout=20
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    Kommentit - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Luo uusi kommentointikierros    timeout=30
    Wait Until Page Contains    Kaikki työkalut    timeout=20
    Wait Until Page Contains    Kaikki organisaatiot    timeout=20
    Wait Until Page Contains    Kaikki tilat    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
