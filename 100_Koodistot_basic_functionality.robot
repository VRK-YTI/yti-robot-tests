*** Settings ***
Documentation     Test Suite for Koodistot basic functionality
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Terminologies_resources.robot

*** Variables ***
${navigation_menu_link}    Käyttäjätiedot
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.
#Excel paths

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly. YTI-460
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    id=information_link    timeout=20
    Click Element    id=information_link
    Wait Until Page Contains    Tietoa Koodistoista    timeout=30
    Wait Until Page Contains    Hyödyt käyttäjille    timeout=30
    Wait Until Page Contains    Miten Koodistot-työkalu toimii?    timeout=30
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi    timeout=30
    Wait Until Page Contains    Katso myös    timeout=30
    Wait Until Page Contains    Ota yhteyttä    timeout=30
    [Teardown]    Return to Koodistot frontpage

101. Open EUPL-1.2 licence page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-457, YTI-877.
    [Tags]    regression    test    100    koodistot
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    ${EUPL_LICENCE_PAGE}    timeout=20
    Click Element    ${EUPL_LICENCE_PAGE}
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly. YTI-459
    [Tags]    local
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    id=description_of_file_link    timeout=20
    Click Element    id=description_of_file_link
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Close All Browsers

103. Search for VALID code list
    [Documentation]    Search for VALID code list with frontpage search function.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Return to Koodistot frontpage
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_6}
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_6}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_6}")]
    Wait Until Page Contains    ${CODE_LIST_6}    timeout=20
    Wait Until Page Contains Element    id=content_language_dropdown_button    timeout=20
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${CODE_1}")]
    Wait Until Page Contains    ${CODE_1}    timeout=20
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    testiautomaatiokoodisto 2    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    koodi01    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Koodi01    timeout=20
    Wait Until Page Contains    Tila    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Wait Until Page Contains    Viimeisin muokkaus    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_6}

104. Search for code list with codeValue
    [Documentation]    Search for code list with codeValue with frontpage search function. YTI-651
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Testikoodisto_T200}    ${CODE_LIST_7}
    Return to Koodistot frontpage
    Wait Until Page Contains Element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click Element    ${STATUS_DROPDOWN_BTN}
    Click Element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_7}
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_7}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_7}")]
    Wait Until Page Contains Element    id=content_language_dropdown_button    timeout=20
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Wait Until Page Contains    ${CODE_LIST_7}    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains    Tunnus    timeout=20
    Wait Until Page Contains    T200    timeout=20
    Wait Until Page Contains    Rekisteri    timeout=20
    Wait Until Page Contains    Testirekisteri    timeout=20
    Wait Until Page Contains    Tietoalue    timeout=20
    Wait Until Page Contains    Eläkkeet    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_7}

105. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Change UI Language    ${LANGUAGE_EN}
    Wait Until Page Contains    ${CODE_LIST_1_EN}    timeout=30
    Wait Until Page Contains    Add code list    timeout=30
    Wait Until Page Contains    All registries    timeout=30
    Wait Until Page Contains    All organizations    timeout=30
    Wait Until Page Contains    Classification    timeout=30
    [Teardown]    Restore Finnish language

106. Export Excel and CSV for Kunnat 2018 Code list
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_1}")]
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Click Element    id=exportDropdown
    Click Element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Click Element    id=exportDropdown
    Click Element    ${EXPORT_TYPE_CSV}
    Sleep    5
    [Teardown]    Return to Koodistot frontpage

107. Export Excel and CSV for Palveluluokitus Code list
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_3}")]
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_3}")]    timeout=30
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Click Element    id=exportDropdown
    Click Element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Wait Until Page Contains Element    id=exportDropdown    timeout=20
    Click Element    id=exportDropdown
    Click Element    ${EXPORT_TYPE_CSV}
    Sleep    5
    [Teardown]    Return to Koodistot frontpage

109. Check ChangeNote information from code list
    [Documentation]    Check ChangeNote information from Code list. YTI-489
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_5}
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_5}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_5}")]
    Wait Until Page Contains    ${CODE_LIST_5}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains    Muutostieto
    [Teardown]    Return to Koodistot frontpage

110. Search for code list and extend search to codes
    [Documentation]    Search for code list with frontpage search function and extend search to codes.
    ...    Check that the correct code list which contains the searched code is listed as a result.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_CODE_CHECKBOX}    timeout=30
    Click Element    ${SEARCH_CODE_CHECKBOX}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_2}
    Sleep    1
    Wait Until Element Is Enabled    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait Until Page Contains    ${CODE_LIST_2}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${TEST_CODE_3}")]    timeout=30
    Click Element    //*[contains(text(), "${TEST_CODE_3}")]
    Wait Until Page Contains    ${TEST_CODE_3}    timeout=30
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    testiautomaatiokoodisto1    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    Koodi1006    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Koodi1006    timeout=20
    Wait Until Page Contains    Tila    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20
    Wait Until Page Contains    Viimeisin muokkaus    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

111. Filter Codes by codeValue and prefLabel
    [Documentation]    Import codelist and filter Codes by codeValue and prefLabel
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_filter}    ${CODE_LIST_13}
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_13}
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_13}")]    timeout=30
    Click Element    //*[contains(text(), "${CODE_LIST_13}")]
    Wait Until Page Contains    ${CODE_LIST_13}
    Wait Until Page Contains Element    ${SEARCH_CODE_BOX_INPUT}
    Input Text    ${SEARCH_CODE_BOX_INPUT}    t52
    Wait Until Page Contains Element    //*[contains(text(), "${TEST_CODE_4}")]
    Wait Until Page Contains Element    ${SEARCH_CODE_BOX_INPUT}
    Input Text    ${SEARCH_CODE_BOX_INPUT}    testi06
    Wait Until Page Contains Element    //*[contains(text(), "${TEST_CODE_5}")]
    Click Element    //*[contains(text(), "${TEST_CODE_5}")]
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    Sisällön filteröinti    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    T56    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Testi06    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_13}

112. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=40
    Wait Until Page Contains    Nimi    timeout=40
    Wait Until Page Contains    Sähköposti    timeout=40
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=40
    Select navigation menu link    Rekisterit
    Wait Until Page Contains    Rekisterit    timeout=40
    Wait Until Page Contains Element    ${REGISTRY_DDL}    timeout=40
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    url=${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait Until Page Contains    Sanastot    timeout=40
    Wait Until Page Contains    Hae sanastoja    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    url=${DATA_VOCABULARIES_ENVIRONMENT_URL}
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link    Suomi.fi-kommentit
    Select Window    url=${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains    Kommentit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Close All Browsers

113. Change content language for code list
    [Documentation]    Change content language for code list and check
    ...    that language change applies to code level as well. YTI-1053
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_test_dcat}    ${CODE_LIST_20}
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=20
    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Wait Until Page Contains Element    //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    timeout=20
    Click Element    //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    Test dataset classification    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    AGRI    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Agriculture, fisheries, forestry and food    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=20
    Wait Until Page Contains    URI    timeout=20
    Wait Until Page Contains    Viimeisin muokkaus    timeout=20
    Wait Until Page Contains Element    ${2_BREADCRUMB_LINK}    timeout=20
    Click Element    ${2_BREADCRUMB_LINK}
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus    timeout=20
    Wait Until Page Contains    dcat01    timeout=20
    Wait Until Page Contains    Koodiston nimi    timeout=20
    Wait Until Page Contains    Test dataset classification    timeout=20
    Wait Until Page Contains    Rekisteri    timeout=20
    Wait Until Page Contains    Test registry    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_20}

114. Check user interface language and content language in page reload
    [Documentation]    Check that user interface language and content language settings are correct after page reload. YTI-1222.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_test_dcat}    ${CODE_LIST_20}
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=20
    Change UI Language    ${LANGUAGE_EN}
    Wait Until Page Contains    Test dataset classification    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    timeout=30
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30
    Reload Page
    Wait Until Page Contains    Test dataset classification    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    timeout=30
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30
    Change UI Language    ${LANGUAGE_FI}
    Wait Until Page Contains    Testi dcat    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "KOODIT")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Testirekisteri")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Yleiset tieto- ja hallintopalvelut")]    timeout=30
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30
    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Wait Until Page Contains Element    //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    timeout=20
    Click Element    //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]
    Wait Until Page Contains    Koodisto    timeout=30
    Wait Until Page Contains    Test dataset classification    timeout=30
    Wait Until Page Contains    Koodin arvo    timeout=30
    Wait Until Page Contains    AGRI    timeout=30
    Wait Until Page Contains    Koodin nimi    timeout=30
    Wait Until Page Contains    Agriculture, fisheries, forestry and food    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    Viimeisin muokkaus    timeout=30
    Reload Page
    Wait Until Page Contains    Koodisto    timeout=30
    Wait Until Page Contains    Test dataset classification    timeout=30
    Wait Until Page Contains    Koodin arvo    timeout=30
    Wait Until Page Contains    AGRI    timeout=30
    Wait Until Page Contains    Koodin nimi    timeout=30
    Wait Until Page Contains    Agriculture, fisheries, forestry and food    timeout=30
    Wait Until Page Contains    Voimassa oleva    timeout=30
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    Viimeisin muokkaus    timeout=30
    Wait Until Page Contains Element    ${2_BREADCRUMB_LINK}    timeout=20
    Click Element    ${2_BREADCRUMB_LINK}
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus    timeout=30
    Wait Until Page Contains    dcat01    timeout=30
    Wait Until Page Contains    Koodiston nimi    timeout=30
    Wait Until Page Contains    Test dataset classification    timeout=30
    Wait Until Page Contains    Rekisteri    timeout=30
    Wait Until Page Contains    Test registry    timeout=30
    Wait Until Page Contains    Tietoalue    timeout=30
    Wait Until Page Contains    Yleiset tieto- ja hallintopalvelut    timeout=30
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_20}

115. Check the visibility of the INCOMPLETE status code list
    [Documentation]    Check that code list with INCOMPLETE status is visible
    ...    in frontpage search for certain users only. YTI-903.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_codes_incomplete}    ${CODE_LIST_26}
    Return to Koodistot frontpage
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Select user    ${CODELIST_USER_ID}    ${CODELIST_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Select user    ${DATAMODEL_USER_ID}    ${DATAMODEL_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Select user    ${NO_GROUP_USER_ID}    ${NO_GROUP_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.    timeout=30
    Select user    ${MEMBER_USER_ID}    ${MEMBER_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Select user    ${TERMINOLOGY_USER_ID}    ${TERMINOLOGY_USER_NAME}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_26}
    Wait Until Page Contains    1 hakutulos    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_26}

*** Keywords ***
Restore Finnish language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}    timeout=30
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    1
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    ${CODE_LIST_1}
    Wait Until Page Contains    Kaikki tilat    timeout=30
    Wait Until Page Contains    Kaikki rekisterit    timeout=30
    Wait Until Page Contains    Kaikki organisaatiot    timeout=30
    Wait Until Page Contains    Luokitus    timeout=30
    Close All Browsers
