*** Settings ***
Documentation     Test Suite for Code list and Code import
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
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
#Error messages
${Error_registry_with_codes}    Rekisterillä on koodistoja. Poista koodistot ennen rekisterin poistamista.

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT Code list without codes, check that import is successful and remove code list
    [Tags]    regression    test
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
    [Tags]    regression    test
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
    Page should contain    Koodin arvo
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
    [Tags]    regression    test
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
    [Tags]    regression    test
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
    [Documentation]    Create new code list and codes manually and remove code and code list
    [Tags]    regression    test
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
    Wait until page contains    Koodin arvo    timeout=20
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
    [Tags]    regression    test
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
    [Tags]    regression    test
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
    Page should contain    Koodin arvo
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

508. Import DRAFT Code list with codes and DEFAULT CODE
    [Documentation]    Import Code list with codes and DEFAULT CODE, check that import is successful and DEFAULTCODE is
    ...    defined in information tab. Remove code list.
    [Tags]    regression    test
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

509. Create Code list and add DEFAULT CODE
    [Documentation]    Create new Code list and import codes. Add DEFAULT CODE manually,
    ...    remove DEFAULTCODE and code list.
    [Tags]    regression    test
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
    [Tags]    regression    test
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
    [Tags]    regression    test
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
    [Tags]    regression    test
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

513. Import VALID Code list with codes and create new version for Code list
    [Documentation]    Import VALID Code list with codes and create new version for Code list.
    ...    Check that links in original Code list and Code are copied as well. YTI-156
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Log to Console    Import VALID Code list with codes and copy Code list
    Log to Console    Start data import
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    7
    Log to Console    Data imported successfully
    Wait until page contains    ${CODE_LIST_9}    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Log to Console    Codes visible and expand button shown
    Click button    ${EXPAND_ALL_BTN}
    Sleep    3
    Log to Console    Expand button clicked
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_2}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_2}")]
    Sleep    3
    Page should contain    Koodin arvo
    Page should contain    testikoodi02
    Page should contain    Koodin nimi
    Page should contain    Testikoodi 02
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Log to Console    Modify button is visible
    Click element    ${MODIFY_CODE_BTN}
    Sleep    3
    Log to Console    Modify button click successful
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Sleep    2
    Log to Console    Add link button click successful
    Wait until page contains element    ${ADD_NEW_LINK_BTN}    timeout=20
    Click element    ${ADD_NEW_LINK_BTN}
    Sleep    2
    Log to Console    Add new link button click successful
    Wait until page contains element    ${LINK_TYPE_DROPDOWN}    timeout=20
    Click element    ${LINK_TYPE_DROPDOWN}
    Sleep    2
    Log to Console    Link type dropdown click successful
    Wait until page contains element    ${DROPDOWN_ITEM_LINK}    timeout=20
    Click element    ${DROPDOWN_ITEM_LINK}
    Sleep    2
    Log to Console    Link type selection click successful
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Sleep    2
    Log to Console    URL input click successful
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Log to Console    Link URL text input successful
    Wait until page contains element    ${ADD_BTN}    timeout=20
    Click element    ${ADD_BTN}
    Sleep    2
    Wait until page contains    Linkki
    Page should contain    https://www.suomi.fi/etusivu/
    Log to Console    Link has been added successfully to page
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Sleep    3
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Log to Console    Back button press successful from Code page
    Click element    ${CODELIST_INFO_TAB}
    Sleep    2
    Check values from Valid Code list
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Log to Console    Modify code list button is found
    Click element    ${MODIFY_CODE_LIST}
    Sleep    2
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Log to Console    Add link button is found
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Sleep    1
    Click Element    ${CCBY4.0}
    Sleep    2
    Log to Console    Add link button is found
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=20
    Click element    ${SELECT_LINK_BTN}
    Sleep    1
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}
    Log to Console    Save button is found
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Sleep    5
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Log to Console    Add link button is found and CC by 4.0 is there
    Click button    ${CREATE_NEW_VERSION_BTN}
    Sleep    2
    Log to Console    Create new version button pressed
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    2
    Log to Console    Code list save pressed
    Wait until page contains element    ${EXPAND_ALL_BTN}
    Click element    ${EXPAND_ALL_BTN}
    Sleep    2
    Log to Console    Expand all pressed
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
    Click element    //*[contains(text(), "testikoodi02 - Testikoodi 02")]
    Sleep    2
    Log to Console    Testikoodi 02 clicked
    Wait until page contains    Linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Log to Console    Testikoodi 02 elements found on page
    Click element    ${CODE_BACK_BTN}
    Sleep    7
    Log to Console    Code back button pressed
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Log to Console    Codelist info tab found
    Click element    ${CODELIST_INFO_TAB}
    Sleep    5
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=20
    Log to Console    CC 4.0 license found and Codes tab is there
    Click element    ${CODELIST_CODES_TAB}
    Sleep    5
    Log to Console    Codes tab clicked
    Return to Koodistot frontpage
    [Teardown]    Remove original and copied Code list

514. Create and delete registry
    [Documentation]    Create registry and attach code list to that registry. Check that deleting
    ...    registry with code lists is not possible, remove code list and delete empty registry.
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    ${CREATE_REGISTRY_BTN}    timeout=20
    Click element    ${CREATE_REGISTRY_BTN}
    Wait until page contains element    ${REGISTRY_VALUE_INPUT}    timeout=20
    Input Text    ${REGISTRY_VALUE_INPUT}    Rekisteri123
    Wait until page contains element    ${REGISTRY_NAME_INPUT}    timeout=20
    Input Text    ${REGISTRY_NAME_INPUT}    Automaatiorekisteri
    Wait until page contains element    ${REGISTRY_DESCRIPTION_INPUT}    timeout=20
    Input text    ${REGISTRY_DESCRIPTION_INPUT}    Kuvaus
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_REGISTRY}
    Click element    ${SAVE_REGISTRY}
    Sleep    5
    Wait until page contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20
    Return to Koodistot frontpage
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_2}
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
    Return to Koodistot frontpage
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Click element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Wait until page contains element    ${DELETE_REGISTRY}
    Click element    ${DELETE_REGISTRY}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains    ${Error_registry_with_codes}    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    //*[contains(text(), "koodisto6000")]    timeout=20
    Click element    //*[contains(text(), "koodisto6000")]
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Click element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Wait until page contains element    ${DELETE_REGISTRY}    timeout=20
    Click element    ${DELETE_REGISTRY}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains element    ${REGISTRY_FILTER_DDL}    timeout=20
    Click element    ${REGISTRY_FILTER_DDL}
    Page should not contain element    //*[contains(text(), "Automaatiorekisteri")]
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

515. Create registry with existing registry code value
    [Documentation]    Create registry with existing registry code value and check error message
    [Tags]    regression    test
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    ${CREATE_REGISTRY_BTN}    timeout=20
    Click element    ${CREATE_REGISTRY_BTN}
    Wait until page contains element    ${REGISTRY_VALUE_INPUT}    timeout=20
    Input Text    ${REGISTRY_VALUE_INPUT}    Rekisteri123
    Wait until page contains element    ${REGISTRY_NAME_INPUT}    timeout=20
    Input Text    ${REGISTRY_NAME_INPUT}    Automaatiorekisteri
    Wait until page contains element    ${REGISTRY_DESCRIPTION_INPUT}    timeout=20
    Input text    ${REGISTRY_DESCRIPTION_INPUT}    Kuvaus
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_REGISTRY}
    Click element    ${SAVE_REGISTRY}
    Sleep    5
    Wait until page contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20
    Sleep    2
    Return to Koodistot frontpage
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    ${CREATE_REGISTRY_BTN}    timeout=20
    Click element    ${CREATE_REGISTRY_BTN}
    Wait until page contains element    ${REGISTRY_VALUE_INPUT}    timeout=20
    Input Text    ${REGISTRY_VALUE_INPUT}    Rekisteri123
    Wait until page contains    Rekisterin tunnus on jo käytössä.    timeout=20
    Sleep    3
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=20
    Click element    ${CANCEL_CODE_MOD_BTN}
    Sleep    5
    Return to Koodistot frontpage
    Sleep    3
    [Teardown]    Remove registry

516. Import new VALID code list and attach variant
    [Documentation]    Import new VALID code list and attach variant to the code list
    [Tags]    koodistot
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
    Wait until page contains element    ${START_DATE_INPUT}    timeout=20
    Input text    ${START_DATE_INPUT}    2020-08-01
    Wait until page contains element    ${END_DATE_INPUT}    timeout=20
    Input text    ${END_DATE_INPUT}    2020-08-31
    Click button    Lisää luokitus
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    3
    Log to Console    koodisto6000 created
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Create new code to code list
    Sleep    5
    Wait until page contains element    ${CODE_BACK_BTN}    timeout=20
    Click element    ${CODE_BACK_BTN}
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains    NewCode001 - newcode001    timeout=20
    Sleep    2
    Return to Koodistot frontpage
    Sleep    2
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_with_codes}
    Sleep    2
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click button    ${UPLOAD_FILE_BTN}
    Sleep    5
    Log to Console    koodisto7000 created
    Wait until page contains    ${CODE_LIST_9}    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${ATTACH_VARIANT_BTN}    timeout=20
    Click element    ${ATTACH_VARIANT_BTN}
    Wait until page contains element    ${SEARCH_VARIANT_INPUT}    timeout=20
    Sleep    2
    Input Text    ${SEARCH_VARIANT_INPUT}    koodisto6000
    Sleep    2
    Click element    ${Koodisto6000_variant}
    Sleep    2
    Log to Console    koodisto6000 attached to koodisto7000
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains    Voimassaolo    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Tila    timeout=20
    #Wait until page contains    01.08.2020 - 31.08.2020    timeout=20
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains element    //*[contains(@id,'detach_variant_')]    timeout=20
    Click Element    //*[contains(@id,'detach_variant_')]
    Sleep    3
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Log to Console    Variant removed
    Sleep    5
    Page should not contain element    ${CODELIST_VARIANTS_TAB}
    Log to Console    Variant tab not visible
    Return to Koodistot frontpage
    [Teardown]    Remove imported Valid code list and variant

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
    Sleep    5
    Wait until page contains    ${CODE_LIST_8}
    #Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Sleep    5
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Sleep    5
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    5
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
    Log to Console    Removing original and copied Code lists
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_9}")]
    Sleep    5
    Wait until page contains    ${CODE_LIST_9}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    5
    Page should contain    Tunnus
    Page should contain    Koodisto7000
    Page should contain    Koodiston nimi
    Page should contain    koodisto7000
    Sleep    5
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Sleep    5
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Log to Console    Code list 7000 removed
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    5
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    5
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Sleep    5
    Wait until page contains    ${CODE_LIST_10}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    5
    Page should contain    Tunnus
    Page should contain    Koodisto7001
    Page should contain    Koodiston nimi
    Page should contain    koodisto7001
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Sleep    5
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Log to Console    Code list 7001 removed
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    5
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
    Log To Console    Terminology Setup start
    Terminology Setup
    Log To Console    Terminology Setup end
    Log To Console    Test Case Setup Superuser start
    Test Case Setup Superuser
    Log To Console    Test Case Setup Superuser end

Test Case Teardown Controlled Vocabularies
    Log To Console    Controlled Vocabularies teardown start
    Terminology Teardown
    Log To Console    Controlled Vocabularies teardown end
    Log To Console    Test Case Setup Superuser start
    Test Case Setup Superuser
    Log To Console    Test Case Setup Superuser end
    Log To Console    Remove Code list with concept from Controlled Vocabularies start
    Remove Code list with concept from Controlled Vocabularies
    Log To Console    Remove Code list with concept from Controlled Vocabularies end

Test Case Teardown Code with concept
    Log To Console    Terminology Teardown start
    Terminology Teardown
    Log To Console    Terminology Teardown end
    Log To Console    Test Case Setup Superuser start
    Test Case Setup Superuser
    Log To Console    Test Case Setup Superuser end
    Log To Console    Remove imported Draft code list start
    Remove imported Draft code list
    Log To Console    Remove imported Draft code list end

Remove registry
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Click element    ${NAVIGATION_MENU_REGISTRIES}
    Wait until page contains element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Click element    //*[contains(text(), "Rekisteri123 - Automaatiorekisteri")]
    Wait until page contains element    ${DELETE_REGISTRY}
    Click element    ${DELETE_REGISTRY}
    Sleep    5
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    5
    Wait until page contains element    ${REGISTRY_FILTER_DDL}    timeout=20
    Click element    ${REGISTRY_FILTER_DDL}
    Page should not contain element    //*[contains(text(), "Automaatiorekisteri")]
    Close All Browsers

Remove imported Valid code list and variant
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_9}")]
    Wait until page contains    ${CODE_LIST_9}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Log to Console    koodisto6000 removed
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_9}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    3
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_8}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_8}")]
    Sleep    3
    Wait until page contains    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Sleep    3
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Log to Console    koodisto7000 removed
    Sleep    3
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Sleep    1
