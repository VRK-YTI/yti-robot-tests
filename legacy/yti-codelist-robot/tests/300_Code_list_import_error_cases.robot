*** Settings ***
Documentation     Test Suite for Code list import error cases
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_classification_value}    Aineistolle annettua tietoaluetta ei löydy.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_invalid_status_value}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu: XXXXXX
${Error_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja: STATUS
${Error_duplicate_code_lists}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.
${Error_invalid_code_list}    Tunnus on virheellinen rivillä 2. Sallitut merkit ovat: a-zA-Z0-9_-
${Error_codes_max_hierarchy_level}    Koodien hierarkkisten tasojen maksimiarvo ylittyi.
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
${Error_invalid_language_code_delimiter}    Aineistossa on kielikoodi arvolla sv:fi, joka ei ole sallittu.

*** Test Cases ***
300. Import code list with missing codeValue
    [Documentation]    Import Code list (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression    test    300
    Set default codelist variables    300

    ${excel_file_path}=    Create excel Code list no codeValue     ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in Excel format
    Choose File                         ${FILE_UPLOAD_BTN}          ${excel_file_path}
    Click element with wait             ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_no_codeValue}       
    Cancel code list import

    ${csv_file_path}=   Create missing CODEVALUE csv     ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in CSV format
    Choose File                         ${FILE_UPLOAD_BTN}          ${csv_file_path}
    Click element with wait             ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_no_codeValue}       
    Cancel code list import

301. Import code list with missing CLASSIFICATION value
    [Documentation]    Import Code list with missing CLASSIFICATION value and check error message
    [Tags]    regression    test    300
    Set default codelist variables    301
    
    ${excel_file_path}=    Create excel Code list no classification value  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}

    Import code list in Excel format
    Choose File                         ${FILE_UPLOAD_BTN}          ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}     
    Click Button                        Tuo
    Wait Until Page Contains            ${Error_no_classification_value}    
    Cancel code list import

    ${csv_file_path}=   Create missing CLASSIFICATION csv
    ...                 ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                 ${DEFAULT_PREFLABEL_SCHEME}

    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${csv_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    Tuo
    Wait Until Page Contains    ${Error_no_classification_value}    
    Cancel code list import

302. Import code list with invalid CLASSIFICATION value
    [Documentation]    Import Code list (Excel, CSV) with invalid CLASSIFICATION value and check error message
    [Tags]    regression    test    300
    Set default codelist variables    302
    
    ${excel_file_path}=    Create excel Code list incorrect classification value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_classification_value}    
    Cancel code list import

    ${csv_file_path}=  Create invalid CLASSIFICATION csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in CSV format

    Choose File    ${FILE_UPLOAD_BTN}    ${csv_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_classification_value}    
    Cancel code list import

304. Import code list with missing STATUS value
    [Documentation]    Import Code list with missing STATUS value and check error message
    [Tags]    regression    test    300    status_change
    Set default codelist variables    304
    
    ${excel_file_path}=    Create excel Code list no status value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_status_value}    
    Cancel code list import

305. Import code list with duplicate columns
    [Documentation]    Import Code list with duplicate columns and check error message
    [Tags]    regression    test    300 
    Set default codelist variables    305
    
    ${excel_file_path}=    Create excel Code list with multiple columns
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_duplicate_columns}    
    Cancel code list import

306. Import code list with duplicate code lists
    [Documentation]    Import Code list with duplicate Code lists and check error message
    [Tags]    regression    test    300
    Set default codelist variables    306
    
    ${excel_file_path}=    Create excel Duplicate code lists
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}   
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_duplicate_code_lists}    
    Cancel code list import

307. Import code list with invalid codeValue
    [Documentation]    Import Code list (Excel, CSV) with invalid codeValue and check error message
    [Tags]    regression    test    300
    Set default codelist variables    307
    
    ${excel_file_path}=    Create excel Code list with invalid codevalue
    ...                    ${DEFAULT_PREFLABEL_SCHEME}   
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_code_list}    
    Cancel code list import

    ${csv_file_path}=   Create invalid CODEVALUE csv
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    Import code list in CSV format
    
    Choose File    ${FILE_UPLOAD_BTN}    ${csv_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_code_list}    
    Cancel code list import

308. Import code list with maximum hierarchies reached for codes
    [Documentation]    Import Code list (Excel) with maximum hierarchies reached
    ...    for codes and check error message
    [Tags]    regression    test    300
    Set default codelist variables    308
    
    ${excel_file_path}=    Create excel Code list and codes with max hierarchy level
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_codes_max_hierarchy_level}    
    Cancel code list import

309. Create new version of code list from invalid file
    [Documentation]    Create new version of code list from file which contains two code lists
    ...    and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    309
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Upload codelist             ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    10 koodia    

    Click element with wait     ${CODE_LIST_DDL}                        
    Click element with wait     ${CREATE_CODELIST_VERSION_FROM_FILE}    
    Click element with wait     ${FILE_FORMAT_BTN}                      
    Click element with wait     ${FILE_FORMAT_Excel}                    

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel 2x codelists
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Wait Until Page Contains Element    ${UPLOAD_FILE_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_only_one_code_list}    
    Cancel code list import

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

310. Create new version of code list from file with same codevalue
    [Documentation]    Create new version of code list from file with same codevalue
    ...    and check error message
    [Tags]    regression    test    300
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    310

    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Upload codelist             ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    10 koodia    

    Click element with wait     ${CODE_LIST_DDL}                        
    Click element with wait     ${CREATE_CODELIST_VERSION_FROM_FILE}    
    Click element with wait     ${FILE_FORMAT_BTN}                      
    Click element with wait     ${FILE_FORMAT_Excel}                    

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Wait Until Page Contains Element    ${UPLOAD_FILE_BTN}    
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_code_list_exists}    
    Cancel code list import

    [Teardown]    Remove codelist teardown     ${DEFAULT_CODELIST_SCHEME_ID}

311. Import code list with invalid propertytype in links
    [Documentation]    Import code list with links and with invalid propertytype in links sheet and check error message
    [Tags]    regression    test    300
    Set default codelist variables    311
    
    ${excel_file_path}=    Create excel Code list with links invalid propertytype
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Choose File                         ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_invalid_propertytype}    
    Cancel code list import

312. Import code list with invalid end date
    [Documentation]    Import code list with invalid end date and check error message. YTI-290.
    [Tags]    regression    test    300
    Set default codelist variables    312

    ${excel_file_path}=    Create excel Code list with links invalid endate
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Choose File                         ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_invalid_enddate}   
    Cancel code list import

313. Import code list with same sub code list
    [Documentation]    Import code list with same sub code list and check error message. YTI-317.
    [Tags]    regression    test    300
    Set default codelist variables    313
    
    ${excel_file_path}=    Create excel same sub code list
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Choose File                         ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_same_sub_code_list}    
    Cancel code list import

314. Import code list with unknown sub code list
    [Documentation]    Import code list with unknown sub code list and check error message. YTI-317.
    [Tags]    regression    test    300
    Set default codelist variables    314
    
    ${excel_file_path}=    Create excel unknown sub code list
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format

    Choose File                         ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_unknown_sub_code_list}    
    Cancel code list import

315. Import empty Excel file
    [Documentation]    Import empty Excel file and check error message. YTI-569.
    [Tags]    regression    test    300
    Set default codelist variables    315
    
    Import code list in Excel format
    ${excel_file_path}=    Create excel empty file
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_empty_Excel}    
    Cancel code list import

    Import code list in CSV format
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_codevalue_missing}    
    Cancel code list import

316. Import Excel file with no content
    [Documentation]    Import Excel file with no content and check error message. YTI-574.
    [Tags]    regression    test    300
    Set default codelist variables    316
    
    ${excel_file_path}=    Create excel No content excel
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_no_content}    
    Cancel code list import

317. Import code list with invalid link URLs
    [Documentation]    Import code list with invalid link URLs and check error message
    [Tags]    regression    test    300
    Set default codelist variables    317
    
    ${excel_file_path}=    Create excel Code list with invalid link URLs
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_link_urls}    
    Cancel code list import

318. Import code list with invalid delimiter in LANGUAGECODE column
    [Documentation]    Import code list with invalid delimiter in LANGUAGECODE column
    ...    and check error message. YTI-1097.
    [Tags]    regression    test    300
    Set default codelist variables    318
    
    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list invalid delimiter in language code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}    
    Click Button    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_language_code_delimiter}    
    Cancel code list import
