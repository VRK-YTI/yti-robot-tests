*** Settings ***
Documentation     Test Suite for Code list and Code import
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Controlled_vocabularies_resources.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Code_list_without_codes}    ${DATAFOLDER}${/}Draft_Code_list_without_codes.xlsx
${Code_list_with_codes}    ${DATAFOLDER}${/}Valid_Code_list_with_codes.xlsx
${Draft_Codes_with_broader}    ${DATAFOLDER}${/}Codes_500_broader.xlsx
${Update_Codes}    ${DATAFOLDER}${/}Update_Codes.xlsx
${Multiple_codelists_and_codes}    ${DATAFOLDER}${/}Multiple_codelists_and_codes.xlsx
${Codelist_ExtensionSchemes}    ${DATAFOLDER}${/}Codelist_with_ExtensionSchemes.xlsx
${Codelist_with_defaultcode}    ${DATAFOLDER}${/}Codelist_with_defaultcode.xlsx
#CSV paths
${Code_list_without_codes_csv}    ${DATAFOLDER}${/}Draft_Code_list_without_codes_csv.csv
${Update_Codes_csv}    ${DATAFOLDER}${/}Update_Codes_csv.csv
${Draft_Codes_with_broader_csv}    ${DATAFOLDER}${/}Draft_Codes_with_broader_csv.csv

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT Code list without codes, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    1
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    1
    Wait until page contains    ${CODE_LIST_8}    timeout=20
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Check values from Draft Code list
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list

501. Import VALID Code list with codes
    [Documentation]    Import VALID Code list with codes, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    5
    Wait until page contains    ${CODE_LIST_9}    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Click button    ${EXPAND_ALL_BTN}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_2}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_2}")]
    Page should contain    Tunnus
    Page should contain    testikoodi02
    Page should contain    Koodin nimi
    Page should contain    Testikoodi 02
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Check values from Valid Code list
    Return to Koodistot frontpage
    [Teardown]    Remove imported Valid code list

502. Import DRAFT Codes to existing Code list
    [Documentation]    Import DRAFT Codes to existing Code list, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    1
    Wait until page contains    ${CODE_LIST_8}    timeout=20
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    ${IMPORT_BTN}
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

503. Import DRAFT Codes to existing Code list and update Codes with import functionality
    [Documentation]    Import DRAFT Codes to existing Code list, check that import is successful,
    ...    update Codes and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    5
    Wait until page contains    ${CODE_LIST_8}    timeout=20
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    ${IMPORT_BTN}
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Update_Codes}
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    ${IMPORT_BTN}
    Check updated code listing
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

504. Create new Code list and Codes
    [Documentation]    Create new code list and codes manually and remove new code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_8}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Create new code to code list
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains    NewCode001 - newcode001    timeout=20
    Sleep    2
    Click element    //*[contains(text(), "NewCode001 - newcode001")]
    Wait until page contains    Tunnus    timeout=20
    Wait until page contains    NewCode001    timeout=20
    Wait until page contains element    ${REMOVE_CODE_BTN}
    Click element    ${REMOVE_CODE_BTN}
    Wait until page contains element    ${REMOVE_CODE_CONF_BTN}
    Click element    ${REMOVE_CODE_CONF_BTN}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    koodisto6000    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list

505. Create new Code list with existing codeValue
    [Documentation]    Create new Code list with existing codeValue and check error message from
    ...    Code list value input field
    [Tags]    regression
    [Setup]    Create draft codelist
    Sleep    2
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_2}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_4}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Wait until page contains    Koodiston tunnus on jo käytössä tässä rekisterissä.    timeout=20
    Wait until page contains element    ${CANCEL_CODE_CREATE_BTN}
    Click element    ${CANCEL_CODE_CREATE_BTN}
    Sleep    5
    Wait until page contains element    ${IMPORT_CREATE_BACK_BTN}    timeout=20
    Click element    ${IMPORT_CREATE_BACK_BTN}
    Return to Koodistot frontpage
    [Teardown]    Remove draft codelist

506. Import multiple Code lists with codes
    [Documentation]    Import multiple Code list with codes, check that import is successful. Remove code lists and codes.
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Multiple_codelists_and_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Wait until page contains    ${CODE_LIST_10}
    Wait until page contains    ${CODE_LIST_10}    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Click button    ${EXPAND_ALL_BTN}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_2}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_2}")]
    Page should contain    Tunnus
    Page should contain    testikoodi02
    Page should contain    Koodin nimi
    Page should contain    Testikoodi 02
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Return to Koodistot frontpage
    Sleep    3
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_11}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_11}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_11}")]
    Wait until page contains    ${CODE_LIST_11}
    Wait until page contains    ${CODE_LIST_11}    timeout=20
    Wait until page contains    testikoodi11 - Testikoodi 11    timeout=20
    Wait until page contains    testikoodi14 - Testikoodi 14    timeout=20
    Wait until page contains    testikoodi16 - Testikoodi 16    timeout=20
    Sleep    3
    Return to Koodistot frontpage
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_12}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_12}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_12}")]
    Wait until page contains    ${CODE_LIST_12}
    Wait until page contains    ${CODE_LIST_12}    timeout=20
    Wait until page contains    testikoodi21 - Testikoodi 21    timeout=20
    Wait until page contains    testikoodi24 - Testikoodi 24    timeout=20
    Wait until page contains    testikoodi26 - Testikoodi 26    timeout=20
    Sleep    3
    Return to Koodistot frontpage
    [Teardown]    Remove multiple code lists

507. Import Code list with Extension Schemes
    [Documentation]    Import Code list with Extension Schemes, check that import is successfull,
    ...    Export Excel and remove code list.
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codelist_ExtensionSchemes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    6
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_14}")]    timeout=30
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Wait until page contains    testcode25 - Testikoodi 25    timeout=20
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_6}")]
    Page should contain    Testikoodisto2 pitkillä arvoilla
    Page should contain    testcode25
    Page should contain    Testikoodi 25
    Page should contain    http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567111/testcode25
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Sleep    5
    Wait until page contains element    id=exportDropdown    timeout=20
    Click element    id=exportDropdown
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Return to Koodistot frontpage
    [Teardown]    Remove codelist with Extension Schemes

508. Import DRAFT Code list with codes and DEFAULTCODE
    [Documentation]    Import Code list with codes and DEFAULTCODE, check that import is successful and DEFAULTCODE is
    ...    defined in information tab. Remove code list.
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codelist_with_defaultcode}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    5
    Wait until page contains    ${CODE_LIST_15}    timeout=20
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_15}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_LIST_15}")]
    Page should contain    T1333
    Page should contain    Vakiokoodikoodisto
    Page should contain    Vakiokoodi
    Page should contain    koodi502 - Koodi502
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove Codelist with defaultcode

509. Create Code list and add DEFAULTCODE
    [Documentation]    Create new Code list and import codes. Add DEFAULTCODE manually,
    ...    remove DEFAULTCODE and code list.
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_8}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    ${IMPORT_BTN}
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Sleep    2
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    2
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${ADD_DEFAULTCODE_BTN}
    Click element    ${ADD_DEFAULTCODE_BTN}
    Wait until page contains element    ${SEARCH_DEFAULTCODE_INPUT}
    Input Text    ${SEARCH_DEFAULTCODE_INPUT}    505
    Wait until page contains element    //*[contains(text(), "Koodi505")]
    Click element    //*[contains(text(), "Koodi505")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    2
    Wait until page contains    Vakiokoodi    timeout=20
    Wait until page contains    koodi505 - Koodi505    timeout=20
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Sleep    2
    Wait until page contains element    ${REMOVE_DEFAULTCODE}    timeout=20
    Click element    ${REMOVE_DEFAULTCODE}
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    3
    Page should not contain    Vakiokoodi    timeout=20
    Page should not contain    koodi505 - Koodi505    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

510. Import DRAFT Codes (CSV) to existing Code list
    [Documentation]    Import DRAFT Codes (CSV) to existing Code list, check that import is successful and remove code list
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    1
    Wait until page contains    ${CODE_LIST_8}    timeout=20
    Sleep    1
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Draft_Codes_with_broader_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=20
    Click button    ${IMPORT_BTN}
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove imported Draft code list with codes

511. Create Code list and get concept for Code list from Controlled Vocabularies
    [Documentation]    Create code list and search for a concept from Controlled Vocabularies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields. YTI-787
    [Tags]    koodistot
    [Setup]    Test Case Setup Controlled Vocabularies
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${SEARCH_CONCEPT_INPUT}    timeout=20
    Input Text    ${SEARCH_CONCEPT_INPUT}    tutkija
    Wait until page contains element    ${VOCABULARY_SELECTION_DDL}    timeout=20
    Click element    ${VOCABULARY_SELECTION_DDL}
    Click Button    Testiautomaatiosanasto
    Wait until page contains element    //*[contains(text(), "tutkija")]
    Click element    //*[contains(text(), "tutkija")]
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    Koodisto6000    timeout=20
    Wait until page contains    tutkija    timeout=20
    Wait until page contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait until page contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Test Case Teardown Controlled Vocabularies

512. Create Code to Code list and get concept for Code from Controlled Vocabularies
    [Documentation]    Create Code to Code list and search for a concept from Controlled Vocabularies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields in Code. YTI-787
    [Tags]    koodistot
    [Setup]    Test Case Setup Controlled Vocabularies
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_without_codes}
    Sleep    1
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    1
    Wait until page contains    ${CODE_LIST_8}    timeout=20
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Check values from Draft Code list
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=20
    Click element    ${CODELIST_CODES_TAB}
    Create new code to code list with concept
    Wait until page contains    NewCode001 - tutkija
    Wait until page contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta
    Return to Koodistot frontpage
    [Teardown]    Test Case Teardown Code with concept

513. Import VALID Code list with codes and copy Code list
    [Documentation]    Import VALID Code list with codes and clone Code list. YTI-156
    [Tags]    regression
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    5
    Wait until page contains    ${CODE_LIST_9}    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Click button    ${EXPAND_ALL_BTN}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_2}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_2}")]
    Page should contain    Tunnus
    Page should contain    testikoodi02
    Page should contain    Koodin nimi
    Page should contain    Testikoodi 02
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Check values from Valid Code list
    Wait until page contains element    ${CLONE_CODE_LIST_BTN}    timeout=20
    Click button    ${CLONE_CODE_LIST_BTN}
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Wait until page contains element    ${EXPAND_ALL_BTN}
    Click element    ${EXPAND_ALL_BTN}
    Wait until page contains    testikoodi01 - Testikoodi 01
    Wait until page contains    testikoodi02 - Testikoodi 02
    Wait until page contains    testikoodi03 - Testikoodi 03
    Wait until page contains    testikoodi04 - Testikoodi 04
    Wait until page contains    testikoodi05 - Testikoodi 05
    Wait until page contains    testikoodi06 - Testikoodi 06
    Wait until page contains    testikoodi07 - Testikoodi 07
    Wait until page contains    testikoodi08 - Testikoodi 08
    Wait until page contains    testikoodi09 - Testikoodi 09
    Wait until page contains    testikoodi10 - Testikoodi 10
    Return to Koodistot frontpage
    [Teardown]    Remove original and copied Code list

*** Keywords ***
Go back to Koodistot frontpage and close browsers
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2
    Close All Browsers

Return to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_LIST_MOD_BTN}

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}

Save code modification
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}

Import code list in Excel format
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click element    ${IMPORT_CODE_LIST_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    #Wait until page contains element    ${REGISTRY_1}    timeout=20
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Import codes in Excel format
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=20
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

Import codes in CSV format
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=20
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=20
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20

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

Remove multiple code lists
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Wait until page contains    ${CODE_LIST_10}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    1
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_11}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_11}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_11}")]
    Wait until page contains    ${CODE_LIST_11}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_11}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    1
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_12}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_12}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_12}")]
    Wait until page contains    ${CODE_LIST_12}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_12}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

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
