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
${Error_linked_codelist}    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: 
${Error_cumulative_codelist}    Tätä koodia ei voi poistaa koska se kuuluu kumulatiiviseen koodistoon.
${Error_invalid_codevalue}    Tiedostossa on eri koodisto kuin päivityksen kohteena oleva koodisto.
#Concept URI
${concept_uri_prefix}    http://uri.suomi.fi/terminology/111/concept-1?env=

*** Test Cases ***
500. Import DRAFT Code list without codes
    [Documentation]    Import DRAFT code list without codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    Set default codelist variables    500

    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Click Code List Info Tab
    Check values from Draft Code list
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

501. Import VALID Code list with codes
    [Documentation]    Import VALID code list with codes, check that import is successful and remove code list
    [Tags]    regression    test    500
    Set default codelist variables    501

    ${excel_file_path}=    Create excel Valid Code list with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_6
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}
    Click Button    ${EXPAND_ALL_BTN}
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_2

    Select breadcrump link 2
    Click Code List Info Tab
    Check values from Valid Code list
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

502. Import DRAFT codes to existing code list
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful and remove code list
    [Tags]    regression    test    500
    Set default codelist variables    502
    
    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_4
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_5
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

503. Import DRAFT codes to existing code list and update codes with import functionality
    [Documentation]    Import DRAFT codes to existing code list, check that import is successful,
    ...    update codes and remove code list
    [Tags]    regression    test    500
    Set default codelist variables    503
    
    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_4
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_5
    Import codes in Excel format

    ${excel_file_path}=    Create excel Update Codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia
    Check updated code listing
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

504. Create new code list and codes
    [Documentation]    Create new code list and codes manually and remove code and code list
    [Tags]    regression    test    500
    Set default codelist variables    504

    Create code list    ${REGISTRY_1}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_SCHEME}    Asuminen
    Create new code to code list    ${DEFAULT_CODELIST_CODE_ID}    ${DEFAULT_PREFLABEL_CODE}    ${DRAFT_STATUS}    ${EMPTY}
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID} - ${DEFAULT_PREFLABEL_CODE}
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}

    Select breadcrump link 2
    Remove code    ${DEFAULT_CODELIST_CODE_ID} - ${DEFAULT_PREFLABEL_CODE}
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

505. Create new code list with existing codeValue
    [Documentation]    Create new code list with existing codeValue and check error message from
    ...    code list value input field
    [Tags]    regression    test    500
    Set default codelist variables    505
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    8 koodia
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_SCHEME}    Asuminen

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

506. Import multiple code lists with codes
    [Documentation]    Import multiple code list with codes, check that import is successful. Remove code lists and codes.
    [Tags]    regression    test    500
    Set default codelist variables    506
    
    ${excel_file_path}=    Create excel Multiple codelists and codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_6
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}
    Click Button    ${EXPAND_ALL_BTN}
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_2

    Select breadcrump link 2
    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element that contains text                ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains                        ${DEFAULT_PREFLABEL_SCHEME}_2

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_11
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_14
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_16

    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_3
    Click element that contains text                ${DEFAULT_PREFLABEL_SCHEME}_3
    Wait Until Page Contains                        ${DEFAULT_PREFLABEL_SCHEME}_3

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_21
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_24
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_26
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                                       ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                                       ${DEFAULT_CODELIST_SCHEME_ID}_3

508. Import DRAFT code list with codes and DEFAULT CODE
    [Documentation]    Import code list with codes and DEFAULT CODE, check that import is successful and DEFAULT CODE is
    ...    defined in information tab. Remove code list.
    [Tags]    regression    test    500
    Set default codelist variables    508
    
    ${excel_file_path}=    Create excel Codelist with defaultcode
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_5
    Click Code List Info Tab

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    Vakiokoodi
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

509. Create code list and add DEFAULT CODE
    [Documentation]    Create new code list and import codes. Add DEFAULT CODE manually,
    ...    remove DEFAULT CODE and code list.
    [Tags]    regression    test    500
    Set default codelist variables    509
    
    Create code list    ${REGISTRY_1}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_SCHEME}    Asuminen
    Import codes in Excel format
    
    ${excel_file_path}=    Create excel Codes 500 broader
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_5
    Click Code List Info Tab
    Click element with wait     ${MODIFY_CODE_LIST}
    Click element with wait     ${ADD_DEFAULTCODE_BTN}
    Input Text with wait    ${SEARCH_DEFAULTCODE_INPUT}    _6
    Click element that contains text     ${DEFAULT_CODELIST_CODE_ID}_6
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}
    Wait Until Page Contains    Vakiokoodi
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_6
    Click element with wait     ${MODIFY_CODE_LIST}
    Click element with wait     ${REMOVE_DEFAULTCODE}
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}
    Page should not contain    Vakiokoodi
    Page should not contain    ${DEFAULT_CODELIST_CODE_ID}_6

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

510. Import DRAFT codes (CSV) to existing code list
    [Documentation]    Import DRAFT codes (CSV) to existing code list, check that import is successful and remove code list
    [Tags]    test  regression  500
    Set default codelist variables    510
    
    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in CSV format
    ${csv_file_path}=   Create draft codes with BROADER csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${csv_file_path}
    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_5

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

511. Create code list and get concept for code list from Terminologies
    [Documentation]    Create code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields
    ...    and concept URI is correct. YTI-787.
    [Tags]    koodistot      test    500
    [Setup]    Test Case Setup Terminologies        Testiautomaatiosanasto
    Set default codelist variables    511
    
    Click element with wait     ${ADD_CODE_LIST_BTN}
    Click element with wait     ${CREATE CODE_LIST_BTN}
    Click element with wait     ${VOCABULARY_SELECTION_DDL}
    Click element that contains text        Testiautomaatiosanasto (Luonnos)
    Input Text with wait        ${SEARCH_CONCEPT_INPUT}    tutkija
    Click element with wait     //*[@id="Testiautomaatiosanasto_Tutkija_concept_link"]

    Click element with wait             ${SELECT_REGISTRY_BTN}
    Click element that contains text    ${REGISTRY_1}

    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait Until Page Contains Element    ${ADD_CLASSIFICATION_BTN}

    Click Button                            ${ADD_CLASSIFICATION_BTN}
    Input Text with wait                    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element that contains text        Asuminen
    Wait Until Page Contains Element        ${ADD_ORGANIZATION_BTN}
    Click Button                            ${ADD_ORGANIZATION_BTN}
    Input Text with wait                    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element that contains text        Testiorganisaatio
    Click element with wait                 ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Visible           ${CODE_LIST_DDL}

    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait Until Page Contains    tutkija
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa
    Wait Until Page Contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta
    ${uri_environment}=    Convert To Lowercase    ${ENVIRONMENT_IDENTIFIER}
    ${concept_uri}=    Catenate    SEPARATOR=    ${concept_uri_prefix}    ${uri_environment}
    Click Element that contains text        ${concept_uri}

    #Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    #Wait Until Page Contains    Suositettava termi
    #Wait Until Page Contains    tutkija
    #Wait Until Page Contains    Person who does the research
    #Wait Until Page Contains    http://uri.suomi.fi/terminology/111/concept-1
    #Close Window

    #Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    [Teardown]    Test Case Teardown Terminologies   ${DEFAULT_CODELIST_SCHEME_ID}

512. Create code to code list and get concept for code from Terminologies
    [Documentation]    Create code to code list and search for a concept from Terminologies and bring it to Reference Data.
    ...    Check that the name and definition of the concept will be copied in their respective fields in code, YTI-787.
    [Tags]    koodistot     test    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    Set default codelist variables    512
    
    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Click Code List Info Tab
    Check values from Draft Code list
    Create new code to code list with concept    Tutkija    Testiautomaatiosanasto
    Wait Until Page Contains    NewCode001 - tutkija
    Wait Until Page Contains    henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta

    [Teardown]    Test Case Teardown Terminologies  ${DEFAULT_CODELIST_SCHEME_ID}

513. Import VALID code list with codes and create new version of code list
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Check that links and codes from the original code list are copied to the new version, YTI-979.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    
    Set default codelist variables    513

    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_6
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}

    Click Button    ${EXPAND_ALL_BTN}

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2
    Click element with wait     ${MODIFY_CODE_BTN}

    Click element with wait     ${ADD_LINK_DDL}
    Click element with wait     ${LINK_BTN}
    Click element with wait     ${LINK_URL_INPUT}

    Input Text with wait        ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Click element with wait     ${ADD_BTN}

    Wait Until Page Contains    Liittyvä linkki
    Wait Until Page Contains    https://www.suomi.fi/etusivu/
    Click element with wait     ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}

    Select breadcrump link 2
    Click Code List Info Tab
    Click element with wait     ${MODIFY_CODE_LIST}
    Click element with wait     ${ADD_LINK_DDL}
    Click element with wait     ${LICENSE_BTN}
    Click element with wait     ${CCBY4.0}
    Click element with wait     ${SELECT_LINK_BTN}

    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Click element with wait     ${SAVE_CODE_LIST_MOD_BTN}

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)

    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait   ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element with wait     ${SAVE_NEW_CODE_LIST}

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}
    Click element with wait     ${EXPAND_ALL_BTN}

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_3
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_4
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_5
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_6
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_7
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_8
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_9
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_10

    Click Element that contains text        ${DEFAULT_PREFLABEL_CODE}_2

    Wait Until Page Contains    Liittyvä linkki
    Wait Until Page Contains    https://www.suomi.fi/etusivu/

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    englanti
    Wait Until Page Contains    suomi
    Wait Until Page Contains    ruotsi
    Wait Until Page Contains    Kuvaus
    Wait Until Page Contains    Määritelmä
    Wait Until Page Contains    muutostietoFI
    Wait Until Page Contains    101
    Wait Until Page Contains    lähdeFI
    Wait Until Page Contains    lakiperusteFI
    Wait Until Page Contains    sitovuustasoFI
    Wait Until Page Contains    Linkit
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                                       ${DEFAULT_CODELIST_SCHEME_ID}_2

514. Create and delete registry
    [Documentation]    Create registry and attach code list to that registry. Check that deleting
    ...    registry with code lists is not possible, remove code list and delete empty registry.
    [Tags]    regression    test    500
    Set default codelist variables    514
    
    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.

    Return to Koodistot frontpage
    Create code list                ${REGISTRY_2}
    ...                             notCumulative
    ...                             ${DEFAULT_CODELIST_SCHEME_ID}
    ...                             ${ORGANIZATION_1}
    ...                             ${DEFAULT_PREFLABEL_CODE}
    ...                             Asuminen
    Create new code to code list    koodi1111    Koodi1111    ${DRAFT_STATUS}    ${EMPTY}
    [Teardown]    Delete registry with code lists    Rekisteri123 - Automaatiorekisteri
    ...                                              Rekisteri123
    ...                                              ${DEFAULT_CODELIST_SCHEME_ID}

515. Create registry with existing registry code value
    [Documentation]    Create registry with existing registry code value and check error message
    [Tags]    regression    test    500
    Set default codelist variables    515
    
    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.
    Return to Koodistot frontpage

    Create registry    Rekisteri123    Automaatiorekisteri    Testiorganisaatio    Kuvaus
    [Teardown]    Delete empty registry    Rekisteri123 - Automaatiorekisteri

516. Import new VALID code list and attach variant
    [Documentation]    Import two code lists, attach variant to both code lists
    ...    and remove link between variant and code list from the first code list.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    516
    
    ${excel_file_path}=    Create excel Variant code list and codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Valid Code list with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait     ${CODE_LIST_DDL}
    Click element with wait     ${ATTACH_VARIANT_BTN}
    Input Text with wait   ${SEARCH_VARIANT_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1

    Click element with wait     ${CODELIST_VARIANTS_TAB}

    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    Voimassaolo
    Wait Until Page Contains    Nimi
    Wait Until Page Contains    Tila
    Wait Until Page Contains    31.12.2016 - 31.12.2018
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Return to Koodistot frontpage
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element with wait     ${CODE_LIST_DDL}
    Click element with wait     ${ATTACH_VARIANT_BTN}
    Input Text with wait    ${SEARCH_VARIANT_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait     ${CODELIST_VARIANTS_TAB}
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    Voimassaolo
    Wait Until Page Contains    Nimi
    Wait Until Page Contains    Tila
    Wait Until Page Contains    02.03.2018 - 30.03.2018
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:
    Click element with wait     //*[contains(@id,'detach_variant_')]
    Click element with wait     ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Page Does Not Contain    Seuraavat koodistot ovat tämän koodiston variantteja:

    Click element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element with wait     ${CODELIST_VARIANTS_TAB}
    Page should not contain     Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                                       ${DEFAULT_CODELIST_SCHEME_ID}_2

517. Import Code list with LANGUAGECODES
    [Documentation]    Import code list with language codes and check that
    ...    those are taken into use.
    [Tags]    regression    test    500
    Set default codelist variables    517
    
    ${excel_file_path}=    Create excel Code list with languagecodes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    Testirekisteri
    Wait Until Page Contains    Asuminen
    Wait Until Page Contains    Työ ja työttömyys
    Wait Until Page Contains    Elinkeinot
    Wait Until Page Contains    Kielikoodi
    Wait Until Page Contains    asu
    Wait Until Page Contains    bemba
    Wait Until Page Contains    englanti
    Wait Until Page Contains    ruotsi
    Wait Until Page Contains    suomi
    Wait Until Page Contains    swahili (Tansania)

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

518. Create code list and suggest concept to Terminologies
    [Documentation]    Create code list and suggest concept to Terminologies
    ...    YTI-848.
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    Set default codelist variables    518
    
    Click element with wait     ${ADD_CODE_LIST_BTN}
    Click element with wait     ${CREATE CODE_LIST_BTN}
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo
    Click element with wait     ${SELECT_REGISTRY_BTN}
    Click element that contains text        ${REGISTRY_1}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}

    Wait Until Page Contains Element    ${ADD_CLASSIFICATION_BTN}
    Click Button    ${ADD_CLASSIFICATION_BTN}
    Input Text with wait    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element that contains text        Asuminen

    Wait Until Page Contains Element    ${ADD_ORGANIZATION_BTN}
    Click Button    ${ADD_ORGANIZATION_BTN}
    Input Text with wait    ${SEARCH_ORGANIZATION_INPUT}    Testiorganisaatio
    Click element that contains text        Testiorganisaatio
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait Until Page Contains    automobiili
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa
    Wait Until Page Contains    Tämä on kulkuneuvo

    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Terminologies      ${DEFAULT_CODELIST_SCHEME_ID}

519. Create code to code list list and suggest concept to Terminologies
    [Documentation]    Create code to code list list and suggest concept to Terminologies
    [Tags]    regression    test    koodistot    500
    [Setup]    Test Case Setup Terminologies    Testiautomaatiosanasto
    Set default codelist variables    519
    
    ${excel_file_path}=    Create excel Draft Code list without codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}

    Click element with wait     ${CODE_LIST_DDL}
    Click element with wait     ${CREATE_CODE_BTN}
    Suggest concept to Terminologies    automob    Testiautomaatiosanasto (Luonnos)    automobiili    Tämä on kulkuneuvo

    Input Text with wait    ${CODE_CODEVALUE_INPUT}    NewCode001
    Click element with wait     ${SAVE_NEW_CODE_BTN}

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    automobiili
    Wait Until Page Contains    Käsitteen URI Sanastot-työkalussa
    Wait Until Page Contains    Tämä on kulkuneuvo

    Close All Browsers
    Check concept suggestion in Terminologies
    [Teardown]    Test Case Teardown Terminologies  ${DEFAULT_CODELIST_SCHEME_ID}

520. Create new version of code list as empty
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    without codes. Check that other code list information is copied to new version. YTI-1163, YTI-873.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    520
    
    ${excel_file_path}=    Create excel Code list with feedback column
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_4
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_6
    Wait Until Page Contains Element    ${EXPAND_ALL_BTN}

    Click Button    ${EXPAND_ALL_BTN}

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
    Input Text with wait        ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait        ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Click element with wait     ${CONFIRMATION_YES_BTN}

    Page Should Not Contain    10 koodia
    Page Should Not Contain    ${DEFAULT_PREFLABEL_CODE}_1

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

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

521. Create new version of code list from file
    [Documentation]    Import VALID code list with codes and create new version of code list
    ...    from file. YTI-1163.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    521
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    10 koodia

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element with wait     ${VERSION_TAB}

    Wait Until Page Contains    02.03.2018 - 30.03.2018
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    Luonnos
    Wait Until Page Contains    Voimassa oleva

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

522. Create new versions of code list from file and remove original code list
    [Documentation]    Import VALID code list with codes and create new versions of code list
    ...    from file. Remove original code list and check that version listing is updated. YTI-1163.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    522
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    10 koodia

    ${excel_file_path}=    Create excel Code list version2
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}     ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    10 koodia
    Modify code list
    Click element with wait     ${CODE_LIST_STATUS_DDL}
    Click element with wait     ${VALID_STATUS}
    Save Code List With Confirmation
    Wait Until Page Contains    Voimassa oleva
    
    ${excel_file_path}=    Create excel Code list version3
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_3
    ...                    ${DEFAULT_CODELIST_CODE_ID}_3
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_3
    ...                    ${DEFAULT_PREFLABEL_CODE}_3
    Create Code List Version From File    ${FILE_FORMAT_Excel}    ${excel_file_path}     ${DEFAULT_PREFLABEL_SCHEME}_3
    Click element with wait     ${VERSION_TAB}
    Wait Until Page Contains    02.03.2018 - 30.03.2018
    Page Should Not Contain     03.03.2018 - 31.03.2018
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_3
    Wait Until Page Contains    Luonnos
    Wait Until Page Contains    Voimassa oleva
    Wait Until Page Contains    Korvattu

    Remove list of codes    ${DEFAULT_PREFLABEL_SCHEME}_1
    Input Text with wait    ${SEARCH_BOX_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2
    Click element that contains text         ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait     ${VERSION_TAB}
    Wait Until Page Contains    02.03.2018 - 30.03.2018
    Page Should Not Contain     03.03.2018 - 31.03.2018
    Page Should Not Contain     ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_3
    Wait Until Page Contains    Luonnos
    Wait Until Page Contains    Voimassa oleva
    Page should not contain     Korvattu

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                                         ${DEFAULT_CODELIST_SCHEME_ID}_3

523. Validity date change in variant listing
    [Documentation]    Import two code lists, attach variant to code list 1,
    ...    change validity date of the code list 1 and check that date change is
    ...    updated in code list 2 variant listing.
    [Tags]    koodistot    regression    test    500
    Set default codelist variables    523
    
    ${excel_file_path}=    Create excel Valid Code list with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Variant code list and codes no end date
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait     ${CODE_LIST_DDL}
    Click element with wait     ${ATTACH_VARIANT_BTN}
    Input Text with wait        ${SEARCH_VARIANT_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1

    Click element with wait     ${CODELIST_VARIANTS_TAB}
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    Voimassaolo
    Wait Until Page Contains    Nimi
    Wait Until Page Contains    Tila
    Wait Until Page Contains    02.03.2018 - 30.03.2018
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click Code List Info Tab
    Wait Until Page Contains    01.11.2018 -
    Click element with wait     ${MODIFY_CODE_LIST}
    Input Text with wait        ${END_DATE_INPUT}    2018-11-30
    Save code list
    Wait Until Page Contains    01.11.2018 - 30.11.2018
    Click element with wait     ${CODELIST_VARIANTS_TAB}
    Click element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1

    Switch window with wait     url=${REFERENCE_DATA_ENVIRONMENT_URL}codescheme;registryCode=test;schemeCode=${DEFAULT_CODELIST_SCHEME_ID}_1
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element with wait     ${CODELIST_VARIANTS_TAB}
    Wait Until Page Contains    Tämä koodisto on määritelty variantiksi seuraavissa koodistoissa:
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    01.11.2018 - 30.11.2018

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

524. Import code list with links
    [Documentation]    Import code list with links, check that links are imported successfully and
    ...    export code list. YTI-1182, YTI-7.
    [Tags]    regression    test    500
    Set default codelist variables    524
    
    ${excel_file_path}=    Create excel Code list with links
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia
    Click Code List Info Tab
    Wait Until Page Contains    Käyttöedellytys
    Wait Until Page Contains    Testikäyttöedellytys
    Wait Until Page Contains    Käyttökohde
    Wait Until Page Contains    Testikäyttökohde
    Wait Until Page Contains    Käyttöohje
    Wait Until Page Contains    Testikäyttöohje
    Wait Until Page Contains    Liittyvä standardi
    Wait Until Page Contains    Testi liittyvä standardi
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait Until Page Contains    Liittyvä linkki
    Wait Until Page Contains    https://www.suomi.fi/etusivu/
    Wait Until Page Contains    Julkaisu
    Wait Until Page Contains    Testijulkaisu_fi
    Wait Until Page Contains    Lähde
    Wait Until Page Contains    Testilähde
    Wait Until Page Contains Element    ${EXPORT_DDL}
    Click element with wait     ${EXPORT_DDL}
    Click element with wait     ${EXPORT_TYPE_EXCEL}
    Click element with wait     ${EXPORT_DDL}
    Click element with wait     ${EXPORT_TYPE_CSV}
    Click element with wait     ${CODELIST_CODES_TAB}
    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Uusi lisenssi
    Wait Until Page Contains    Lähde
    Wait Until Page Contains    Uusi lähde
    Wait Until Page Contains    Liittyvä linkki
    Wait Until Page Contains    Normilinkki_fi
    Wait Until Page Contains    Käyttöohje
    Wait Until Page Contains    https://käyttöohje.fi
    Wait Until Page Contains    Julkaisu
    Wait Until Page Contains    Testijulkaisu_fi

    Select breadcrump link 2
    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_30
    Wait Until Page Contains    Lisenssi
    Wait Until Page Contains    Uusi lisenssi
    Wait Until Page Contains    Lähde
    Wait Until Page Contains    Uusi lähde

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

525. Link sub code list for code
    [Documentation]    Import two code lists and link sub code list for code in other code list.
    ...    Try to remove linked code list and check error message. YTI-317.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    525
    
    ${excel_file_path}=    Create excel Code list with links
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_2_2
    Click element with wait                 ${MODIFY_CODE_BTN}
    Click element with wait                 ${SUB_CODE_LIST_BTN}
    Input Text with wait                    ${SEARCH_SUB_CODE_LIST_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}
    #Sleep  30
    Click element with wait                 //span[text()="${DEFAULT_PREFLABEL_SCHEME}" and @class="title"]
    Click element with wait                 ${SAVE_NEW_CODE_BTN}
    Wait Until Page Contains                Liittyvä koodisto
    Wait Until Page Contains                ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait                 ${MODIFY_CODE_BTN}
    Click element with wait                 id=remove_${DEFAULT_CODELIST_SCHEME_ID}_code_scheme_link
    Click element with wait                 ${SAVE_NEW_CODE_BTN}

    Page should not contain                 ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait                 ${MODIFY_CODE_BTN}
    Click element with wait                 ${SUB_CODE_LIST_BTN}
    Input Text with wait                    ${SEARCH_SUB_CODE_LIST_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait                 //span[text()="${DEFAULT_PREFLABEL_SCHEME}" and @class="title"]
    Click element with wait                 ${SAVE_NEW_CODE_BTN}

    Wait Until Page Contains                Liittyvä koodisto
    Wait Until Page Contains                ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}

    Return to Koodistot frontpage
    Input Text with wait                    ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait                 link=${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait                 ${CODE_LIST_DDL}
    Click element with wait                 ${DELETE_CODE_LIST_BTN}
    Click element with wait                 ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Page Contains                ${Error_linked_codelist} http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}_2/code/${DEFAULT_CODELIST_CODE_ID}_2
    Click element with wait                 ${CLOSE_ERROR_MESSAGE_BTN}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2    ${DEFAULT_CODELIST_SCHEME_ID}

526. Code list import with sub code list for code
    [Documentation]    Import code list with sub code list for code.
    ...    Update sub code lists for codes with CSV code import. YTI-317.
    [Tags]    regression    test    koodistot    500
    Set default codelist variables    526
    
    ${excel_file_path}=    Create excel Code list with links
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Code list with sub code list in code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_2_1
    Wait Until Page Contains                Liittyvä koodisto
    Wait Until Page Contains                ${DEFAULT_CODELIST_SCHEME_ID}_1 - ${DEFAULT_PREFLABEL_SCHEME}_1

    Select breadcrump link 2
    Import codes in CSV format
    ${csv_file_path}=   Create update sub codelist csv
    ...                    test
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    ...                    31
    Upload codes    ${csv_file_path}
    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_1_30
    Wait Until Page Contains                Liittyvä koodisto
    Wait Until Page Contains                ${DEFAULT_CODELIST_SCHEME_ID}_1 - ${DEFAULT_PREFLABEL_SCHEME}_1

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}_2  
    ...                                         ${DEFAULT_CODELIST_SCHEME_ID}_1

527. Create new code with sub code list
    [Documentation]    Create new code list and create code with with sub coce list.
    [Tags]    regression    test    500
    Set default codelist variables    527
    
    ${excel_file_path}=    Create excel Valid Code list with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    10 koodia
    Return to Koodistot frontpage
    Create code list    ${REGISTRY_1}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}_2    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_SCHEME}_2    Asuminen
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    NewCode001 - newCode001
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    NewCode001
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    newCode001
    Wait Until Page Contains     - ${DEFAULT_PREFLABEL_SCHEME}_1

    Select breadcrump link 2
    Remove code    NewCode001 - newCode001
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

528. Remove code from versioned code list
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Remove code from versioned code list and check that version history tab does not disappear. YTI-451.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    Set default codelist variables    528
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}   ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Click element with wait     ${EXPAND_ALL_BTN}

    Wait Until Page Contains    10 koodia
    Click element that contains text     ${DEFAULT_PREFLABEL_CODE}_1_1
    Wait Until Page Contains             ${DEFAULT_PREFLABEL_CODE}_1_1
    Remove code                          ${DEFAULT_PREFLABEL_CODE}_1_1
    Wait Until Page Contains             ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains             ${DEFAULT_PREFLABEL_CODE}_1_2
    Page should not contain              ${DEFAULT_PREFLABEL_CODE}_1_1
    Wait Until Element Is Enabled        ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2    ${DEFAULT_CODELIST_SCHEME_ID}_1

529. Create new version of code list with default code
    [Documentation]    Import code list with default code and create new version.
    ...    Check that new version is created succesfully and default code is copied.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.5
    Set default codelist variables    529
    
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1_1
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait          ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Wait Until Page Contains    10 koodia

    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_1_1
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    
    ...                                       ${DEFAULT_CODELIST_SCHEME_ID}_2
    #...                                       ${DEFAULT_CODELIST_SCHEME_ID}_1${DEFAULT_CODELIST_SCHEME_ID}_2

530. Update code attributes in versioned code list's newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Update a code's attributes in the latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    Set default codelist variables    530
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait   ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Wait Until Page Contains    10 koodia
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1_1 - ${DEFAULT_PREFLABEL_CODE}_1_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1_1 - ${DEFAULT_PREFLABEL_CODE}_1_1
    Click element that contains text        ${DEFAULT_PREFLABEL_CODE}_1_1
    Click Element with wait    ${MODIFY_CODE_BTN}
    Input Text with wait    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Input Text with wait    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Input Text with wait    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Click Element with wait    ${SAVE_CODE_MOD_BTN}
    Wait Until Page Contains    Tämä on uusi nimi koodille
    Wait Until Page Contains    Tämä on uusi kuvaus koodille
    Wait Until Page Contains    Tämä on uusi lyhyt nimi
    Click Element that contains text     ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Element Is Visible    ${VERSION_TAB}

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}
    Click Element that contains text    ${ALL_STATUSES_FI}
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}_1")]
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Element Is Visible    ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

531. Update code attributes in versioned code list's second newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Update a code's attributes in the second latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    Set default codelist variables    531
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait   ${CODE_LIST_NAME_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2

    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT}
    Click Element with wait    ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}
    Click Element that contains text        ${ALL_STATUSES_FI}
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Element Is Enabled    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}_1")]
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Page Contains    10 koodia
    Click Element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1_1 - ${DEFAULT_PREFLABEL_CODE}_1_1
    Click Element that contains text        ${DEFAULT_PREFLABEL_CODE}_1_1
    Click Element with wait   ${MODIFY_CODE_BTN}
    Input Text with wait   ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Input Text with wait   ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Input Text with wait   ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Click Element with wait    ${SAVE_CODE_MOD_BTN}
    Wait Until Page Contains    Tämä on uusi nimi koodille
    Wait Until Page Contains    Tämä on uusi kuvaus koodille
    Wait Until Page Contains    Tämä on uusi lyhyt nimi
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Element Is Visible    ${VERSION_TAB}

    Return to Koodistot frontpage
    Click Element with wait    ${STATUS_DROPDOWN_BTN}
    Click Element that contains text        ${ALL_STATUSES_FI}
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element that contains text        ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Element Is Visible    ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

532. Create a new code in versioned code list's newest version
    [Documentation]    Import VALID code list with codes and create new version of code list.
    ...    Create a new code in the latest code list and check that version history tab does not disappear from any of the versions.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    Set default codelist variables    532

    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}_1
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}_1
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    10 koodia
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait   ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001
    Wait Until Page Contains    Koodin arvo
    Wait Until Page Contains    NewCode001
    Wait Until Page Contains    Koodin nimi
    Wait Until Page Contains    newCode001

    Select breadcrump link 2
    Wait Until Element Is Visible    ${VERSION_TAB}
    Return to Koodistot frontpage
    Click Element with wait                 ${STATUS_DROPDOWN_BTN}
    Click element that contains text        ${ALL_STATUSES_FI}
    Input Text with wait    ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_1
    Click element that contains text     ${DEFAULT_PREFLABEL_SCHEME}_1
    Wait Until Element Is Visible    ${VERSION_TAB}
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

533. Create new version of code list with default code and change the default code
    [Documentation]    Import code list with default code and create new version.
    ...    Check that new version is created succesfully and default code is copied.
    ...    Then manually change the default code and ensure that the version history tab is intact.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    Set default codelist variables    533
    
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    10 koodia
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}   ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait   ${SAVE_NEW_CODE_LIST}

    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Wait Until Page Contains    10 koodia

    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1

    Click Element with wait   ${MODIFY_CODE_LIST}
    Click Element with wait   ${ADD_DEFAULTCODE_BTN}
    Click element with wait     //span[text()="${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1" and @class="title float-left"]
    Click element with wait     ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}
    Wait Until Page Contains    Vakiokoodi
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until element Is Enabled    ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

534. Create new version of cumulative code list and try to remove code
    [Documentation]    Create new version of cumulative code list
    ...    and check that the code can not be deleted.
    [Tags]    regression    koodistot    test    500
    set selenium speed   0.3
    Set default codelist variables    534
    
    Create code list    ${REGISTRY_1}
    ...                 Cumulative
    ...                 ${DEFAULT_CODELIST_SCHEME_ID}
    ...                 ${ORGANIZATION_1}
    ...                 ${DEFAULT_PREFLABEL_SCHEME}
    ...                 Asuminen

    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto
    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    6 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_4 - ${DEFAULT_PREFLABEL_CODE}_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_5 - ${DEFAULT_PREFLABEL_CODE}_5
    Modify code list
    Click Element with wait    ${CODE_LIST_STATUS_DDL}
    Wait Until Page Contains Element    ${VALID_STATUS}
    Click Button    ${VALID_STATUS}
    Save code list
    Click Element with wait    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains    Voimassa oleva
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}
    Input Text with wait   ${CODE_LIST_VALUE_INPUT}  ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait   ${CODE_LIST_NAME_INPUT}   ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait  ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}
    Wait Until Page Contains    6 koodia
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto
    Click Element with wait    ${CODELIST_CODES_TAB}
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Click Element with wait    ${CODE_DDL}
    Click Element with wait    ${REMOVE_CODE_BTN}
    Click Element with wait   ${REMOVE_CODE_CONF_BTN}
    Wait Until Page Contains    ${Error_cumulative_codelist}
    Click Element with wait    ${CLOSE_ERROR_MESSAGE_BTN}

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}  ${DEFAULT_CODELIST_SCHEME_ID}_2

535. Change code list as cumulative after import and create new cumulative code list version and add new code
    [Documentation]    Change code list as cumulative after import and
    ...    create new cumulative code list version and check that codes can not be deleted but new code can be added.
    [Tags]    koodistot    regression    test    500
    set selenium speed   0.3
    Set default codelist variables    535
    
    ${excel_file_path}=    Create excel Code list codes default code for new version valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    10 koodia
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto
    Wait Until Page Contains    Ei

    Click Element with wait    ${MODIFY_CODE_LIST}
    Click Element with wait   ${MARK_CUMULATIVE_CODE_LIST_CHECKBOX}
    Click Element with wait   ${SAVE_NEW_CODE_LIST}

    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}
    Wait Until Page Contains    Kumulatiivinen koodisto
    Wait Until Page Contains    Kyllä
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait   ${CODE_LIST_NAME_INPUT}      ${DEFAULT_PREFLABEL_SCHEME}_2
    Click Element with wait    ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}

    Wait Until Page Contains    10 koodia

    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto
    Click Element with wait   ${CODELIST_CODES_TAB}
    Click element that contains text       ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Click Element with wait    ${CODE_DDL}
    Click Element with wait   ${REMOVE_CODE_BTN}
    Click Element with wait   ${REMOVE_CODE_CONF_BTN}
    Click Element with wait   ${CLOSE_ERROR_MESSAGE_BTN}

    Select breadcrump link 2
    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Wait Until Element Is Visible    //*[contains(text(), "NewCode001 - newCode001")]
    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes 500 broader
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Upload codes    ${excel_file_path}
    Click Element with wait    ${CODELIST_CODES_TAB}
    Wait Until Page Contains    17 koodia
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_1 - ${DEFAULT_PREFLABEL_CODE}_2_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_4 - ${DEFAULT_PREFLABEL_CODE}_2_4
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_5 - ${DEFAULT_PREFLABEL_CODE}_2_5

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

536. Update code list
    [Documentation]    Import code list and update code list from file. Check that other code lists
    ...    can not be updated with this function.
    [Tags]    regression    koodistot    test    500
    Set default codelist variables    536
    
    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia
    ${excel_file_path}=    Create excel Code list with 30 Codes updated
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_Excel}
    Wait Until Page Contains    31 koodia
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_31 - ${DEFAULT_PREFLABEL_CODE}_31
    Wait Until Page Contains    Voimassa oleva
    Wait Until Page Contains    Uuden koodin kuvaus
    Wait Until Page Contains    01.01.2019 - 01.01.2020

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Koodiston uusi kuvaus
    ${csv_file_path}=   Create update codelist with 30 codes csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${csv_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_CSV}

    Click Element with wait    ${CODELIST_INFO_TAB}
    Wait Until Page Contains   Koodiston uusi kuvaus numero 2
    Click Element with wait    ${CODE_LIST_DDL}
    Click Element with wait    ${UPDATE_CODE_LIST_FROM_FILE_BTN}
    Click Element with wait    ${FILE_FORMAT_BTN}
    Click Element with wait    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}

    ${excel_file_path}=    Create excel Code list with 30 Codes invalid codevalue
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click Element with wait    ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_codevalue}

    Cancel code list import
    Click Element with wait   ${CODE_LIST_DDL}
    Click Element with wait   ${UPDATE_CODE_LIST_FROM_FILE_BTN}
    Click Element with wait   ${FILE_FORMAT_BTN}
    Click Element with wait   ${FILE_FORMAT_CSV}
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}

    ${csv_file_path}=   Create invalid update codelist with 30 codes csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${csv_file_path}

    Click Element with wait   ${UPLOAD_FILE_BTN}
    Wait Until Page Contains    ${Error_invalid_codevalue}
    Cancel code list import

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

537. Create new version of code list from file, add variant and update code list from file
    [Documentation]    Create new version of code list from file, add variant, change code list as cumulative
    ...    and update code list from file. Check that code list remains as cumulative and version history and
    ...    variant listing do not disappear after code list update.YTI-498.
    [Tags]    koodistot    regression    test    500
    Set default codelist variables    537
    
    ${excel_file_path}=    Create excel Code list and codes for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    ${excel_file_path}=    Create excel Variant code list and codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    10 koodia
    Return to Koodistot frontpage
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2

    Wait Until Page Contains    25 koodia
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Element with wait   ${CODE_LIST_DDL}
    Click Element with wait   ${CREATE_CODELIST_VERSION_FROM_FILE}
    Click Element with wait    ${FILE_FORMAT_BTN}
    Click Element with wait    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_3
    ...                    ${DEFAULT_CODELIST_CODE_ID}_3
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_3
    ...                    ${DEFAULT_PREFLABEL_CODE}_3
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}_3
    Click Element with wait   ${VERSION_TAB}

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_3

    Modify code list
    Click Element with wait   ${MARK_CUMULATIVE_CODE_LIST_CHECKBOX}
    Save code list
    Wait Until Page Contains    Kumulatiivinen koodisto
    Wait Until Page Contains    Kyllä
    Click Element with wait   ${CODE_LIST_DDL}
    Click Element with wait   ${ATTACH_VARIANT_BTN}

    Wait Until Page Contains Element    ${SEARCH_VARIANT_INPUT}
    Input Text with wait                ${SEARCH_VARIANT_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait             //span[text()="${DEFAULT_PREFLABEL_SCHEME}" and @class="title"]

    Click Element with wait   ${CODELIST_VARIANTS_TAB}
    Wait Until Page Contains    Seuraavat koodistot ovat tämän koodiston variantteja:
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}
    ${excel_file_path}=    Create excel Code list with 30 Codes updated
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_3
    ...                    ${DEFAULT_CODELIST_CODE_ID}_3
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_3
    ...                    ${DEFAULT_PREFLABEL_CODE}_3
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}_3    ${FILE_FORMAT_Excel}
    Wait Until Page Contains Element    ${CODELIST_VARIANTS_TAB}
    Wait Until Page Contains Element    ${VERSION_TAB}
    Click Code List Info Tab
    Wait Until Page Contains    Kumulatiivinen koodisto
    Wait Until Page Contains    Kyllä

    [Teardown]    Remove codelist teardown
    ...           ${DEFAULT_CODELIST_SCHEME_ID}
    ...           ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...           ${DEFAULT_CODELIST_SCHEME_ID}_3

538. JSON array export for code list codes
    [Documentation]    Import code list and check that JSON array export is successful for code list codes. YTI-645.
    [Tags]    regression    test    500
    [Setup]     Test Case Setup superuser
    Set default codelist variables    538
    
    ${excel_file_path}=    Create excel Code list testi dcat
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Go To    ${REFERENCE_DATA_ENVIRONMENT_URL}codelist-api/api/v1/coderegistries/test/codeschemes/${DEFAULT_CODELIST_SCHEME_ID}/codes?array
    Wait Until Page Contains    ${Json_export_dcat}
    Switch Browser    1

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

539. Create new code with special characters
    [Documentation]    Check that code creation with special characters is successful
    ...    Check that URI link for code is working. YTI-672.
    [Tags]    regression    test    500
    Set default codelist variables    539
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Create new code to code list    +    plus    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    &    ja    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    *    tähti    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    .    piste    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Wait Until Page Contains    5 koodia

    GO To    http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}/code/*?env=${ENVIRONMENT_IDENTIFIER}
    Wait until page contains    Koodisto
    Wait until page contains    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait until page contains    Koodin arvo
    Wait until page contains    *
    Wait until page contains    Koodin nimi
    Wait until page contains    tähti

    Select breadcrump link 2
    Remove code    . - piste
    Wait Until Page Contains    4 koodia
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

540. Import codes with special characters
    [Documentation]    Check that importing code list and codes with special characters is successful. YTI-672.
    [Tags]    regression    test    500
    Set default codelist variables    540
    
    ${excel_file_path}=    Create excel Codelist special characters for codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    6 koodia
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

541. Import codes with special characters in CSV format
    [Documentation]    Check that importing codes with special characters in CSV format is successful. YTI-672.
    [Tags]    regression    test    500
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    541
    
    ${excel_file_path}=    Create excel Testikoodisto T200
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in CSV format
    ${csv_file_path}=           Create codes with special characters csv
    ...                         ${DEFAULT_CODELIST_SCHEME_ID}
    ...                         ${DEFAULT_CODELIST_CODE_ID}
    ...                         ${DEFAULT_PREFLABEL_SCHEME}
    ...                         ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    11 koodia
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

542. Import codes with existing order number
    [Documentation]    Check that importing codes is successful when imported file for codes
    ...    contains existing order number. YTI-1002.
    [Tags]    regression    test    500
    Set default codelist variables    542
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Import codes in CSV format
    ${csv_file_path}=           Create codes with special characters csv
    ...                         ${DEFAULT_CODELIST_SCHEME_ID}
    ...                         ${DEFAULT_CODELIST_CODE_ID}
    ...                         ${DEFAULT_PREFLABEL_SCHEME}
    ...                         ${DEFAULT_PREFLABEL_CODE}
    Upload codes                ${csv_file_path}
    Wait Until Page Contains    12 koodia

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes with order
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Wait Until Page Contains    22 koodia
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

543. Create new version of code list with languages
    [Documentation]    Import code list and create new version. Check that all elements with different
    ...    languages are shown in version creation and copied to the new version.
    [Tags]    regression    test    koodistot    500
    set selenium speed   0.3
    Set default codelist variables    543
    
    ${excel_file_path}=    Create excel Code list with languages
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia
    Click Code List Info Tab
    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_af_NA
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_TT
    Wait Until Page Contains Element    ${CODE_LIST_DDL}
    Click Button    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CREATE_NEW_VERSION_BTN}
    Click Button    ${CREATE_NEW_VERSION_BTN}

    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_AB}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_AF_NA}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_BEM}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_EN}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_NDS}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_SV}
    Wait Until Page Contains Element    ${CODE_LIST_NAME_INPUT_TT}
    Wait Until Page Contains Element    ${CODE_LIST_DESCRIPTION_INPUT_BEM}
    Wait Until Page Contains Element    ${CODE_LIST_DESCRIPTION_INPUT_SV}
    Wait Until Page Contains Element    ${CODE_LIST_DEFINITION_INPUT_BEM}
    Wait Until Page Contains Element    ${CODE_LIST_CHANGENOTE_INPUT}
    Wait Until Page Contains Element    ${CODE_LIST_FEEDBACK_INPUT_NDS}
    Click Element with wait    ${SAVE_NEW_CODE_LIST}
    Wait Until Page Contains    30 koodia
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}
    Click Code List Info Tab
    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_af_NA
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_TT

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2    ${DEFAULT_CODELIST_SCHEME_ID}

544. Import code list and codes with same PREFLABEL and DEFINITION values
    [Documentation]    Import code list and codes with same PREFLABEL, DEFINITION and DESCRIPTION values. YTI-1252.
    [Tags]    regression    test    500
    Set default codelist variables    544
    
    ${excel_file_path}=    Create excel Code list with same preflabel values
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist   ${DEFAULT_PREFLABEL_SCHEME}

    Change Content Language     ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}
    Wait Until Page Contains    Kuvaus
    Wait Until Page Contains    Määritelmä
    Wait Until Page Contains    xxxx
    Wait Until Page Contains    FI
    Wait Until Page Contains    EN
    Wait Until Page Contains    SV
    Wait Until Page Contains    BEM
    Wait Until Page Contains    AF
    Wait Until Page Contains    AB
    Wait Until Page Contains    AY
    Import codes in Excel format

    ${excel_file_path}=    Create excel Codes with same preflabel and definition value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Click Element with wait    ${CODELIST_CODES_TAB}
    Wait Until Page Contains    310 koodia
    Click element that contains text        005 - Alajärvi
    Wait Until Page Contains    Alajärvi
    Wait Until Page Contains    FI
    Wait Until Page Contains    EN
    Wait Until Page Contains    SV
    Wait Until Page Contains    BEM
    Wait Until Page Contains    Alajärven määritelmä
    Wait Until Page Contains    AB

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

*** Keywords ***
Check values from Draft Code list
    Page should contain    Tunnus
    Page should contain    ${DEFAULT_CODELIST_SCHEME_ID}
    Page should contain    Koodiston nimi
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Tietoalue
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check values from Valid Code list
    Page should contain    Tunnus
    Page should contain    ${DEFAULT_CODELIST_SCHEME_ID}
    Page should contain    Koodiston nimi
    Page should contain    Rekisteri
    Page should contain    Testirekisteri
    Page should contain    Tietoalue
    Page should contain    Asuminen
    Page should contain    Työ ja työttömyys
    Page should contain    Elinkeinot

Check updated code listing
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_1")]
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2")]
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_3")]
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_4")]
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_5")]
    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_6")]

Create new code to code list with concept
    [Arguments]    ${concept}    ${vocabulary}
    Click Element with wait     ${CODE_LIST_DDL}
    Click Element with wait     ${CREATE_CODE_BTN}
    Click Element with wait     ${VOCABULARY_SELECTION_DDL}
    Click Element with wait     //*[contains(@id, '${vocabulary}')]
    Input Text with wait        ${SEARCH_CONCEPT_INPUT}    ${concept}
    Click Element with wait     //*[@id="${vocabulary}_${concept}_concept_link"]
    Input Text with wait        ${CODE_CODEVALUE_INPUT}    NewCode001
    Click Element with wait     ${SAVE_NEW_CODE_BTN}
    Wait Until Page Contains Element    ${MODIFY_CODE_BTN}

Suggest concept to Terminologies
    [Arguments]    ${concept}    ${terminologies}    ${concept_name}    ${definition}
    Input Text with wait        ${SEARCH_CONCEPT_INPUT}    ${concept}
    Click Element with wait     ${VOCABULARY_SELECTION_DDL}
    Click Element that contains text       ${terminologies}
    Click Element with wait     ${OPEN_TERMINOLOGY_MODAL_BTN}
    Input Text with wait        ${CONCEPT_SUGGESTION_NAME_INPUT}    ${concept_name}
    Input Text with wait        ${CONCEPT_DEFINITION_INPUT}         ${definition}

    Click Element with wait     ${SAVE_CONCEPT_SUGGESTION_BTN}
    Wait Until Page Contains    Haluatko ehdottaa käsitettä ${concept_name} sanastoon
    Click Element with wait     ${CONFIRMATION_YES_BTN}
