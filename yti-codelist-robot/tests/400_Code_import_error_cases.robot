*** Settings ***
Documentation     Test Suite for Code import error cases
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Remove codelist teardown      testiautomaatiokoodisto

Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_with_invalid_status}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu: xxxxxxxx
${Error_with_invalid_broader}    Aineistossa olevaa BROADER-sarakkeen koodia ei löydy tunnuksella koodi1007.
${Error_with_same_broader}    BROADER-sarakkeen arvo viittaa koodiin itseensä.
${Error_with_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja: STATUS
${Error_with_duplicate_columns_csv}    Aineistosta löytyi sama sarake useita kertoja.
${Error_with_invalid_HL_value}    HIERARCHYLEVEL-sarakkeen arvo ei ole sallittu.
${Error_with_codevalue_column_missing}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_with_invalid_startdate}    Virheellinen alkupäivä rivillä 2.
${Error_with_invalid_ID}    Aineistossa oleva ID-sarakkeen arvo ei ole sallittu.
${Error_with_update_code_valid_draft}    Väärä kohdetila.
${Error_with_duplicate_codes}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.
${Error_invalid_codeValue}    Tunnus on virheellinen rivillä 2. Sallitut merkit ovat ovat: a-zA-Z0-9_-.+*#&
${Error_missing_order}    Koodin order-sarakkeen kentät ovat puutteelliset.
${Error_same_order_values}    Koodin order-sarakkeen kentistä löytyi samoja arvoja.
${Error_existing_order_values}    Koodin order-arvo on jo käytössä tässä koodistossa.
${Error_invalid_order_value}    ORDER-sarakkeen arvo ei ole sallittu rivillä 1.
${Error_no_codevalue}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_no_content}    Excel-tiedosto on tyhjä. Varmista, että tietosisältö on määritelty oikein ja yritä uudelleen.
${Error_empty_Excel}    Virhe luettaessa Excel-tiedostoa. Tarkasta tuotavan tiedoston muoto.

*** Test Cases ***
400. Import Codes with missing CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes codevalue missing
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_codeValue}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=   Create import code missing CODEVALUE csv
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_no_codeValue}    timeout=20
    Cancel code import

401. Import Codes with missing STATUS value
    [Documentation]    Import Codes (Excel, CSV) with missing STATUS value and check error message
    [Tags]    regression    test    400    status_change
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes status missing    
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_status_value}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=   Create import code missing STATUS csv
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_no_status_value}    timeout=20
    Cancel code import

402. Import Codes with invalid STATUS value
    [Documentation]    Import Codes (Excel, CSV) with invalid STATUS value and check error message
    [Tags]    regression    test    400    status_change
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid status
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_status}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=   Create import code invalid STATUS csv
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_status}    timeout=20
    Cancel code import

403. Import Codes with invalid BROADER value
    [Documentation]    Import Codes (Excel, CSV) with invalid BROADER value and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid broader value
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_broader}               timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code invalid BROADER csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_broader}               timeout=20
    Cancel code import

404. Code import when BROADER code references code value of the code itself
    [Documentation]    Import Codes (Excel, CSV) when BROADER code references code value of the code itself and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with same broader value
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_same_broader}                  timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code same BROADER csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_same_broader}                  timeout=20
    Cancel code import

405. Import codes with duplicate comlumns
    [Documentation]    Import Codes (Excel, CSV) with duplicate columns and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with duplicate columns
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_columns}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with dublicate columns csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_columns_csv}    timeout=20
    Cancel code import

406. Import codes with invalid HIERARCHYLEVEL value
    [Documentation]    Import Codes (Excel) with invalid HIERARCHYLEVEL and check that import is successful.
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid HL value
    Import codes in Excel format
    Upload codes                        ${excel_file_path}
    Wait Until Page Contains            8 koodia                                    timeout=20

407. Import codes with CODEVALUE column missing
    [Documentation]    Import codes (Excel, CSV) with CODEVALUE column missing and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes without codevalue column
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_codevalue_column_missing}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with CODEVALUE column missing csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_codevalue_column_missing}    timeout=20
    Cancel code import

408. Import codes with invalid start date
    [Documentation]    Import codes (Excel, CSV) with invalid start date and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid startdate
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_startdate}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with invalid start date csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_startdate}    timeout=20
    Cancel code import

409. Import codes with invalid ID values
    [Documentation]    Import codes (Excel, CSV) with invalid ID values and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid ID
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_ID}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with invalid ID csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_ID}    timeout=20
    Cancel code import

410. Update code status from VALID to DRAFT
    [Documentation]    Update Code status from VALID to DRAFT with import function (Excel, CSV) and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Update code valid draft
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_update_code_valid_draft}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code valid draft csv  codevalue=koodi01  preflabel_fi=Koodi01
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_update_code_valid_draft}    timeout=20
    Cancel code import

411. Import codes with duplicate CODEVALUES
    [Documentation]    Import codes (Excel, CSV) with duplicate CODEVALUES and check error message
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Duplicate codes
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_codes}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with dublicate CODEVALUES csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_codes}    timeout=20
    Cancel code import

412. Import Codes with invalid CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with invalid CODEVALUE and check error message. YTI-703
    [Tags]    regression    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes invalid codevalue
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_invalid_codeValue}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with invalid CODEVALUES csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_invalid_codeValue}    timeout=20
    Cancel code import

413. Import Codes with missing ORDER value
    [Documentation]    Import Codes (Excel, CSV) with missing ORDER value and check error message. YTI-650
    [Tags]    koodistot
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes with missing order
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_missing_order}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with missing ORDER csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_missing_order}    timeout=20
    Cancel code import

414. Import Codes with same ORDER values
    [Documentation]    Import Codes with same ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with same order values  
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_same_order_values}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with same ORDER csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_same_order_values}    timeout=20
    Cancel code import

415. Import Codes with existing ORDER values
    [Documentation]    Import Codes with existing ORDER values in Code list and check error message
    [Tags]    koodistot
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_existing_order_values}    timeout=20
    Cancel code import

416. Import Codes with invalid ORDER values
    [Documentation]    Import Codes with invalid ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    ${excel_file_path}=    Create excel Codes with invalid order values
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_invalid_order_value}    timeout=20
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=           Create import code with invalid ORDER csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_invalid_order_value}    timeout=20
    Cancel code import

417. Import Codes with empty Excel file and Excel file with no content
    [Documentation]    Import Codes with Excel-file with no content and check error message
    [Tags]    regression    koodistot    test    400
    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_2}

    Import codes in Excel format
    ${excel_file_path}=    Create excel empty file
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_empty_Excel}    timeout=20
    Cancel code import

    ${excel_file_path}=    Create excel No content excel
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_content}    timeout=20
    Cancel code import

