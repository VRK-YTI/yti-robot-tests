*** Settings ***
Documentation     Test Suite for Code list import error cases
Suite Teardown    Close All Browsers
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${BROWSER}        chrome
${USER_1}         Testi Admin
${CODE_LIST_4}    testiautomaatiokoodisto
${CODE_LIST_6}    testiautomaatiokoodisto 2
${TEST_CODE_1}    T100 - Automaatiokoodi
${CODE_LIST_STATUS_DRAFT_FI}    Luonnos
${CODE_LIST_STATUS_VALID_FI}    Voimassa oleva
${CODE_LIST_STATUSES_ALL}    Kaikki tilat
${EXPORT_TYPE_EXCEL}    Excel
${EXPORT_TYPE_CSV}    CSV
${REGISTRY_1}     Testirekisteri
${FILE_FORMAT_Excel}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[2]/dl/dd/div/button[2]
${FILE_FORMAT_CSV}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[2]/dl/dd/div/button[1]
#Buttons and links
${ADD_CLASSIFICATION_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/button
${LANGUAGE_DROPDOWN_BTN}    //*[@class="dropdown-toggle nav-link btn btn-language dropdown-toggle"]
${ADD_CODE_LIST_BTN}    id=import_codelist_button
${IMPORT_CODE_LIST_BTN}    id=import_from_file_button
${SELECT_REGISTRY_BTN}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[1]/div/app-coderegistry-input/dl/dd/div/app-dropdown/div/button
${FILE_FORMAT_BTN}    id=file_format_dropdown_button
${FILE_UPLOAD_BTN}    id=fileupload_input
${CLOSE_ERROR_MESSAGE_BTN}    //ngb-modal-window[2]/div/div/app-error-modal/div[3]/button
${CANCEL_IMPORT_CODE_LIST_BTN}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[3]/div/button[2]
${SAVE_CODE_LIST_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[1]/div/app-editable-buttons/button[1]
${MODIFY_CODE_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Muokkaa')]
${SAVE_CODE_MODIFICATION_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${STATUS_DROPDOWN_BTN}    css=app-filter-dropdown.d-inline-block:nth-child(3)
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
#CSV paths
${Code_list_no_codeValue_csv}    ${DATAFOLDER}${/}Code_list_no_codeValue_csv.csv
${Code_list_no_classification_csv}    ${DATAFOLDER}${/}Code_list_no_classification_value_csv.csv
${Code_list_invalid_classification_csv}    ${DATAFOLDER}${/}Code_list_incorrect_classification_value_csv.csv
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_classification_value}    Aineistolle annettua luokitusta ei löydy.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_invalid_status_value}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu.
${Error_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja.
${Error_duplicate_code_lists}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.

*** Test Cases ***
300. Import Code list with missing codeValue
    [Documentation]    Import Code list (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=10
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

301. Import Code list with missing CLASSIFICATION value
    [Documentation]    Import Code list with missing CLASSIFICATION value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_classification}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=10
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_classification_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

302. Import Code list with invalid CLASSIFICATION value
    [Documentation]    Import Code list (Excel, CSV) with invalid CLASSIFICATION value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_classification}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=10
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_classification_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

303. Import Code list with missing STATUS value
    [Documentation]    Import Code list with missing STATUS value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_status_value}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_status_value}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

304. Import Code list with invalid STATUS value
    [Documentation]    Import Code list with invalid STATUS value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_status_value}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_invalid_status_value}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

305. Import Code list with duplicate columns
    [Documentation]    Import Code list with duplicate columns and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_duplicate_columns}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_duplicate_columns}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

306. Import Code list with duplicate Code lists
    [Documentation]    Import Code list with duplicate Code lists and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Duplicate_code_lists}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_duplicate_code_lists}    timeout=10
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

*** Keywords ***
Test Case Setup
    Open Koodistot
    Choose user

Open Koodistot
    Open Koodistot in '${BROWSER}'
    Sleep    1

Choose user
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    //*[@class="nav-link dropdown-toggle"]
    Sleep    1
    Click element    //*[contains(text(), "${USER_1}")]
    Wait Until Page Contains    ${USER_1}
    Reload Page
    Sleep    2

Open Koodistot in '${BROWSER}'
    Open koodistot in dev-environment    ${BROWSER}
    Sleep    2
    Page should contain    Koodistot
    #Page should contain    Luokitus
    Page should contain    KIRJAUDU SISÄÄN

Open koodistot in dev-environment
    [Arguments]    ${browser}
    Set Selenium Speed    0.3
    Open Browser    https://koodistot-dev.suomi.fi/    browser=${browser}

Go back to Koodistot frontpage
    Wait until page contains element    //app-root/app-navigation-bar/nav/a/span    timeout=10
    Click element    //app-root/app-navigation-bar/nav/a/span
    Sleep    2
    Close All Browsers

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_BTN}    timeout=10
    Click element    ${SAVE_CODE_LIST_BTN}

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=10
    Click element    ${MODIFY_CODE_BTN}

Save code modification
    Wait until page contains element    ${SAVE_CODE_MODIFICATION_BTN}
    Click element    ${SAVE_CODE_MODIFICATION_BTN}

Select draft code list
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN})
    Click element    //*[contains(text(), "${CODE_LIST_STATUS_DRAFT_FI}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Wait until page contains    ${CODE_LIST_4}
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains    ${TEST_CODE_1}

Import code list in Excel format
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=10
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=10
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=10
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Import code list in CSV format
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=10
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=10
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Cancel code list import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}
