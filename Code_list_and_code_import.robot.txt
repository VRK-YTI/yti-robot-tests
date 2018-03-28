*** Settings ***
Documentation     Test Suite for Code list and Code import
Suite Teardown    Close All Browsers
Library           Selenium2Library

*** Variables ***
${USER_1}         Testi Superuser
${CODE_LIST_1}    koodisto6000
${CODE_LIST_2}    koodisto7000
${CODE_LIST_3}    testiautomaatiokoodisto
${CODE_LIST_VALUE_1}    Koodisto 6000
${CODE_LIST_VALUE_2}    t100
${CODE_LIST_6}    testiautomaatiokoodisto 2
${TEST_CODE_1}    T100 - Automaatiokoodi
${CODE_LIST_STATUS_DRAFT_FI}    Luonnos
${CODE_LIST_STATUS_VALID_FI}    Voimassa oleva
${CODE_LIST_STATUSES_ALL}    Kaikki tilat
${CODES_FILE_FORMAT_Excel}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[2]/div/div/div[1]/dl/dd/div/button[2]
${CODE_LIST_FILE_FORMAT_Excel}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[2]/dl/dd/div/button[2]
${REGISTRY_1}     Testirekisteri
#Buttons and links
${LICENCE}        //ngb-modal-window/div/div/app-link-list-modal/div[2]/div/div/div[1]/div[1]/div/label/input
${ADD_CLASSIFICATION_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/button
${LANGUAGE_DROPDOWN_BTN}    //*[@class="dropdown-toggle nav-link btn btn-language dropdown-toggle"]
${ADD_CODE_LIST_BTN}    //app-root/div/app-frontpage/div/div[2]/div[2]/div[1]/div/div/button
${IMPORT_CODE_LIST_BTN}    //app-root/div/app-code-scheme-import-and-create/div/button[1]
${SELECT_REGISTRY_BTN}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[2]/div[1]/div/app-coderegistry-input/dl/dd/div/app-dropdown/div/button
${FILE_FORMAT_BTN}    //*[@id="format-dropdown"]
${FILE_UPLOAD_BTN}    //*[@id="fileupload"]
${IMPORT_CODE_LIST_BTN}    css=button.btn-action:nth-child(1)
${CLOSE_ERROR_MESSAGE_BTN}    //ngb-modal-window[2]/div/div/app-error-modal/div[3]/button
${CANCEL_IMPORT_CODE_LIST_BTN}    //ngb-modal-window/div/div/app-code-scheme-import-modal/div/div[3]/div/button[2]
${FILE_FORMAT_Excel}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[2]/div/div/div[1]/dl/dd/div/button[2]
${FILE_FORMAT_CSV}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[2]/div/div/div[1]/dl/dd/div/button[1]
${IMPORT_CODES_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-codes/div/div[2]/div/button[1]
${IMPORT_BTN}     //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[3]/div/button[1]
${CLOSE_ERROR_MESSAGE_BTN}    //ngb-modal-window[2]/div/div/app-error-modal/div[3]/button
${CANCEL_IMPORT_CODE_LIST_BTN}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[3]/div/button[2]
${REMOVE_CODE_LIST_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[1]/div/button
${REMOVE_CODE_LIST_CONF_BTN}    //ngb-modal-window/div/div/app-confirmation-modal/div[3]/button[1]
${STATUS_DROPDOWN_BTN}    css=app-filter-dropdown.d-inline-block:nth-child(3)
${CREATE CODE_LIST_BTN}    //button[@class='btn btn-action'][contains(text(),'Luo uusi koodisto')]
${CODEREGISTRY_DDL}    //app-root/div/app-code-scheme-create/div/form/div[2]/div/app-coderegistry-input/dl/dd/div/app-dropdown/div/button
${CODEREGISTRY_1}    //button[@class='dropdown-item'][contains(text(),'Testirekisteri')]
${CODE_LIST_VALUE_INPUT}    //app-root/div/app-code-scheme-create/div/form/div[2]/div/app-literal-input[1]/dl/dd/div/input
${CODE_LIST_NAME_INPUT}    //app-root/div/app-code-scheme-create/div/form/div[2]/div/app-localizable-input/dl/dd/div/input
${ADD_CLASSIFICATION_BTN}    Lisää luokitus
${CLASSIFICATION_1}    Asuminen
${SEARCH_CLASSIFICATION_INPUT}    //ngb-modal-window/div/div/app-search-linked-code-modal/div[2]/div[1]/div/div/input
${SAVE_NEW_CODE_LIST}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${CREATE_CODE_BTN}    //button[@class='btn btn-action pull-right']
${CODE_CODEVALUE_INPUT}    //app-root/div/app-code-create/div/form/div[2]/div/app-literal-input[1]/dl/dd/div/input
${CODE_CODENAME_INPUT}    //app-root/div/app-code-create/div/form/div[2]/div/app-localizable-input/dl/dd/div/input
${SAVE_NEW_CODE_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${BACK_BTN}       //div[@class='col-12']//a
${REMOVE_CODE_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Poista')]
${REMOVE_CODE_CONF_BTN}    //button[@class='btn btn-secondary-action confirm']
${CANCEL_CODE_CREATE_BTN}    //button[@class='btn btn-link pull-right']
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Code_list_without_codes}    ${DATAFOLDER}${/}Draft_Code_list_without_codes.xlsx
${Code_list_with_codes}    ${DATAFOLDER}${/}Valid_Code_list_with_codes.xlsx
${Draft_Codes_with_broader}    ${DATAFOLDER}${/}Codes_500_broader.xlsx
${Update_Codes}    ${DATAFOLDER}${/}Update_Codes.xlsx
#CSV paths
${Code_list_without_codes_csv}    ${DATAFOLDER}${/}Draft_Code_list_without_codes_csv.csv
${Update_Codes_csv}    ${DATAFOLDER}${/}Update_Codes_csv.csv

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT Code list without codes, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    1
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Sleep    1
    Wait until page contains    ${CODE_LIST_1}    timeout=10
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=10
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Check values from Draft Code list
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list

501. Import VALID Code list with codes
    [Documentation]    Import VALID Code list with codes, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_codes}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Sleep    5
    Wait until page contains    ${CODE_LIST_2}    timeout=10
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=10
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=10
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=10
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Check values from Valid Code list
    Return to Koodistot frontpage
    [Teardown]    Remove imported Valid code list

502. Import DRAFT Codes to existing Code list
    [Documentation]    Import DRAFT Codes to existing Code list, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Sleep    1
    Wait until page contains    ${CODE_LIST_1}    timeout=10
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    koodi500 - Koodi500    timeout=10
    Wait until page contains    koodi503 - Koodi503    timeout=10
    Wait until page contains    koodi504 - Koodi504    timeout=10
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

503. Import DRAFT Codes to existing Code list and update Codes with import functionality
    [Documentation]    Import DRAFT Codes to existing Code list, check that import is successful,
    ...    update Codes and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    Tuo
    Sleep    5
    Wait until page contains    ${CODE_LIST_1}    timeout=10
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    koodi500 - Koodi500    timeout=10
    Wait until page contains    koodi503 - Koodi503    timeout=10
    Wait until page contains    koodi504 - Koodi504    timeout=10
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Update_Codes}
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Check updated code listing
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

504. Create new Code list and Codes
    [Documentation]    Create new code list and codes manually and remove new code list
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=10
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=10
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CODEREGISTRY_DDL}    timeout=10
    Click element    ${CODEREGISTRY_DDL}
    Click button    ${CODEREGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_1}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=10
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.
    Create new code to code list
    Click element    ${BACK_BTN}
    Wait until page contains    koodisto6000    timeout=10
    Wait until page contains    NewCode001 - newcode001    timeout=10
    Click element    //*[contains(text(), "NewCode001 - newcode001")]
    Wait until page contains    Tunnus    timeout=10
    Wait until page contains    NewCode001    timeout=10
    Wait until page contains element    ${REMOVE_CODE_BTN}
    Click element    ${REMOVE_CODE_BTN}
    Wait until page contains element    ${REMOVE_CODE_CONF_BTN}
    Click element    ${REMOVE_CODE_CONF_BTN}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    koodisto6000    timeout=10
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list

505. Create new Code list with existing Codevalue
    [Documentation]    Create new Code list with existing Codevalue and check error message from
    ...    Code list value input field
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=10
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=10
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CODEREGISTRY_DDL}    timeout=10
    Click element    ${CODEREGISTRY_DDL}
    Click button    ${CODEREGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_2}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_3}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=10
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Wait until page contains    Koodiston tunnus on jo käytössä tässä rekisterissä.
    Wait until page contains element    ${CANCEL_CODE_CREATE_BTN}
    Click element    ${CANCEL_CODE_CREATE_BTN}
    Click element    ${BACK_BTN}
    Return to Koodistot frontpage

*** Keywords ***
Test Case Setup
    Open Koodistot
    Choose user

Open Koodistot
    Open Koodistot in 'chrome'
    Sleep    1

Choose user
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    //*[@class="nav-link dropdown-toggle"]
    Sleep    1
    Click element    //*[contains(text(), "${USER_1}")]
    Wait Until Page Contains    ${USER_1 }
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

Go back to Koodistot frontpage and close browsers
    Wait until page contains element    //app-root/app-navigation-bar/nav/a/span    timeout=10
    Click element    //app-root/app-navigation-bar/nav/a/span
    Sleep    2
    Close All Browsers

Return to Koodistot frontpage
    Wait until page contains element    //app-root/app-navigation-bar/nav/a/span    timeout=10
    Click element    //app-root/app-navigation-bar/nav/a/span

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=10
    Click element    ${SAVE_CODE_LIST_MOD_BTN}

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}

Save code modification
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}

Select draft code list
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=10
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${CODE_LIST_STATUS_DRAFT_FI} ")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Wait until page contains    ${CODE_LIST_4}
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains    $${TEST_CODE_1}

Import code list in Excel format
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=10
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=10
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=10
    Click element    ${SELECT_REGISTRY_BTN}
    #Wait until page contains element    ${REGISTRY_1}    timeout=10
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${CODE_LIST_FILE_FORMAT_Excel}    timeout=10
    Click element    ${CODE_LIST_FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Cancel code list import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Import codes in Excel format
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=10
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${CODES_FILE_FORMAT_Excel}    timeout=10
    Click element    ${CODES_FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Cancel code import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Import codes in CSV format
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=10
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Check values from Draft Code list
    Page should contain    Tunnus
    Page should contain    Koodisto 6000
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
    Page should contain    Koodisto 7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Luokitus
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Remove imported Draft code list
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_1}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_1}")]
    Wait until page contains    ${CODE_LIST_1}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=10
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto 6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Wait until page contains element    ${REMOVE_CODE_LIST_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_1}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove imported Draft code list with codes
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_1}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_1}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_1}")]
    Wait until page contains    ${CODE_LIST_1}
    #Wait until page contains    koodi500 - Koodi500    timeout=10
    #Wait until page contains    koodi503 - Koodi503    timeout=10
    #Wait until page contains    koodi504 - Koodi504    timeout=10
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto 6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Wait until page contains element    ${REMOVE_CODE_LIST_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_1}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Remove imported Valid code list
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    Tunnus
    Page should contain    Koodisto 7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Wait until page contains element    ${REMOVE_CODE_LIST_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=10
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search-box    timeout=30
    Input Text    id=search-box    ${CODE_LIST_2}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

Check updated code listing
    Wait until page contains    koodi500 - Koodi500    timeout=10
    Wait until page contains    koodi501 - Koodi501    timeout=10
    Wait until page contains    koodi502 - Koodi502    timeout=10
    Wait until page contains    koodi503 - Koodi503    timeout=10
    Wait until page contains    koodi504 - Koodi504    timeout=10
    Wait until page contains    koodi505 - Koodi505    timeout=10

Create new code to code list
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=10
    Click element    ${CREATE_CODE_BTN}
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=10
    Input text    ${CODE_CODEVALUE_INPUT}    NewCode001
    Wait until page contains element    ${CODE_CODENAME_INPUT}    timeout=10
    Input text    ${CODE_CODENAME_INPUT}    newcode001
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=10
    Click element    ${SAVE_NEW_CODE_BTN}
