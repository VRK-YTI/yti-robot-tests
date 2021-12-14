*** Settings ***
Documentation     Test Suite for Extensions
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Superuser
#Library           AutoRecorder

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown

*** Test Cases ***
600. Import code list with extension
    [Documentation]    Import Code list with extension and members (definition hierarchy), check that import is successfull,
    ...    modify member, export Excel and remove code list.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Codelist_Extensions_members} to test with api
    Search and open codelist    ${CODE_LIST_14}

    Wait Until Page Contains    testcode01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testcode25 - Testikoodi 25    timeout=20
    Wait Until Page Contains    25 koodia    timeout=20
    Click element with wait      //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Wait Until Page Contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    testcode25    timeout=20
    Wait Until Page Contains    Testikoodi 25    timeout=20
    Wait Until Page Contains    http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567111/code/testcode25    timeout=20

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    timeout=20

    Wait Until Element Is Visible    //*[contains(@id,'222_view_extension')]    timeout=30

    Click element with wait             //*[contains(@id,'111_view_extension')]    timeout=30
    Wait Until Page Contains            9 jäsentä    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=20

    Click element with wait      //*[contains(text(), " Jäsen1 · Testikoodi 01")]    timeout=20
    Wait Until Page Contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Testilaajennus11    timeout=20
    Wait Until Page Contains    Koodi    timeout=20
    Wait Until Page Contains    testcode01 - Testikoodi 01    timeout=20

    Click element with wait      ${MODIFY_MEMBER_BTN}                       timeout=20
    Click element with wait      ${ADD_DEFAULTCODE_BTN}                     timeout=20
    Input Text with wait         ${SEARCH_DEFAULTCODE_INPUT}    25          timeout=30
    Click element with wait      //*[contains(text(), "Testikoodi 25")]     timeout=20
    Click element with wait      ${ADD_MEMBER_BTN}                          timeout=20
    Input Text with wait         ${SEARCH_MEMBER_INPUT}    koulutus         timeout=30
    Click element with wait      //*[contains(text(), "Koulutus, kulttuuri ja urheilu")]
    Click element with wait      ${SAVE_MEMBER}                             timeout=60
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    timeout=60

    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Testilaajennus11    timeout=20
    Wait Until Page Contains    Koodi    timeout=20
    Wait Until Page Contains    testcode25 - Testikoodi 25    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Koulutus, kulttuuri ja urheilu    timeout=20

    Select breadcrump link 2
    Click element with wait      ${EXPORT_DDL}              timeout=20
    Click element with wait      ${EXPORT_TYPE_EXCEL}       timeout=30

    [Teardown]    Remove codelist with extensions teardown    O1234567890123456789012345678901234567111

601. Import code list with codes and import extension and members
    [Documentation]    Import code list with codes and import extension and members.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Wait Until Page Contains    30 koodia    timeout=20
    Upload extension    ${Extension_definition_hierarchy}    ${FILE_FORMAT_EXCEL}

    Click element with wait             //*[contains(@id,'555_view_extension')]     timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]            timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]             timeout=20

    Upload members    ${Definition_hierarchy_members}    ${FILE_FORMAT_EXCEL}
    Wait Until Element Is Enabled    //*[contains(text(), "Testcode 29")]
    Click element with wait          //*[contains(text(), "Testcode 28")]    timeout=20

    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Testilaajennus55    timeout=20
    Wait Until Page Contains    suomi    timeout=20
    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600

602. Import new code list and create extension and members
    [Documentation]    Import new code list and create calculation hierarchy extension and member manually
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    DCAT-AP-luokitus    False
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    600 - ${CODE_LIST_16}   Testcode 57    ${EMPTY}

    Wait Until Page Contains    - Member 1 · Testcode 57 <=    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "- Member 1 · Testcode 57 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20
    Wait Until Page Contains    Extension 1    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600

603. Delete extension and member
    [Documentation]    Import new code list and create and delete calculation hierarchy extension and member.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}    False

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testcode 57    ${EMPTY}
    Wait Until Page Contains    Koodisto                        timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}                 timeout=20
    Wait Until Page Contains    Laajennus                       timeout=20
    Wait Until Page Contains    Extension 1                     timeout=20
    Wait Until Page Contains    Jäsenen nimi                    timeout=20
    Wait Until Page Contains    Member 1                        timeout=20
    Wait Until Page Contains    Aritmeettinen operaattori       timeout=20
    Wait Until Page Contains    -                               timeout=20
    Wait Until Page Contains    Vertailuoperaattori             timeout=20
    Wait Until Page Contains    <=                              timeout=20
    Wait Until Page Contains    Koodi                           timeout=20
    Wait Until Page Contains    testcode57 - Testcode 57        timeout=20

    Delete member
    Wait Until Page Contains    Extension 1                                     timeout=30
    Wait Until Page Contains    Tällä laajennuksella ei ole yhtään jäsentä.     timeout=30
    Delete extension

    [Teardown]    Remove codelist with extensions teardown    600

604. Modify extension member
    [Documentation]    Import new code list, import calculation hierarchy extension and members and modify member.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}

    Click element with wait      //*[contains(@id,'555_view_extension')]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=20
    Upload members    ${Calculation_hierarchy_members}    ${FILE_FORMAT_EXCEL}

    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen2 · Testcode 29 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20
    Click element with wait      //*[contains(text(), "- Jäsen1 · Testcode 28 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20
    Click element with wait      ${MODIFY_MEMBER_BTN}    timeout=20
    Click element with wait      ${ADD_MEMBER_BTN}    timeout=20

    Click element with wait      //*[contains(text(), "Testcode 29")]    timeout=20
    Input Text with wait    ${MEMBER_NAME_INPUT}    ${MEMBER_NAME_1}    timeout=30
    Click element with wait      ${ADD_CODE_TO_MEMBER_BTN}    timeout=30
    Input Text with wait    ${SEARCH_CODE_TO_MEMBER_INPUT}    Testcode 57   timeout=30
    Click element with wait      //*[contains(text(), "Testcode 57")]    timeout=30

    Click element with wait      ${REMOVE_MEMBER_LINK}    timeout=20

    Click element with wait      ${SAVE_MEMBER}    timeout=20
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    timeout=20
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Testilaajennus55    timeout=20
    Wait Until Page Contains    Jäsenen nimi    timeout=20
    Wait Until Page Contains    Member 1    timeout=20
    Wait Until Page Contains    Koodi    timeout=20
    Wait Until Page Contains    testcode57 - Testcode 57
    Page should not contain    - Jäsen2 · Testcode 29 <=

    Select breadcrump link 3
    Wait Until Page Contains    Testilaajennus55    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "- Member 1 · Testcode 57 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20
    Page Should Not Contain Element    ${EXPAND_ALL_BTN}

    [Teardown]    Remove codelist with extensions teardown    600

605. Import members in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}

    Click element with wait      //*[contains(@id,'555_view_extension')]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    timeout=20

    Upload members    ${Calculation_hierarchy_members_csv}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen2 · Testcode 29 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20

    Click element with wait      //*[contains(text(), "- Jäsen1 · Testcode 28 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennus    timeout=20
    Wait Until Page Contains    Testilaajennus55    timeout=20
    Wait Until Page Contains    Jäsenen nimi    timeout=20
    Wait Until Page Contains    Jäsen1    timeout=20
    Wait Until Page Contains    Aritmeettinen operaattori    timeout=20
    Wait Until Page Contains    -    timeout=20
    Wait Until Page Contains    Vertailuoperaattori    timeout=20
    Wait Until Page Contains    <=    timeout=20
    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20

    Select breadcrump link 3
    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_MEMBERS_TYPE_CSV}    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600

606. Import code list with extension and without CODESCHEMES value
    [Documentation]    Import code list with extension. Check error message when CODESCHEME value
    ...    for external code list is missing from Extensions sheet in Excel. YTI-853
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Extensions_without_codeschemes_value}

    Click element with wait      ${UPLOAD_FILE_BTN}              timeout=20
    Wait Until Page Contains     ${Error_missing_codeschemes}    timeout=20
    Cancel code import

607. Import code list with extension and with invalid code
    [Documentation]    Import code list (Excel) with extension. Check error message when
    ...    code in extensions sheet is not included to the code list. YTI-853
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Extensions_invalid_code_in_members_sheet}

    Click element with wait      ${UPLOAD_FILE_BTN}    timeout=20
    Wait Until Page Contains    ${Error_invalid_code}    timeout=20
    Cancel code import

608. Import code list with extension and members that exceed maximum hierarchy level
    [Documentation]    Import code list with extension and members that exceed maximum hierarchy level and
    ...    Check error message . YTI-844
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Extensios_max_hierarchy_level}

    Click element with wait      ${UPLOAD_FILE_BTN}    timeout=20
    Wait Until Page Contains    ${Error_max_hierarchy_level}    timeout=20
    Cancel code import

609. Import members with missing member value
    [Documentation]    Import members with missing unaryoperator value to calculation hierarchy extension
    ...    and check that import is successful.
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}
    Click element with wait      //*[contains(@id,'555_view_extension')]    timeout=20
    Upload members    ${Unaryoperator_value_missing}    ${FILE_FORMAT_EXCEL}
    Wait Until Page Contains    14 jäsentä    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen1 · Testcode 28 · ${CODE_LIST_16} · Testirekisteri <=")]    timeout=20

    [Teardown]    Remove codelist with extensions teardown   600

610. Add code list to the extension
    [Documentation]    Add code list to the calculation hierarchy extension and
    ...    add codes from that code list to the extension member.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Create codelist from Excel ${testiautomaatiokoodisto1_with_codes} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False

    Click element with wait      //*[contains(text(), "TIEDOT")]    timeout=20
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennuksen tunnus    timeout=20
    Wait Until Page Contains    extension1    timeout=20
    Wait Until Page Contains    Laajennuksen nimi    timeout=20
    Wait Until Page Contains    Extension 1    timeout=20
    Wait Until Page Contains    Laajennuksen tyyppi    timeout=20
    Wait Until Page Contains    Laskentahierarkia    timeout=20
    Wait Until Page Contains    ${CODE_LIST_4} - ${CODE_LIST_2}    timeout=20

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - ${CODE_LIST_2}    Koodi1000    ${EMPTY}
    Wait Until Page Contains    Koodi1000 - Koodi1000    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Koodi1000 · ${CODE_LIST_2} · Testirekisteri")]

    [Teardown]    Remove codelist with extensions teardown    600    testiautomaatiokoodisto

611. Import code list with codes, extensions and members and create new version of code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    create new version of code list. Check that all values for codes, extensions and members are copied to the new
    ...    code list version. Export Excel and CSV for new code list version.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Extensions_new_version_creation} to test with api
    Search and open codelist    ${CODE_LIST_14}

    Wait Until Page Contains    25 koodia    timeout=20

    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${CREATE_NEW_VERSION_BTN}    timeout=30

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_5}    timeout=60
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_19}   timeout=30

    Click element with wait      ${SAVE_NEW_CODE_LIST}    timeout=30
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60
    Wait Until Page Contains    25 koodia    timeout=120
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    timeout=20

    Click Code List Info Tab
    Wait Until Page Contains    O1234567890123456789012345678901234567333    timeout=20
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testirekisteri    timeout=20
    Wait Until Page Contains    Asuminen    timeout=20
    Wait Until Page Contains    Rakennettu ympäristö    timeout=20
    Wait Until Page Contains    Yleiset tieto- ja hallintopalvelut    timeout=20
    Wait Until Page Contains    englanti    timeout=20
    Wait Until Page Contains    suomi    timeout=20
    Page should not contain    ruotsi
    Wait Until Page Contains    testcode06 - Testikoodi 06    timeout=20
    Wait Until Page Contains    31.12.2016 - 30.12.2018    timeout=20

    Click element with wait      ${EXTENSIONS_TAB}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "MÄÄRITYSHIERARKIAT")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "LASKENTAHIERARKIAT")]    timeout=20

    Click element with wait      //*[contains(@id,'111_view_extension')]    timeout=20
    Click element with wait      ${EXTENSION_INFO_TAB}    timeout=30
    Wait Until Page Contains    O1234567890123456789012345678901234567111    timeout=20
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testilaajennus11    timeout=20
    Wait Until Page Contains    Määrityshierarkia    timeout=20
    Wait Until Page Contains    dcat - DCAT-AP-luokitus    timeout=20
    Wait Until Page Contains    31.12.2016 - 30.12.2018    timeout=20

    Click element with wait      ${MEMBERS_TAB}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    timeout=20

    Click element with wait      //*[contains(text(), "Jäsen1 · Testikoodi 01")]    timeout=20
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testilaajennus11    timeout=20
    Wait Until Page Contains    testcode01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    01.01.2018 - 01.01.2020    timeout=20
    Wait Until Page Contains    URI    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    timeout=20

    Click element with wait      //*[contains(text(), "educ · Koulutus, kulttuuri ja urheilu")]    timeout=20
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testilaajennus11    timeout=20
    Wait Until Page Contains    EDUC - Koulutus, kulttuuri ja urheilu - DCAT-AP-luokitus - Euroopan unionin koodistot    timeout=20
    Wait Until Page Contains    08.01.2018 - 08.01.2020    timeout=20
    Wait Until Page Contains    URI    timeout=20

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    timeout=30
    Click element with wait      ${CALC_HIERARCHY_TAB}    timeout=30

    Click element with wait      //*[contains(@id,'222_view_extension')]    timeout=20
    Wait Until Page Contains    9 jäsentä    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    timeout=20

    Click element with wait      //*[contains(text(), "- Jäsen1 · Testikoodi 08 · Testikoodisto3 pitkillä arvoilla · Testirekisteri <=")]    timeout=20
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testilaajennus22    timeout=20
    Wait Until Page Contains    Jäsen1    timeout=20
    Wait Until Page Contains    Vertailuoperaattori    timeout=20
    Wait Until Page Contains    Aritmeettinen operaattori    timeout=20
    Wait Until Page Contains    testcode08 - Testikoodi 08    timeout=20
    Wait Until Page Contains    01.01.2018 - 01.01.2020    timeout=20
    Wait Until Page Contains    URI    timeout=20

    Select breadcrump link 2
    Click element with wait      ${VERSION_TAB}    timeout=30
    Wait Until Page Contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Voimassaolo    timeout=20
    Wait Until Page Contains    Tila    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20

    Select breadcrump link 2
    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_TYPE_EXCEL}   timeout=30

    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_TYPE_CSV}     timeout=30

    [Teardown]    Remove codelist with extensions teardown    O1234567890123456789012345678901234567111     O1234567890123456789012345678901234567333

612. Import members with invalid member value
    [Documentation]    Import members with invalid unary operator value to calculation hierarchy extension
    ...    and check error message.
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    30 koodia    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}

    Click element with wait      //*[contains(@id,'555_view_extension')]    timeout=20
    Upload members    ${Invalid_unaryoperator_value}    ${FILE_FORMAT_EXCEL}
    Wait Until Page Contains    ${Error_member_value_invalid}    timeout=20
    Cancel code import

    Upload members    ${Invalid_unaryoperator_value_csv}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains    ${Error_member_value_invalid}    timeout=20
    Cancel code import

    [Teardown]    Remove codelist with extensions teardown    600

613. Remove code list when codes are in use in other resources in the same code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    Check that it is possible to remove code list when codes are in use in other resources in the same code list.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Extensions_new_version_creation} to test with api
    Search and open codelist    ${CODE_LIST_14}
    Wait Until Page Contains    25 koodia    timeout=20

    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element with wait      ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20

    Return to Koodistot frontpage
    Input Text with wait        ${SEARCH_BOX_INPUT}    ${CODE_LIST_14}      timeout=30
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.        timeout=60

614. Import extensions in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait Until Page Contains    30 koodia    timeout=20
    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Calc_def_hierarchy_extensions_csv}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains Element    //*[contains(@id,'111_view_extension')]     timeout=20

    Click element with wait             ${CALC_HIERARCHY_TAB}                       timeout=20
    Wait Until Page Contains Element    //*[contains(@id,'222_view_extension')]     timeout=20

    [Teardown]    Remove codelist with extensions teardown    600

615. Import extensions to the versioned code list
    [Documentation]    Import code list with codes, create new version from file and import extensions
    ...    in CSV format to the new code list version. Check that versions are listed correctly, YTI-1163.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Code_list_with_30_Codes_valid} to test with api
    Search and open codelist    ${CODE_LIST_17}

    Wait Until Page Contains    30 koodia    timeout=20
    Wait until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    testcode29 - Testcode 29    timeout=20

    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${CREATE_CODELIST_VERSION_FROM_FILE}   timeout=30
    Click element with wait      ${FILE_FORMAT_BTN}    timeout=20
    Click element with wait      ${FILE_FORMAT_Excel}    timeout=20

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Upload extension    ${Calc_def_hierarchy_extensions_csv}    ${FILE_FORMAT_CSV}

    Click element with wait      //*[contains(@id,'111_view_extension')]    timeout=20

    Select breadcrump link 2
    Click element with wait      ${VERSION_TAB}    timeout=30

    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_17}    timeout=20
    Wait Until Page Contains    01.01.2018 - 01.01.2019    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600    700

616. Modify code list and codes attached to extensions and members
    [Documentation]    Modify the name of the code list and code that are attached to extensions and members.
    ...    Check that changes take effect on extensions and members.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Create codelist from Excel ${testiautomaatiokoodisto1_with_codes} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False

    Click element with wait       ${EXTENSION_INFO_TAB}    timeout=20
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennuksen tunnus    timeout=20
    Wait Until Page Contains    extension1    timeout=20
    Wait Until Page Contains    Laajennuksen nimi    timeout=20
    Wait Until Page Contains    Extension 1    timeout=20
    Wait Until Page Contains    Laajennuksen tyyppi    timeout=20
    Wait Until Page Contains    Laskentahierarkia    timeout=20
    Wait Until Page Contains    ${CODE_LIST_4} - ${CODE_LIST_2}    timeout=20

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - ${CODE_LIST_2}    Koodi1000    ${EMPTY}
    Wait Until Page Contains    Koodi1000 - Koodi1000    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Koodi1000 · ${CODE_LIST_2} · Testirekisteri")]    timeout=20

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_2}    timeout=30
    Click element with wait      //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Wait Until Page Contains    ${CODE_LIST_2}

    Click Code List Info Tab
    Click element with wait      ${MODIFY_CODE_LIST}    timeout=20
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    uusi nimi koodistolle    timeout=30
    Save code list

    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}    timeout=120
    Click element with wait      ${CODELIST_CODES_TAB}    timeout=30
    Click element with wait      //*[contains(text(), "Koodi1000 - Koodi1000")]    timeout=20
    Click element with wait      ${MODIFY_CODE_BTN}    timeout=20
    Input Text with wait   ${CODE_NAME_INPUT}    koodin uusi nimi   timeout=30
    Click element with wait      ${SAVE_CODE_MOD_BTN}    timeout=20
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=120

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_16}   timeout=30
    Click element with wait      //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Click element with wait      ${EXTENSIONS_TAB}    timeout=30

    Click element with wait      //*[contains(text(), "extension1 - Extension 1")]    timeout=20
    Click element with wait      ${EXTENSION_INFO_TAB}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    extension1    timeout=20
    Wait Until Page Contains    Extension 1    timeout=20
    Wait Until Page Contains    Laskentahierarkia    timeout=20
    Wait Until Page Contains    ${CODE_LIST_4} - uusi nimi koodistolle    timeout=20

    Click element with wait      ${MEMBERS_TAB}    timeout=20
    Click element with wait      //*[contains(text(), "- Member 1 · koodin uusi nimi · uusi nimi koodistolle · Testirekisteri <=")]    timeout=20

    Wait Until Page Contains    Koodi1000 - koodin uusi nimi - uusi nimi koodistolle - Testirekisteri    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600    testiautomaatiokoodisto

617. Remove code list which is linked to other resources
    [Documentation]    Remove code list which has codes attached to other code list extension.
    ...    Check that removing the code list is not possible. YTI-1229.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Create codelist from Excel ${testiautomaatiokoodisto1_with_codes} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False

    Click element with wait      ${EXTENSION_INFO_TAB}    timeout=20
    Wait Until Page Contains    Koodisto    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    Laajennuksen tunnus    timeout=20
    Wait Until Page Contains    extension1    timeout=20
    Wait Until Page Contains    Laajennuksen nimi    timeout=20
    Wait Until Page Contains    Extension 1    timeout=20
    Wait Until Page Contains    Laajennuksen tyyppi    timeout=20
    Wait Until Page Contains    Laskentahierarkia    timeout=20
    Wait Until Page Contains    ${CODE_LIST_4} - ${CODE_LIST_2}    timeout=20

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - ${CODE_LIST_2}    Koodi1000    ${EMPTY}
    Wait Until Page Contains    Koodi1000 - Koodi1000    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Koodi1000 · ${CODE_LIST_2} · Testirekisteri")]    timeout=60

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_2}    timeout=30
    Click element with wait      //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element with wait      ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Wait Until Page Contains    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/600/extension/extension1    timeout=20
    Wait Until Page Contains Element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click Button    ${CLOSE_ERROR_MESSAGE_BTN}

    [Teardown]    Remove codelist teardown    600    testiautomaatiokoodisto

618. Create member with broader member
    [Documentation]    Import new code list and create calculation hierarchy extension. Create member with broader member manually.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Extensions_new_version_creation} to test with api
    Search and open codelist    ${CODE_LIST_14}

    Wait Until Page Contains    testcode01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    25 koodia    timeout=20

    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      ${CALC_HIERARCHY_TAB}    timeout=20

    Click element with wait      //*[contains(@id,'222_view_extension')]    timeout=20

    Create member for calculation hierarchy    Jäsen10    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testikoodi 01    Jäsen9
    Wait Until Page Contains    - Jäsen10 · Testikoodi 01 <=    timeout=20
    Wait Until Page Contains    - Jäsen9 · Testikoodi 16 · Testikoodisto2 pitkillä arvoilla · Testirekisteri <=    timeout=20

    Select breadcrump link 3
    Wait Until Page Contains    Testilaajennus22    timeout=20
    Wait Until Page Contains    10 jäsentä    timeout=20

    Click element with wait      ${EXPAND_ALL_BTN}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen10 · Testikoodi 01 · Testikoodisto2 pitkillä arvoilla · Testirekisteri <=")]    timeout=20

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

619. Import code list, create members and create cross-reference list
    [Documentation]    Import code list, create members and create cross-reference list, export cross_reference list Excel and CSV
    ...    and delete cross-reference list and code lists.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_for_cross_reference_list_creation} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api

    Search and open codelist    ${CODE_LIST_22}
    Wait Until Page Contains    30 koodia    timeout=20
    Return to Koodistot frontpage

    Search and open codelist    ${CODE_LIST_16}
    Wait Until Page Contains    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    30 koodia    timeout=20

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${CODE_LIST_22}    True
    Wait Until Page Contains    60 jäsentä    timeout=60

    Click element with wait      //*[contains(text(), "Testcode 30 · ${CODE_LIST_16} · Testirekisteri")]    timeout=20
    Click element with wait      ${MODIFY_MEMBER_BTN}    timeout=20
    Click element with wait      ${ADD_MEMBER_BTN}    timeout=20
    Click element with wait      ${CODE_SCHEME_DDL_BTN}    timeout=20

    Click element with wait      //*[contains(text(), "800 - Koodisto800")]    timeout=60
    Click element with wait      //*[contains(text(), "Testcode 63 - Koodisto800")]    timeout=20

    Click element with wait      ${SAVE_MEMBER}    timeout=20
    Wait Until Element Is Visible    ${MODIFY_MEMBER_BTN}    timeout=60

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 30 · ${CODE_LIST_16} · Testirekisteri")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 63 · Koodisto800 · Testirekisteri")]    timeout=20

    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_CROSS_REFERENCE_EXCEL}    timeout=30

    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_CROSS_REFERENCE_CSV}    timeout=30

    Delete extension
    Page Should Not Contain element    //*[contains(text(), "LAAJENNUKSET")]

    [Teardown]    Remove codelist teardown    600    800

620. Automatic member creation for codes
    [Documentation]    Import two code lists with codes, create calculation hierarchy extension and add another code list to the extension.
    ...    Create automatically members and check that members are created for each code from both code lists.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_for_cross_reference_list_creation} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api

    Search and open codelist    ${CODE_LIST_22}
    Wait Until Page Contains    30 koodia    timeout=20
    Return to Koodistot frontpage

    Search and open codelist    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_22}    True
    Wait until page contains    60 jäsentä    timeout=20

    [Teardown]    Remove codelist teardown    600    800

621. Create missing members for the extensions
    [Documentation]    Import two code lists with codes, create calculation hierarchy and definition hierarchy extensions
    ...    without member creation and add other code list to the extension. Create missing members for the extensions
    ...    and check that members are created for each code from both code lists.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_for_cross_reference_list_creation} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api

    Search and open codelist    ${CODE_LIST_22}
    Wait until page contains    30 koodia    timeout=20
    Return to Koodistot frontpage

    Search and open codelist    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_22}    False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    timeout=30
    Click element with wait      ${EXTENSION_DDL}    timeout=20
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    timeout=20
    Click element with wait      ${CONFIRMATION_YES_BTN}    timeout=20
    Wait until page contains    60 puuttunutta jäsentä luotu.    timeout=120
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    timeout=120

    Wait Until Element Is Visible    //*[contains(text(), "Testcode 28 · ${CODE_LIST_16} · Testirekisteri")]    timeout=60
    Wait until page contains    60 jäsentä    timeout=20

    Select breadcrump link 2
    Create extension    ${DEFINITION_HIERARCHY}    ${EXTENSION_VALUE_2}    ${EXTENSION_NAME_2}    ${DRAFT_STATUS}    ${CODE_LIST_22}    False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    timeout=30
    Click element with wait      ${EXTENSION_DDL}    timeout=20
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    timeout=20
    Click element with wait      ${CONFIRMATION_YES_BTN}    timeout=20
    Wait until page contains    60 puuttunutta jäsentä luotu.    timeout=120
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    timeout=120

    Wait Until Element Is Visible    //*[contains(text(), "Testcode 28 · ${CODE_LIST_16} · Testirekisteri")]    timeout=60
    Wait until page contains    60 jäsentä    timeout=20

    [Teardown]    Remove codelist teardown    600    800

622. Create missing members for the Cross-Reference list
    [Documentation]    Import code list and create Cross-Reference list. Create missing members for the Cross-Reference list.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_for_cross_reference_list_creation} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api

    Search and open codelist    ${CODE_LIST_22}
    Wait until page contains    30 koodia    timeout=20
    Return to Koodistot frontpage

    Search and open codelist    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    30 koodia    timeout=20

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${CODE_LIST_22}    False
    Wait Until Element Is Visible    ${MEMBERS_TAB}    timeout=60
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    timeout=20

    Click element with wait      ${EXTENSION_DDL}    timeout=20
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    timeout=20
    Click element with wait      ${CONFIRMATION_YES_BTN}    timeout=20
    Wait until page contains    60 puuttunutta jäsentä luotu.    timeout=120
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    timeout=120

    Wait Until Element Is Visible    //*[contains(text(), "Testcode 28 · ${CODE_LIST_16} · Testirekisteri")]    timeout=60
    Wait until page contains    60 jäsentä    timeout=20

    [Teardown]    Remove codelist teardown    600    800

623. Remove code that is in use in Cross-Reference list
    [Documentation]    Try to remove code that is in use in Cross-Reference list and check error message
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_for_cross_reference_list_creation} to test with api
    Create codelist from Excel ${Code_list_with_30_Codes} to test with api

    Search and open codelist    ${CODE_LIST_22}
    Wait until page contains    30 koodia    timeout=20
    Return to Koodistot frontpage

    Search and open codelist    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    30 koodia    timeout=20

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${CODE_LIST_22}    True
    Wait until page contains    60 jäsentä    timeout=20

    Click element with wait      //*[contains(text(), "Testcode 30 · ${CODE_LIST_16} · Testirekisteri")]    timeout=20
    Click element with wait      ${MODIFY_MEMBER_BTN}    timeout=20
    Click element with wait      ${ADD_MEMBER_BTN}    timeout=20
    Click element with wait      ${CODE_SCHEME_DDL_BTN}    timeout=20
    Click element with wait      //*[contains(text(), "800 - Koodisto800")]    timeout=20
    Click element with wait      //*[contains(text(), "Testcode 63 - Koodisto800")]    timeout=20
    Click element with wait      ${SAVE_MEMBER}    timeout=20
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    timeout=60

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 30 · ${CODE_LIST_16} · Testirekisteri")]    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 63 · Koodisto800 · Testirekisteri")]    timeout=20

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_22}   timeout=30
    Click element with wait      //*[contains(text(), "${CODE_LIST_22}")]    timeout=30
    Wait until page contains    ${CODE_LIST_22}
    Click element with wait      id=test_800_testcode63_view_code    timeout=40
    Click element with wait      ${CODE_DDL}    timeout=20
    Click element with wait      ${REMOVE_CODE_BTN}    timeout=20
    Click element with wait      ${REMOVE_CODE_CONF_BTN}    timeout=20
    Wait until page contains     ${Error_remove_linked_code}    timeout=20
    Click element with wait      ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20

    [Teardown]    Remove codelist teardown    600    800

624. Create missing members for the extension and verify code list values
    [Documentation]    Create missing members for the extension and verify that code list values are correct after member creation.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_links_and_default_code} to test with api
    Search and open codelist    ${CODE_LIST_23}
    Wait until page contains    30 koodia    timeout=60

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}    False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    timeout=30
    Click element with wait      ${EXTENSION_DDL}    timeout=20
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    timeout=20
    Click element with wait      ${CONFIRMATION_YES_BTN}    timeout=20
    Wait until page contains    30 puuttunutta jäsentä luotu.    timeout=120
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    timeout=120

    Wait Until Element Is Visible    //*[contains(text(), "Testcode 28 · Koodisto300 · Testirekisteri")]    timeout=60
    Wait until page contains    30 jäsentä    timeout=20

    Select breadcrump link 2
    Click Code List Info Tab
    Wait until page contains    Asuminen    timeout=20
    Wait until page contains    Vakiokoodi    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    Testijulkaisu_fi    timeout=20
    Wait until page contains    Testikäyttöedellytys    timeout=20
    Wait until page contains    Testikäyttökohde    timeout=20
    Wait until page contains    Testikäyttöohje    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Wait until page contains    Testi liittyvä standardi    timeout=20
    Wait until page contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains    Testilähde    timeout=20

    [Teardown]    Remove codelist teardown    300

625. Import code list with Cross-Reference list extension
    [Documentation]    Import code list with Cross-Reference list extension and members, check that import is successfull,
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_cross_reference_list} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Wait until page contains    30 koodia    timeout=60

    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      ${CROSS_REFERENCE_LIST_TAB}    timeout=20
    Click element with wait      //*[contains(@id,'test_600crossrefrencelist_view_extension')]    timeout=20
    Page should not contain    Tällä laajennuksella ei ole vielä yhtään koodiliitosta.
    Wait Until Page Contains Element    //*[contains(text(), "Jäsen02 · Testcode 29 · ${CODE_LIST_16} · Testirekisteri")]    timeout=20
    Click element with wait      ${MEMBERS_TAB}    timeout=30
    Wait until page contains    30 jäsentä    timeout=20

    [Teardown]    Remove codelist with extensions teardown    600

626. Remove code and extension from versioned code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    create new version of code list. Try to remove code from code list and check that proper error message is displayed.
    ...    Remove extension and check that code list version history does not disappear. YTI-452, YTI-566.
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Extensions_new_version_creation} to test with api
    Search and open codelist    ${CODE_LIST_14}

    Wait until page contains        25 koodia
    Click element with wait         ${CODE_LIST_DDL}
    Click element with wait         ${CREATE_NEW_VERSION_BTN}

    Input Text with wait            ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_5}    timeout=60
    Input Text with wait            ${CODE_LIST_NAME_INPUT}     ${CODE_LIST_19}

    Click element with wait             ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled       ${CODE_LIST_DDL}    timeout=60
    Wait until page contains            25 koodia           timeout=120

    Click element with wait         //*[contains(text(), "testcode01 - Testikoodi 01")]    timeout=20

    Wait until page contains        testcode01 - Testikoodi 01    timeout=60
    Click element with wait         ${CODE_DDL}
    Click element with wait         ${REMOVE_CODE_BTN}
    Click element with wait         ${REMOVE_CODE_CONF_BTN}
    Wait until page contains        ${Error_linked_code}

    Click element with wait         ${CLOSE_ERROR_MESSAGE_BTN}

    Select breadcrump link 2
    Click element with wait         ${EXTENSIONS_TAB}
    Click element with wait         //*[contains(@id,'111_view_extension')]
    Delete extension

    Wait Until Element Is Visible    ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111    O1234567890123456789012345678901234567333

627. Extend front page search to extensions and codes
    [Documentation]    Import two code lists with extensions. Check that front page search with extensions and codes without prefLabel
    ...    is successfull.
    [Tags]    koodistot    regression    600    test    search
    Create codelist from Excel ${filter_1_Code_list_three_extensions} to test with api
    Create codelist from Excel ${filter_2_Code_list_one_extension} to test with api

    Search and open codelist    ${CODE_LIST_16}
    Wait Until Page Contains    26 koodia    timeout=20

    Return to Koodistot frontpage
    Search and open codelist    ${CODE_LIST_17}
    Wait Until Page Contains    25 koodia    timeout=20

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rtt     timeout=30
    Click element with wait      ${SEARCH_CODE_CHECKBOX}        timeout=30

    Wait Until Page Contains    Hakutulokset    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "RTT")]    timeout=30

    Input Text with wait   ${SEARCH_BOX_INPUT}    rty789         timeout=30
    Click element with wait      ${SEARCH_EXTENSION_CHECKBOX}    timeout=30

    sleep  2
    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}    timeout=30
    Click element with wait      ${PROPERTYTYPE_CROSSREFERENCELIST_FILTER}    timeout=30
    Wait Until Page Contains            Hakutulokset                                timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Page Should Not Contain Element     //*[contains(text(), "${CODE_LIST_17}")]

    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     timeout=30
    Click element with wait      ${PROPERTYTYPE_CALCULATIONHIERARCHY_FILTER}    timeout=30

    Wait Until Page Contains                Hakutulokset                                timeout=30
    Wait Until Page Contains Element        //*[contains(text(), "${CODE_LIST_17}")]    timeout=30
    Page Should Not Contain Element         //*[contains(text(), "${CODE_LIST_16}")]

    [Teardown]    Remove codelist teardown    600    700

628. Clear values for calculation hierarchy member
    [Documentation]    Check that clearing the comparison operator and unary operator values
    ...    for Calculation hierarchy member is successfull, YTI-468.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_calculation_hierarchy_members} to test with api
    Search and open codelist    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20

    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      ${CALC_HIERARCHY_TAB}    timeout=20
    Click element with wait      //*[contains(@id,'222_view_extension')]    timeout=30

    Wait until page contains    9 jäsentä    timeout=20
    Click element with wait      //*[contains(text(), "+ Jäsen1")]    timeout=20
    Click element with wait      ${MODIFY_MEMBER_BTN}    timeout=20
    Click element with wait      ${COMPARISON_OPERATOR_INPUT}    timeout=20
    Repeat Keyword    2 times    Press Key    ${COMPARISON_OPERATOR_INPUT}    \\08

    Click element with wait      ${UNARY_OPERATOR_INPUT}    timeout=20
    Repeat Keyword    2 times    Press Key    ${UNARY_OPERATOR_INPUT}    \\08

    Click element with wait      ${SAVE_MEMBER}    timeout=30
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    timeout=60

    Wait Until Page Does Not Contain    <=    timeout=60
    Wait Until Page Does Not Contain    +    timeout=60

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

629. Add values for new calculation hierarchy member
    [Documentation]    Add new calculation hierarchy member without unary operator and comparison operator values.
    ...    Check that modifying only one value (unary operator) for member is successful after member creation, YTI-468.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_calculation_hierarchy_members} to test with api
    Search and open codelist    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20

    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      ${CALC_HIERARCHY_TAB}    timeout=20
    Click element with wait      //*[contains(@id,'222_view_extension')]    timeout=30
    Wait until page contains    9 jäsentä    timeout=20

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Testikoodi 18    ${EMPTY}
    Click element with wait      ${MODIFY_MEMBER_BTN}    timeout=20
    Click element with wait      ${COMPARISON_OPERATOR_INPUT}    timeout=20
    Input Text with wait    ${COMPARISON_OPERATOR_INPUT}    <=      timeout=30

    Wait Until Element Is Enabled    ${SAVE_MEMBER}    timeout=30
    Click Button    ${SAVE_MEMBER}
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    timeout=60
    Wait until page contains    <=    timeout=30

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

630. Update members with duplicate member values
    [Documentation]    Import new code list with definition hierarchy extension and members.
    ...    Check that correct error message is dispalyed when trying to import members with duplicate member values, YTI-503.
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_definition_hierarchy_members} to test with api
    Search and open codelist    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20

    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${UPDATE_CODE_LIST_FROM_FILE_BTN}    timeout=20
    Click element with wait      ${FILE_FORMAT_BTN}    timeout=20
    Click element with wait      ${FILE_FORMAT_Excel}    timeout=20
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_with_duplicate_member_id_values}

    Click element with wait      ${UPLOAD_FILE_BTN}    timeout=20
    Wait until page contains    ${Error_duplicate_member_id_values}    timeout=20
    Cancel code import

    [Teardown]    Remove codelist teardown    600

631. Update member relations with member URI, code URI, codeValue and MEMBER_ID
    [Documentation]    Import code list and update member relations with member URI, code URI,
    ...    codeValue and MEMBER_ID. YTI-639, YTI-696.
    [Tags]    regression    koodistot    test    600
    Import code list in Excel format
    Upload codelist    ${Code_list_extensions_broader_members}    ${CODE_LIST_14}

    Wait until page contains    25 koodia    timeout=20
    Update code list    ${Code_list_with_update_members}    ${CODE_LIST_14}    ${FILE_FORMAT_Excel}
    Click element with wait      ${EXTENSIONS_TAB}    timeout=60
    Click element with wait      //*[contains(@id,'222_view_extension')]    timeout=30

    Page Should Not Contain Element    //*[contains(text(), "Jäsen2")]
    Page Should Not Contain Element    //*[contains(text(), "Jäsen4")]
    Page Should Not Contain Element    //*[contains(text(), "Jäsen9")]

    Click element with wait      ${EXPAND_ALL_BTN}    timeout=30
    Page Should Contain Element    //*[contains(text(), "Jäsen2")]
    Page Should Contain Element    //*[contains(text(), "Jäsen4")]
    Page Should Contain Element    //*[contains(text(), "Jäsen9")]

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

632. Export JSON for code list
    [Documentation]    Import code list with codes, extensions and members,
    ...    Check that JSON export for code list is successful. YTI-18
    [Tags]    regression    koodistot    600    test
    Create codelist from Excel ${Extensions_new_version_creation} to test with api
    Search and open codelist    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20

    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_JSON}    timeout=20

    Switch window with wait     url=${REFERENCE_DATA_ENVIRONMENT_URL}codelist-api/api/v1/coderegistries/test/codeschemes/O1234567890123456789012345678901234567111/?format=json&embedCodes=true&embedExtensions=true&embedMembers=true&expand=extension,member,codeScheme,code,memberValue,codeRegistry,organization,valueType,externalReference,propertyType&downloadFile=false&pretty
    Page should contain    "codeValue" : "O1234567890123456789012345678901234567111",
    Page should contain    "uri" : "http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567111",
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Click element with wait      ${EXPORT_DDL}    timeout=20
    Click element with wait      ${EXPORT_JSON_AS_FILE_BTN}    timeout=20

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

633. Update members with invalid relation value
    [Documentation]    Update members with invalid relation value
    ...    and check error message
    [Tags]    regression    test    600
    Create codelist from Excel ${Code_list_extensions_broader_members} to test with api
    Search and open codelist    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20

    Click element with wait      ${CODE_LIST_DDL}    timeout=20
    Click element with wait      ${UPDATE_CODE_LIST_FROM_FILE_BTN}    timeout=20
    Click element with wait      ${FILE_FORMAT_BTN}    timeout=20
    Click element with wait      ${FILE_FORMAT_Excel}    timeout=20
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose File    ${FILE_UPLOAD_BTN}    ${Update_members_invalid_relation}

    Click element with wait      ${UPLOAD_FILE_BTN}    timeout=20
    Wait until page contains    ${Error_invalid_member_relation}    timeout=20
    Cancel code import

    [Teardown]    Remove codelist teardown    O1234567890123456789012345678901234567111

634. Import code list and extensions with 100 members
    [Documentation]    Import Code list with extensions and 100 members, check that import is successfull. YTI-691
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${code_list_extensions_100_members} to test with api
    Search and open codelist    ${CODE_LIST_25}
    Wait until page contains    115 koodia    timeout=90

    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      id=test_100ext1_view_extension    timeout=30
    Wait until page contains    115 jäsentä    timeout=20
    Wait Until Element Is Enabled    ${EXPAND_ALL_BTN}    timeout=20

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    timeout=20
    Click element with wait      ${CALC_HIERARCHY_TAB}    timeout=20
    Click element with wait      id=test_100ext2_view_extension    timeout=30
    Wait until page contains    9 jäsentä    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20

    [Teardown]    Remove codelist teardown    100

635. Front page deep search with multiple extensions and codes
    [Documentation]    Import code list with multiple codes and extensions. Check that front page deep search function is successful.
    [Tags]    koodistot    regression    600    test    search
    Create codelist from Excel ${Code_list_with_multiple_extensions} to test with api
    Search and open codelist    ${CODE_LIST_16}
    Wait Until Page Contains    36 koodia    timeout=20

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rtt     timeout=30
    Click element with wait      ${SEARCH_CODE_CHECKBOX}        timeout=30

    Wait Until Page Contains            Hakutulokset                                timeout=60
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Wait Until Page Contains            Koodit                                      timeout=30

    Click element with wait      //*[contains(text(), "Katso kaikki 11 osumaa")]    timeout=30

    Wait until page contains    11 koodia    timeout=20
    Wait Until Page Contains    RTT555 - aaaa    timeout=30
    Wait Until Page Contains    RTT556 - bbbb (en)    timeout=30
    Wait Until Page Contains    RTT557    timeout=30
    Wait Until Page Contains    RTT558    timeout=30
    Wait Until Page Contains    RTT559    timeout=30
    Wait Until Page Contains    RTT560    timeout=30
    Wait Until Page Contains    RTT561    timeout=30
    Wait Until Page Contains    RTT562    timeout=30
    Wait Until Page Contains    RTT563    timeout=30
    Wait Until Page Contains    RTT564    timeout=30
    Wait Until Page Contains    RTT565    timeout=30

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rty                     timeout=30
    Click element with wait      ${SEARCH_EXTENSION_CHECKBOX}                   timeout=30

    Sleep                        2
    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     timeout=30
    Click element with wait      ${PROPERTYTYPE_DEFINITIONHIERARCHY_FILTER}     timeout=30

    Wait Until Element Is Not Visible   //*[contains(text(), "${CODE_LIST_16}")]    timeout=60
    Click element with wait             ${PROPERTYTYPE_FILTER_DDL}                     timeout=30
    Click element with wait             ${PROPERTYTYPE_CALCULATIONHIERARCHY_FILTER}    timeout=30

    Wait Until Element Is Not Visible    //*[contains(text(), "${CODE_LIST_16}")]    timeout=60

    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     timeout=30
    Click element with wait      ${PROPERTYTYPE_CROSSREFERENCELIST_FILTER}      timeout=30

    Wait Until Page Contains    Hakutulokset    timeout=30
    Wait Until Page Contains    Laajennukset    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30

    Click element with wait      //*[contains(text(), "Katso kaikki 8 osumaa")]     timeout=30
    Click element with wait      ${EXTENSIONS_TAB}                                  timeout=60
    Click element with wait      ${CROSS_REFERENCE_LIST_TAB}                        timeout=60

    Wait Until Page Contains    rty789 - dddd (en)    timeout=30
    Wait Until Page Contains    rty790    timeout=30
    Wait Until Page Contains    rty791    timeout=30
    Wait Until Page Contains    rty792    timeout=30
    Wait Until Page Contains    rty793    timeout=30
    Wait Until Page Contains    rty794    timeout=30
    Wait Until Page Contains    rty795 - ffff    timeout=30
    Wait Until Page Contains    rty796    timeout=30

    [Teardown]    Remove codelist teardown    600

636. Different organization between code list and linked registry
    [Documentation]    Check that creating and modifying code list is successful when code list organization
    ...    is different than linked registry organization.
    [Tags]    regression    test    600
    set selenium speed      0.5
    Create registry    Rekisteri123    Automaatiorekisteri    Automaatiotestaus    Rekisterin kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20

    Return to Koodistot frontpage
    Create code list    ${REGISTRY_2}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Create new code to code list    koodi1111    Koodi1111    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    DCAT-AP-luokitus    True
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Koodi1111    ${EMPTY}

    [Teardown]    Delete registry with code lists    Rekisteri123 - Automaatiorekisteri  Rekisteri123  ${CODE_LIST_8}

637. Import code list, extensions and members, create member manually
    [Documentation]    Import code list, extensions and members with MEMBER-IDs, create member manually. YTI-1085
    [Tags]    koodistot    regression    600    test
    Create codelist from Excel ${Code_list_with_extensions_and_member_relations} to test with api
    Search and open codelist    ${CODE_LIST_25}
    Wait Until Page Contains    25 koodia    timeout=90
    Select Tab    ${EXTENSIONS_TAB}
    Select Tab    ${CALC_HIERARCHY_TAB}
    Click Element with wait    id=test_100ext2_view_extension
    Wait Until Page Contains    25 jäsentä    timeout=20
    Create member for calculation hierarchy    Jäsen10    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testikoodi 01    Testikoodi 06

    Select breadcrump link 3
    Wait Until Page Contains    26 jäsentä    timeout=20

    [Teardown]    Remove codelist teardown    100
