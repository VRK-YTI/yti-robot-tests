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
${Variant_code_list}    ${DATAFOLDER}${/}Variant_code_list_and_codes.xlsx
${Code_list_Codes_new_version}    ${DATAFOLDER}${/}Code_list_and_codes_for_new_version_creation.xlsx
${Code_list_with_languagecode}    ${DATAFOLDER}${/}Code_list_with_languagecodes.xlsx
${Code_list_with_30_Codes}    ${DATAFOLDER}${/}Code_list_with_30_Codes.xlsx
${Code_list_version2}    ${DATAFOLDER}${/}Code_list_version2.xlsx
${Code_list_version3}    ${DATAFOLDER}${/}Code_list_version3.xlsx
${Variant_no_end_date}    ${DATAFOLDER}${/}Variant_code_list_and_codes_no_end_date.xlsx
${Code_list_with_links}    ${DATAFOLDER}${/}Code_list_with_links.xlsx
${Code_list_with_sub_code_list_in_code}    ${DATAFOLDER}${/}Code_list_with_sub_code_list_in_code.xlsx
#CSV paths
${Code_list_without_codes_csv}    ${DATAFOLDER}${/}Draft_Code_list_without_codes_csv.csv
${Update_Codes_csv}    ${DATAFOLDER}${/}Update_Codes_csv.csv
${Draft_Codes_with_broader_csv}    ${DATAFOLDER}${/}Draft_Codes_with_broader_csv.csv
${Codes_update_sub_code_list_csv}    ${DATAFOLDER}${/}Codes_update_sub_code_list_csv.csv
#Error messages
${Error_registry_with_codelists}    Rekisterillä on koodistoja. Poista koodistot ennen rekisterin poistamista.
${Error_linked_codelist}    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/600/code/testcode29

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT code list without codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_without_codes}    ${CODE_LIST_8}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Check values from Draft Code list
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}

501. Import VALID Code list with codes
    [Documentation]    Import VALID code list with codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_codes}    ${CODE_LIST_9}
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
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Check values from Valid Code list
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_9}

502. Import DRAFT codes to existing code list
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful and remove code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_without_codes}    ${CODE_LIST_8}
    Import codes in Excel format
    Upload codes    ${Draft_Codes_with_broader}
    Wait until page contains    6 koodia    timeout=20
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}

503. Import DRAFT codes to existing code list and update codes with import functionality
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful,
    ...    update codes and remove code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_without_codes}    ${CODE_LIST_8}
    Import codes in Excel format
    Upload codes    ${Draft_Codes_with_broader}
    Wait until page contains    6 koodia    timeout=20
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Import codes in Excel format
    Upload codes    ${Update_Codes}
    Wait until page contains    6 koodia    timeout=20
    Check updated code listing
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}

504. Create new code list and codes
    [Documentation]    Create new code list and codes manually and remove code and code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Create code list    ${REGISTRY_1}    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Sleep    2
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}
    Sleep    5
    Wait until page contains    NewCode001 - newCode001
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains    Koodin arvo    timeout=20
    Wait until page contains    NewCode001    timeout=20
    Wait until page contains    Koodin nimi    timeout=20
    Wait until page contains    newCode001    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    2
    Remove code    NewCode001 - newCode001
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    koodisto6000    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}

505. Create new code list with existing codeValue
    [Documentation]    Create new code list with existing codeValue and check error message from
    ...    code list value input field
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Wait until page contains    8 koodia    timeout=20
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    ${CODE_LIST_VALUE_4}    ${ORGANIZATION_1}    ${CODE_LIST_9}    Asuminen
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_2}

506. Import multiple code lists with codes
    [Documentation]    Import multiple code list with codes, check that import is successful. Remove code lists and codes.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Multiple_codelists_and_codes}    ${CODE_LIST_10}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Wait until page contains    ${CODE_LIST_10}    timeout=20
    Log to Console    koodisto7001 found
    Wait until page contains    10 koodia    timeout=20
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
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Return to Koodistot frontpage
    Sleep    3
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_11}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_11}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_11}")]
    Wait until page contains    ${CODE_LIST_11}    timeout=20
    Log to Console    koodisto7002 found
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains    testikoodi11 - Testikoodi 11    timeout=20
    Wait until page contains    testikoodi14 - Testikoodi 14    timeout=20
    Wait until page contains    testikoodi16 - Testikoodi 16    timeout=20
    Sleep    3
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_12}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_12}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_12}")]
    Wait until page contains    ${CODE_LIST_12}    timeout=20
    Log to Console    koodisto7003 found
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains    testikoodi21 - Testikoodi 21    timeout=20
    Wait until page contains    testikoodi24 - Testikoodi 24    timeout=20
    Wait until page contains    testikoodi26 - Testikoodi 26    timeout=20
    Sleep    3
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_10}    ${CODE_LIST_11}    ${CODE_LIST_12}

508. Import DRAFT code list with codes and DEFAULT CODE
    [Documentation]    Import code list with codes and DEFAULT CODE, check that import is successful and DEFAULT CODE is
    ...    defined in information tab. Remove code list.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Codelist_with_defaultcode}    ${CODE_LIST_15}
    Wait until page contains    6 koodia    timeout=20
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Page should contain    T1333
    Page should contain    Vakiokoodikoodisto
    Page should contain    Vakiokoodi
    Page should contain    koodi502 - Koodi502
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_15}

509. Create code list and add DEFAULT CODE
    [Documentation]    Create new code list and import codes. Add DEFAULT CODE manually,
    ...    remove DEFAULT CODE and code list.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Create code list    ${REGISTRY_1}    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Import codes in Excel format
    Upload codes    ${Draft_Codes_with_broader}
    Wait until page contains    6 koodia    timeout=20
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
    [Teardown]    Remove code lists    ${CODE_LIST_8}

510. Import DRAFT codes (CSV) to existing code list
    [Documentation]    Import DRAFT codes (CSV) to existing code list, check that import is successful and remove code list
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_without_codes}    ${CODE_LIST_8}
    Import codes in CSV format
    Upload codes    ${Draft_Codes_with_broader_csv}
    Wait until page contains    6 koodia    timeout=20
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}

511. Create code list and get concept for code list from Terminologies
    [Documentation]    Create code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields. YTI-787.
    [Tags]    koodistot    regression    test    500
    [Setup]    Test Case Setup Terminologies
    Log to Console    Vocabulary added
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Wait until page contains element    ${SEARCH_CONCEPT_INPUT}    timeout=20
    Input Text    ${SEARCH_CONCEPT_INPUT}    tutkija
    Wait until page contains element    ${VOCABULARY_SELECTION_DDL}    timeout=20
    Click element    ${VOCABULARY_SELECTION_DDL}
    Click element    //*[contains(text(), "Testiautomaatiosanasto (Luonnos)")]
    Wait until page contains element    //*[contains(text(), "tutkija")]
    Click element    //*[contains(text(), "tutkija")]
    Sleep    7
    Log to Console    Concept added
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Log to Console    Registry added
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Click button    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Log to Console    Code list saved
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    Koodisto6000    timeout=20
    Wait until page contains    tutkija    timeout=20
    Wait until page contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait until page contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta    timeout=20
    Log to Console    Code list values checked
    Return to Koodistot frontpage
    [Teardown]    Test Case Teardown concept for code list from Terminologies

512. Create code to code list and get concept for code from Terminologies
    [Documentation]    Create code to code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields in code, YTI-787.
    [Tags]    koodistot    regression    test    500
    [Setup]    Test Case Setup Terminologies
    Upload codelist in Excel format    ${Code_list_without_codes}    ${CODE_LIST_8}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Check values from Draft Code list
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=20
    Click element    ${CODELIST_CODES_TAB}
    Create new code to code list with concept    tutkija    Testiautomaatiosanasto (Luonnos)
    Wait until page contains    NewCode001 - tutkija
    Wait until page contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta
    Return to Koodistot frontpage
    [Teardown]    Test Case Teardown Code with concept

513. Import VALID code list with codes and create new version of code list
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Check that links and codes from the original code list are copied to the new version, YTI-979.
    [Tags]    regression    koodistot    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Log to Console    Codes visible and expand button shown
    Click button    ${EXPAND_ALL_BTN}
    Sleep    3
    Log to Console    Expand all button clicked
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_2}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_2}")]
    Sleep    3
    Page should contain    Koodin arvo
    Page should contain    testikoodi02
    Page should contain    Koodin nimi
    Page should contain    Testikoodi 02
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Log to Console    Modify button clicked
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Sleep    1
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click element    ${LINK_BTN}
    Sleep    1
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Sleep    1
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${ADD_BTN}    timeout=20
    Click element    ${ADD_BTN}
    Sleep    1
    Wait until page contains    Liittyvä linkki
    Page should contain    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    3
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    2
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LICENSE_BTN}    timeout=20
    Click element    ${LICENSE_BTN}
    Sleep    1
    Wait until page contains element    ${CCBY4.0}    timeout=20
    Click Element    ${CCBY4.0}
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=20
    Click Element    ${SELECT_LINK_BTN}
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    5
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Log to Console    CC by 4.0 added
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click button    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click button    ${CREATE_NEW_VERSION_BTN}
    Sleep    10
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}    timeout=20
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    2
    Log to Console    New version of code list created
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Click element    ${EXPAND_ALL_BTN}
    Sleep    2
    Log to Console    Expand all pressed
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi02 - Testikoodi 02    timeout=20
    Wait until page contains    testikoodi03 - Testikoodi 03    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi05 - Testikoodi 05    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains    testikoodi07 - Testikoodi 07    timeout=20
    Wait until page contains    testikoodi08 - Testikoodi 08    timeout=20
    Wait until page contains    testikoodi09 - Testikoodi 09    timeout=20
    Wait until page contains    testikoodi10 - Testikoodi 10    timeout=20
    Log to Console    All codes are copied
    Click element    //*[contains(text(), "testikoodi02 - Testikoodi 02")]
    Sleep    2
    Log to Console    Testikoodi 02 clicked
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Log to Console    Code links copied
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    7
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    5
    Wait until page contains    englanti    timeout=20
    Wait until page contains    suomi    timeout=20
    Wait until page contains    ruotsi    timeout=20
    Wait until page contains    kuvausFI    timeout=20
    Wait until page contains    määritelmäFI    timeout=20
    Wait until page contains    muutostietoFI    timeout=20
    Wait until page contains    101    timeout=20
    Wait until page contains    lähdeFI    timeout=20
    Wait until page contains    lakiperusteFI    timeout=20
    Wait until page contains    sitovuustasoFI    timeout=20
    Wait until page contains    Linkit    timeout=20
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Log to Console    All code list values and links copied
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_10}    ${CODE_LIST_9}

514. Create and delete registry
    [Documentation]    Create registry and attach code list to that registry. Check that deleting
    ...    registry with code lists is not possible, remove code list and delete empty registry.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Create registry    Rekisteri123    Automaatiorekisteri    Kuvaus    Testiorganisaatio
    Wait until page contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20
    Return to Koodistot frontpage
    Sleep    5
    Create code list    ${REGISTRY_2}    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Create new code to code list    koodi1111    Koodi1111    ${DRAFT_STATUS}    ${EMPTY}
    Sleep    3
    Return to Koodistot frontpage
    Delete registry with code lists    Rekisteri123 - Automaatiorekisteri    ${CODE_LIST_8}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_8}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Close All Browsers

515. Create registry with existing registry code value
    [Documentation]    Create registry with existing registry code value and check error message
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Sleep    2
    Create registry    Rekisteri123    Automaatiorekisteri    Kuvaus    Testiorganisaatio
    Sleep    2
    Wait until page contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20
    Sleep    2
    Return to Koodistot frontpage
    Create registry    Rekisteri123    Automaatiorekisteri    Kuvaus    Testiorganisaatio
    [Teardown]    Delete empty registry    Rekisteri123 - Automaatiorekisteri

516. Import new VALID code list and attach variant
    [Documentation]    Import two code lists, attach variant to both code lists
    ...    and remove link between variant and code list from the first code list.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Variant_code_list}    ${CODE_LIST_8}
    Return to Koodistot frontpage
    Sleep    2
    Upload codelist in Excel format    ${Code_list_with_codes}    ${CODE_LIST_9}
    Sleep    2
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${ATTACH_VARIANT_BTN}    timeout=20
    Click element    ${ATTACH_VARIANT_BTN}
    Wait until page contains element    ${SEARCH_VARIANT_INPUT}    timeout=20
    Sleep    2
    Input Text    ${SEARCH_VARIANT_INPUT}    koodisto6000
    Sleep    2
    Click element    //*[contains(text(), "koodisto6000")]
    Sleep    2
    Log to Console    koodisto6000 attached to koodisto7000
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait until page contains    Voimassaolo    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Tila    timeout=20
    Wait until page contains    31.12.2016 - 31.12.2018    timeout=20
    Wait until page contains    koodisto6000    timeout=20
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_8}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_8}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_8}")]
    Sleep    5
    Wait until page contains    ${CODE_LIST_8}
    Sleep    2
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${ATTACH_VARIANT_BTN}    timeout=20
    Click element    ${ATTACH_VARIANT_BTN}
    Wait until page contains element    ${SEARCH_VARIANT_INPUT}    timeout=20
    Sleep    2
    Input Text    ${SEARCH_VARIANT_INPUT}    koodisto7000
    Sleep    2
    Click element    //*[contains(text(), "koodisto7000")]
    Sleep    2
    Log to Console    koodisto7000 attached to koodisto6000
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait until page contains    Voimassaolo    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Tila    timeout=20
    Wait until page contains    02.03.2018 - 30.03.2018    timeout=20
    Wait until page contains    koodisto7000    timeout=20
    Wait until page contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Wait until page contains element    //*[contains(@id,'detach_variant_')]    timeout=20
    Click Element    //*[contains(@id,'detach_variant_')]
    Sleep    3
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Sleep    5
    Page should not contain    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Log to Console    Variant removed
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_8}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_LIST_8}")]
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Page should not contain    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait until page contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Wait until page contains    koodisto7000    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}    ${CODE_LIST_9}

517. Import Code list with LANGUAGECODES
    [Documentation]    Import code list with language codes and check that
    ...    those are taken into use.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_languagecode}    ${CODE_LIST_9}
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Page should contain    Koodisto7000
    Page should contain    koodisto7000
    Page should contain    Testirekisteri
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot
    Page should contain    Kielikoodi
    Page should contain    asu
    Page should contain    bemba
    Page should contain    englanti
    Page should contain    ruotsi
    Page should contain    suomi
    Page should contain    swahili (Tansania)
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_9}

518. Create code list and suggest concept to Terminologies
    [Documentation]    Create code list and suggest concept to Terminologies
    ...    YTI-848.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies
    Wait until page contains element    ${ADD_CODE_LIST_BTN}    timeout=20
    Click element    ${ADD_CODE_LIST_BTN}
    Wait until page contains element    ${CREATE CODE_LIST_BTN}    timeout=20
    Click element    ${CREATE CODE_LIST_BTN}
    Sleep    2
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo
    Sleep    2
    Wait until page contains element    ${SELECT_REGISTRY_BTN}    timeout=20
    Click element    ${SELECT_REGISTRY_BTN}
    Click button    ${REGISTRY_1}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Click button    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click button    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=20
    Input text    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    5
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    Koodisto6000    timeout=20
    Wait until page contains    automobiili    timeout=20
    Wait until page contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait until page contains    Tämä on kulkuneuvo    timeout=20
    Return to Koodistot frontpage
    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Terminologies

519. Create code to code list list and suggest concept to Terminologies
    [Documentation]    Create code to code list list and suggest concept to Terminologies
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies
    Import code list in Excel format
    Upload codelist    ${Code_list_without_codes}    ${CODE_LIST_8}
    Sleep    1
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Log to Console    Code list without codes imported
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=20
    Click element    ${CREATE_CODE_BTN}
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo
    Log to Console    Concept suggested to Terminologies
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=20
    Input text    ${CODE_CODEVALUE_INPUT}    NewCode001
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Log to Console    New code name saved
    Sleep    5
    Wait until page contains    Koodisto6000    timeout=20
    Wait until page contains    automobiili    timeout=20
    Wait until page contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait until page contains    Tämä on kulkuneuvo    timeout=20
    Log to Console    Code values checked
    Return to Koodistot frontpage
    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Code with concept

520. Create new version of code list as empty
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    without codes. YTI-1163.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload code list    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Sleep    2
    Wait until page contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait until page contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait until page contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=20
    Log to Console    Codes visible and expand button shown
    Click button    ${EXPAND_ALL_BTN}
    Sleep    3
    Log to Console    Expand all button clicked
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Log to Console    Back button press successful from Code page
    Sleep    2
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LICENSE_BTN}    timeout=20
    Click element    ${LICENSE_BTN}
    Sleep    1
    Wait until page contains element    ${CCBY4.0}    timeout=20
    Click Element    ${CCBY4.0}
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=20
    Click Element    ${SELECT_LINK_BTN}
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Click element    ${DROPDOWN_ITEM_LINK}
    Sleep    1
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    #Click element    ${LINK_URL_INPUT}
    Sleep    1
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${ADD_BTN}    timeout=20
    Click element    ${ADD_BTN}
    Sleep    1
    Wait until page contains    Liittyvä linkki
    Page should contain    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Sleep    1
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Log to Console    links are saved
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click button    ${CODE_LIST_DDL}
    Sleep    2
    Wait until page contains element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click button    ${CREATE_NEW_VERSION_BTN}
    Sleep    7
    Log to Console    Create new version button pressed
    Wait until page contains element    ${CREATE_CODELIST_VERSION_AS_EMPTY}    timeout=20
    Click element    ${CREATE_CODELIST_VERSION_AS_EMPTY}
    Wait until page contains element    ${CODE_LIST_VALUE_INPUT}    timeout=20
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=20
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    2
    Wait until page contains element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click element    ${CONFIRMATION_YES_BTN}
    Log to Console    Code list saved
    Log to Console    New code list version created as empty
    Page should not contain    10 koodia    timeout=20
    Page should not contain    testikoodi01 - Testikoodi 01    timeout=20
    Log to Console    Codes were not copied
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Sleep    1
    Wait until page contains    englanti    timeout=20
    Wait until page contains    suomi    timeout=20
    Wait until page contains    ruotsi    timeout=20
    Wait until page contains    kuvausFI    timeout=20
    Wait until page contains    määritelmäFI    timeout=20
    Wait until page contains    muutostietoFI    timeout=20
    Wait until page contains    101    timeout=20
    Wait until page contains    lähdeFI    timeout=20
    Wait until page contains    lakiperusteFI    timeout=20
    Wait until page contains    sitovuustasoFI    timeout=20
    Wait until page contains    Linkit
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Log to Console    Links are copied
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_10}    ${CODE_LIST_9}

521. Create new version of code list from file
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    from file. YTI-1163.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload code list    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Sleep    2
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Click element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains element    ${VERSION_TAB}    timeout=20
    Click element    ${VERSION_TAB}
    Log to Console    Codelist info tab clicked
    Wait until page contains    02.03.2018 - 30.03.2018    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    koodisto7000    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Voimassa oleva    timeout=20
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_9}

522. Create new versions of code list from file and remove original code list
    [Documentation]    Import VALID code list with codes and create new versions of code list
    ...    from file. Remove original code list and check that version listing is updated. YTI-1163.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload code list    ${Code_list_Codes_new_version}    ${CODE_LIST_9}
    Sleep    2
    Wait until page contains    10 koodia    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Click element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Upload codelist    ${Code_list_version2}    ${CODE_LIST_10}
    Sleep    2
    Wait until page contains    10 koodia    timeout=20
    Modify code list
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click element    ${CODE_LIST_STATUS_DDL}
    Sleep    2
    Click button    ${VALID_STATUS}
    Save code list
    Wait until page contains element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click element    ${CONFIRMATION_YES_BTN}
    Sleep    5
    Wait until page contains    Voimassa oleva    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Click element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Upload codelist    ${Code_list_version3}    ${CODE_LIST_11}
    Wait until page contains element    ${VERSION_TAB}    timeout=20
    Click element    ${VERSION_TAB}
    Wait until page contains    02.03.2018 - 30.03.2018    timeout=20
    Page should not contain    03.03.2018 - 31.03.2018
    Wait until page contains    koodisto7000    timeout=20
    Wait until page contains    koodisto7001    timeout=20
    Wait until page contains    koodisto7002    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Voimassa oleva    timeout=20
    Wait until page contains    Korvattu    timeout=20
    Sleep    1
    Return to Koodistot frontpage
    Remove code lists    ${CODE_LIST_9}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_10}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_10}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_10}")]
    Wait until page contains    ${CODE_LIST_10}
    Wait until page contains element    ${VERSION_TAB}    timeout=20
    Click element    ${VERSION_TAB}
    Sleep    8
    Wait until page contains    02.03.2018 - 30.03.2018    timeout=20
    Page should not contain    03.03.2018 - 31.03.2018
    Page should not contain    koodisto7000
    Wait until page contains    koodisto7001    timeout=20
    Wait until page contains    koodisto7002    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Voimassa oleva    timeout=20
    Page should not contain    Korvattu
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_10}    ${CODE_LIST_11}

523. Validity date change in variant listing
    [Documentation]    Import two code lists, attach variant to code list 1,
    ...    change validity date of the code list 1 and check that date change is
    ...    updated in code list 2 variant listing.
    [Tags]    koodistot    regression    test    500
    [Setup]    Test Case Setup Superuser
    Import codelist in Excel format
    Upload code list    ${Code_list_with_codes}    ${CODE_LIST_9}
    Return to Koodistot frontpage
    Sleep    2
    Import code list in Excel format
    Upload code list    ${Variant_no_end_date}    ${CODE_LIST_8}
    Sleep    2
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${ATTACH_VARIANT_BTN}    timeout=20
    Click element    ${ATTACH_VARIANT_BTN}
    Wait until page contains element    ${SEARCH_VARIANT_INPUT}    timeout=20
    Sleep    2
    Input Text    ${SEARCH_VARIANT_INPUT}    koodisto7000
    Sleep    2
    Click element    //*[contains(text(), "koodisto7000")]
    Sleep    2
    Log to Console    koodisto7000 attached to koodisto6000 as a variant
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait until page contains    Voimassaolo    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Tila    timeout=20
    Wait until page contains    02.03.2018 - 30.03.2018    timeout=20
    Wait until page contains    koodisto7000    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    01.11.2018 -    timeout=20
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Sleep    2
    Wait until page contains element    ${END_DATE_INPUT}    timeout=20
    Input Text    ${END_DATE_INPUT}    2018-11-30
    Save code list
    Sleep    2
    Wait until page contains    01.11.2018 - 30.11.2018    timeout=20
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_LIST_9}")]
    Sleep    3
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://koodistot-dev.suomi.fi/"    Select Window    url=https://koodistot-dev.suomi.fi/codescheme;registryCode=test;schemeCode=Koodisto7000
    ...    ELSE    Select Window    url=https://koodistot-test.suomi.fi/codescheme;registryCode=test;schemeCode=Koodisto7000
    Wait until page contains    koodisto7000    timeout=20
    Sleep    2
    Wait until page contains element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element    ${CODELIST_VARIANTS_TAB}
    Wait until page contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains    01.11.2018 - 30.11.2018    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}    ${CODE_LIST_9}

524. Import code list with links
    [Documentation]    Import code list with links, check that links are imported successfully and
    ...    export code list. YTI-1182, YTI-7.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_links}    ${CODE_LIST_21}
    Sleep    2
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    Käyttöedellytys    timeout=20
    Wait until page contains    Testikäyttöedellytys    timeout=20
    Wait until page contains    Käyttökohde    timeout=20
    Wait until page contains    Testikäyttökohde    timeout=20
    Wait until page contains    Käyttöohje    timeout=20
    Wait until page contains    Testikäyttöohje    timeout=20
    Wait until page contains    Liittyvä standardi    timeout=20
    Wait until page contains    Testi liittyvä standardi    timeout=20
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=20
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Wait until page contains    Julkaisu    timeout=20
    Wait until page contains    Testijulkaisu_fi    timeout=20
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    2
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_CSV}
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=20
    Click element    ${CODELIST_CODES_TAB}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Uusi lisenssi    timeout=20
    Wait until page contains    Lähde    timeout=20
    Wait until page contains    Uusi lähde    timeout=20
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    käyttöohje.fi    timeout=20
    Wait until page contains    Normilinkki_fi    timeout=20
    Wait until page contains    Julkaisu    timeout=20
    Wait until page contains    Testijulkaisu_fi    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    Lisenssi    timeout=20
    Wait until page contains    Uusi lisenssi    timeout=20
    Wait until page contains    Lähde    timeout=20
    Wait until page contains    Uusi lähde    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_21}

525. Link sub code list for code
    [Documentation]    Import two code lists and link sub code list for code in other code list.
    ...    Try to remove linked code list and check error message. YTI-317.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Import codelist in Excel format
    Upload code list    ${Code_list_with_links}    ${CODE_LIST_21}
    Return to Koodistot frontpage
    Sleep    2
    Import code list in Excel format
    Upload code list    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${SUB_CODE_LIST_BTN}    timeout=20
    Click element    ${SUB_CODE_LIST_BTN}
    Wait until page contains element    ${SEARCH_SUB_CODE_LIST_INPUT}    timeout=20
    Input text    ${SEARCH_SUB_CODE_LIST_INPUT}    Linkkikoodisto
    Wait until page contains element    //*[contains(text(), "Linkkikoodisto")]    timeout=20
    Click element    //*[contains(text(), "Linkkikoodisto")]
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Sleep    3
    Wait until page contains    Liittyvä koodisto    timeout=20
    Wait until page contains    200 - Linkkikoodisto    timeout=20
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    id=remove_200_code_scheme_link    timeout=20
    Click element    id=remove_200_code_scheme_link
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Sleep    3
    Page should not contain    200 - Linkkikoodisto    timeout=20
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${SUB_CODE_LIST_BTN}    timeout=20
    Click element    ${SUB_CODE_LIST_BTN}
    Wait until page contains element    ${SEARCH_SUB_CODE_LIST_INPUT}    timeout=20
    Input text    ${SEARCH_SUB_CODE_LIST_INPUT}    Linkkikoodisto
    Wait until page contains element    //*[contains(text(), "Linkkikoodisto")]    timeout=20
    Click element    //*[contains(text(), "Linkkikoodisto")]
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Sleep    3
    Wait until page contains    Liittyvä koodisto    timeout=20
    Wait until page contains    200 - Linkkikoodisto    timeout=20
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_21}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_21}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_21}")]
    Wait until page contains    ${CODE_LIST_21}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains    ${Error_linked_codelist}    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_21}

526. Code list import with sub code list for code
    [Documentation]    Import code list with sub code list for code.
    ...    Update sub code lists for codes with CSV code import. YTI-317.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Superuser
    Import codelist in Excel format
    Upload code list    ${Code_list_with_links}    ${CODE_LIST_21}
    Return to Koodistot frontpage
    Sleep    2
    Import code list in Excel format
    Upload code list    ${Code_list_with_sub_code_list_in_code}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    Liittyvä koodisto    timeout=20
    Wait until page contains    200 - Linkkikoodisto    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    1
    Import codes in CSV format
    Upload codes    ${Codes_update_sub_code_list_csv}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    Liittyvä koodisto    timeout=20
    Wait until page contains    200 - Linkkikoodisto    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_21}

527. Create new code with sub code list
    [Documentation]    Create new code list and create code with with sub coce list.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_codes}    ${CODE_LIST_9}
    Wait until page contains    10 koodia    timeout=20
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Sleep    2
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${CODE_LIST_9}
    Sleep    5
    Wait until page contains    NewCode001 - newCode001
    Wait until page contains    koodisto6000    timeout=20
    Wait until page contains    Koodin arvo    timeout=20
    Wait until page contains    NewCode001    timeout=20
    Wait until page contains    Koodin nimi    timeout=20
    Wait until page contains    newCode001    timeout=20
    Wait until page contains    Koodisto7000 - koodisto7000    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    2
    Remove code    NewCode001 - newCode001
    Wait until page contains    Tällä koodistolla ei ole yhtään koodia.    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    koodisto6000    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_8}    ${CODE_LIST_9}

*** Keywords ***
Check values from Draft Code list
    Page should contain    Tunnus
    Page should contain    Koodisto6000
    Page should contain    Koodiston nimi
    Page should contain    koodisto6000
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Tietoalue
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
    Page should contain    Tietoalue
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check updated code listing
    Wait until page contains    koodi500 - Koodi500    timeout=20
    Wait until page contains    koodi501 - Koodi501    timeout=20
    Wait until page contains    koodi502 - Koodi502    timeout=20
    Wait until page contains    koodi503 - Koodi503    timeout=20
    Wait until page contains    koodi504 - Koodi504    timeout=20
    Wait until page contains    koodi505 - Koodi505    timeout=20

Create new code to code list with concept
    [Arguments]    ${concept}    ${vocabulary}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_CODE_BTN}    timeout=20
    Click element    ${CREATE_CODE_BTN}
    Wait until page contains element    ${SEARCH_CONCEPT_INPUT}    timeout=20
    Input Text    ${SEARCH_CONCEPT_INPUT}    ${concept}
    Wait until page contains element    ${VOCABULARY_SELECTION_DDL}    timeout=20
    Click element    ${VOCABULARY_SELECTION_DDL}
    Click Button    ${vocabulary}
    Wait until page contains element    //*[contains(text(), "${concept}")]
    Click element    //*[contains(text(), "${concept}")]
    Wait until page contains element    ${CODE_CODEVALUE_INPUT}    timeout=20
    Input text    ${CODE_CODEVALUE_INPUT}    NewCode001
    Wait until page contains element    ${SAVE_NEW_CODE_BTN}    timeout=20
    Click element    ${SAVE_NEW_CODE_BTN}
    Sleep    2
    Log to Console    New code "${concept}" created

Suggest concept to Terminologies
    [Arguments]    ${concept}    ${terminologies}    ${concept_name}    ${definition}
    Wait until page contains element    ${SEARCH_CONCEPT_INPUT}    timeout=20
    Input Text    ${SEARCH_CONCEPT_INPUT}    ${concept}
    Wait until page contains element    ${VOCABULARY_SELECTION_DDL}    timeout=20
    Click element    ${VOCABULARY_SELECTION_DDL}
    Click Button    ${terminologies}
    Sleep    5
    Wait until page contains element    ${OPEN_TERMINOLOGY_MODAL_BTN}    timeout=20
    Click element    ${OPEN_TERMINOLOGY_MODAL_BTN}
    Sleep    5
    Wait until page contains element    ${CONCEPT_SUGGESTION_NAME_INPUT}    timeout=20
    Input Text    ${CONCEPT_SUGGESTION_NAME_INPUT}    ${concept_name}
    Wait until page contains element    ${CONCEPT_DEFINITION_INPUT}    timeout=20
    Input Text    ${CONCEPT_DEFINITION_INPUT}    ${definition}
    Wait until page contains element    ${SAVE_CONCEPT_SUGGESTION_BTN}    timeout=20
    Click element    ${SAVE_CONCEPT_SUGGESTION_BTN}
    Sleep    5
    Wait until page contains    Haluatko ehdottaa käsitettä ${concept_name} sanastoon
    Wait until page contains element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click element    ${CONFIRMATION_YES_BTN}
    Sleep    3
    Log to Console    Concept ${concept_name} suggested succesfully to Terminologies
    Sleep    2

Remove Code list with concept from Terminologies
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

Test Case Setup Terminologies
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Terminologies
    Terminology Teardown
    Test Case Setup Superuser
    Remove code lists    automobiili

Test Case Teardown concept for code list from Terminologies
    Terminology Teardown
    Log to Console    Terminology teardown done
    Test Case Setup Superuser
    Log to Console    Test Case Setup Superuser done
    Remove code lists    tutkija

Test Case Teardown Code with concept
    Terminology Teardown
    Log to Console    Test Case Teardown Code with concept done
    Test Case Setup Superuser
    Log to Console    Test Case Setup Superuser done
    Remove code lists    ${CODE_LIST_8}
