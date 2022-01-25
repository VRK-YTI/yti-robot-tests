*** Settings ***
Documentation     Test Suite for Code list and Code import
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Superuser

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
#Error messages
${Error_registry_with_codelists}    Rekisterillä on koodistoja. Poista koodistot ennen rekisterin poistamista.
${Error_linked_codelist}    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/600/code/testcode29
${Error_cumulative_codelist}    Tätä koodia ei voi poistaa koska se kuuluu kumulatiiviseen koodistoon.
${Error_invalid_codevalue}    Tiedostossa on eri koodisto kuin päivityksen kohteena oleva koodisto.
#Concept URI
${concept_uri_prefix}    http://uri.suomi.fi/terminology/111/concept-1?env=

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT code list without codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_8}

    Click Code List Info Tab
    Check values from Draft Code list
    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

501. Import VALID Code list with codes
    [Documentation]    Import VALID code list with codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Valid Code list with codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}    timeout=20
    Click Button    ${EXPAND_ALL_BTN}
    Click element that contains text        ${TEST_CODE_2}    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    testikoodi02    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Testikoodi 02    timeout=20

    Select breadcrump link 2
    Click Code List Info Tab
    Check values from Valid Code list
    [Teardown]    Remove codelist teardown    ${CODE_LIST_9}

502. Import DRAFT codes to existing code list
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful and remove code list
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${CODE_LIST_8}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

503. Import DRAFT codes to existing code list and update codes with import functionality
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful,
    ...    update codes and remove code list
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${CODE_LIST_8}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20
    Import codes in Excel format
    ${excel_file_path}=    Create excel Update Codes
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Check updated code listing
    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

504. Create new code list and codes
    [Documentation]    Create new code list and codes manually and remove code and code list
    [Tags]    regression    test    500
    Create code list    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001    timeout=30
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    NewCode001    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    newCode001    timeout=20

    Select breadcrump link 2
    Remove code    NewCode001 - newCode001
    Click Code List Info Tab
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

505. Create new code list with existing codeValue
    [Documentation]    Create new code list with existing codeValue and check error message from
    ...    code list value input field
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_2}

    Wait Until Page Contains    8 koodia    timeout=20
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_4}    ${ORGANIZATION_1}    ${CODE_LIST_9}    Asuminen

    [Teardown]    Remove codelist teardown    testiautomaatiokoodisto

506. Import multiple code lists with codes
    [Documentation]    Import multiple code list with codes, check that import is successful. Remove code lists and codes.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Multiple codelists and codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_10}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}    timeout=20
    Click Button    ${EXPAND_ALL_BTN}
    Click element that contains text        ${TEST_CODE_2}    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    testikoodi02    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Testikoodi 02    timeout=20

    Select breadcrump link 2
    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_11}  timeout=30
    Click element that contains text     ${CODE_LIST_11}    timeout=30
    Wait Until Page Contains    ${CODE_LIST_11}    timeout=20

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains    testikoodi11 - Testikoodi 11    timeout=20
    Wait Until Page Contains    testikoodi14 - Testikoodi 14    timeout=20
    Wait Until Page Contains    testikoodi16 - Testikoodi 16    timeout=20

    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_12}  timeout=30
    Click element that contains text     ${CODE_LIST_12}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_12}    timeout=20

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains    testikoodi21 - Testikoodi 21    timeout=20
    Wait Until Page Contains    testikoodi24 - Testikoodi 24    timeout=20
    Wait Until Page Contains    testikoodi26 - Testikoodi 26    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_11}    ${CODE_LIST_12}

508. Import DRAFT code list with codes and DEFAULT CODE
    [Documentation]    Import code list with codes and DEFAULT CODE, check that import is successful and DEFAULT CODE is
    ...    defined in information tab. Remove code list.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Codelist with defaultcode
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_15}

    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    T1333    timeout=20
    Wait Until Page Contains    Vakiokoodikoodisto    timeout=20
    Wait Until Page Contains    Vakiokoodi    timeout=20
    Wait Until Page Contains    koodi502 - Koodi502    timeout=20

    [Teardown]    Remove codelist teardown    T1333

509. Create code list and add DEFAULT CODE
    [Documentation]    Create new code list and import codes. Add DEFAULT CODE manually,
    ...    remove DEFAULT CODE and code list.
    [Tags]    regression    test    500
    Create code list    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Import codes in Excel format
    
    ${excel_file_path}=    Create excel Codes 500 broader
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20
    Click Code List Info Tab
    Click element with wait     ${MODIFY_CODE_LIST}                     timeout=20
    Click element with wait     ${ADD_DEFAULTCODE_BTN}                  timeout=20
    Input Text with wait    ${SEARCH_DEFAULTCODE_INPUT}    505     timeout=20
    Click element that contains text     Koodi505                        timeout=20
    Click element with wait     ${SAVE_NEW_CODE_LIST}                   timeout=20
    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}                timeout=60
    Wait Until Page Contains    Vakiokoodi                              timeout=20
    Wait Until Page Contains    koodi505 - Koodi505                     timeout=20
    Click element with wait     ${MODIFY_CODE_LIST}                     timeout=20
    Click element with wait     ${REMOVE_DEFAULTCODE}                   timeout=20
    Click element with wait     ${SAVE_NEW_CODE_LIST}                   timeout=20
    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}                timeout=20
    Page should not contain    Vakiokoodi
    Page should not contain    koodi505 - Koodi505

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

510. Import DRAFT codes (CSV) to existing code list
    [Documentation]    Import DRAFT codes (CSV) to existing code list, check that import is successful and remove code list
    [Tags]    test  regression  500
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_8}

    Import codes in CSV format
    ${csv_file_path}=   Create draft codes with BROADER csv
    Upload codes    ${csv_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}

511. Create code list and get concept for code list from Terminologies
    [Documentation]    Create code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields
    ...    and concept URI is correct. YTI-787.
    [Tags]    koodistot      test    500
    [Setup]    Test Case Setup Terminologies        Testiautomaatiosanasto
    Click element with wait     ${ADD_CODE_LIST_BTN}            timeout=60
    Click element with wait     ${CREATE CODE_LIST_BTN}         timeout=60
    Click element with wait     ${VOCABULARY_SELECTION_DDL}     timeout=60
    Click element that contains text        Testiautomaatiosanasto (Luonnos)
    Input Text with wait        ${SEARCH_CONCEPT_INPUT}    tutkija
    Click element with wait     //*[@id="Testiautomaatiosanasto_Tutkija_concept_link"]    timeout=60

    Click element with wait             ${SELECT_REGISTRY_BTN}
    Click element that contains text    ${REGISTRY_1}

    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION_BTN}    timeout=20

    Click Button                            ${ADD_CLASSIFICATION_BTN}
    Input Text with wait                    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element that contains text        Asuminen    timeout=60
    Wait Until Page Contains Element        ${ADD_ORGANIZATION_BTN}    timeout=20
    Click Button                            ${ADD_ORGANIZATION_BTN}
    Input Text with wait                    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element that contains text        Testiorganisaatio    timeout=60
    Click element with wait                 ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Visible           ${CODE_LIST_DDL}    timeout=60

    Click Code List Info Tab
    Wait Until Page Contains    Koodisto6000    timeout=20
    Wait Until Page Contains    tutkija    timeout=20
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait Until Page Contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta    timeout=20
    ${uri_environment}=    Convert To Lowercase    ${ENVIRONMENT_IDENTIFIER}
    ${concept_uri}=    Catenate    SEPARATOR=    ${concept_uri_prefix}    ${uri_environment}
    Click Element that contains text        ${concept_uri}  timeout=20

    #Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    #Wait Until Page Contains    Suositettava termi    timeout=60
    #Wait Until Page Contains    tutkija    timeout=60
    #Wait Until Page Contains    Person who does the research    timeout=60
    #Wait Until Page Contains    http://uri.suomi.fi/terminology/111/concept-1    timeout=60
    #Close Window

    #Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    [Teardown]    Test Case Teardown Terminologies   tutkija

512. Create code to code list and get concept for code from Terminologies
    [Documentation]    Create code to code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields in code, YTI-787.
    [Tags]    koodistot     test    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_8}

    Click Code List Info Tab
    Check values from Draft Code list
    Create new code to code list with concept    Tutkija    Testiautomaatiosanasto
    Wait Until Page Contains    NewCode001 - tutkija    timeout=20
    Wait Until Page Contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta    timeout=20

    [Teardown]    Test Case Teardown Terminologies  ${CODE_LIST_8}

513. Import VALID code list with codes and create new version of code list
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Check that links and codes from the original code list are copied to the new version, YTI-979.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}    timeout=20

    Click Button    ${EXPAND_ALL_BTN}

    Click element that contains text        ${TEST_CODE_2}    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    testikoodi02    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    Testikoodi 02    timeout=20
    Click element with wait     ${MODIFY_CODE_BTN}    timeout=20

    Click element with wait     ${ADD_LINK_DDL}         timeout=30
    Click element with wait     ${LINK_BTN}             timeout=20
    Click element with wait     ${LINK_URL_INPUT}       timeout=20

    Input Text with wait   ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/  timeout=20
    Click element with wait     ${ADD_BTN}    timeout=60

    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Wait Until Page Contains    https://www.suomi.fi/etusivu/    timeout=20
    Click element with wait     ${SAVE_CODE_MOD_BTN}    timeout=20
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=60

    Select breadcrump link 2
    Click Code List Info Tab
    Click element with wait     ${MODIFY_CODE_LIST}     timeout=20
    Click element with wait     ${ADD_LINK_DDL}         timeout=30
    Click element with wait     ${LICENSE_BTN}          timeout=20
    Click element with wait     ${CCBY4.0}              timeout=20
    Click element with wait     ${SELECT_LINK_BTN}      timeout=20

    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Click element with wait     ${SAVE_CODE_LIST_MOD_BTN}    timeout=20

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}    timeout=60
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20

    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}  timeout=60
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}  timeout=20
    Click element with wait     ${SAVE_NEW_CODE_LIST}    timeout=60

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}    timeout=60
    Click element with wait     ${EXPAND_ALL_BTN}    timeout=60

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi02 - Testikoodi 02    timeout=20
    Wait Until Page Contains    testikoodi03 - Testikoodi 03    timeout=20
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains    testikoodi05 - Testikoodi 05    timeout=20
    Wait Until Page Contains    testikoodi06 - Testikoodi 06    timeout=20
    Wait Until Page Contains    testikoodi07 - Testikoodi 07    timeout=20
    Wait Until Page Contains    testikoodi08 - Testikoodi 08    timeout=20
    Wait Until Page Contains    testikoodi09 - Testikoodi 09    timeout=20
    Wait Until Page Contains    testikoodi10 - Testikoodi 10    timeout=20

    Click Element that contains text        testikoodi02 - Testikoodi 02

    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Wait Until Page Contains    https://www.suomi.fi/etusivu/    timeout=20

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    englanti    timeout=20
    Wait Until Page Contains    suomi    timeout=20
    Wait Until Page Contains    ruotsi    timeout=20
    Wait Until Page Contains    Kuvaus    timeout=20
    Wait Until Page Contains    Määritelmä    timeout=20
    Wait Until Page Contains    muutostietoFI    timeout=20
    Wait Until Page Contains    101    timeout=20
    Wait Until Page Contains    lähdeFI    timeout=20
    Wait Until Page Contains    lakiperusteFI    timeout=20
    Wait Until Page Contains    sitovuustasoFI    timeout=20
    Wait Until Page Contains    Linkit    timeout=20
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

514. Create and delete registry
    [Documentation]    Create registry and attach code list to that registry. Check that deleting
    ...    registry with code lists is not possible, remove code list and delete empty registry.
    [Tags]    regression    test    500
    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20

    Return to Koodistot frontpage
    Create code list    ${REGISTRY_2}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Create new code to code list    koodi1111    Koodi1111    ${DRAFT_STATUS}    ${EMPTY}
    [Teardown]    Delete registry with code lists    Rekisteri123 - Automaatiorekisteri  Rekisteri123    Koodisto6000

515. Create registry with existing registry code value
    [Documentation]    Create registry with existing registry code value and check error message
    [Tags]    regression    test    500
    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.    timeout=20
    Return to Koodistot frontpage

    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    [Teardown]    Delete empty registry    Rekisteri123 - Automaatiorekisteri

516. Import new VALID code list and attach variant
    [Documentation]    Import two code lists, attach variant to both code lists
    ...    and remove link between variant and code list from the first code list.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Variant code list and codes
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Valid Code list with codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Click element with wait     ${CODE_LIST_DDL}    timeout=20
    Click element with wait     ${ATTACH_VARIANT_BTN}    timeout=20
    Input Text with wait   ${SEARCH_VARIANT_INPUT}    ${CODE_LIST_8}  timeout=20
    Click element that contains text        ${CODE_LIST_8}    timeout=20

    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=20

    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:       timeout=20
    Wait Until Page Contains    Voimassaolo                                                 timeout=20
    Wait Until Page Contains    Nimi                                                        timeout=20
    Wait Until Page Contains    Tila                                                        timeout=20
    Wait Until Page Contains    31.12.2016 - 31.12.2018                                     timeout=20
    Wait Until Page Contains    ${CODE_LIST_8}                                              timeout=20
    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_8}   timeout=30
    Click element that contains text        ${CODE_LIST_8}    timeout=30
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=30
    Click element with wait     ${CODE_LIST_DDL}    timeout=20
    Click element with wait     ${ATTACH_VARIANT_BTN}    timeout=20
    Input Text with wait    ${SEARCH_VARIANT_INPUT}    ${CODE_LIST_9}     timeout=20
    Click element that contains text        ${CODE_LIST_9}  timeout=20

    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=30
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait Until Page Contains    Voimassaolo    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Tila    timeout=20
    Wait Until Page Contains    02.03.2018 - 30.03.2018    timeout=20
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Click element with wait     //*[contains(@id,'detach_variant_')]    timeout=20
    Click element with wait     ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Wait Until Page Does Not Contain    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=60

    Click element that contains text        ${CODE_LIST_8}    timeout=20

    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=20
    Page should not contain    Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}    ${CODE_LIST_9}

517. Import Code list with LANGUAGECODES
    [Documentation]    Import code list with language codes and check that
    ...    those are taken into use.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Code list with languagecodes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Click Code List Info Tab
    Wait Until Page Contains    ${CODE_LIST_9}          timeout=20
    Wait Until Page Contains    Testirekisteri          timeout=20
    Wait Until Page Contains    Asuminen                timeout=20
    Wait Until Page Contains    Työ ja työttömyys       timeout=20
    Wait Until Page Contains    Elinkeinot              timeout=20
    Wait Until Page Contains    Kielikoodi              timeout=20
    Wait Until Page Contains    asu                     timeout=20
    Wait Until Page Contains    bemba                   timeout=20
    Wait Until Page Contains    englanti                timeout=20
    Wait Until Page Contains    ruotsi                  timeout=20
    Wait Until Page Contains    suomi                   timeout=20
    Wait Until Page Contains    swahili (Tansania)      timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_9}

518. Create code list and suggest concept to Terminologies
    [Documentation]    Create code list and suggest concept to Terminologies
    ...    YTI-848.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    Click element with wait     ${ADD_CODE_LIST_BTN}    timeout=20
    Click element with wait     ${CREATE CODE_LIST_BTN}    timeout=20
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo
    Click element with wait     ${SELECT_REGISTRY_BTN}    timeout=20
    Click element that contains text        ${REGISTRY_1}    timeout=30

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_1}  timeout=20

    Wait Until Page Contains Element    ${ADD_CLASSIFICATION_BTN}   timeout=20
    Click Button    ${ADD_CLASSIFICATION_BTN}
    Input Text with wait    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen  timeout=20
    Click element that contains text        Asuminen    timeout=20

    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}    timeout=20
    Click Button    ${ADD_ORGANIZATION_BTN}
    Input Text with wait    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio  timeout=20
    Click element that contains text        Testiorganisaatio    timeout=20
    Click element with wait     ${SAVE_NEW_CODE_LIST}    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    Koodisto6000    timeout=20
    Wait Until Page Contains    automobiili    timeout=20
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait Until Page Contains    Tämä on kulkuneuvo    timeout=20

    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Terminologies      Koodisto6000

519. Create code to code list list and suggest concept to Terminologies
    [Documentation]    Create code to code list list and suggest concept to Terminologies
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    ${excel_file_path}=    Create excel Draft Code list without codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${CODE_LIST_8}

    Click element with wait     ${CODE_LIST_DDL}    timeout=20
    Click element with wait     ${CREATE_CODE_BTN}    timeout=20
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo

    Input Text with wait    ${CODE_CODEVALUE_INPUT}    NewCode001   timeout=20
    Click element with wait     ${SAVE_NEW_CODE_BTN}    timeout=20

    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    automobiili    timeout=20
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa    timeout=20
    Wait Until Page Contains    Tämä on kulkuneuvo    timeout=20

    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Terminologies  ${CODE_LIST_8}

520. Create new version of code list as empty
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    without codes. Check that other code list information is copied to new version. YTI-1163, YTI-873.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list with feedback column
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    testikoodi01 - Testikoodi 01
    Wait Until Page Contains    testikoodi04 - Testikoodi 04
    Wait Until Page Contains    testikoodi06 - Testikoodi 06
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}

    Click Button    ${EXPAND_ALL_BTN}

    Sleep                           5
    Click Code List Info Tab
    Click element with wait         ${MODIFY_CODE_LIST}
    Click element with wait         ${ADD_LINK_DDL}
    Click element with wait         ${LICENSE_BTN}
    Click element with wait         ${CCBY4.0}
    Click element with wait         ${SELECT_LINK_BTN}

    Wait Until Page Contains        Lisenssi
    Wait Until Page Contains        Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)

    Click element with wait             ${ADD_LINK_DDL}
    Click element with wait             ${DROPDOWN_ITEM_LINK}
    Input Text with wait                ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Click element with wait             ${ADD_BTN}
    Wait Until Page Contains            Liittyvä linkki
    Page Should Contain                 https://www.suomi.fi/etusivu/
    Click element with wait             ${SAVE_CODE_LIST_MOD_BTN}
    Wait Until Element Is Visible       ${MODIFY_CODE_LIST}
    Wait Until Page Contains            Lisenssi
    Wait Until Page Contains            Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait Until Page Contains            Liittyvä linkki
    Wait Until Page Contains            https://www.suomi.fi/etusivu/

    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button                        ${CODE_LIST_DDL}

    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button                        ${CREATE_NEW_VERSION_BTN}

    Click element with wait     ${CREATE_CODELIST_VERSION_AS_EMPTY}
    Input Text with wait        ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}
    Input Text with wait        ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Click element with wait     ${CONFIRMATION_YES_BTN}

    Page Should Not Contain    10 koodia
    Page Should Not Contain    testikoodi01 - Testikoodi 01

    Click Code List Info Tab

    Wait Until Page Contains    englanti
    Wait Until Page Contains    suomi
    Wait Until Page Contains    ruotsi
    Wait Until Page Contains    kuvausFI
    Wait Until Page Contains    määritelmäFI
    Wait Until Page Contains    muutostietoFI
    Wait Until Page Contains    101
    Wait Until Page Contains    lähdeFI
    Wait Until Page Contains    lakiperusteFI
    Wait Until Page Contains    sitovuustasoFI
    Wait Until Page Contains    Linkit
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait Until Page Contains    Liittyvä linkki
    Wait Until Page Contains    https://www.suomi.fi/etusivu/
    Wait Until Page Contains    Yhteydenotto
    Wait Until Page Contains    Aineiston palauteosoite_fi

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

521. Create new version of code list from file
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    from file. YTI-1163.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=30
    ${excel_file_path}=    Create excel Code list with 30 Codes
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}    ${CODE_LIST_16}
    Click element with wait     ${VERSION_TAB}    timeout=20

    Wait Until Page Contains    02.03.2018 - 30.03.2018    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20

    [Teardown]    Remove codelist teardown    600    ${CODE_LIST_9}

522. Create new versions of code list from file and remove original code list
    [Documentation]    Import VALID code list with codes and create new versions of code list
    ...    from file. Remove original code list and check that version listing is updated. YTI-1163.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=60
    ${excel_file_path}=    Create excel Code list version2
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}    ${CODE_LIST_10}
    Wait Until Page Contains    10 koodia    timeout=60
    Modify code list
    Click element with wait     ${CODE_LIST_STATUS_DDL}    timeout=20
    Click element with wait     ${VALID_STATUS}    timeout=20
    Save Code List With Confirmation
    Wait Until Page Contains    Voimassa oleva    timeout=60
    
    ${excel_file_path}=    Create excel Code list version3
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}    ${CODE_LIST_11}
    Click element with wait     ${VERSION_TAB}    timeout=60
    Wait Until Page Contains    02.03.2018 - 30.03.2018    timeout=20
    Page Should Not Contain    03.03.2018 - 31.03.2018
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_10}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_11}    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Wait Until Page Contains    Korvattu    timeout=20

    Remove list of codes    ${CODE_LIST_9}
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_10}  timeout=30
    Click element that contains text        ${CODE_LIST_10}    timeout=30
    Wait Until Page Contains    ${CODE_LIST_10}
    Click Element with wait     ${VERSION_TAB}            timeout=20
    Wait Until Page Contains    02.03.2018 - 30.03.2018    timeout=20
    Page Should Not Contain    03.03.2018 - 31.03.2018
    Page Should Not Contain    ${CODE_LIST_9}
    Wait Until Page Contains    ${CODE_LIST_10}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_11}    timeout=20
    Wait Until Page Contains    Luonnos    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Page should not contain    Korvattu

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_11}

523. Validity date change in variant listing
    [Documentation]    Import two code lists, attach variant to code list 1,
    ...    change validity date of the code list 1 and check that date change is
    ...    updated in code list 2 variant listing.
    [Tags]    koodistot    regression    test    500
    ${excel_file_path}=    Create excel Valid Code list with codes
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Variant code list and codes no end date
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_8}

    Click element with wait     ${CODE_LIST_DDL}    timeout=20
    Click element with wait     ${ATTACH_VARIANT_BTN}    timeout=20
    Input Text with wait        ${SEARCH_VARIANT_INPUT}    ${CODE_LIST_9}  timeout=20
    Click Element that contains text        ${CODE_LIST_9}        timeout=20

    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=20
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait Until Page Contains    Voimassaolo    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Tila    timeout=20
    Wait Until Page Contains    02.03.2018 - 30.03.2018    timeout=20
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    01.11.2018 -    timeout=20
    Click element with wait     ${MODIFY_CODE_LIST}    timeout=20
    Input Text with wait    ${END_DATE_INPUT}    2018-11-30  timeout=20
    Save code list
    Wait Until Page Contains    01.11.2018 - 30.11.2018    timeout=20
    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=20
    Click element that contains text        ${CODE_LIST_9}    timeout=20

    Switch window with wait     url=${REFERENCE_DATA_ENVIRONMENT_URL}codescheme;registryCode=test;schemeCode=Koodisto7000
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    Click element with wait     ${CODELIST_VARIANTS_TAB}    timeout=20
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:    timeout=20
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    01.11.2018 - 30.11.2018    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}    ${CODE_LIST_9}

524. Import code list with links
    [Documentation]    Import code list with links, check that links are imported successfully and
    ...    export code list. YTI-1182, YTI-7.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Code list with links
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_21}

    Wait Until Page Contains    30 koodia    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    Käyttöedellytys    timeout=20
    Wait Until Page Contains    Testikäyttöedellytys    timeout=20
    Wait Until Page Contains    Käyttökohde    timeout=20
    Wait Until Page Contains    Testikäyttökohde    timeout=20
    Wait Until Page Contains    Käyttöohje    timeout=20
    Wait Until Page Contains    Testikäyttöohje    timeout=20
    Wait Until Page Contains    Liittyvä standardi    timeout=20
    Wait Until Page Contains    Testi liittyvä standardi    timeout=20
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Wait Until Page Contains    https://www.suomi.fi/etusivu/    timeout=20
    Wait Until Page Contains    Julkaisu    timeout=20
    Wait Until Page Contains    Testijulkaisu_fi    timeout=20
    Wait Until Page Contains    Lähde    timeout=20
    Wait Until Page Contains    Testilähde    timeout=20
    Wait Until Page Contains Element    ${EXPORT_DDL}    timeout=20
    Click element with wait     ${EXPORT_DDL}
    Click element with wait     ${EXPORT_TYPE_EXCEL}
    Click element with wait     ${EXPORT_DDL}    timeout=20
    Click element with wait     ${EXPORT_TYPE_CSV}
    Click element with wait     ${CODELIST_CODES_TAB}
    Click element that contains text        testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Uusi lisenssi    timeout=20
    Wait Until Page Contains    Lähde    timeout=20
    Wait Until Page Contains    Uusi lähde    timeout=20
    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Wait Until Page Contains    Normilinkki_fi    timeout=20
    Wait Until Page Contains    Käyttöohje    timeout=20
    Wait Until Page Contains    https://käyttöohje.fi    timeout=20
    Wait Until Page Contains    Julkaisu    timeout=20
    Wait Until Page Contains    Testijulkaisu_fi    timeout=20

    Select breadcrump link 2
    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Uusi lisenssi    timeout=20
    Wait Until Page Contains    Lähde    timeout=20
    Wait Until Page Contains    Uusi lähde    timeout=20

    [Teardown]    Remove codelist teardown    200

525. Link sub code list for code
    [Documentation]    Import two code lists and link sub code list for code in other code list.
    ...    Try to remove linked code list and check error message. YTI-317.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list with links
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Code list with 30 Codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Click element that contains text        testcode29 - Testcode 29    timeout=20
    Click element with wait     ${MODIFY_CODE_BTN}    timeout=20
    Click element with wait     ${SUB_CODE_LIST_BTN}    timeout=20
    Input Text with wait    ${SEARCH_SUB_CODE_LIST_INPUT}    Linkkikoodisto  timeout=20
    Click element that contains text        Linkkikoodisto    timeout=20
    Click element with wait     ${SAVE_NEW_CODE_BTN}    timeout=20
    Wait Until Page Contains    Liittyvä koodisto    timeout=20
    Wait Until Page Contains    200 - Linkkikoodisto    timeout=20
    Click element with wait     ${MODIFY_CODE_BTN}    timeout=20
    Click element with wait     id=remove_200_code_scheme_link    timeout=20
    Click element with wait     ${SAVE_NEW_CODE_BTN}    timeout=20

    Page should not contain    200 - Linkkikoodisto
    Click element with wait     ${MODIFY_CODE_BTN}    timeout=20
    Click element with wait     ${SUB_CODE_LIST_BTN}    timeout=20
    Input Text with wait        ${SEARCH_SUB_CODE_LIST_INPUT}    Linkkikoodisto  timeout=20
    Click element that contains text        Linkkikoodisto    timeout=20
    Click element with wait     ${SAVE_NEW_CODE_BTN}    timeout=20

    Wait Until Page Contains    Liittyvä koodisto    timeout=20
    Wait Until Page Contains    200 - Linkkikoodisto    timeout=20

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_21}   timeout=30
    Click element with wait     link=${CODE_LIST_21}    timeout=30
    Click element with wait     ${CODE_LIST_DDL}    timeout=20
    Click element with wait     ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element with wait     ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Wait Until Page Contains    ${Error_linked_codelist}    timeout=20
    Click element with wait     ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20

    [Teardown]    Remove codelist teardown    600    200

526. Code list import with sub code list for code
    [Documentation]    Import code list with sub code list for code.
    ...    Update sub code lists for codes with CSV code import. YTI-317.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list with links
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Code list with sub code list in code
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_16}

    Click element that contains text        testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    Liittyvä koodisto    timeout=20
    Wait Until Page Contains    200 - Linkkikoodisto    timeout=20

    Select breadcrump link 2
    Import codes in CSV format
    ${csv_file_path}=   Create update sub codelist csv
    Upload codes    ${csv_file_path}
    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Contains    Liittyvä koodisto    timeout=20
    Wait Until Page Contains    200 - Linkkikoodisto    timeout=20

    [Teardown]    Remove codelist teardown    600    200

527. Create new code with sub code list
    [Documentation]    Create new code list and create code with with sub coce list.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Valid Code list with codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${CODE_LIST_9}
    Wait Until Page Contains    NewCode001 - newCode001    timeout=20
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    NewCode001    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    newCode001    timeout=20
    Wait Until Page Contains     - ${CODE_LIST_9}    timeout=20

    Select breadcrump link 2
    Remove code    NewCode001 - newCode001
    Click Code List Info Tab
    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}    ${CODE_LIST_9}

528. Remove code from versioned code list
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Remove code from versioned code list and check that version history tab does not disappear. YTI-451.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}    timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=20

    Click element with wait     ${SAVE_NEW_CODE_LIST}    timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Click element with wait     ${EXPAND_ALL_BTN}    timeout=20

    Wait Until Page Contains    10 koodia    timeout=20
    Click element that contains text     testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Remove code    testikoodi01 - Testikoodi 01
    Wait Until Page Contains    ${CODE_LIST_10}    timeout=20
    Wait Until Page Contains    testikoodi02 - Testikoodi 02    timeout=20
    Page should not contain    testikoodi01 - Testikoodi 01
    Wait Until Element Is Enabled    ${VERSION_TAB}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

529. Create new version of code list with default code
    [Documentation]    Import code list with default code and create new version.
    ...    Check that new version is created succesfully and default code is copied.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}        timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=60
    Click Element with wait    ${SAVE_NEW_CODE_LIST}        timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Wait Until Page Contains    10 koodia    timeout=20

    Click Code List Info Tab
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

530. Update code attributes in versioned code list's newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Update a code's attributes in the latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}     timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=20
    Click Element with wait   ${SAVE_NEW_CODE_LIST}     timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Wait Until Page Contains    10 koodia    timeout=20
    Click element that contains text        testikoodi01 - Testikoodi 01    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Click element that contains text        Testikoodi 01       timeout=20
    Click Element with wait    ${MODIFY_CODE_BTN}       timeout=20
    Input Text with wait    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille    timeout=20
    Input Text with wait    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille      timeout=20
    Input Text with wait    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi     timeout=20
    Click Element with wait    ${SAVE_CODE_MOD_BTN}     timeout=20
    Wait Until Page Contains    Tämä on uusi nimi koodille    timeout=20
    Wait Until Page Contains    Tämä on uusi kuvaus koodille    timeout=20
    Wait Until Page Contains    Tämä on uusi lyhyt nimi    timeout=20
    Click Element that contains text     ${CODE_LIST_10}        timeout=30
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}               timeout=30
    Click Element that contains text    ${ALL_STATUSES_FI}          timeout=20
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_9}    timeout=30
    Wait Until Page Contains Element    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click Element that contains text        ${CODE_LIST_9}      timeout=30
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

531. Update code attributes in versioned code list's second newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Update a code's attributes in the second latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}  timeout=60
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}   timeout=20

    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Click Element with wait    ${SAVE_NEW_CODE_LIST}  timeout=30
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}       timeout=30
    Click Element that contains text        ${ALL_STATUSES_FI}  timeout=30
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_9}  timeout=30
    Wait Until Element Is Enabled    //*[contains(text(), "${CODE_LIST_9}")]    timeout=30
    Click Element that contains text        ${CODE_LIST_9}  timeout=30
    Wait Until Page Contains    10 koodia    timeout=30
    Click Element that contains text        testikoodi01 - Testikoodi 01    timeout=20
    Click Element that contains text        Testikoodi 01  timeout=20
    Click Element with wait   ${MODIFY_CODE_BTN}    timeout=20
    Input Text with wait   ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille         timeout=20
    Input Text with wait   ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille       timeout=20
    Input Text with wait   ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi      timeout=20
    Click Element with wait    ${SAVE_CODE_MOD_BTN}     timeout=30
    Wait Until Page Contains    Tämä on uusi nimi koodille    timeout=30
    Wait Until Page Contains    Tämä on uusi kuvaus koodille    timeout=30
    Wait Until Page Contains    Tämä on uusi lyhyt nimi    timeout=30
    Click Element that contains text        ${CODE_LIST_9}    timeout=30
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}       timeout=30
    Click Element that contains text        ${ALL_STATUSES_FI}  timeout=30
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${CODE_LIST_10}   timeout=30
    Click Element that contains text        ${CODE_LIST_10}    timeout=30
    Click Element that contains text        ${CODE_LIST_10}    timeout=30
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

532. Create a new code in versioned code list's newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Create a new code in the latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}        timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=20
    Click Element with wait   ${SAVE_NEW_CODE_LIST}     timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    NewCode001    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    newCode001    timeout=20

    Select breadcrump link 2
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20
    Return to Koodistot frontpage
    Click Element with wait                 ${STATUS_DROPDOWN_BTN}      timeout=30
    Click element that contains text        ${ALL_STATUSES_FI}          timeout=30
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${CODE_LIST_9}       timeout=30
    Click element that contains text     ${CODE_LIST_9}    timeout=30
    Wait Until Element Is Visible    ${VERSION_TAB}    timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

533. Create new version of code list with default code and change the default code
    [Documentation]    Import code list with default code and create new version.
    ...    Check that new version is created succesfully and default code is copied.
    ...    Then manually change the default code and ensure that the version history tab is intact.
    [Tags]    regression    koodistot    test    500
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}   ${CODE_LIST_VALUE_3}        timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=20
    Click Element with wait   ${SAVE_NEW_CODE_LIST}     timeout=20

    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Wait Until Page Contains    10 koodia    timeout=20

    Click Code List Info Tab
    Wait Until Page Contains    testikoodi04 - Testikoodi 04    timeout=20

    Click Element with wait   ${MODIFY_CODE_LIST}           timeout=20
    Click Element with wait   ${ADD_DEFAULTCODE_BTN}        timeout=20
    Click element that contains text        Testikoodi 01    timeout=20
    Click element with wait     ${SAVE_NEW_CODE_LIST}    timeout=20
    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}    timeout=60
    Wait Until Page Contains    Vakiokoodi    timeout=20
    Wait Until Page Contains    testikoodi01 - Testikoodi 01    timeout=20
    Wait Until element Is Enabled    ${VERSION_TAB}    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

534. Create new version of cumulative code list and try to remove code
    [Documentation]    Create new version of cumulative code list
    ...    and check that the code can not be deleted.
    [Tags]    regression    koodistot    test    500
    Create code list    ${REGISTRY_1}    Cumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20
    Modify code list
    Click Element with wait    ${CODE_LIST_STATUS_DDL}      timeout=20
    Wait Until Page Contains Element    ${VALID_STATUS}    timeout=20
    Click Button    ${VALID_STATUS}
    Save code list
    Click Element with wait    ${CONFIRMATION_YES_BTN}      timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=60
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}     timeout=60
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}       timeout=60
    Click Element with wait  ${SAVE_NEW_CODE_LIST}  timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60
    Wait Until Page Contains    6 koodia    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Click Element with wait    ${CODELIST_CODES_TAB}    timeout=20
    Click element that contains text        koodi500 - Koodi500    timeout=20
    Click Element with wait    ${CODE_DDL}      timeout=20
    Click Element with wait    ${REMOVE_CODE_BTN}       timeout=20
    Click Element with wait   ${REMOVE_CODE_CONF_BTN}       timeout=20
    Wait Until Page Contains    ${Error_cumulative_codelist}    timeout=20
    Click Element with wait    ${CLOSE_ERROR_MESSAGE_BTN}       timeout=20

    [Teardown]    Remove codelist teardown      koodisto6000    Koodisto7001         #Koodisto6000Koodisto7001

535. Change code list as cumulative after import and create new cumulative code list version and add new code
    [Documentation]    Change code list as cumulative after import and
    ...    create new cumulative code list version and check that codes can not be deleted but new code can be added.
    [Tags]    koodistot    regression    test    500
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    10 koodia    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Wait Until Page Contains    Ei    timeout=20

    Click Element with wait    ${MODIFY_CODE_LIST}      timeout=20
    Click Element with wait   ${MARK_CUMULATIVE_CODE_LIST_CHECKBOX}     timeout=20
    Click Element with wait   ${SAVE_NEW_CODE_LIST}     timeout=20

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}    timeout=60
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Wait Until Page Contains    Kyllä    timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}        timeout=60
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}    timeout=20
    Click Element with wait    ${SAVE_NEW_CODE_LIST}        timeout=20

    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60

    Wait Until Page Contains    10 koodia    timeout=20

    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Click Element with wait   ${CODELIST_CODES_TAB}  timeout=20
    Click element that contains text       testikoodi01 - Testikoodi 01    timeout=20
    Click Element with wait    ${CODE_DDL}      timeout=20
    Click Element with wait   ${REMOVE_CODE_BTN}        timeout=20
    Click Element with wait   ${REMOVE_CODE_CONF_BTN}       timeout=20
    Click Element with wait   ${CLOSE_ERROR_MESSAGE_BTN}        timeout=20

    Select breadcrump link 2
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Wait Until Element Is Visible    //*[contains(text(), "NewCode001 - newCode001")]    timeout=60
    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    Upload codes    ${excel_file_path}
    Click Element with wait    ${CODELIST_CODES_TAB}        timeout=20
    Wait Until Page Contains    17 koodia    timeout=20
    Wait Until Page Contains    koodi500 - Koodi500    timeout=20
    Wait Until Page Contains    koodi503 - Koodi503    timeout=20
    Wait Until Page Contains    koodi504 - Koodi504    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

536. Update code list
    [Documentation]    Import code list and update code list from file. Check that other code lists
    ...    can not be updated with this function.
    [Tags]    regression    koodistot    test    500
    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list with 30 Codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_16}

    Wait Until Page Contains    30 koodia    timeout=20
    ${excel_file_path}=    Create excel Code list with 30 Codes updated
    Update code list    ${excel_file_path}    ${CODE_LIST_24}    ${FILE_FORMAT_Excel}
    Wait Until Page Contains    31 koodia    timeout=20
    Click element that contains text        testcode58 - Testcode 58    timeout=20
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Wait Until Page Contains    Uuden koodin kuvaus    timeout=20
    Wait Until Page Contains    01.01.2019 - 01.01.2020    timeout=20

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Koodiston uusi kuvaus    timeout=20
    ${csv_file_path}=   Create update codelist with 30 codes csv
    Update code list    ${csv_file_path}    ${CODE_LIST_24}    ${FILE_FORMAT_CSV}

    Click Element with wait   ${CODELIST_INFO_TAB}       timeout=30
    Wait Until Page Contains    Koodiston uusi kuvaus numero 2    timeout=20
    Click Element with wait    ${CODE_LIST_DDL}     timeout=20
    Click Element with wait    ${UPDATE_CODE_LIST_FROM_FILE_BTN}    timeout=20
    Click Element with wait    ${FILE_FORMAT_BTN}       timeout=20
    Click Element with wait    ${FILE_FORMAT_Excel}     timeout=20
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20
    ${excel_file_path}=    Create excel Code list with 30 Codes invalid codevalue
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click Element with wait    ${UPLOAD_FILE_BTN}   timeout=20
    Wait Until Page Contains    ${Error_invalid_codevalue}    timeout=20
    Cancel code list import
    Click Element with wait   ${CODE_LIST_DDL}      timeout=20
    Click Element with wait   ${UPDATE_CODE_LIST_FROM_FILE_BTN}     timeout=20
    Click Element with wait   ${FILE_FORMAT_BTN}        timeout=20
    Click Element with wait   ${FILE_FORMAT_CSV}        timeout=20
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20

    ${csv_file_path}=   Create invalid update codelist with 30 codes csv
    Choose File    ${FILE_UPLOAD_BTN}    ${csv_file_path}

    Click Element with wait   ${UPLOAD_FILE_BTN}        timeout=20
    Wait Until Page Contains    ${Error_invalid_codevalue}    timeout=20
    Cancel code list import

    [Teardown]    Remove codelist teardown    600

537. Create new version of code list from file, add variant and update code list from file
    [Documentation]    Create new version of code list from file, add variant, change code list as cumulative
    ...    and update code list from file. Check that code list remains as cumulative and version history and
    ...    variant listing do not disappear after code list update.YTI-498.
    [Tags]    koodistot    regression    test    500
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Variant code list and codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}
    Wait Until Page Contains    10 koodia    timeout=20
    Return to Koodistot frontpage
    Search and open codelist    ${CODE_LIST_8}

    Wait Until Page Contains    25 koodia    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Element with wait   ${CODE_LIST_DDL}
    Click Element with wait   ${CREATE_CODELIST_VERSION_FROM_FILE}
    Click Element with wait    ${FILE_FORMAT_BTN}       timeout=20
    Click Element with wait    ${FILE_FORMAT_Excel}     timeout=20
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    timeout=20

    ${excel_file_path}=    Create excel Code list with 30 Codes
    Upload codelist    ${excel_file_path}    ${CODE_LIST_16}
    Click Element with wait   ${VERSION_TAB}        timeout=20

    Wait Until Page Contains    ${CODE_LIST_8}    timeout=20
    Wait Until Page Contains    ${CODE_LIST_16}    timeout=20

    Modify code list
    Click Element with wait   ${MARK_CUMULATIVE_CODE_LIST_CHECKBOX}     timeout=30
    Save code list
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Wait Until Page Contains    Kyllä    timeout=20
    Click Element with wait   ${CODE_LIST_DDL}      timeout=20
    Click Element with wait   ${ATTACH_VARIANT_BTN}     timeout=20

    Wait Until Page Contains Element    ${SEARCH_VARIANT_INPUT}
    Input Text with wait    ${SEARCH_VARIANT_INPUT}    ${CODE_LIST_9}     timeout=20
    Click element that contains text        ${CODE_LIST_9}        timeout=30

    Click Element with wait   ${CODELIST_VARIANTS_TAB}      timeout=20
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:    timeout=20
    Wait Until Page Contains    ${CODE_LIST_9}    timeout=20
    ${excel_file_path}=    Create excel Code list with 30 Codes updated
    Update code list    ${excel_file_path}    ${CODE_LIST_24}    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${CODELIST_VARIANTS_TAB}    timeout=20
    Wait Until Page Contains Element    ${VERSION_TAB}    timeout=20
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto    timeout=20
    Wait Until Page Contains    Kyllä    timeout=20

    [Teardown]    Remove codelist teardown    600    ${CODE_LIST_8}    ${CODE_LIST_9}

538. JSON array export for code list codes
    [Documentation]    Import code list and check that JSON array export is successful for code list codes. YTI-645.
    [Tags]    regression    test    500
    [Setup]     Test Case Setup superuser
    ${excel_file_path}=    Create excel Code list testi dcat
    Create codelist from Excel ${excel_file_path} to test with api

    Go To    ${REFERENCE_DATA_ENVIRONMENT_URL}codelist-api/api/v1/coderegistries/test/codeschemes/dcat01/codes?array
    Wait Until Page Contains    ${Json_export_dcat}    timeout=20
    Switch Browser    1

    [Teardown]    Remove codelist teardown    dcat01

539. Create new code with special characters
    [Documentation]    Check that code creation with special characters is successful
    ...    Check that URI link for code is working. YTI-672.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_4}

    Create new code to code list    +    plus    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    &    ja    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    *    tähti    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    .    piste    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Wait Until Page Contains    5 koodia    timeout=20

    GO To    http://uri.suomi.fi/codelist/test/T100/code/*?env=${ENVIRONMENT_IDENTIFIER}
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    T100    timeout=20
    Wait until page contains    Koodin arvo    timeout=20
    Wait until page contains    *    timeout=20
    Wait until page contains    Koodin nimi    timeout=20
    Wait until page contains    tähti    timeout=20

    Select breadcrump link 2
    Remove code    . - piste
    Wait Until Page Contains    4 koodia    timeout=30
    [Teardown]    Remove codelist teardown    T100

540. Import codes with special characters
    [Documentation]    Check that importing code list and codes with special characters is successful. YTI-672.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Codelist special characters for codes
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_4}
    Wait Until Page Contains    6 koodia    timeout=20
    [Teardown]    Remove codelist teardown    T100

541. Import codes with special characters in CSV format
    [Documentation]    Check that importing codes with special characters in CSV format is successful. YTI-672.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    ${excel_file_path}=    Create excel Testikoodisto T200
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_7}

    Import codes in CSV format
    ${csv_file_path}=           Create codes with special characters csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    11 koodia     timeout=20
    [Teardown]    Remove codelist teardown    ${CODE_LIST_7}

542. Import codes with existing order number
    [Documentation]    Check that importing codes is successful when imported file for codes
    ...    contains existing order number. YTI-1002.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_4}

    Import codes in CSV format
    ${csv_file_path}=           Create codes with special characters csv
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    12 koodia    timeout=20

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes with order
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    22 koodia    timeout=20
    [Teardown]    Remove codelist teardown    T100

543. Create new version of code list with languages
    [Documentation]    Import code list and create new version. Check that all elements with different
    ...    languages are shown in version creation and copied to the new version.
    [Tags]    regression    test    koodistot    500
    ${excel_file_path}=    Create excel Code list with languages
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_9}

    Wait Until Page Contains    30 koodia    timeout=20
    Click Code List Info Tab
    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${CODE_LIST_9}_af_NA    timeout=60
    Wait Until Page Contains    ${CODE_LIST_9}_TT    timeout=60
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=20
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}    timeout=20
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_3}  timeout=60
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_10}      timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_AB}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_AF_NA}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_BEM}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_EN}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_NDS}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_SV}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_TT}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DESCRIPTION_INPUT_BEM}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DESCRIPTION_INPUT_SV}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_DEFINITION_INPUT_BEM}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=20
    Wait Until Page Contains Element    ${CODE_LIST_FEEDBACK_INPUT_NDS}    timeout=20
    Click Element with wait    ${SAVE_NEW_CODE_LIST}  timeout=20
    Wait Until Page Contains    30 koodia    timeout=20
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=60
    Click Code List Info Tab
    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${CODE_LIST_9}_af_NA    timeout=60
    Wait Until Page Contains    ${CODE_LIST_9}_TT    timeout=60

    [Teardown]    Remove codelist teardown    ${CODE_LIST_10}    ${CODE_LIST_9}

544. Import code list and codes with same PREFLABEL and DEFINITION values
    [Documentation]    Import code list and codes with same PREFLABEL, DEFINITION and DESCRIPTION values. YTI-1252.
    [Tags]    regression    test    500
    ${excel_file_path}=    Create excel Code list with same preflabel values
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${CODE_LIST_27}

    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    Koodisto3000    timeout=20
    Wait Until Page Contains    Kuvaus    timeout=20
    Wait Until Page Contains    Määritelmä    timeout=20
    Wait Until Page Contains    xxxx    timeout=20
    Wait Until Page Contains    FI    timeout=20
    Wait Until Page Contains    EN    timeout=20
    Wait Until Page Contains    SV    timeout=20
    Wait Until Page Contains    BEM    timeout=20
    Wait Until Page Contains    AF    timeout=20
    Wait Until Page Contains    AB    timeout=20
    Wait Until Page Contains    AY    timeout=20
    Import codes in Excel format

    ${excel_file_path}=    Create excel Codes with same preflabel and definition value
    Upload codes    ${excel_file_path}
    Click Element with wait    ${CODELIST_CODES_TAB}    timeout=20
    Wait Until Page Contains    310 koodia    timeout=20
    Click element that contains text        005 - Alajärvi    timeout=20
    Wait Until Page Contains    Alajärvi    timeout=20
    Wait Until Page Contains    FI    timeout=20
    Wait Until Page Contains    EN    timeout=20
    Wait Until Page Contains    SV    timeout=20
    Wait Until Page Contains    BEM    timeout=20
    Wait Until Page Contains    Alajärven määritelmä    timeout=20
    Wait Until Page Contains    AB    timeout=20

    [Teardown]    Remove codelist teardown    k3000

*** Keywords ***
Check values from Draft Code list
    Page should contain    Tunnus
    Page should contain    ${CODE_LIST_8}
    Page should contain    Koodiston nimi
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Tietoalue
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check values from Valid Code list
    Page should contain    Tunnus
    Page should contain    ${CODE_LIST_9}
    Page should contain    Koodiston nimi
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Tietoalue
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check updated code listing
    Wait Until Element Is Visible    //*[contains(text(), "koodi500 - Koodi500")]    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "koodi501 - Koodi501")]    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "koodi502 - Koodi502")]    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "koodi503 - Koodi503")]    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "koodi504 - Koodi504")]    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "koodi505 - Koodi505")]    timeout=60

Create new code to code list with concept
    [Arguments]    ${concept}    ${vocabulary}
    Click Element with wait     ${CODE_LIST_DDL}                            timeout=20
    Click Element with wait     ${CREATE_CODE_BTN}                          timeout=20
    Click Element with wait     ${VOCABULARY_SELECTION_DDL}                 timeout=20
    Click Element with wait     //*[contains(@id, '${vocabulary}')]         timeout=20
    Input Text with wait        ${SEARCH_CONCEPT_INPUT}    ${concept}        timeout=20
    Click Element with wait     //*[@id="${vocabulary}_${concept}_concept_link"]     timeout=60
    Input Text with wait        ${CODE_CODEVALUE_INPUT}    NewCode001       timeout=20
    Click Element with wait     ${SAVE_NEW_CODE_BTN}     timeout=60
    Wait Until Page Contains Element    ${MODIFY_CODE_BTN}    timeout=60

Suggest concept to Terminologies
    [Arguments]    ${concept}    ${terminologies}    ${concept_name}    ${definition}
    Input Text with wait    ${SEARCH_CONCEPT_INPUT}    ${concept}       timeout=20
    Click Element with wait   ${VOCABULARY_SELECTION_DDL}           timeout=60
    Click Element that contains text       ${terminologies}         timeout=20
    Click Element with wait    ${OPEN_TERMINOLOGY_MODAL_BTN}        timeout=20
    Input Text with wait    ${CONCEPT_SUGGESTION_NAME_INPUT}    ${concept_name}     timeout=60
    Input Text with wait    ${CONCEPT_DEFINITION_INPUT}         ${definition}       timeout=20

    Click Element with wait   ${SAVE_CONCEPT_SUGGESTION_BTN}        timeout=20
    Wait Until Page Contains    Haluatko ehdottaa käsitettä ${concept_name} sanastoon    timeout=20
    Click Element with wait   ${CONFIRMATION_YES_BTN}       timeout=20
