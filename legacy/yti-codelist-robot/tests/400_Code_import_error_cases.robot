*** Settings ***
Documentation     Test Suite for Code import error cases
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_with_invalid_status}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu: xxxxxxxx
${Error_with_invalid_broader}    Aineistossa olevaa BROADER-sarakkeen koodia ei löydy tunnuksella
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
    Set default codelist variables    400

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes codevalue missing
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_codeValue}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=   Create import code missing CODEVALUE csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_no_codeValue}    
    Cancel code import

401. Import Codes with missing STATUS value
    [Documentation]    Import Codes (Excel, CSV) with missing STATUS value and check error message
    [Tags]    regression    test    400    status_change
    Set default codelist variables    401

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes status missing    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_status_value}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=   Create import code missing STATUS csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_no_status_value}    
    Cancel code import

402. Import Codes with invalid STATUS value
    [Documentation]    Import Codes (Excel, CSV) with invalid STATUS value and check error message
    [Tags]    regression    test    400    status_change
    Set default codelist variables    402

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid status
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_status}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code invalid STATUS csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes        ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_status}    
    Cancel code import

403. Import Codes with invalid BROADER value
    [Documentation]    Import Codes (Excel, CSV) with invalid BROADER value and check error message
    [Tags]    regression    test    400
    Set default codelist variables    403

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid broader value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_broader} ${DEFAULT_CODELIST_CODE_ID}_100.    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code invalid BROADER csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_broader} ${DEFAULT_CODELIST_CODE_ID}_100.               
    Cancel code import

404. Code import when BROADER code references code value of the code itself
    [Documentation]    Import Codes (Excel, CSV) when BROADER code references code value of the code itself and check error message
    [Tags]    regression    test    400
    Set default codelist variables    404

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with same broader value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_same_broader}                  
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code same BROADER csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_same_broader}                  
    Cancel code import

405. Import codes with duplicate comlumns
    [Documentation]    Import Codes (Excel, CSV) with duplicate columns and check error message
    [Tags]    regression    test    400
    Set default codelist variables    405

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with duplicate columns
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_columns}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with dublicate columns csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_columns_csv}    
    Cancel code import

406. Import codes with invalid HIERARCHYLEVEL value
    [Documentation]    Import Codes (Excel) with invalid HIERARCHYLEVEL and check that import is successful.
    [Tags]    regression    test    400
    Set default codelist variables    406

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid HL value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                        ${excel_file_path}
    Wait Until Page Contains            8 koodia                                    

407. Import codes with CODEVALUE column missing
    [Documentation]    Import codes (Excel, CSV) with CODEVALUE column missing and check error message
    [Tags]    regression    test    400
    Set default codelist variables    407

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes without codevalue column
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_codevalue_column_missing}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with CODEVALUE column missing csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_codevalue_column_missing}    
    Cancel code import

408. Import codes with invalid start date
    [Documentation]    Import codes (Excel, CSV) with invalid start date and check error message
    [Tags]    regression    test    400
    Set default codelist variables    408

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid startdate
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes                ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_startdate}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with invalid start date csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_startdate}    
    Cancel code import

409. Import codes with invalid ID values
    [Documentation]    Import codes (Excel, CSV) with invalid ID values and check error message
    [Tags]    regression    test    400
    Set default codelist variables    409

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid ID
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_invalid_ID}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with invalid ID csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_invalid_ID}    
    Cancel code import

410. Update code status from VALID to DRAFT
    [Documentation]    Update Code status from VALID to DRAFT with import function (Excel, CSV) and check error message
    [Tags]    regression    test    400
    Set default codelist variables    410

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Update code valid draft
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_update_code_valid_draft}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code valid draft csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_update_code_valid_draft}    
    Cancel code import

411. Import codes with duplicate CODEVALUES
    [Documentation]    Import codes (Excel, CSV) with duplicate CODEVALUES and check error message
    [Tags]    regression    test    400
    Set default codelist variables    411

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Duplicate codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_codes}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with dublicate CODEVALUES csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_with_duplicate_codes}    
    Cancel code import

412. Import Codes with invalid CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with invalid CODEVALUE and check error message. YTI-703
    [Tags]    regression    test    400
    Set default codelist variables    412

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes invalid codevalue
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_invalid_codeValue}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with invalid CODEVALUES csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_invalid_codeValue}    
    Cancel code import

413. Import Codes with missing ORDER value
    [Documentation]    Import Codes (Excel, CSV) with missing ORDER value and check error message. YTI-650
    [Tags]    koodistot
    Set default codelist variables    413

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes with missing order
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_missing_order}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with missing ORDER csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_missing_order}    
    Cancel code import

414. Import Codes with same ORDER values
    [Documentation]    Import Codes with same ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    Set default codelist variables    414

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with same order values  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_same_order_values}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with same ORDER csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_same_order_values}    
    Cancel code import

415. Import Codes with existing ORDER values
    [Documentation]    Import Codes with existing ORDER values in Code list and check error message
    [Tags]    koodistot
    Set default codelist variables    415

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_existing_order_values}    
    Cancel code import

416. Import Codes with invalid ORDER values
    [Documentation]    Import Codes with invalid ORDER values in Excel/CSV and check error message
    [Tags]    regression    koodistot    test    400
    Set default codelist variables    416

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    ${excel_file_path}=    Create excel Codes with invalid order values
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_invalid_order_value}    
    Cancel code import

    Import codes in CSV format
    ${csv_file_path}=      Create import code with invalid ORDER csv  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    ${Error_invalid_order_value}    
    Cancel code import

417. Import Codes with empty Excel file and Excel file with no content
    [Documentation]    Import Codes with Excel-file with no content and check error message
    [Tags]    regression    koodistot    test    400
    Set default codelist variables    417

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in Excel format
    ${excel_file_path}=    Create excel empty file
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_empty_Excel}    
    Cancel code import

    ${excel_file_path}=    Create excel No content excel
    Import codes in Excel format
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    ${Error_no_content}    
    Cancel code import

