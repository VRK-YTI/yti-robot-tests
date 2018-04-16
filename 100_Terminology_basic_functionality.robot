*** Settings ***
Documentation     Test Suite for basic functionality of Terminology application
Suite Teardown    Close All Browsers
Library           Selenium2Library
Library           XvfbRobot
Resource          Terminology_Resources.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait until page contains    Tietoa Sanastoista
    Wait until page contains    Sanastot-työkalu on tarkoitettu
    Wait until page contains    Sanastot-työkalulla
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten voin liittyä työkalun käyttäjäksi?
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Go back to Sanastot frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    //a[@target='_blank'][contains(text(),'Lähdekoodi on lisensoitu EUPL-1.2 -lisenssillä.')]    timeout=20
    Click element    //a[@target='_blank'][contains(text(),'Lähdekoodi on lisensoitu EUPL-1.2 -lisenssillä.')]
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=Sanastot
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    //a[@target='_blank'][contains(text(),'Tietosuojaseloste')]    timeout=20
    Click element    //a[@target='_blank'][contains(text(),'Tietosuojaseloste')]
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=Sanastot
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_EN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    All vocabulary types    timeout=20
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    Classification
    [Teardown]    Restore Finnish language

104. Search for DRAFT vocabulary
    [Documentation]    Search for DRAFT vocabulary with frontpage search function.
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Wait until page contains element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    [Teardown]    Go back to Sanastot frontpage

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_FI}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    Kaikki organisaatiot    timeout=20
    Wait until page contains    Kaikki sanastotyypit    timeout=20
    Wait until page contains    Luokitus    timeout=20
    Close All Browsers
