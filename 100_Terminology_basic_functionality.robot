*** Settings ***
Documentation     Test Suite for basic functionality of Terminology application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    id=information_link    timeout=20
    Click element    id=information_link
    Wait until page contains    Tietoa Sanastoista
    Wait until page contains    Sanastot-työkalu on tarkoitettu
    Wait until page contains    Sanastot-työkalulla
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten voin liittyä työkalun käyttäjäksi?
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    Log to Console    Information about the service page opened
    Go back to Sanastot frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    id=license_link    timeout=20
    Click element    id=license_link
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Log to Console    EUPL-1.2 license page opened
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Sanastot
    ...    ELSE    Select Window    title=TEST - Sanastot

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    id=description_of_file_link    timeout=20
    Click element    id=description_of_file_link
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Log to Console    Description of file page opened
    Select Window    title=DEV - Sanastot

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    Search terminologies    timeout=20
    Wait until page contains    Filter with information domain
    Log to Console    User interface language changed
    [Teardown]    Restore Finnish language

104. Search for DRAFT vocabulary
    [Documentation]    Search for DRAFT vocabulary with frontpage search function.
    [Tags]    regression    sanastot    test
    [Setup]    Test Case Setup Create Testiautomaatiosanasto
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Wait until page contains element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    Log to Console    Testiautomaatiosanasto found
    Go back to Sanastot frontpage
    [Teardown]    Delete Testiautomaatiosanasto

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot
    Wait until page contains    Nimi
    Wait until page contains    Testi Admin
    Wait until page contains    Sähköposti
    Wait until page contains    Organisaatiot ja roolit
    Wait until page contains    Lähetä käyttöoikeuspyyntö
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Sanastot
    ...    ELSE    Select Window    title=TEST - Sanastot
    Select navigation menu link    Suomi.fi-koodistot
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Koodistot
    ...    ELSE    Select Window    title=TEST - Koodistot
    Wait until page contains    Koodistot    timeout=40
    Wait until page contains    Hae koodistoa    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Sanastot
    ...    ELSE    Select Window    title=TEST - Sanastot
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=Tietomallit
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://sanastot-dev.suomi.fi/"    Select Window    title=DEV - Sanastot
    ...    ELSE    Select Window    title=TEST - Sanastot
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    Kaikki organisaatiot    timeout=20
    Wait until page contains    Rajaa tietoalueella    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
