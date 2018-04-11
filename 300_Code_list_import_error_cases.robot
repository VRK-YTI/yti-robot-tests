*** Settings ***
Documentation     Test Suite for Code list import error cases
Suite Teardown    Close All Browsers
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://koodistot-dev.suomi.fi/
${USER_1}         id=testiadmin@localhost
${TEST_CODE_1}    T100 - Automaatiokoodi
${REGISTRY_1}     Testirekisteri
${FILE_FORMAT_Excel}    id=excel_format_dropdown_button
${FILE_FORMAT_CSV}    id=csv_format_dropdown_button
#Buttons and links
${ADD_CODE_LIST_BTN}    id=import_codelist_button
${IMPORT_CODE_LIST_BTN}    id=import_from_file_button
${SELECT_REGISTRY_BTN}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[1]/div/app-coderegistry-input/dl/dd/div/app-dropdown/div/button
${FILE_FORMAT_BTN}    id=file_format_dropdown_button
${FILE_UPLOAD_BTN}    id=fileupload_input
${CLOSE_ERROR_MESSAGE_BTN}    //ngb-modal-window[2]/div/div/app-error-modal/div[3]/button
${CANCEL_IMPORT_CODE_LIST_BTN}    id=cancel_upload_button
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
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
#CSV paths
${Code_list_no_codeValue_csv}    ${DATAFOLDER}${/}Code_list_no_codeValue_csv.csv
${Code_list_no_classification_csv}    ${DATAFOLDER}${/}Code_list_no_classification_value_csv.csv
${Code_list_invalid_classification_csv}    ${DATAFOLDER}${/}Code_list_incorrect_classification_value_csv.csv
${Code_list_invalid_codeValue_csv}    ${DATAFOLDER}${/}Code_list_with_invalid_codevalue_csv.csv
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 2.
${Error_no_classification_value}    Aineistolle annettua luokitusta ei löydy.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 2.
${Error_invalid_status_value}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu.
${Error_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja.
${Error_duplicate_code_lists}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.
${Error_invalid_code_list}    Tunnus on virheellinen. Sallitut arvot ovat: a-zA-Z0-9_-

*** Test Cases ***
300. Import Code list with missing codeValue
    [Documentation]    Import Code list (Excel, CSV) with missing codeValue and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_codeValue_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_no_classification_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_classification_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_classification_value}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_no_status_value}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_invalid_status_value}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_duplicate_columns}    timeout=20
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
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_duplicate_code_lists}    timeout=20
    Cancel code list import
    Sleep    2
    Go back to Koodistot frontpage

307. Import Code list with invalid codeValue
    [Documentation]    Import Code list (Excel, CSV) with invalid codeValue and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_codeValue}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_invalid_code_list}    timeout=20
    Cancel code list import
    Import code list in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_invalid_codeValue_csv}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_invalid_code_list}    timeout=20
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
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Sleep    1
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=20
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
    Open Browser    ${ENVIRONMENT_URL}    browser=${browser}

Go back to Koodistot frontpage
    Wait until page contains element    //app-root/app-navigation-bar/nav/a/span    timeout=20
    Click element    //app-root/app-navigation-bar/nav/a/span
    Sleep    2
    Close All Browsers

Import code list in Excel format
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Import code list in CSV format
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=20
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Cancel code list import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}
