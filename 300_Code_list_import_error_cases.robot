*** Settings ***
Documentation     Test Suite for Code list import error cases
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Code_list_no_codeValue}    ${DATAFOLDER}${/}Code_list_no_codeValue.xlsx
${Code_list_no_classification}    ${DATAFOLDER}${/}Code_list_no_classification_value.xlsx
${Code_list_invalid_classification}    ${DATAFOLDER}${/}Code_list_incorrect_classification_value.xlsx
${Code_list_no_status_value}    ${DATAFOLDER}${/}Code_list_no_status_value.xlsx
${Code_list_invalid_status_value}    ${DATAFOLDER}${/}Code_list_incorrect_status_value.xlsx
${Code_list_with_duplicate_columns}    ${DATAFOLDER}${/}Code_list_with_multiple_columns.xlsx
${Duplicate_code_lists}    ${DATAFOLDER}${/}Duplicate_code_lists.xlsx
${Code_list_exists}    ${DATAFOLDER}${/}Code_list_exists.xlsx
${Code_list_invalid_codeValue}    ${DATAFOLDER}${/}Code_list_with_invalid_codevalue.xlsx
${Code_list_max_hierarchy_level_codes}    ${DATAFOLDER}${/}Code_list_and_codes_with_max_hierarchy_level.xlsx
${2x_code_list}    ${DATAFOLDER}${/}2x_codelists.xlsx
${Code_list_invalid_propertytype}    ${DATAFOLDER}${/}Code_list_with_links_invalid_propertytype.xlsx
${Code_list_invalid_enddate}    ${DATAFOLDER}${/}Code_list_with_links_invalid_endate.xlsx
${Same_sub_code_list}    ${DATAFOLDER}${/}same_sub_code_list.xlsx
${Unknown_sub_code_list}    ${DATAFOLDER}${/}unknown_sub_code_list.xlsx
${empty}          ${DATAFOLDER}${/}empty.xlsx
${No_content_excel}    ${DATAFOLDER}${/}No_content_excel.xlsx
${Code_list_with_invalid_link_urls}    ${DATAFOLDER}${/}Code_list_with_invalid_link_URLs.xlsx
#CSV paths
${Code_list_no_codeValue_csv}    ${DATAFOLDER}${/}Code_list_no_codeValue_csv.csv
${Code_list_no_classification_csv}    ${DATAFOLDER}${/}Code_list_no_classification_value_csv.csv
${Code_list_invalid_classification_csv}    ${DATAFOLDER}${/}Code_list_incorrect_classification_value_csv.csv
${Code_list_invalid_codeValue_csv}    ${DATAFOLDER}${/}Code_list_with_invalid_codevalue_csv.csv
${2x_code_list_csv}    ${DATAFOLDER}${/}2x_codelists_csv.csv
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_classification_value}    Aineistolle annettua tietoaluetta ei löydy.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_invalid_status_value}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu: XXXXXX
${Error_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja: STATUS
${Error_duplicate_code_lists}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.
${Error_invalid_code_list}    Tunnus on virheellinen rivillä 2. Sallitut merkit ovat: a-zA-Z0-9_-
${Error_codes_max_hierarchy_level}    Koodien maksimi hierarkkinen taso ylittyi.
${Error_only_one_code_list}    Tiedostossa saa olla vain yksi koodisto.
${Error_code_list_exists}    Koodisto on jo olemassa.
${Error_invalid_propertytype}    Linkkiin liitettyä tyypitystä ei ole olemassa.
${Error_invalid_enddate}    Virheellinen loppupäivä rivillä 2.
${Error_same_sub_code_list}    Liittyvä koodisto on sama kuin koodin koodisto.
${Error_unknown_sub_code_list}    Liittyvää koodistoa ei löydy tunnisteella: 4c6c0ced-7e52-4e01-a985-000003ec223c
${Error_empty_Excel}    Virhe luettaessa Excel-tiedostoa. Tarkasta tuotavan tiedoston muoto.
${Error_codevalue_missing}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_no_content}    Excel-tiedosto on tyhjä. Varmista, että tietosisältö on määritelty oikein ja yritä uudelleen.
${Error_invalid_link_urls}    Tuotava aineisto sisältää virheellisiä arvoja linkkien HREF-sarakkeissa.

*** Test Cases ***
300. Import code list with missing codeValue
    [Documentation]    Import Code list (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_codeValue}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue_csv}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_codeValue}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

301. Import code list with missing CLASSIFICATION value
    [Documentation]    Import Code list with missing CLASSIFICATION value and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_no_classification}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    Tuo
    Wait Until Page Contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_no_classification_csv}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    Tuo
    Wait Until Page Contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

302. Import code list with invalid CLASSIFICATION value
    [Documentation]    Import Code list (Excel, CSV) with invalid CLASSIFICATION value and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_classification}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_classification_csv}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

303. Import code list with missing STATUS value
    [Documentation]    Import Code list with missing STATUS value and check error message
    [Tags]    regression    test    300    status_change
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_no_status_value}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_status_value}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

304. Import code list with invalid STATUS value
    [Documentation]    Import Code list with invalid STATUS value and check error message
    [Tags]    regression    test    300    status_change
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_status_value}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_status_value}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

305. Import code list with duplicate columns
    [Documentation]    Import Code list with duplicate columns and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_with_duplicate_columns}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_duplicate_columns}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

306. Import code list with duplicate code lists
    [Documentation]    Import Code list with duplicate Code lists and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Duplicate_code_lists}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_duplicate_code_lists}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

307. Import code list with invalid codeValue
    [Documentation]    Import Code list (Excel, CSV) with invalid codeValue and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_codeValue}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_code_list}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_codeValue_csv}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_code_list}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

308. Import code list with maximum hierarchies reached for codes
    [Documentation]    Import Code list (Excel) with maximum hierarchies reached
    ...    for codes and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_max_hierarchy_level_codes}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_codes_max_hierarchy_level}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

309. Create new version of code list from invalid file
    [Documentation]    Create new version of code list from file which contains two code lists
    ...    and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Click Element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait Until Page Contains Element    ${FILE_FORMAT_BTN}    timeout=20
    Click Element    ${FILE_FORMAT_BTN}
    Wait Until Page Contains Element    ${FILE_FORMAT_Excel}    timeout=20
    Click Element    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose File    ${FILE_UPLOAD_BTN}    ${2x_code_list}
    Wait Until Page Contains Element    ${UPLOAD_FILE_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_only_one_code_list}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_9}

310. Create new version of code list from file with same codevalue
    [Documentation]    Create new version of code list from file with same codevalue
    ...    and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Click Element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait Until Page Contains Element    ${FILE_FORMAT_BTN}    timeout=20
    Click Element    ${FILE_FORMAT_BTN}
    Wait Until Page Contains Element    ${FILE_FORMAT_Excel}    timeout=20
    Click Element    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_Codes_new_version}
    Wait Until Page Contains Element    ${UPLOAD_FILE_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_code_list_exists}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_9}

311. Import code list with invalid propertytype in links
    [Documentation]    Import code list with links and with invalid propertytype in links sheet and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_propertytype}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_propertytype}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

312. Import code list with invalid end date
    [Documentation]    Import code list with invalid end date and check error message. YTI-290.
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_enddate}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_enddate}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

313. Import code list with same sub code list
    [Documentation]    Import code list with same sub code list and check error message. YTI-317.
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Same_sub_code_list}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_same_sub_code_list}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

314. Import code list with unknown sub code list
    [Documentation]    Import code list with unknown sub code list and check error message. YTI-317.
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Unknown_sub_code_list}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_unknown_sub_code_list}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

315. Import empty Excel file
    [Documentation]    Import empty Excel file and check error message. YTI-569.
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${empty}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_empty_Excel}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${empty}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_codevalue_missing}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

316. Import Excel file with no content
    [Documentation]    Import Excel file with no content and check error message. YTI-574.
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${No_content_excel}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_content}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage

317. Import code list with invalid link URLs
    [Documentation]    Import code list with invalid link URLs and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_with_invalid_link_urls}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_link_urls}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage
