*** Settings ***
Documentation     Test Suite for Koodistot basic functionality
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${navigation_menu_link}    Käyttäjätiedot
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly. YTI-460
    [Tags]    regression    test    100
    Click element with wait     id=information_link    timeout=20

    Wait Until Page Contains    Tietoa Koodistoista    timeout=30
    Wait Until Page Contains    Koodistot-työkalu on tarkoitettu    timeout=30
    Wait Until Page Contains    Koodistot-työkalulla voi    timeout=30
    Wait Until Page Contains    Hyödyt käyttäjille    timeout=30
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi    timeout=30
    Wait Until Page Contains    Katso myös    timeout=30
    Wait Until Page Contains    Ota yhteyttä    timeout=30

101. Open EUPL-1.2 licence page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-457, YTI-877.
    [Tags]    regression    test    100    koodistot
    Click element with wait     ${EUPL_LICENCE_PAGE}    timeout=20

    Switch window with wait        url=https://ec.europa.eu/info/european-union-public-licence

    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30

    Switch window with wait        title=${ENVIRONMENT_IDENTIFIER} - Koodistot

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly. YTI-459
    [Tags]    regression    test    100
    Click element with wait     id=description_of_file_link    timeout=20
    Switch window with wait     url=https://wiki.dvv.fi/display/YTIJD/Tietosuojaseloste

103. Search for VALID code list
    [Documentation]    Search for VALID code list with frontpage search function.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}

    Return to Koodistot frontpage

    Input text with wait        id=search_box_input     ${CODE_LIST_6}          timeout=30
    Click element with wait     //*[contains(text(), "${CODE_LIST_6}")]         timeout=30

    Wait Until Page Contains            ${CODE_LIST_6}                          timeout=20
    Wait Until Page Contains Element    id=content_language_dropdown_button     timeout=20
    Wait Until Page Contains Element    id=exportDropdown                       timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_1}")]      timeout=20

    Click element with wait     //*[contains(text(), "${CODE_1}")]
    Wait Until Page Contains    ${CODE_1}                   timeout=20
    Wait Until Page Contains    Koodisto                    timeout=20
    Wait Until Page Contains    testiautomaatiokoodisto 2   timeout=20
    Wait Until Page Contains    Koodin arvo                 timeout=20
    Wait Until Page Contains    koodi01                     timeout=20
    Wait Until Page Contains    Koodin nimi                 timeout=20
    Wait Until Page Contains    Koodi01                     timeout=20
    Wait Until Page Contains    Tila                        timeout=20
    Wait Until Page Contains    Voimassa oleva              timeout=20
    Wait Until Page Contains    Viimeisin muokkaus          timeout=20
    Wait Until Page Contains    Voimassa oleva              timeout=20

    [Teardown]    Remove codelist teardown     testiautomaatiokoodisto2

104. Search for code list with codeValue
    [Documentation]    Search for code list with codeValue with frontpage search function. YTI-651
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist                     ${Testikoodisto_T200}    ${CODE_LIST_7}

    Return to Koodistot frontpage
    Wait Until Page Contains Element    ${STATUS_DROPDOWN_BTN}                      timeout=30

    Click element with wait             ${STATUS_DROPDOWN_BTN}
    Click element with wait             //*[contains(text(), "${ALL_STATUSES_FI}")]

    Input text with wait                ${SEARCH_BOX_INPUT}     ${CODE_LIST_7}      timeout=30

    Click element with wait             //*[contains(text(), "${CODE_LIST_7}")]     timeout=30

    Wait Until Page Contains Element    id=content_language_dropdown_button         timeout=20
    Wait Until Page Contains Element    id=exportDropdown                           timeout=20
    Wait Until Page Contains            ${CODE_LIST_7}                              timeout=20

    Click element with wait      //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains    Tunnus              timeout=20
    Wait Until Page Contains    T200                timeout=20
    Wait Until Page Contains    Rekisteri           timeout=20
    Wait Until Page Contains    Testirekisteri      timeout=20
    Wait Until Page Contains    Tietoalue           timeout=20
    Wait Until Page Contains    Eläkkeet            timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_7}

105. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    test    100
    Change UI Language          ${LANGUAGE_EN}

    Wait Until Page Contains    ${CODE_LIST_KUNNAT_EN}      timeout=30
    Wait Until Page Contains    Add code list               timeout=30
    Wait Until Page Contains    All registries              timeout=30
    Wait Until Page Contains    All organizations           timeout=30
    Wait Until Page Contains    Classification              timeout=30

106. Export Excel and CSV for Kunnat 2018 Code list
    [Tags]    regression    test    100
    Click element with wait             //*[contains(text(), "${CODE_LIST_KUNNAT}")]    timeout=30
    Wait Until Page Contains Element    id=exportDropdown    timeout=20

    Click element with wait     id=exportDropdown
    Click element with wait     ${EXPORT_TYPE_EXCEL}

    Click element with wait     id=exportDropdown    timeout=20
    Click element with wait     ${EXPORT_TYPE_CSV}   timeout=20

107. Export Excel and CSV for Palveluluokitus Code list
    [Tags]    regression    test    100
    Click element with wait             //*[contains(text(), "${CODE_LIST_3}")]    timeout=30

    Click element with wait     id=exportDropdown       timeout=20
    Click element with wait     ${EXPORT_TYPE_EXCEL}    timeout=20

    Click element with wait     id=exportDropdown       timeout=20
    Click element with wait     ${EXPORT_TYPE_CSV}      timeout=20

109. Check ChangeNote information from code list
    [Documentation]    Check ChangeNote information from Code list. YTI-489
    [Tags]    regression    test    100
    Input text with wait    id=search_box_input  ${CODE_LIST_5}  timeout=30
    Click element with wait         //*[contains(text(), "${CODE_LIST_5}")]     timeout=30
    Wait Until Page Contains        ${CODE_LIST_5}                              timeout=30

    Click element with wait         //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains        Muutostieto

110. Search for code list and extend search to codes
    [Documentation]    Search for code list with frontpage search function and extend search to codes.
    ...    Check that the correct code list which contains the searched code is listed as a result.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser

    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}

    Return to Koodistot frontpage
    Click element with wait     ${SEARCH_CODE_CHECKBOX}    timeout=30
    Input text with wait    ${SEARCH_BOX_INPUT}     ${CODE_2}   timeout=30
    Click element with wait             //*[contains(text(), "${CODE_LIST_2}")]     timeout=30
    Click element with wait     //*[contains(text(), "${TEST_CODE_3}")]     timeout=30
    Wait Until Page Contains    ${TEST_CODE_3}                              timeout=30
    Wait Until Page Contains    Koodisto                                    timeout=20
    Wait Until Page Contains    ${CODE_LIST_2}                              timeout=20
    Wait Until Page Contains    Koodin arvo                                 timeout=20
    Wait Until Page Contains    Koodi1006                                   timeout=20
    Wait Until Page Contains    Koodin nimi                                 timeout=20
    Wait Until Page Contains    Koodi1006                                   timeout=20
    Wait Until Page Contains    Tila                                        timeout=20
    Wait Until Page Contains    Luonnos                                     timeout=20
    Wait Until Page Contains    Viimeisin muokkaus                          timeout=20

    [Teardown]    Remove codelist teardown      testiautomaatiokoodisto

111. Filter Codes by codeValue and prefLabel
    [Documentation]    Import codelist and filter Codes by codeValue and prefLabel
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_filter}    ${CODE_LIST_13}
    Return to Koodistot frontpage

    Input text with wait     ${SEARCH_BOX_INPUT}    ${CODE_LIST_13}   timeout=30
    Click element with wait             //*[contains(text(), "${CODE_LIST_13}")]    timeout=30
    Input text with wait    ${SEARCH_CODE_BOX_INPUT}    t52                 timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "${TEST_CODE_4}")]
    Wait Until Page Contains Element    ${SEARCH_CODE_BOX_INPUT}

    Input text with wait    ${SEARCH_CODE_BOX_INPUT}    testi06             timeout=20
    Click element with wait     //*[contains(text(), "${TEST_CODE_5}")]     timeout=20
    Wait Until Page Contains    Koodisto                                    timeout=20
    Wait Until Page Contains    Sisällön filteröinti                        timeout=20
    Wait Until Page Contains    Koodin arvo                                 timeout=20
    Wait Until Page Contains    T56                                         timeout=20
    Wait Until Page Contains    Koodin nimi                                 timeout=20
    Wait Until Page Contains    Testi06                                     timeout=20

    [Teardown]    Remove codelist teardown      T500

112. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Select navigation menu link     Käyttäjätiedot
    Wait Until Page Contains        Käyttäjätiedot              timeout=40
    Wait Until Page Contains        Nimi                        timeout=40
    Wait Until Page Contains        Sähköposti                  timeout=40
    Wait Until Page Contains        Organisaatiot ja roolit     timeout=40

    Select navigation menu link         Rekisterit
    Wait Until Page Contains            Rekisterit              timeout=40
    Wait Until Page Contains Element    ${REGISTRY_DDL}         timeout=40
    Select navigation menu link         yhteentoimiva.suomi.fi

    Switch window with wait                   title=Yhteentoimivuusalusta | Suomidigi
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    Select navigation menu link     Suomi.fi-sanastot
    Switch window with wait         url=${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait Until Page Contains        Sanastot                timeout=40
    Close Window

    Switch window with wait                 title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link     Suomi.fi-tietomallit

    Switch window with wait                 url=${DATA_VOCABULARIES_ENVIRONMENT_URL}
    Wait Until Page Contains        Tietomallit         timeout=40
    Wait Until Page Contains        Etusivu             timeout=40
    Close Window

    Switch window with wait                 title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link     Suomi.fi-kommentit

    Switch window with wait                 url=${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains        Kommentit           timeout=40
    Wait Until Page Contains        Etusivu             timeout=40
    Close Window

    Switch window with wait                 title=${ENVIRONMENT_IDENTIFIER} - Koodistot

113. Change content language for code list
    [Documentation]    Change content language for code list and check
    ...    that language change applies to code level as well. YTI-1053
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_test_dcat}    ${CODE_LIST_20}

    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=20
    Change Content Language     ${CONTENT_LANGUAGE_EN}

    Click element with wait     //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    timeout=20
    Wait Until Page Contains    Koodisto                                    timeout=20
    Wait Until Page Contains    Test dataset classification                 timeout=20
    Wait Until Page Contains    Koodin arvo                                 timeout=20
    Wait Until Page Contains    AGRI                                        timeout=20
    Wait Until Page Contains    Koodin nimi                                 timeout=20
    Wait Until Page Contains    Agriculture, fisheries, forestry and food   timeout=20
    Wait Until Page Contains    Voimassa oleva                              timeout=20
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=20
    Wait Until Page Contains    URI                                         timeout=20
    Wait Until Page Contains    Viimeisin muokkaus                          timeout=20

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus                                      timeout=20
    Wait Until Page Contains    dcat01                                      timeout=20
    Wait Until Page Contains    Koodiston nimi                              timeout=20
    Wait Until Page Contains    Test dataset classification                 timeout=20
    Wait Until Page Contains    Rekisteri                                   timeout=20
    Wait Until Page Contains    Test registry                               timeout=20

    [Teardown]    Remove codelist teardown    dcat01

114. Check user interface language and content language in page reload
    [Documentation]    Check that user interface language and content language settings are correct after page reload. YTI-1222.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_test_dcat}    ${CODE_LIST_20}
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=20

    Change UI Language    ${LANGUAGE_EN}
    Wait Until Page Contains            Test dataset classification                                     timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]                                  timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]                            timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]                          timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    timeout=30
    Wait Until Page Contains            AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       timeout=30

    Reload Page
    Wait Until Page Contains            Test dataset classification                                     timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]                                  timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]                            timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]                          timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    timeout=30
    Wait Until Page Contains            AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       timeout=30

    Change UI Language    ${LANGUAGE_FI}
    Wait Until Page Contains            Testi dcat                                              timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "KOODIT")]                         timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]                         timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Testirekisteri")]                 timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Yleiset tieto- ja hallintopalvelut")]    timeout=30
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       timeout=30

    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Click element with wait     //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    timeout=20
    Wait Until Page Contains    Koodisto                                        timeout=30
    Wait Until Page Contains    Test dataset classification                     timeout=30
    Wait Until Page Contains    Koodin arvo                                     timeout=30
    Wait Until Page Contains    AGRI                                            timeout=30
    Wait Until Page Contains    Koodin nimi                                     timeout=30
    Wait Until Page Contains    Agriculture, fisheries, forestry and food       timeout=30
    Wait Until Page Contains    Voimassa oleva                                  timeout=30
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=30
    Wait Until Page Contains    URI                                             timeout=30
    Wait Until Page Contains    Viimeisin muokkaus                              timeout=30

    Reload Page
    Wait Until Page Contains    Koodisto                                        timeout=30
    Wait Until Page Contains    Test dataset classification                     timeout=30
    Wait Until Page Contains    Koodin arvo                                     timeout=30
    Wait Until Page Contains    AGRI                                            timeout=30
    Wait Until Page Contains    Koodin nimi                                     timeout=30
    Wait Until Page Contains    Agriculture, fisheries, forestry and food       timeout=30
    Wait Until Page Contains    Voimassa oleva                                  timeout=30
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    timeout=30
    Wait Until Page Contains    URI                                             timeout=30
    Wait Until Page Contains    Viimeisin muokkaus                              timeout=30

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus                              timeout=30
    Wait Until Page Contains    dcat01                              timeout=30
    Wait Until Page Contains    Koodiston nimi                      timeout=30
    Wait Until Page Contains    Test dataset classification         timeout=30
    Wait Until Page Contains    Rekisteri                           timeout=30
    Wait Until Page Contains    Test registry                       timeout=30
    Wait Until Page Contains    Tietoalue                           timeout=30
    Wait Until Page Contains    Yleiset tieto- ja hallintopalvelut  timeout=30

    [Teardown]    Remove codelist teardown    dcat01

115. Check the visibility of the INCOMPLETE status code list
    [Documentation]    Check that code list with INCOMPLETE status is visible
    ...    in frontpage search for certain users only. YTI-903.
    [Tags]    regression    test    100
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_codes_incomplete}    ${CODE_LIST_26}

    Return to Koodistot frontpage
    Input text with wait                id=search_box_input      ${CODE_LIST_26}        timeout=30
    Wait Until Page Contains            1 hakutulos                                     timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]        timeout=30

    Select superuser user
    Input text with wait                id=search_box_input      ${CODE_LIST_26}        timeout=30
    Wait Until Page Contains            1 hakutulos                                     timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]        timeout=30

    Select codelist user
    Input text with wait                    id=search_box_input      ${CODE_LIST_26}    timeout=30
    Wait Until Page Contains                1 hakutulos                                 timeout=30
    Wait Until Page Contains Element        //*[contains(text(), "${CODE_LIST_26}")]    timeout=30

    Select Datamodel user
    Input text with wait                id=search_box_input      ${CODE_LIST_26}    timeout=30
    Wait Until Page Contains            1 hakutulos                                 timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30

    Select no group user
    Input text with wait        id=search_box_input      ${CODE_LIST_26}            timeout=30
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.                timeout=60

    Select member user
    Input text with wait                id=search_box_input      ${CODE_LIST_26}    timeout=30
    Wait Until Page Contains            1 hakutulos                                 timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30

    Select terminology user
    Input text with wait                id=search_box_input     ${CODE_LIST_26}     timeout=30
    Wait Until Page Contains            1 hakutulos                                 timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_26}")]    timeout=30

    [Teardown]    Remove codelist teardown    600

116. Check URI links
    [Documentation]    Check that URI links are working correctly in DEV, TEST and PROD environments
    [Tags]    regression    koodistot    test    100
    Go To    http://uri.suomi.fi/codelist/eu/dcat
    Wait Until Page Contains    DCAT-AP-luokitus                                             timeout=30

    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30

    Go To    http://uri.suomi.fi/codelist/eu/dcat?env=awsdev
    Wait Until Page Contains    DCAT-AP-luokitus                                             timeout=30

    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI?env=awsdev
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30

    Go To    http://uri.suomi.fi/codelist/eu/dcat?env=awstest
    Wait Until Page Contains    DCAT-AP-luokitus                                             timeout=30

    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI?env=awstest
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    timeout=30

117. Create codelist from Excel and delete it
    [Tags]    regression    koodistot    test    100
    Upload codelist in Excel format     ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Remove list of codes                ${CODE_LIST_4}
    [Teardown]  run keyword if test failed   Remove codelist teardown      T100

#118. Create codelist from CSV and delete it
#    [Tags]    regression    koodistot    test    100
#    Upload codelist in CSV format       ${testiautomaatiokoodisto_with_code}     ${CODE_LIST_4}
#    Remove list of codes                @{codelist}
#    [Teardown]  run keyword if test failed   Delete model ${PREFIX_2} with api