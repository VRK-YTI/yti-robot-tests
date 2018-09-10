*** Settings ***
Documentation     Test Suite for Extension Schemes
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Controlled_vocabularies_resources.robot

*** Variables ***
${CALCULATION_HIERARCHY}    id=create_extensionscheme_calculationhierarchy_button
${DEFINITION_HIERARCHY}    id=create_extensionscheme_definitionhierarchy_button
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Codelist_ExtensionSchemes}    ${DATAFOLDER}${/}Codelist_with_ExtensionSchemes.xlsx
${Code_list_with_30_Codes}    ${DATAFOLDER}${/}Code_list_with_30_Codes.xlsx
${601_Extension_Scheme}    ${DATAFOLDER}${/}601_Extension_Scheme.xlsx
${601_Extensions}    ${DATAFOLDER}${/}601_Extensions.xlsx
${ExtensionSchemes_without_codeschemes}    ${DATAFOLDER}${/}ExtensionSchemes_without_codeschemes_value.xlsx
${ExtensionSchemes_codeschemes_invalid_code}    ${DATAFOLDER}${/}ExtensionSchemes_codeschemes_invalid_Code.xlsx
${Extensios_max_hierarchy_level}    ${DATAFOLDER}${/}Extensions_max_hierarchy_level.xlsx
${Extension_Scheme_calculation_hierarchy}    ${DATAFOLDER}${/}Extension_Scheme_calculation_hierarchy.xlsx
${Extensions_empty_extensionvalues}    ${DATAFOLDER}${/}Extensions_empty_extensionvalues.xlsx
${Extensions_no_extensionvalue_column}    ${DATAFOLDER}${/}Extensions_no_extensionvalue_column.xlsx
#CSV paths
${Extensions_csv}    ${DATAFOLDER}${/}Extensions_csv.csv
#error messages
${Error_missing_codeschemes}    Laajennukseen liitetty koodi ei kuulu tähän koodistoon tai laajennusjärjestelmään liitettyihin koodistoihin.
${Error_invalid_code}    Laajennukseen liitettyä koodia ei ole olemassa.
${Error_max_hierarchy_level}    Laajennusten maksimi hierarkinen taso ylittyi.
${Error_extensionvalue_missing}    Aineistossa puuttuu arvo sarakkeesta EXTENSIONVALUE riviltä 2.

*** Test Cases ***
600. Import Code list with Extension Schemes
    [Documentation]    Import Code list with Extension Schemes (definition hierarchy), check that import is successfull,
    ...    Modify Extension, Export Excel and remove code list.
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Codelist_ExtensionSchemes}    ${CODE_LIST_14}
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Wait until page contains    testcode25 - Testikoodi 25    timeout=20
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_6}")]
    Page should contain    Testikoodisto2 pitkillä arvoilla
    Page should contain    testcode25
    Page should contain    Testikoodi 25
    Page should contain    http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567111/testcode25
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Sleep    5
    Wait until page contains element    ${EXTENSION_SCHEMES_TAB}    timeout=20
    Click element    ${EXTENSION_SCHEMES_TAB}
    Wait until page contains element    //*[contains(@id,'111_codelist_extensionscheme_listitem')]    timeout=20
    Wait until page contains element    //*[contains(@id,'222_codelist_extensionscheme_listitem')]    timeout=20
    Click Element    //*[contains(@id,'111_codelist_extensionscheme_listitem')]
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Testikoodi 01")]    timeout=20
    Sleep    2
    Click element    //*[contains(text(), "Testikoodi 01")]
    Sleep    2
    Wait until page contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait until page contains    Laajennusjärjestelmä    timeout=20
    Wait until page contains    Testilaajennus11    timeout=20
    Wait until page contains    Koodi    timeout=20
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Sleep    2
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_DEFAULTCODE_BTN}    timeout=20
    Click element    ${ADD_DEFAULTCODE_BTN}
    Wait until page contains element    ${SEARCH_DEFAULTCODE_INPUT}
    Input Text    ${SEARCH_DEFAULTCODE_INPUT}    25
    Click element    //*[contains(text(), "Testikoodi 25")]
    Wait until page contains element    ${ADD_EXTENSION_BTN}    timeout=20
    Click element    ${ADD_EXTENSION_BTN}
    Wait until page contains element    ${SEARCH_EXTENSION_INPUT}    timeout=20
    Input Text    ${SEARCH_EXTENSION_INPUT}    koulutus
    Click element    //*[contains(text(), "Koulutus, kulttuuri ja urheilu")]
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Koodisto
    Wait until page contains    Testikoodisto2 pitkillä arvoilla
    Wait until page contains    Laajennusjärjestelmä
    Wait until page contains    Testilaajennus11
    Wait until page contains    Koodi
    Wait until page contains    testcode25 - Testikoodi 25
    Wait until page contains    Laajennus
    Wait until page contains    Koulutus, kulttuuri ja urheilu - DCAT-AP-luokitus
    Wait until page contains element    ${EXTENSION_BACK_BTN}    timeout=20
    Click element    ${EXTENSION_BACK_BTN}
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_14}

601. Import Code list with codes and import Extension Schemes and Extensions
    [Documentation]    Import Code list with Codes and import Extension Scheme and Extensions.
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains    30 koodia    timeout=20
    Upload extension scheme    ${601_Extension_Scheme}
    Wait until page contains element    //*[contains(@id,'555_view_extensionscheme')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extensionscheme')]
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Upload extension    ${601_Extensions}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(text(), "Testcode 28")]
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 28")]
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennusjärjestelmä    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    suomi    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Sleep    2
    Wait until page contains element    ${EXTENSION_BACK_BTN}    timeout=20
    Click element    ${EXTENSION_BACK_BTN}
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

602. Import new Code list and create Extension Scheme and Extensions
    [Documentation]    Import new Code list and create calculation hierarchy Extension Scheme and Extension manually
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Create extension scheme    ${CALCULATION_HIERARCHY}    ${EXTENSION_SCHEME_VALUE_1}    ${EXTENSION_SCHEME_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}
    Create extension    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    Testcode 57
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Wait until page contains    ext1 Extension 1 - Testcode 57    timeout=30
    Wait until page contains element    //*[contains(@id,'2_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'2_breadcrumb_link')]
    Wait until page contains    Koodisto600    timeout=30
    Sleep    3
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

603. Delete Extension Scheme and Extension
    [Documentation]    Import new Code list and create and delete Extension Scheme and Extension.
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_30_Codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains element    ${EXTENSION_SCHEMES_DDL}    timeout=30
    Click element    ${EXTENSION_SCHEMES_DDL}
    Click element    ${CREATE_EXTENSION_SCHEMES_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEME_CODEVALUE_INPUT}    timeout=30
    Input Text    ${EXTENSION_SCHEME_CODEVALUE_INPUT}    ${EXTENSION_SCHEME_VALUE_1}
    Wait until page contains element    ${EXTENSION_SCHEME_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_SCHEME_NAME_INPUT}    ${EXTENSION_SCHEME_NAME_1}
    Wait until page contains element    ${SAVE_EXTENSION_SCHEME}    timeout=30
    Click button    ${SAVE_EXTENSION_SCHEME}
    Wait until page contains element    ${CREATE_EXTENSION_BTN}    timeout=30
    Click button    ${CREATE_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_VALUE_INPUT}    timeout=30
    Input Text    ${EXTENSION_VALUE_INPUT}    ${EXTENSION_VALUE_1}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_NAME_INPUT}    ${EXTENSION_NAME_1}
    Wait until page contains element    ${ADD_CODE_TO_EXTENSION_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_EXTENSION_BTN}
    Wait until page contains element    ${SEARCH_CODE_TO_EXTENSION_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_EXTENSION_INPUT}    Testcode 57
    Wait until page contains element    //*[contains(text(), "Testcode 57")]    timeout=30
    Click element    //*[contains(text(), "Testcode 57")]
    Sleep    3
    Wait until page contains element    ${SAVE_EXTENSION_SCHEME}    timeout=30
    Click button    ${SAVE_EXTENSION_SCHEME}
    Sleep    3
    Wait until page contains    Koodisto
    Wait until page contains    Koodisto600
    Wait until page contains    Laajennusjärjestelmä
    Wait until page contains    Extension scheme 1
    Wait until page contains    Laajennuksen nimi
    Wait until page contains    Extension 1
    Wait until page contains    Laajennuksen arvo
    Wait until page contains    ext1
    Wait until page contains    Koodi
    Wait until page contains    testcode57 - Testcode 57
    Wait until page contains element    ${EXTENSION_DELETE_BTN}    timeout=30
    Click element    ${EXTENSION_DELETE_BTN}
    Wait until page contains element    ${CONFIRM_DELETE_EXTENSION_BTN}    timeout=30
    Click element    ${CONFIRM_DELETE_EXTENSION_BTN}
    Wait until page contains    Extension scheme 1    timeout=30
    Wait until page contains    Tällä laajennusjärjestelmällä ei ole yhtään laajennusta.    timeout=30
    Wait until page contains element    ${EXTENSION_SCHEME_DELETE_BTN}    timeout=30
    Click element    ${EXTENSION_SCHEME_DELETE_BTN}
    Wait until page contains element    ${CONFIRM_DELETE_EXTENSION_BTN}    timeout=30
    Click element    ${CONFIRM_DELETE_EXTENSION_BTN}
    Sleep    3
    Return to Koodistot frontpage
    Sleep    2
    [Teardown]    Remove codelist with Extension Schemes and Extensions

604. Modify Extension
    [Documentation]    Import new Code list with calculation hierarhy Extension Schemes and Extensions and modify Extension.
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_30_Codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains element    ${EXTENSION_SCHEMES_DDL}    timeout=30
    Click element    ${EXTENSION_SCHEMES_DDL}
    Click element    ${IMPORT_EXTENSION_SCHEMES_BTN}
    Sleep    2
    Choose file    ${EXTENSION_SCHEMES_FILE_UPLOAD}    ${601_Extension_Scheme}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_SCHEMES_UPLOAD_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_TAB}    timeout=20
    Click element    ${EXTENSION_SCHEMES_TAB}
    Wait until page contains element    //*[contains(@id,'555_view_extensionscheme')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extensionscheme')]
    Wait until page contains element    //*[contains(text(), "LAAJENNUKSET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Wait until page contains element    ${IMPORT_EXTENSION_BTN}    timeout=30
    Click element    ${IMPORT_EXTENSION_BTN}
    Choose file    ${EXTENSION_FILE_UPLOAD}    ${601_Extensions}
    Sleep    2
    Wait until page contains element    ${EXTENSION_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_UPLOAD_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "Testcode 28")]
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 28")]
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=20
    Click element    ${MODIFY_EXTENSION_BTN}
    Sleep    2
    Wait until page contains element    ${ADD_EXTENSION_BTN}    timeout=20
    Click element    ${ADD_EXTENSION_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 29")]
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=20
    Click element    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=20
    Click element    ${MODIFY_EXTENSION_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSION_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_NAME_INPUT}    ${EXTENSION_NAME_1}
    Wait until page contains element    ${ADD_CODE_TO_EXTENSION_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_EXTENSION_BTN}
    Wait until page contains element    ${SEARCH_CODE_TO_EXTENSION_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_EXTENSION_INPUT}    Testcode 57
    Wait until page contains element    //*[contains(text(), "Testcode 57")]    timeout=30
    Click element    //*[contains(text(), "Testcode 57")]
    Sleep    3
    Wait until page contains element    ${REMOVE_EXTENSION_LINK}    timeout=20
    Click element    ${REMOVE_EXTENSION_LINK}
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=20
    Click element    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennusjärjestelmä    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    Laajennuksen nimi    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Wait until page contains    Koodi    timeout=20
    Wait until page contains    testcode57 - Testcode 57
    Page should not contain    Testcode 29
    Sleep    6
    Return to Koodistot frontpage
    [Teardown]    Remove codelist with Extension Schemes and Extensions

605. Import Extensions in CSV format
    [Documentation]    Import Code list with Codes and import Extension Scheme.
    ...    Import Extensions in CSV format and export CSV
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_30_Codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains element    ${EXTENSION_SCHEMES_DDL}    timeout=30
    Click element    ${EXTENSION_SCHEMES_DDL}
    Click element    ${IMPORT_EXTENSION_SCHEMES_BTN}
    Sleep    2
    Choose file    ${EXTENSION_SCHEMES_FILE_UPLOAD}    ${601_Extension_Scheme}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_SCHEMES_UPLOAD_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_TAB}    timeout=20
    Click element    ${EXTENSION_SCHEMES_TAB}
    Wait until page contains element    //*[contains(@id,'555_view_extensionscheme')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extensionscheme')]
    Wait until page contains element    //*[contains(text(), "LAAJENNUKSET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Wait until page contains element    ${IMPORT_EXTENSION_BTN}    timeout=30
    Click element    ${IMPORT_EXTENSION_BTN}
    Wait until page contains element    ${FILE_FORMAT_UPLOAD}    timeout=20
    Click element    ${FILE_FORMAT_UPLOAD}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=20
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${EXTENSION_FILE_UPLOAD}    timeout=20
    Choose file    ${EXTENSION_FILE_UPLOAD}    ${Extensions_csv}
    Sleep    2
    Wait until page contains element    ${EXTENSION_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_UPLOAD_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "Testcode 28")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 28")]
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennusjärjestelmä    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    testcode28_FI    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Sleep    2
    Wait until page contains element    ${EXTENSION_BACK_BTN}    timeout=20
    Click element    ${EXTENSION_BACK_BTN}
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    5
    Return to Koodistot frontpage
    [Teardown]    Remove codelist with Extension Schemes and Extensions

606. Import Code list with Extension Schemes and without CODESCHEME value
    [Documentation]    Import Code list (Excel) with Extension Schemes. Check error message when CODESCHEME value
    ...    for external code list is missing from ExtensionSchemes sheet in Excel. YTI-853
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${ExtensionSchemes_without_codeschemes}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_missing_codeschemes}    timeout=20
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

607. Import Code list with Extension Schemes and with invalid Code
    [Documentation]    Import Code list (Excel) with Extension Schemes. Check error message when
    ...    Code in Extensions sheet is not included to the Code list. YTI-853
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${ExtensionSchemes_codeschemes_invalid_code}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_invalid_code}    timeout=20
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

608. Import Code list with Extensions that exceed maximum hierarchy level
    [Documentation]    Import Code list with Extensions that exceed maximum hierarchy level and
    ...    Check error message . YTI-844
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Extensios_max_hierarchy_level}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_max_hierarchy_level}    timeout=20
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

609. Import Extensions with missing EXTENSIONVALUE
    [Documentation]    Import Extensions with missing EXTENSIONVALUE to calculation hierarchy extension scheme
    ...    and check error message.
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Upload extension scheme    ${Extension_Scheme_calculation_hierarchy}
    Wait until page contains element    //*[contains(@id,'555_view_extensionscheme')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extensionscheme')]
    Upload extension    ${Extensions_empty_extensionvalues}    ${FILE_FORMAT_EXCEL}
    Wait until page contains    ${Error_extensionvalue_missing}    timeout=20
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

610. Add code list to the Extension Scheme
    [Documentation]    Add code list to the calculation hierarchy Extension Scheme and
    ...    add codes from that code list to the extension.
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Create extension scheme manually    ${EXTENSION_SCHEME_VALUE_1}    ${EXTENSION_SCHEME_NAME_1}    ${CALCULATION_HIIERARCHY}
    Return to Koodistot frontpage
    #Remove codelist    ${CODE_LIST_2}
    #Remove codelist    ${CODE_LIST_16}
    [Teardown]    Remove code lists    ${CODE_LIST_2}    ${CODE_LIST_16}

*** Keywords ***
Go back to Koodistot frontpage and close browsers
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2
    Close All Browsers

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_LIST_MOD_BTN}

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}

Save code modification
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}

Check values from Draft Code list
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Luokitus
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check values from Valid Code list
    Page should contain    Tunnus
    Page should contain    Koodisto7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Luokitus
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Remove imported Draft code list
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_8}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_8}")]
    Wait until page contains    ${CODE_LIST_8}
    #Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove imported Draft code list with codes
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_8}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_8}")]
    Wait until page contains    ${CODE_LIST_8}
    #Wait until page contains    koodi500 - Koodi500    timeout=20
    #Wait until page contains    koodi503 - Koodi503    timeout=20
    #Wait until page contains    koodi504 - Koodi504    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove imported Valid code list
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_9}")]
    Wait until page contains    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove original and copied Code list
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_9}")]
    Wait until page contains    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    3
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Wait until page contains    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto7001
    Page should contain    Koodiston nimi
    Page should contain    koodisto7001
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Check updated code listing
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi501 - Koodi501    timeout=20
    Wait until page contains    koodi502 - Koodi502    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Wait until page contains    koodi505 - Koodi505    timeout=20

Create new code to code list
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=20
    Click element    ${CREATE_CODE_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=20
    Input text    ${CODE_CODEVALUE_INPUT}    NewCode001
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    newcode001
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}

Create new code to code list with concept
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=20
    Click element    ${CREATE_CODE_BTN}
    Wait until page contains element    ${SEARCH_CONCEPT_INPUT}    timeout=20
    Input Text    ${SEARCH_CONCEPT_INPUT}    tutkija
    Wait until page contains element    ${VOCABULARY_SELECTION_DDL}    timeout=20
    Click element    ${VOCABULARY_SELECTION_DDL}
    Click Button    Testiautomaatiosanasto
    Wait until page contains element    //*[contains(text(), "tutkija")]
    Click element    //*[contains(text(), "tutkija")]
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=20
    Input text    ${CODE_CODEVALUE_INPUT}    NewCode001
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}

Create draft codelist
    Test Case Setup Superuser
    Create testiautomaatiokoodisto with one code

Remove draft codelist
    Remove testiautomaatiokoodisto with one code

Remove codelist with Extension Schemes
    Test Case Setup Superuser
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_14}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_14}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_14}")]
    Wait until page contains    ${CODE_LIST_14}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_14}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Page should not contain element    //*[contains(text(), "Testikoodisto2 pitkillä arvoilla")]
    Close All Browsers

Remove imported Codelist with defaultcode
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_15}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_15}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_15}")]
    Wait until page contains    ${CODE_LIST_15}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Page should contain    Tunnus
    Page should contain    T1333
    Page should contain    Koodiston nimi
    Page should contain    Vakiokoodikoodisto
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_15}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove Code list with concept from Controlled Vocabularies
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "tutkija")]    timeout=30
    Click element    //*[contains(text(), "tutkija")]
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    tutkija
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove codelist with Extension Schemes and Extensions
    Test Case Setup Superuser
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_16}")]
    Wait until page contains    ${CODE_LIST_16}
    #Wait until page contains element    //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_16}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Page should not contain element    //*[contains(text(), "Koodisto600")]
    Close All Browsers

Remove Codelist with defaultcode
    Test Case Setup Superuser
    Remove imported Codelist with defaultcode

Test Case Setup Controlled Vocabularies
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Controlled Vocabularies
    Terminology Teardown
    Test Case Setup Superuser
    Remove Code list with concept from Controlled Vocabularies

Test Case Teardown Code with concept
    Terminology Teardown
    Test Case Setup Superuser
    Remove imported Draft code list

Cancel code list import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Go back to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2
    Close All Browsers

Upload extension scheme
    [Arguments]    ${extension_scheme}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=30
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${IMPORT_EXTENSION_SCHEMES_BTN}    timeout=30
    Click element    ${IMPORT_EXTENSION_SCHEMES_BTN}
    Sleep    2
    Choose file    ${EXTENSION_SCHEMES_FILE_UPLOAD}    ${extension_scheme}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_SCHEMES_UPLOAD_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEMES_TAB}    timeout=20
    Click element    ${EXTENSION_SCHEMES_TAB}
    Sleep    1

Upload extension
    [Arguments]    ${extension}    ${file_format}
    Wait until page contains element    ${EXTENSION_SCHEMES_DDL}    timeout=30
    Click element    ${EXTENSION_SCHEMES_DDL}
    Wait until page contains element    ${IMPORT_EXTENSION_BTN}    timeout=30
    Click element    ${IMPORT_EXTENSION_BTN}
    Wait until page contains element    ${FILE_FORMAT_UPLOAD}    timeout=20
    Click element    ${FILE_FORMAT_UPLOAD}
    Wait until page contains element    ${file_format}    timeout=20
    Click element    ${file_format}
    Wait until page contains element    ${EXTENSION_FILE_UPLOAD}    timeout=20
    Choose file    ${EXTENSION_FILE_UPLOAD}    ${extension}
    Sleep    2
    Wait until page contains element    ${EXTENSION_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_UPLOAD_BTN}
    Sleep    2

Create extension scheme
    [Arguments]    ${property_type}    ${extension_scheme_codevalue}    ${extension_scheme_name}    ${ext_scheme_status}    ${code_list_name}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=30
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${property_type}    timeout=30
    Click element    ${property_type}
    Sleep    2
    Wait until page contains element    ${EXTENSION_SCHEME_CODEVALUE_INPUT}    timeout=30
    Input Text    ${EXTENSION_SCHEME_CODEVALUE_INPUT}    ${extension_scheme_codevalue}
    Wait until page contains element    ${EXTENSION_SCHEME_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_SCHEME_NAME_INPUT}    ${extension_scheme_name}
    Wait until page contains element    ${EXT_SCHEME_STATUS_DDL}    timeout=20
    Click element    ${EXT_SCHEME_STATUS_DDL}
    Wait until page contains element    ${ext_scheme_status}    timeout=20
    Click element    ${ext_scheme_status}
    ${code_list_name_not_empty}    Should Not Be Empty    ${code_list_name}
    run keyword if    '${code_list_name_not_empty}' == 'None'    Add code list to extension scheme    ${code_list_name}
    Sleep    1
    Wait until page contains element    ${SAVE_EXTENSION_SCHEME}    timeout=30
    Click button    ${SAVE_EXTENSION_SCHEME}
    Sleep    2

Add code list to extension scheme
    [Arguments]    ${code_list_name}
    Wait until page contains element    ${ADD_CODE_LIST_TO_EXT_SCHEME_BTN}    timeout=30
    Click element    ${ADD_CODE_LIST_TO_EXT_SCHEME_BTN}
    Sleep    2
    Wait until page contains element    ${SEARCH_LINKED_CODE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_CODE_INPUT}    ${code_list_name}
    Click element    //*[contains(text(), "${code_list_name}")]
    Sleep    2

Create extension
    [Arguments]    ${extension_codevalue}    ${extension_name}    ${code}
    Wait until page contains element    ${EXTENSION_SCHEMES_DDL}    timeout=30
    Click button    ${EXTENSION_SCHEMES_DDL}
    Wait until page contains element    ${CREATE_EXTENSION_BTN}    timeout=30
    Click button    ${CREATE_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_VALUE_INPUT}    timeout=30
    Input Text    ${EXTENSION_VALUE_INPUT}    ${extension_codevalue}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_NAME_INPUT}    ${extension_name}
    Wait until page contains element    ${ADD_CODE_TO_EXTENSION_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_EXTENSION_BTN}
    Wait until page contains element    ${SEARCH_CODE_TO_EXTENSION_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_EXTENSION_INPUT}    ${code}
    Wait until page contains element    //*[contains(text(), "${code}")]    timeout=30
    Click element    //*[contains(text(), "${code}")]
    Sleep    2
    Wait until page contains element    ${SAVE_EXTENSION_SCHEME}    timeout=30
    Click button    ${SAVE_EXTENSION_SCHEME}
    Sleep    2

Remove codelist
    [Arguments]    ${code_list}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${code_list}
    Wait until page contains element    //*[contains(text(), "${code_list}")]    timeout=30
    Click element    //*[contains(text(), "${code_list}")]
    Wait until page contains    ${code_list}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    testiautomaatiokoodisto
    Page should contain    testiautomaatiokoodisto1
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${code_list}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
