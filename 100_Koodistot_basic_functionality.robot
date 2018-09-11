*** Settings ***
Documentation     Test Suite for Koodistot basic functionality
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot

*** Variables ***
${navigation_menu_link}    Käyttäjätiedot
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly. YTI-460
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait until page contains element    id=information_link    timeout=20
    Click element    id=information_link
    Wait until page contains    Tietoa Koodistoista
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten Koodistot-työkalu toimii?
    Wait until page contains    Miten voin liittyä työkalun käyttäjäksi
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Go back to Koodistot frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly. YTI-457
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait until page contains element    id=license_link    timeout=20
    Click element    id=license_link
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=Koodistot
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly. YTI-459
    [Tags]    local
    [Setup]    Test Case Setup Admin
    Wait until page contains element    id=description_of_file_link    timeout=20
    Click element    id=description_of_file_link
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=Koodistot
    Close All Browsers

103. Search for VALID code list
    [Documentation]    Search for VALID code list with frontpage search function.
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Go back to Koodistot frontpage
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_6}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_6}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_6}")]
    Wait until page contains    ${CODE_LIST_6}
    Wait until page contains element    id=content_language_dropdown_button
    Wait until page contains element    id=exportDropdown
    Wait until page contains element    //*[contains(text(), "${CODE_1}")]
    Click element    //*[contains(text(), "${CODE_1}")]
    Wait until page contains    ${CODE_1}
    Wait until page contains    Koodisto
    Wait until page contains    testiautomaatiokoodisto 2
    Wait until page contains    Koodin arvo
    Wait until page contains    koodi01
    Wait until page contains    Koodin nimi
    Wait until page contains    Koodi01
    Wait until page contains    Tila
    Wait until page contains    Voimassa oleva
    Wait until page contains    Viimeisin muokkaus
    Wait until page contains    Voimassa oleva
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_6}

104. Search for code list with codeValue
    [Documentation]    Search for code list with codeValue with frontpage search function. YTI-651
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Testikoodisto_T200}    ${CODE_LIST_7}
    Go back to Koodistot frontpage
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_7}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_7}")]    timeout=30
    Sleep    2
    Click element    //*[contains(text(), "${CODE_LIST_7}")]
    Sleep    2
    Wait until page contains element    id=content_language_dropdown_button
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
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_7}

105. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Sleep    2
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    2
    Click element    ${LANGUAGE_EN}
    Sleep    2
    Wait until page contains    ${CODE_LIST_1_EN}    timeout=30
    Wait until page contains    Add code list    timeout=30
    Wait until page contains    All registries    timeout=30
    Wait until page contains    All organizations    timeout=30
    Wait until page contains    Classification    timeout=30
    Sleep    2
    #Click element    //*[@class="dropdown-toggle nav-link btn btn-language dropdown-toggle"]
    #Sleep    1
    #Click element    //*[contains(text(), "${languageSV}")]
    #Wait until page contains    ${MUNICIPALITY_SV}
    #Wait until page contains    ${municipalityNameSV}
    [Teardown]    Restore Finnish language

106. Export Excel and CSV for Kunnat 2018 Code list
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_1}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    5
    [Teardown]    Go back to Koodistot frontpage

107. Export Excel and CSV for Palveluluokitus Code list
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_3}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    5
    [Teardown]    Go back to Koodistot frontpage

108. Check User right management link
    [Documentation]    Check User right management link functionality. YTI-449
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait until page contains element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)    timeout=20
    Click element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)
    Click element    ${USER_RIGHT_MANAGEMENT}
    #Select Window    title=Yhteentoimivuusalustan oikeuksienhallinta
    #Wait until page contains    Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    2
    Select Window    title=Koodistot
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click element    ${LANGUAGE_EN}
    Wait until page contains    ${CODE_LIST_1_EN}
    Wait until page contains element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)    timeout=20
    Click element    css=.btn-menu > app-menu:nth-child(1) > svg:nth-child(1)
    Click element    ${USER_RIGHT_MANAGEMENT}
    Sleep    2
    Select Window    title=Koodistot
    [Teardown]    Restore Finnish language

109. Check ChangeNote information from code list
    [Documentation]    Check ChangeNote information from Code list. YTI-489
    [Tags]    regression    test
    [Setup]    Test Case Setup Admin
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_5}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_5}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_5}")]
    Sleep    2
    Wait until page contains    ${CODE_LIST_5}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Muutostieto
    [Teardown]    Go back to Koodistot frontpage

110. Search for code list and extend search to codes
    [Documentation]    Search for code list with frontpage search function and extend search to codes.
    ...    Check that the correct code list which contains the searched code is listed as a result.
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Go back to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_CODE_CHECKBOX}    timeout=30
    Click element    ${SEARCH_CODE_CHECKBOX}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_2}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_3}")]
    Click element    //*[contains(text(), "${TEST_CODE_3}")]
    Wait until page contains    ${TEST_CODE_3}
    Wait until page contains    Koodisto
    Wait until page contains    testiautomaatiokoodisto1
    Wait until page contains    Koodin arvo
    Wait until page contains    Koodi1006
    Wait until page contains    Koodin nimi
    Wait until page contains    Koodi1006
    Wait until page contains    Tila
    Wait until page contains    Luonnos
    Wait until page contains    Viimeisin muokkaus
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

111. Filter Codes by codeValue and prefLabel
    [Documentation]    Import codelist and filter Codes by codeValue and prefLabel
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_filter}    ${CODE_LIST_13}
    Go back to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_13}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_13}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_13}")]
    Wait until page contains    ${CODE_LIST_13}
    Wait until page contains element    ${SEARCH_CODE_BOX_INPUT}
    Input Text    ${SEARCH_CODE_BOX_INPUT}    t52
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_4}")]
    Sleep    1
    Wait until page contains element    ${SEARCH_CODE_BOX_INPUT}
    Input Text    ${SEARCH_CODE_BOX_INPUT}    testi06
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_5}")]
    Click element    //*[contains(text(), "${TEST_CODE_5}")]
    Wait until page contains    Koodisto
    Wait until page contains    Sisällön filteröinti
    Wait until page contains    Koodin arvo
    Wait until page contains    T56
    Wait until page contains    Koodin nimi
    Wait until page contains    Testi06
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_13}

112. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot
    Wait until page contains    Nimi
    Wait until page contains    Sähköposti
    Wait until page contains    Organisaatiot ja roolit
    Sleep    1
    Select navigation menu link    Rekisterit
    Wait until page contains    Rekisterit
    Wait until page contains element    ${REGISTRY_DDL}
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=Koodistot
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=Sanastot
    Wait until page contains    Sanastot    timeout=40
    Wait until page contains    Hae sanastoja    timeout=40
    Wait until page contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=Koodistot
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=Tietomallit
    Wait until page contains    Tietomallit    timeout=40
    Wait until page contains    Etusivu    timeout=40
    Close Window
    Select Window    title=Koodistot
    Sleep    1
    Close All Browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click element    ${LANGUAGE_FI}
    Wait until page contains    ${CODE_LIST_1}
    Wait until page contains    Kaikki tilat
    Wait until page contains    Kaikki rekisterit
    Wait until page contains    Kaikki organisaatiot
    Wait until page contains    Luokitus
    Close All Browsers

Go back to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2

Select navigation menu link
    [Arguments]    ${navigation_menu_link}=Käyttäjätiedot
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2
