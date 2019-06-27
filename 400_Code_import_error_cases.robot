*** Settings ***
Documentation     Test Suite for Code import error cases
Suite Teardown    Close all Browsers
Test Teardown     Close all Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Codes_codevalue_missing}    ${DATAFOLDER}${/}Codes_codevalue_missing.xlsx
${Codes_status_missing}    ${DATAFOLDER}${/}Codes_status_missing.xlsx
${Codes_with_invalid_status}    ${DATAFOLDER}${/}Codes_with_invalid_status.xlsx
${Codes_with_invalid_broader}    ${DATAFOLDER}${/}Codes_with_invalid_broader_value.xlsx
${Codes_with_same_broader}    ${DATAFOLDER}${/}Codes_with_same_broader_value.xlsx
${Codes_with_duplicate_columns}    ${DATAFOLDER}${/}Codes_with_duplicate_columns.xlsx
${Codes_with_invalid_HL}    ${DATAFOLDER}${/}Codes_with_invalid_HL_value.xlsx
${Codes_without_codevalue_column}    ${DATAFOLDER}${/}Codes_without_codevalue_column.xlsx
${Codes_with_invalid_startdate}    ${DATAFOLDER}${/}Codes_with_invalid_startdate.xlsx
${Codes_with_invalid_ID}    ${DATAFOLDER}${/}Codes_with_invalid_ID.xlsx
${Update_Code_valid_draft}    ${DATAFOLDER}${/}Update_code_valid_draft.xlsx
${Duplicate_Codes}    ${DATAFOLDER}${/}Duplicate_codes.xlsx
${Codes_without_ID_column}    ${DATAFOLDER}${/}Codes_without_ID_column.xlsx
${Codes_invalid_codevalue}    ${DATAFOLDER}${/}Codes_invalid_codevalue.xlsx
${Codes_with_missing_order_value}    ${DATAFOLDER}${/}Codes_with_missing_order.xlsx
${Same_order_values}    ${DATAFOLDER}${/}Codes_with_same_order_values.xlsx
${Codes_with_order_values}    ${DATAFOLDER}${/}Codes_with_order_values.xlsx
${Codes_with_existing_order_values}    ${DATAFOLDER}${/}Codes_with_existing_order_values.xlsx
${Codes_with_invalid_order_values}    ${DATAFOLDER}${/}Codes_with_invalid_order_values.xlsx
${Error_empty_Excel}    Virhe luettaessa Excel-tiedostoa. Tarkasta tuotavan tiedoston muoto.
${empty}          ${DATAFOLDER}${/}empty.xlsx
${No_content_excel}    ${DATAFOLDER}${/}No_content_excel.xlsx
#CSV paths
${Codes_codevalue_missing_csv}    ${DATAFOLDER}${/}Codes_codevalue_missing_csv.csv
${Codes_status_missing_csv}    ${DATAFOLDER}${/}Codes_status_missing_csv.csv
${Codes_with_invalid_status_csv}    ${DATAFOLDER}${/}Codes_with_invalid_status_csv.csv
${Codes_with_invalid_broader_csv}    ${DATAFOLDER}${/}Codes_with_invalid_broader_value_csv.csv
${Codes_with_same_broader_csv}    ${DATAFOLDER}${/}Codes_with_same_broader_value_csv.csv
${Codes_with_duplicate_columns_csv}    ${DATAFOLDER}${/}Codes_with_duplicate_columns_csv.csv
${Codes_with_invalid_HL_csv}    ${DATAFOLDER}${/}Codes_with_invalid_HL_value_csv.csv
${Codes_without_codevalue_column_csv}    ${DATAFOLDER}${/}Codes_without_codevalue_column_csv.csv
${Codes_with_invalid_startdate_csv}    ${DATAFOLDER}${/}Codes_with_invalid_startdate_csv.csv
${Codes_with_invalid_ID_csv}    ${DATAFOLDER}${/}Codes_with_invalid_ID_csv.csv
${Update_Code_valid_draft_csv}    ${DATAFOLDER}${/}Update_code_valid_draft_csv.csv
${Duplicate_Codes_csv}    ${DATAFOLDER}${/}Duplicate_codes_csv.csv
${Codes_invalid_codevalue_csv}    ${DATAFOLDER}${/}Codes_invalid_codevalue_csv.csv
${Codes_with_missing_order_value_csv}    ${DATAFOLDER}${/}Codes_with_missing_order_csv.csv
${Same_order_values_csv}    ${DATAFOLDER}${/}Codes_with_same_order_values_csv.csv
${Codes_with_invalid_order_values_csv}    ${DATAFOLDER}${/}Codes_with_invalid_order_values_csv.csv
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 5.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 7.
${Error_with_invalid_status}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu.
${Error_with_invalid_broader}    Aineistossa olevaa BROADER-sarakkeen koodia ei löydy tunnuksella koodi1007.
${Error_with_same_broader}    BROADER-sarakkeen arvo viittaa koodiin itseensä.
${Error_with_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja: STATUS
${Error_with_duplicate_columns_csv}    Aineistosta löytyi sama sarake useita kertoja.
${Error_with_invalid_HL_value}    HIERARCHYLEVEL-sarakkeen arvo ei ole sallittu.
${Error_with_codevalue_column_missing}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_with_invalid_startdate}    Virheellinen alkupäivä rivillä 5.
${Error_with_invalid_ID}    Aineistossa oleva ID-sarakkeen arvo ei ole sallittu.
${Error_with_update_code_valid_draft}    Väärä kohdetila.
${Error_with_duplicate_codes}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.
${Error_invalid_codeValue}    Tunnus on virheellinen rivillä 9. Sallitut merkit ovat ovat: a-zA-Z0-9_-.+*#&
${Error_missing_order}    Koodin order-sarakkeen kentät ovat puutteelliset.
${Error_same_order_values}    Koodin order-sarakkeen kentistä löytyi samoja arvoja.
${Error_existing_order_values}    Koodin order-arvo on jo käytössä tässä koodistossa.
${Error_invalid_order_value}    ORDER-sarakkeen arvo ei ole sallittu rivillä 2.
${Error_no_codevalue}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_no_content}    Excel-tiedosto on tyhjä. Varmista, että tietosisältö on määritelty oikein ja yritä uudelleen.

*** Test Cases ***
400. Import Codes with missing CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_codevalue_missing}
    Wait until page contains    ${Error_no_codeValue}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_codevalue_missing_csv}
    Wait until page contains    ${Error_no_codeValue}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

401. Import Codes with missing STATUS value
    [Documentation]    Import Codes (Excel, CSV) with missing STATUS value and check error message
    [Tags]    regression    test    400    status_change
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_status_missing}
    Wait until page contains    ${Error_no_status_value}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_status_missing_csv}
    Wait until page contains    ${Error_no_status_value}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

402. Import Codes with invalid STATUS value
    [Documentation]    Import Codes (Excel, CSV) with invalid STATUS value and check error message
    [Tags]    regression    test    400    status_change
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_status}
    Wait until page contains    ${Error_with_invalid_status}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_status_csv}
    Wait until page contains    ${Error_with_invalid_status}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

403. Import Codes with invalid BROADER value
    [Documentation]    Import Codes (Excel, CSV) with invalid BROADER value and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_broader}
    Wait until page contains    ${Error_with_invalid_broader}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_broader_csv}
    Wait until page contains    ${Error_with_invalid_broader}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

404. Code import when BROADER code references code value of the code itself
    [Documentation]    Import Codes (Excel, CSV) when BROADER code references code value of the code itself and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_same_broader}
    Wait until page contains    ${Error_with_same_broader}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_same_broader_csv}
    Wait until page contains    ${Error_with_same_broader}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

405. Import codes with duplicate comlumns
    [Documentation]    Import Codes (Excel, CSV) with duplicate columns and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_duplicate_columns}
    Wait until page contains    ${Error_with_duplicate_columns}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_duplicate_columns_csv}
    Wait until page contains    ${Error_with_duplicate_columns_csv}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

406. Import codes with invalid HIERARCHYLEVEL value
    [Documentation]    Import Codes (Excel, CSV) with invalid HIERARCHYLEVEL value and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_HL}
    Wait until page contains    ${Error_with_invalid_HL_value}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_HL_csv}
    Wait until page contains    ${Error_with_invalid_HL_value}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

407. Import codes with CODEVALUE column missing
    [Documentation]    Import codes (Excel, CSV) with CODEVALUE column missing and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_without_codevalue_column}
    Wait until page contains    ${Error_with_codevalue_column_missing}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_without_codevalue_column_csv}
    Wait until page contains    ${Error_with_codevalue_column_missing}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

408. Import codes with invalid start date
    [Documentation]    Import codes (Excel, CSV) with invalid start date and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_startdate}
    Wait until page contains    ${Error_with_invalid_startdate}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_startdate_csv}
    Wait until page contains    ${Error_with_invalid_startdate}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

409. Import codes with invalid ID values
    [Documentation]    Import codes (Excel, CSV) with invalid ID values and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_ID}
    Wait until page contains    ${Error_with_invalid_ID}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_ID_csv}
    Wait until page contains    ${Error_with_invalid_ID}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

410. Update code status from VALID to DRAFT
    [Documentation]    Update Code status from VALID to DRAFT with import function (Excel, CSV) and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Update_Code_valid_draft}
    Wait until page contains    ${Error_with_update_code_valid_draft}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Update_Code_valid_draft_csv}
    Wait until page contains    ${Error_with_update_code_valid_draft}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

411. Import codes with duplicate CODEVALUES
    [Documentation]    Import codes (Excel, CSV) with duplicate CODEVALUES and check error message
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Duplicate_Codes}
    Wait until page contains    ${Error_with_duplicate_codes}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Duplicate_Codes_csv}
    Wait until page contains    ${Error_with_duplicate_codes}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

412. Import Codes with invalid CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with invalid CODEVALUE and check error message. YTI-703
    [Tags]    regression    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_invalid_codevalue}
    Wait until page contains    ${Error_invalid_codeValue}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_invalid_codevalue_csv}
    Wait until page contains    ${Error_invalid_codeValue}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

413. Import Codes with missing ORDER value
    [Documentation]    Import Codes (Excel, CSV) with missing ORDER value and check error message. YTI-650
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_missing_order_value}
    Wait until page contains    ${Error_missing_order}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_missing_order_value_csv}
    Wait until page contains    ${Error_missing_order}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

414. Import Codes with same ORDER values
    [Documentation]    Import Codes with same ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Same_order_values}
    Wait until page contains    ${Error_same_order_values}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Same_order_values_csv}
    Wait until page contains    ${Error_same_order_values}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

415. Import Codes with existing ORDER values
    [Documentation]    Import Codes with existing ORDER values in Code list and check error message
    [Tags]    koodistot
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_order_values}
    Wait until page contains    ${Error_existing_order_values}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

416. Import Codes with invalid ORDER values
    [Documentation]    Import Codes with invalid ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${Codes_with_invalid_order_values}
    Wait until page contains    ${Error_invalid_order_value}    timeout=20
    Cancel code import
    Import codes in CSV format
    Upload codes    ${Codes_with_invalid_order_values_csv}
    Wait until page contains    ${Error_invalid_order_value}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

417. Import Codes with empty Excel file and Excel file with no content
    [Documentation]    Import Codes with Excel-file with no content and check error message
    [Tags]    regression    koodistot    test    400
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Import codes in Excel format
    Upload codes    ${empty}
    Wait until page contains    ${Error_empty_Excel}    timeout=20
    Cancel code import
    Import codes in Excel format
    Upload codes    ${No_content_excel}
    Wait until page contains    ${Error_no_content}    timeout=20
    Cancel code import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}
