*** Settings ***
Documentation     Test Suite for Koodistot basic functionality
Suite Teardown    Close All Browsers
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${BROWSER}        chrome
${USER_1}         Testi Admin
${CODE_LIST_1}    Kunnat 2017
${CODE_LIST_1_EN}    Municipalities 2017
${CODE_LIST_2}    Kunnat 2018
${CODE_LIST_3}    Palveluluokitus
${CODE_LIST_5}    Ammattiluokitus 2010
${CODE_LIST_7}    T200
${MUNICIPALITY}    091 - Helsinki
${MUNICIPALITY2}    092 - Vantaa
${MUNICIPLALITY_SV}    091 - Helsingfors
${LANGUAGE_FI}    Suomeksi (FI)
${LANGUAGE_EN}    In English (EN)
${LANGUAGE_SV}    På svenska (SV)
${MUNICIPALITY_NAME_SV}    Helsingfors
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
${EXPORT_TYPE_EXCEL}    Excel
${EXPORT_TYPE_CSV}    CSV
${USER_RIGHT_MANAGEMENT_FI}    Oikeuksienhallinta
${USER_RIGHT_MANAGEMENT_EN}    User right management
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    //*[@class="dropdown-toggle nav-link btn btn-language dropdown-toggle"]
${STATUS_DROPDOWN_BTN}    css=app-filter-dropdown.d-inline-block:nth-child(3)

*** Test Cases ***
100. Open Information about the web service page
    [Documentation]    Verify that Information about the web service page is opened correctly. YTI-460
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    xpath=//app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=10
    Click element    xpath=//app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten palvelu toimii?
    Wait until page contains    Nykytilanne
    Wait until page contains    Miten voin liittyä palvelun käyttäjäksi?
    [Teardown]    Go back to Koodistot frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly. YTI-457
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    xpath=//app-root/app-footer/div/div[2]/div[3]/a    timeout=10
    Click element    xpath=//app-root/app-footer/div/div[2]/div[3]/a
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=Koodistot
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly. YTI-459
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    xpath=//app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a    timeout=10
    Click element    xpath=//app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=Koodistot
    Close All Browsers

103. Search for VALID code list
    [Documentation]    Search for VALID code list with frontpage search function.
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_1}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_1}")]
    Sleep    2
    Wait until page contains    ${CODE_LIST_1}
    Wait until page contains element    id=contentLanguageDropdown
    Wait until page contains element    id=exportDropdown
    Click element    //*[contains(text(), "${MUNICIPALITY}")]
    Wait until page contains    ${MUNICIPALITY}
    Wait until page contains    Koodisto
    Wait until page contains    Kunnat 2017
    Wait until page contains    Tunnus
    Wait until page contains    091
    Wait until page contains    Koodin nimi
    Wait until page contains    Helsinki
    Wait until page contains    Tila
    Wait until page contains    Voimassa oleva
    Wait until page contains    Viimeisin muokkaus
    Wait until page contains    Voimassa oleva
    [Teardown]    Go back to Koodistot frontpage

104. Search for code list with codeValue
    [Documentation]    Search for code list with codeValue with frontpage search function. YTI-651
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_7}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_7}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_7}")]
    Sleep    2
    Wait until page contains element    id=contentLanguageDropdown
    Wait until page contains element    id=exportDropdown
    Wait until page contains    ${CODE_LIST_7}
    Wait until page contains element    //*[contains(text(), "KOODIT")]
    Wait until page contains element    //*[contains(text(), "TIEDOT")]
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Tunnus
    Wait until page contains    T200
    Wait until page contains    Rekisteri
    Wait until page contains    Testirekisteri
    Wait until page contains    Luokitus
    Wait until page contains    Eläkkeet
    [Teardown]    Go back to Koodistot frontpage

105. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click element    //*[contains(text(), "${LANGUAGE_EN}")]
    Wait until page contains    ${CODE_LIST_1_EN}
    Wait until page contains    Add code list
    Wait until page contains    All registries
    Wait until page contains    All organizations
    Wait until page contains    Classification
    #Click element    //*[@class="dropdown-toggle nav-link btn btn-language dropdown-toggle"]
    #Sleep    1
    #Click element    //*[contains(text(), "${languageSV}")]
    #Wait until page contains    ${MUNICIPALITY_SV}
    #Wait until page contains    ${municipalityNameSV}
    [Teardown]    Restore Finnish language

106. Export Excel and CSV for Kunnat 2017 Code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_1}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Wait until page contains element    id=exportDropdown    timeout=10
    Click element    id=exportDropdown
    Click element    //*[contains(text(), "${EXPORT_TYPE_EXCEL}")]
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=10
    Click element    id=exportDropdown
    Click element    //*[contains(text(), "${EXPORT_TYPE_CSV}")]
    Sleep    5
    [Teardown]    Go back to Koodistot frontpage

107. Export Excel and CSV for Palveluluokitus Code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_3}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Wait until page contains element    id=exportDropdown    timeout=10
    Click element    id=exportDropdown
    Click element    //*[contains(text(), "${EXPORT_TYPE_EXCEL}")]
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=10
    Click element    id=exportDropdown
    Click element    //*[contains(text(), "${EXPORT_TYPE_CSV}")]
    Sleep    5
    [Teardown]    Go back to Koodistot frontpage

108. Check User right management link
    [Documentation]    Check User right management link functionality. YTI-449
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait until page contains element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)    timeout=10
    Click element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)
    Click element    //*[contains(text(), "${USER_RIGHT_MANAGEMENT_FI}")]
    #Select Window    title=Yhteentoimivuusalustan oikeuksienhallinta
    #Wait until page contains    Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    2
    Select Window    title=Koodistot
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click element    //*[contains(text(), "${LANGUAGE_EN}")]
    Wait until page contains    ${CODE_LIST_1_EN}
    Wait until page contains element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)    timeout=10
    Click element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)
    Click element    //*[contains(text(), "${USER_RIGHT_MANAGEMENT_EN}")]
    Sleep    2
    Select Window    title=Koodistot
    [Teardown]    Restore Finnish language

109. Check ChangeNote information from code list
    [Documentation]    Check ChangeNote information from Code list. YTI-489
    [Tags]    regression
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_5}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_5}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_5}")]
    Sleep    2
    Wait until page contains    ${CODE_LIST_5}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Muutostieto
    [Teardown]    Go back to Koodistot frontpage

*** Keywords ***
Test Case Setup
    Open Koodistot
    Choose user

Open Koodistot
    Open Koodistot in '${BROWSER}'
    Sleep    1

Choose user
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    //*[@class="nav-link dropdown-toggle"]
    Sleep    1
    Click element    //*[contains(text(), "${USER_1}")]
    Wait Until Page Contains    ${USER_1}
    Reload Page
    Sleep    2

Open Koodistot in '${BROWSER}'
    Open koodistot in dev-environment    ${BROWSER}
    Sleep    2
    Page should contain    Koodistot
    #Page should contain    Luokitus
    Page should contain    KIRJAUDU SISÄÄN

Open koodistot in dev-environment
    [Arguments]    ${browser}
    Set Selenium Speed    0.3
    Open Browser    https://koodistot-dev.suomi.fi/    browser=${browser}

Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click element    //*[contains(text(), "${LANGUAGE_FI}")]
    Close All Browsers

Go back to Koodistot frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=10
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers
