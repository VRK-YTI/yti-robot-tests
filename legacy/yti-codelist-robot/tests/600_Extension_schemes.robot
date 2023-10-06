*** Settings ***
Documentation     Test Suite for Extensions
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Superuser

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown

*** Test Cases ***
600. Import code list with extension
    [Documentation]    Import Code list with extension and members (definition hierarchy), check that import is successfull,
    ...    modify member, export Excel and remove code list.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    600

    ${excel_file_path}=    Create excel Codelist with def hierarchy extensions and members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    testcode01 - Testikoodi 01    
    Wait Until Page Contains    testcode25 - Testikoodi 25    
    Wait Until Page Contains    25 koodia    
    Click element with wait      //*[contains(text(), "testcode25 - Testikoodi 25")] 
    Wait Until Page Contains    testcode25    
    Wait Until Page Contains    Testikoodi 25    
    Wait Until Page Contains    http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}/code/testcode25

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    

    Wait Until Element Is Visible    //*[contains(@id,'222_view_extension')]    

    Click element with wait             //*[contains(@id,'111_view_extension')]    
    Wait Until Page Contains            9 jäsentä    
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    

    Click element with wait      //*[contains(text(), " Jäsen1 · Testikoodi 01")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}   
    Wait Until Page Contains    Laajennus    
    Wait Until Page Contains    Testilaajennus11    
    Wait Until Page Contains    Koodi    
    Wait Until Page Contains    testcode01 - Testikoodi 01    

    Click element with wait      ${MODIFY_MEMBER_BTN}                       
    Click element with wait      ${ADD_DEFAULTCODE_BTN}                     
    Input Text with wait         ${SEARCH_DEFAULTCODE_INPUT}    25          
    Click element with wait      //*[contains(text(), "Testikoodi 25")]     
    Click element with wait      ${ADD_MEMBER_BTN}                          
    Input Text with wait         ${SEARCH_MEMBER_INPUT}    koulutus         
    Click element with wait      //*[contains(text(), "Koulutus, kulttuuri ja urheilu")]
    Click element with wait      ${SAVE_MEMBER}                             
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    

    Wait Until Page Contains    Koodisto    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}   
    Wait Until Page Contains    Laajennus    
    Wait Until Page Contains    Testilaajennus11    
    Wait Until Page Contains    Koodi    
    Wait Until Page Contains    testcode25 - Testikoodi 25    
    Wait Until Page Contains    Laajennus    
    Wait Until Page Contains    Koulutus, kulttuuri ja urheilu    

    Select breadcrump link 2
    Click element with wait      ${EXPORT_DDL}              
    Click element with wait      ${EXPORT_TYPE_EXCEL}       

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

601. Import code list with codes and import extension and members
    [Documentation]    Import code list with codes and import extension and members.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    601

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2
    Wait Until Page Contains    30 koodia    
    
    ${excel_file_path}=    Create excel Extension definition hierarchy
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload extension    ${excel_file_path}    ${FILE_FORMAT_EXCEL}


    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]            
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]             

    ${excel_file_path}=    Create excel Definition hierarchy members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload members    ${excel_file_path}    ${FILE_FORMAT_EXCEL}
    Wait Until Element Is Enabled    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2")]
    Click element with wait          //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_1")]    

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains    Laajennus    
    Wait Until Page Contains    suomi    
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

602. Import new code list and create extension and members
    [Documentation]    Import new code list and create calculation hierarchy extension and member manually
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    602

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    DCAT-AP-luokitus    False
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}   ${DEFAULT_PREFLABEL_CODE}_30    ${EMPTY}

    Wait Until Page Contains    - Member 1 · ${DEFAULT_PREFLABEL_CODE}_30 <=

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "- Member 1 · ${DEFAULT_PREFLABEL_CODE}_30 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]
    Wait Until Page Contains    Extension 1    

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

603. Delete extension and member
    [Documentation]    Import new code list and create and delete calculation hierarchy extension and member.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    603

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}  

    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}    False

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    ${DEFAULT_PREFLABEL_CODE}_30    ${EMPTY}
    Wait Until Page Contains    Koodisto                        
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                   
    Wait Until Page Contains    Laajennus                       
    Wait Until Page Contains    Extension 1                     
    Wait Until Page Contains    Jäsenen nimi                    
    Wait Until Page Contains    Member 1                        
    Wait Until Page Contains    Aritmeettinen operaattori       
    Wait Until Page Contains    -                               
    Wait Until Page Contains    Vertailuoperaattori             
    Wait Until Page Contains    <=                              
    Wait Until Page Contains    Koodi                           
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_30 - ${DEFAULT_PREFLABEL_CODE}_30        

    Delete member
    Wait Until Page Contains    Extension 1                                     
    Wait Until Page Contains    Tällä laajennuksella ei ole yhtään jäsentä.     
    Delete extension

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

604. Modify extension member
    [Documentation]    Import new code list, import calculation hierarchy extension and members and modify member.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    604

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist   ${DEFAULT_PREFLABEL_SCHEME} 

    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2
    
    ${excel_file_path}=    Create excel Extension calculation hierarchy
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload extension       ${excel_file_path}    ${FILE_FORMAT_EXCEL}

    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]    
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    

    ${excel_file_path}=    Create excel Calculation hierarchy members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload members         ${excel_file_path}    ${FILE_FORMAT_EXCEL}

    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen2 · ${DEFAULT_PREFLABEL_CODE}_2 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    
    Click element with wait      //*[contains(text(), "- Jäsen1 · ${DEFAULT_PREFLABEL_CODE}_1 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    
    Click element with wait      ${MODIFY_MEMBER_BTN}    
    Click element with wait      ${ADD_MEMBER_BTN}    

    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2")]    
    Input Text with wait         ${MEMBER_NAME_INPUT}    ${MEMBER_NAME_1}    
    Click element with wait      ${ADD_CODE_TO_MEMBER_BTN}    
    Input Text with wait         ${SEARCH_CODE_TO_MEMBER_INPUT}    ${DEFAULT_PREFLABEL_CODE}_30
    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_30")]    

    Click element with wait      ${REMOVE_MEMBER_LINK}    

    Click element with wait      ${SAVE_MEMBER}    
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    
    Wait Until Page Contains    Koodisto    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}  
    Wait Until Page Contains    Laajennus    
    Wait Until Page Contains    Jäsenen nimi    
    Wait Until Page Contains    Member 1    
    Wait Until Page Contains    Koodi    
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_30 - ${DEFAULT_PREFLABEL_CODE}_30
    Page should not contain     - Jäsen2 · ${DEFAULT_PREFLABEL_CODE}_2 <=

    Select breadcrump link 3
    Wait Until Page Contains Element     //*[contains(text(), "- Member 1 · ${DEFAULT_PREFLABEL_CODE}_30 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    
    Page Should Not Contain Element      ${EXPAND_ALL_BTN}

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

605. Import members in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    605

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}


    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2
    
    ${excel_file_path}=    Create excel Extension calculation hierarchy
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload extension    ${excel_file_path}    ${FILE_FORMAT_EXCEL}

    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]    
    Wait Until Page Contains Element    //*[contains(text(), "JÄSENET")]    
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]    

    ${csv_file_path}=   Create calculation hierarchy csv
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload members    ${csv_file_path}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen2 · ${DEFAULT_PREFLABEL_CODE}_2 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    

    Click element with wait      //*[contains(text(), "- Jäsen1 · ${DEFAULT_PREFLABEL_CODE}_1 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains    Laajennus       
    Wait Until Page Contains    Jäsenen nimi    
    Wait Until Page Contains    Jäsen1    
    Wait Until Page Contains    Aritmeettinen operaattori    
    Wait Until Page Contains    -    
    Wait Until Page Contains    Vertailuoperaattori    
    Wait Until Page Contains    <=    
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1   

    Select breadcrump link 3
    Click element with wait      ${EXPORT_DDL}    
    Click element with wait      ${EXPORT_MEMBERS_TYPE_CSV}    

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

606. Import code list with extension and without CODESCHEMES value
    [Documentation]    Import code list with extension. Check error message when CODESCHEME value
    ...    for external code list is missing from Extensions sheet in Excel. YTI-853
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    606

    Import code list in Excel format
    ${excel_file_path}=    Create excel Extensions without codeschemes value
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait      ${UPLOAD_FILE_BTN}              
    Wait Until Page Contains     ${Error_missing_codeschemes}    
    Cancel code import

607. Import code list with extension and with invalid code
    [Documentation]    Import code list (Excel) with extension. Check error message when
    ...    code in extensions sheet is not included to the code list. YTI-853
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    607

    Import code list in Excel format
    ${excel_file_path}=    Create excel Extensions invalid code in members sheet
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait      ${UPLOAD_FILE_BTN}    
    Wait Until Page Contains    ${Error_invalid_code}    
    Cancel code import

608. Import code list with extension and members that exceed maximum hierarchy level
    [Documentation]    Import code list with extension and members that exceed maximum hierarchy level and
    ...    Check error message . YTI-844
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    608

    Import code list in Excel format
    ${excel_file_path}=    Create excel Extensions max hierarchy level
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait      ${UPLOAD_FILE_BTN}    
    Wait Until Page Contains    ${Error_max_hierarchy_level}    
    Cancel code import

609. Import members with missing member value
    [Documentation]    Import members with missing unaryoperator value to calculation hierarchy extension
    ...    and check that import is successful.
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    609

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    
    ${excel_file_path}=    Create excel Extension calculation hierarchy
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload extension    ${excel_file_path}    ${FILE_FORMAT_EXCEL}

    Click element with wait  //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]
    ${excel_file_path}=    Create excel Calculation hierarchy members unaryoperator value missing
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload members    ${excel_file_path}    ${FILE_FORMAT_EXCEL}
    Wait Until Page Contains    14 jäsentä    
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen1 · ${DEFAULT_PREFLABEL_CODE}_1 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]

    [Teardown]    Remove codelist with extensions teardown   ${DEFAULT_CODELIST_SCHEME_ID}

610. Add code list to the extension
    [Documentation]    Add code list to the calculation hierarchy extension and
    ...    add codes from that code list to the extension member.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    610

    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
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
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}_2    False

    Click element with wait      //*[contains(text(), "TIEDOT")]    
    Wait Until Page Contains    Koodisto    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2  
    Wait Until Page Contains    Laajennuksen tunnus    
    Wait Until Page Contains    extension1    
    Wait Until Page Contains    Laajennuksen nimi    
    Wait Until Page Contains    Extension 1    
    Wait Until Page Contains    Laajennuksen tyyppi    
    Wait Until Page Contains    Laskentahierarkia    
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}_2 - ${DEFAULT_PREFLABEL_SCHEME}_2   

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${DEFAULT_CODELIST_SCHEME_ID}_2 - ${DEFAULT_PREFLABEL_SCHEME}_2    ${DEFAULT_PREFLABEL_CODE}_2_1    ${EMPTY}
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_1 - ${DEFAULT_PREFLABEL_CODE}_2_1    

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_1 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}   ${DEFAULT_CODELIST_SCHEME_ID}_2

611. Import code list with codes, extensions and members and create new version of code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    create new version of code list. Check that all values for codes, extensions and members are copied to the new
    ...    code list version. Export Excel and CSV for new code list version.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    611

    ${excel_file_path}=    Create excel Extensions and members for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_1
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_1
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_1

    Wait Until Page Contains    25 koodia    

    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${CREATE_NEW_VERSION_BTN}    

    Sleep                   1
    Input Text with wait    ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2  
    Input Text with wait    ${CODE_LIST_NAME_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait      ${SAVE_NEW_CODE_LIST}    
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    
    Wait Until Page Contains    25 koodia    
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    

    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}_2    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2 
    Wait Until Page Contains    Testirekisteri    
    Wait Until Page Contains    Asuminen    
    Wait Until Page Contains    Rakennettu ympäristö    
    Wait Until Page Contains    Yleiset tieto- ja hallintopalvelut    
    Wait Until Page Contains    englanti    
    Wait Until Page Contains    suomi    
    Page should not contain    ruotsi
    Wait Until Page Contains    testcode06 - Testikoodi 06    
    Wait Until Page Contains    31.12.2016 - 30.12.2018    

    Click element with wait      ${EXTENSIONS_TAB}    
    Wait Until Page Contains Element    //*[contains(text(), "MÄÄRITYSHIERARKIAT")]    
    Wait Until Page Contains Element    //*[contains(text(), "LASKENTAHIERARKIAT")]    
    Click element with wait      //*[contains(@id,'111_view_extension')]    
    Click element with wait      ${EXTENSION_INFO_TAB}    
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    Testilaajennus11    
    Wait Until Page Contains    Määrityshierarkia    
    Wait Until Page Contains    dcat - DCAT-AP-luokitus    
    Wait Until Page Contains    31.12.2016 - 30.12.2018    

    Click element with wait      ${MEMBERS_TAB}    
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    

    Click element with wait      //*[contains(text(), "Jäsen1 · Testikoodi 01")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2   
    Wait Until Page Contains    Testilaajennus11    
    Wait Until Page Contains    testcode01 - Testikoodi 01    
    Wait Until Page Contains    01.01.2018 - 01.01.2020    
    Wait Until Page Contains    URI    

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    

    Click element with wait      //*[contains(text(), "educ · Koulutus, kulttuuri ja urheilu")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2   
    Wait Until Page Contains    Testilaajennus11    
    Wait Until Page Contains    EDUC - Koulutus, kulttuuri ja urheilu - DCAT-AP-luokitus - Euroopan unionin koodistot    
    Wait Until Page Contains    08.01.2018 - 08.01.2020    
    Wait Until Page Contains    URI    

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CALC_HIERARCHY_TAB}    

    Click element with wait      //*[contains(@id,'222_view_extension')]    
    Wait Until Page Contains    9 jäsentä    
    Wait Until Page Contains Element    //*[contains(text(), "Laajenna kaikki")]    

    Click element with wait      //*[contains(text(), "- Jäsen1 · Testikoodi 08 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri <=")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2    
    Wait Until Page Contains    Testilaajennus22    
    Wait Until Page Contains    Jäsen1    
    Wait Until Page Contains    Vertailuoperaattori    
    Wait Until Page Contains    Aritmeettinen operaattori    
    Wait Until Page Contains    testcode08 - Testikoodi 08    
    Wait Until Page Contains    01.01.2018 - 01.01.2020    
    Wait Until Page Contains    URI    

    Select breadcrump link 2
    Click element with wait      ${VERSION_TAB}    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}   
    Wait Until Page Contains    Nimi    
    Wait Until Page Contains    Voimassaolo    
    Wait Until Page Contains    Tila    
    Wait Until Page Contains    Luonnos    
    Wait Until Page Contains    Voimassa oleva   

    Select breadcrump link 2
    Click element with wait      ${EXPORT_DDL}   
    Click element with wait      ${EXPORT_TYPE_EXCEL}  

    Click element with wait      ${EXPORT_DDL}   
    Click element with wait      ${EXPORT_TYPE_CSV}    

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}_1    ${DEFAULT_CODELIST_SCHEME_ID}_2

612. Import members with invalid member value
    [Documentation]    Import members with invalid unary operator value to calculation hierarchy extension
    ...    and check error message.
    [Tags]    regression    koodistot    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    612

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME} 
    
    ${excel_file_path}=    Create excel Extension calculation hierarchy
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Wait Until Page Contains    30 koodia    
    Upload extension    ${excel_file_path}    ${FILE_FORMAT_EXCEL}
    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]    
    ${excel_file_path}=    Create excel Calculation members invalid unary operator
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload members    ${excel_file_path}    ${FILE_FORMAT_EXCEL}
    Wait Until Page Contains    ${Error_member_value_invalid}    
    Cancel code import

    ${csv_file_path}=   Create invalid member csv
    Upload members    ${csv_file_path}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains    ${Error_member_value_invalid}    
    Cancel code import

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

613. Remove code list when codes are in use in other resources in the same code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    Check that it is possible to remove code list when codes are in use in other resources in the same code list.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    613

    ${excel_file_path}=    Create excel Extensions and members for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    25 koodia    

    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${DELETE_CODE_LIST_BTN}    
    Click element with wait      ${REMOVE_CODE_LIST_CONF_BTN}    

    Return to Koodistot frontpage
    Input Text with wait        ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.        timeout=60

    [Teardown]  run keywords   
    ...    Test Case Teardown Generic Teardown
    ...    Delete codelist ${DEFAULT_CODELIST_SCHEME_ID} if test fails

614. Import extensions in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    614

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia    
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1   
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2

    ${csv_file_path}=   Create Calc def hierarchy extensions csv    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload extension    ${csv_file_path}    ${FILE_FORMAT_CSV}
    Wait Until Page Contains Element    //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_view_extension')]       

    Click element with wait             ${CALC_HIERARCHY_TAB}          
    Wait Until Page Contains Element    //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}${DEFAULT_CODELIST_SCHEME_ID}_2_view_extension')]      

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

615. Import extensions to the versioned code list
    [Documentation]    Import code list with codes, create new version from file and import extensions
    ...    in CSV format to the new code list version. Check that versions are listed correctly, YTI-1163.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    615

    ${excel_file_path}=    Create excel Code list with 30 Codes valid    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia    
    Wait until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1    
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2 - ${DEFAULT_PREFLABEL_CODE}_2   

    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${CREATE_CODELIST_VERSION_FROM_FILE}   
    Click element with wait      ${FILE_FORMAT_BTN}    
    Click element with wait      ${FILE_FORMAT_Excel}    

    Wait Until Page Contains Element    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2  
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Upload codelist    ${excel_file_path}    ${DEFAULT_CODELIST_SCHEME_ID}_2

    ${csv_file_path}=   Create Calc def hierarchy extensions csv    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2  
    ...                    ${DEFAULT_PREFLABEL_CODE}_2
    Upload extension    ${csv_file_path}    ${FILE_FORMAT_CSV}

    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}_2${DEFAULT_CODELIST_SCHEME_ID}_2_view_extension')]    

    Select breadcrump link 2
    Click element with wait      ${VERSION_TAB}    

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains    01.01.2018 - 01.01.2019    
    Wait Until Page Contains    Luonnos    

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

616. Modify code list and codes attached to extensions and members
    [Documentation]    Modify the name of the code list and code that are attached to extensions and members.
    ...    Check that changes take effect on extensions and members.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    616

    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
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

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    False

    Click element with wait       ${EXTENSION_INFO_TAB}    
    Wait Until Page Contains    Koodisto    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2    
    Wait Until Page Contains    Laajennuksen tunnus    
    Wait Until Page Contains    extension1    
    Wait Until Page Contains    Laajennuksen nimi    
    Wait Until Page Contains    Extension 1    
    Wait Until Page Contains    Laajennuksen tyyppi    
    Wait Until Page Contains    Laskentahierarkia    
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}   

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${DEFAULT_CODELIST_SCHEME_ID}_2 - ${DEFAULT_PREFLABEL_SCHEME}_2   ${DEFAULT_PREFLABEL_CODE}_2    ${EMPTY}
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_1 - ${DEFAULT_PREFLABEL_CODE}_2_1    

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_1 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}    
    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}

    Click Code List Info Tab
    Click element with wait      ${MODIFY_CODE_LIST}    
    Input Text with wait    ${CODE_LIST_NAME_INPUT}    uusi nimi koodistolle    
    Save code list

    Wait Until Element Is Visible    ${MODIFY_CODE_LIST}    
    Click element with wait      ${CODELIST_CODES_TAB}    
    Click element with wait      //*[contains(text(), "${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1")]    
    Click element with wait      ${MODIFY_CODE_BTN}    
    Input Text with wait         ${CODE_NAME_INPUT}    koodin uusi nimi   
    Click element with wait      ${SAVE_CODE_MOD_BTN}    
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    

    Return to Koodistot frontpage
    Input Text with wait        ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}_2  
    Click element with wait     //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}_2")]    
    Click element with wait     ${EXTENSIONS_TAB}    

    Click element with wait     //*[contains(text(), "extension1 - Extension 1")]    
    Click element with wait     ${EXTENSION_INFO_TAB}    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    extension1    
    Wait Until Page Contains    Extension 1    
    Wait Until Page Contains    Laskentahierarkia    
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID} - uusi nimi koodistolle    

    Reload page
    
    Click element with wait      ${MEMBERS_TAB}    
    #Click element with wait      //*[contains(text(), "- Member 1 · koodin uusi nimi · uusi nimi koodistolle · Testirekisteri <=")]    

    #Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME} - koodin uusi nimi - uusi nimi koodistolle - Testirekisteri    

    [Teardown]    Remove codelist with extensions teardown  ${DEFAULT_CODELIST_SCHEME_ID}_2  ${DEFAULT_CODELIST_SCHEME_ID}

617. Remove code list which is linked to other resources
    [Documentation]    Remove code list which has codes attached to other code list extension.
    ...    Check that removing the code list is not possible. YTI-1229.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    617

    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
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

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    False

    Click element with wait      ${EXTENSION_INFO_TAB}    
    Wait Until Page Contains    Koodisto    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_2    
    Wait Until Page Contains    Laajennuksen tunnus    
    Wait Until Page Contains    extension1    
    Wait Until Page Contains    Laajennuksen nimi    
    Wait Until Page Contains    Extension 1    
    Wait Until Page Contains    Laajennuksen tyyppi    
    Wait Until Page Contains    Laskentahierarkia    
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}    ${DEFAULT_CODELIST_CODE_ID}    ${EMPTY}
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1   

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_1 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri")]    

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${DELETE_CODE_LIST_BTN}    
    Click element with wait      ${REMOVE_CODE_LIST_CONF_BTN}    
    Wait Until Page Contains    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}_2/extension/extension1    
    Wait Until Page Contains Element    ${CLOSE_ERROR_MESSAGE_BTN}    
    Click Button    ${CLOSE_ERROR_MESSAGE_BTN}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2  ${DEFAULT_CODELIST_SCHEME_ID}

618. Create member with broader member
    [Documentation]    Import new code list and create calculation hierarchy extension. Create member with broader member manually.
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    618

    ${excel_file_path}=    Create excel Extensions and members for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    testcode01 - Testikoodi 01    
    Wait Until Page Contains    25 koodia    

    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CALC_HIERARCHY_TAB}    

    Click element with wait      //*[contains(@id,'222_view_extension')]    

    Create member for calculation hierarchy    Jäsen10    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testikoodi 01    Jäsen9
    Wait Until Page Contains    - Jäsen10 · Testikoodi 01 <=    
    Wait Until Page Contains    - Jäsen9 · Testikoodi 16 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=    

    Select breadcrump link 3
    Wait Until Page Contains    Testilaajennus22    
    Wait Until Page Contains    10 jäsentä    

    Click element with wait      ${EXPAND_ALL_BTN}    
    Wait Until Page Contains Element    //*[contains(text(), "- Jäsen10 · Testikoodi 01 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri <=")]    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

619. Import code list, create members and create cross-reference list
    [Documentation]    Import code list, create members and create cross-reference list, export cross_reference list Excel and CSV
    ...    and delete cross-reference list and code lists.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    619

    ${excel_file_path}=    Create excel Code list and codes for cross reference list
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

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    
    Return to Koodistot frontpage

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_2_1 - ${DEFAULT_PREFLABEL_CODE}_2_1
    Wait Until Page Contains    30 koodia    

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    True
    Wait Until Page Contains    60 jäsentä    

    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_3 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Click element with wait      ${MODIFY_MEMBER_BTN}    
    Click element with wait      ${ADD_MEMBER_BTN}    
    Click element with wait      ${CODE_SCHEME_DDL_BTN}    

    Click element with wait      //*[contains(text(), "${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}")]    
    Click element with wait      //*[contains(text(), "Testcode 63 - ${DEFAULT_PREFLABEL_SCHEME}")]    

    Click element with wait      ${SAVE_MEMBER}    
    Wait Until Element Is Visible    ${MODIFY_MEMBER_BTN}    

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_3 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 63 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri")]    

    Click element with wait      ${EXPORT_DDL}    
    Click element with wait      ${EXPORT_CROSS_REFERENCE_EXCEL}    

    Click element with wait      ${EXPORT_DDL}    
    Click element with wait      ${EXPORT_CROSS_REFERENCE_CSV}    

    Delete extension
    Page Should Not Contain element    //*[contains(text(), "LAAJENNUKSET")]

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2       ${DEFAULT_CODELIST_SCHEME_ID}

620. Automatic member creation for codes
    [Documentation]    Import two code lists with codes, create calculation hierarchy extension and add another code list to the extension.
    ...    Create automatically members and check that members are created for each code from both code lists.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    620

    ${excel_file_path}=    Create excel Code list and codes for cross reference list
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

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    
    Return to Koodistot frontpage

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    30 koodia    

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    True
    Wait until page contains    60 jäsentä    

    [Teardown]    Remove codelist teardown  ${DEFAULT_CODELIST_SCHEME_ID}_2  ${DEFAULT_CODELIST_SCHEME_ID}           

621. Create missing members for the extensions
    [Documentation]    Import two code lists with codes, create calculation hierarchy and definition hierarchy extensions
    ...    without member creation and add other code list to the extension. Create missing members for the extensions
    ...    and check that members are created for each code from both code lists.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    621

    ${excel_file_path}=    Create excel Code list and codes for cross reference list
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

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME} 
    Wait until page contains    30 koodia    
    Return to Koodistot frontpage

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait until page contains    30 koodia    

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}     False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    
    Click element with wait      ${EXTENSION_DDL}    
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    
    Click element with wait      ${CONFIRMATION_YES_BTN}    
    Wait until page contains    60 puuttunutta jäsentä luotu.    
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    

    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_1 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Wait until page contains    60 jäsentä    

    Select breadcrump link 2
    Create extension    ${DEFINITION_HIERARCHY}    ${EXTENSION_VALUE_2}    ${EXTENSION_NAME_2}    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}     False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    
    Click element with wait      ${EXTENSION_DDL}    
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    
    Click element with wait      ${CONFIRMATION_YES_BTN}    
    Wait until page contains    60 puuttunutta jäsentä luotu.    
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    

    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_2_1 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Wait until page contains    60 jäsentä    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2       ${DEFAULT_CODELIST_SCHEME_ID}

622. Create missing members for the Cross-Reference list
    [Documentation]    Import code list and create Cross-Reference list. Create missing members for the Cross-Reference list.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    622

    ${excel_file_path}=    Create excel Code list and codes for cross reference list
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2 
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2 
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    30 koodia    
    Return to Koodistot frontpage

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait until page contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait until page contains    30 koodia    

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    False
    Wait Until Element Is Visible    ${MEMBERS_TAB}    
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    

    Click element with wait      ${EXTENSION_DDL}    
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    
    Click element with wait      ${CONFIRMATION_YES_BTN}    
    Wait until page contains    60 puuttunutta jäsentä luotu.    
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    

    Wait Until Element Is Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_1 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Wait until page contains    60 jäsentä    

    [Teardown]    Remove codelist teardown        ${DEFAULT_CODELIST_SCHEME_ID}_2       ${DEFAULT_CODELIST_SCHEME_ID}

623. Remove code that is in use in Cross-Reference list
    [Documentation]    Try to remove code that is in use in Cross-Reference list and check error message
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    623

    ${excel_file_path}=    Create excel Code list and codes for cross reference list
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    30 koodia    
    Return to Koodistot frontpage

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait until page contains    ${DEFAULT_CODELIST_CODE_ID}_1 - ${DEFAULT_PREFLABEL_CODE}_1
    Wait until page contains    30 koodia    

    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${DEFAULT_PREFLABEL_SCHEME}    True
    Wait until page contains    60 jäsentä    

    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_3 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Click element with wait      ${MODIFY_MEMBER_BTN}    
    Click element with wait      ${ADD_MEMBER_BTN}    
    Click element with wait      ${CODE_SCHEME_DDL_BTN}    
    Click element with wait      //*[contains(text(), "${DEFAULT_CODELIST_SCHEME_ID} - ${DEFAULT_PREFLABEL_SCHEME}")]    
    Click element with wait      //*[contains(text(), "Testcode 63 - ${DEFAULT_PREFLABEL_SCHEME}")]    
    Click element with wait      ${SAVE_MEMBER}    
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    

    Select breadcrump link 3
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}_3 · ${DEFAULT_PREFLABEL_SCHEME}_2 · Testirekisteri")]    
    Wait Until Page Contains Element    //*[contains(text(), "Testcode 63 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri")]    

    Return to Koodistot frontpage
    Input Text with wait   ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}   
    Click element with wait      //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Wait until page contains    ${DEFAULT_PREFLABEL_SCHEME}
    Click element with wait      id=test_${DEFAULT_CODELIST_SCHEME_ID}_testcode63_view_code    
    Click element with wait      ${CODE_DDL}    
    Click element with wait      ${REMOVE_CODE_BTN}    
    Click element with wait      ${REMOVE_CODE_CONF_BTN}    
    Wait until page contains     ${Error_remove_linked_code} http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}_2/extension/koodiliitoslaajennus/member/
    Click element with wait      ${CLOSE_ERROR_MESSAGE_BTN}    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}_2    ${DEFAULT_CODELIST_SCHEME_ID}

624. Create missing members for the extension and verify code list values
    [Documentation]    Create missing members for the extension and verify that code list values are correct after member creation.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    624

    ${excel_file_path}=    Create excel Code list with links and default code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    30 koodia    

    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}    False
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    
    Click element with wait      ${EXTENSION_DDL}    
    Click element with wait      ${CREATE_MISSING_MEMBERS_BTN}    
    Click element with wait      ${CONFIRMATION_YES_BTN}    
    Wait until page contains    30 puuttunutta jäsentä luotu.    
    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}    

    Wait Until Element Is Visible    //*[contains(text(), "Testcode 28 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri")]    
    Wait until page contains    30 jäsentä    

    Select breadcrump link 2
    Click Code List Info Tab
    Wait until page contains    Asuminen    
    Wait until page contains    Vakiokoodi    
    Wait until page contains    testcode28 - Testcode 28    
    Wait until page contains    Testijulkaisu_fi    
    Wait until page contains    Testikäyttöedellytys    
    Wait until page contains    Testikäyttökohde    
    Wait until page contains    Testikäyttöohje    
    Wait until page contains    https://www.suomi.fi/etusivu/    
    Wait until page contains    Testi liittyvä standardi    
    Wait until page contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    
    Wait until page contains    Testilähde    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

625. Import code list with Cross-Reference list extension
    [Documentation]    Import code list with Cross-Reference list extension and members, check that import is successfull,
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    625

    ${excel_file_path}=    Create excel Code list with cross reference list
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait until page contains    30 koodia    

    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CROSS_REFERENCE_LIST_TAB}    
    
    Click element with wait      //*[contains(@id,'test_${DEFAULT_CODELIST_SCHEME_ID}crossrefrencelist_view_extension')]    
    Page should not contain    Tällä laajennuksella ei ole vielä yhtään koodiliitosta.
    Wait Until Page Contains Element    //*[contains(text(), "Jäsen02 · Testcode 29 · ${DEFAULT_PREFLABEL_SCHEME} · Testirekisteri")]    
    Click element with wait      ${MEMBERS_TAB}    
    Wait until page contains    30 jäsentä    

    [Teardown]    Remove codelist with extensions teardown    ${DEFAULT_CODELIST_SCHEME_ID}

626. Remove code and extension from versioned code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    create new version of code list. Try to remove code from code list and check that proper error message is displayed.
    ...    Remove extension and check that code list version history does not disappear. YTI-452, YTI-566.
    [Tags]    regression    koodistot    600    test
    Set selenium speed  0.3
    Set default codelist variables    626

    ${excel_file_path}=    Create excel Extensions and members for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait until page contains        25 koodia
    Click element with wait         ${CODE_LIST_DDL}
    Click element with wait         ${CREATE_NEW_VERSION_BTN}

    Input Text with wait            ${CODE_LIST_VALUE_INPUT}    ${DEFAULT_CODELIST_SCHEME_ID}_2
    Input Text with wait            ${CODE_LIST_NAME_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}_2

    Click element with wait             ${SAVE_NEW_CODE_LIST}
    Wait Until Element Is Enabled       ${CODE_LIST_DDL}    
    Wait until page contains            25 koodia           

    Click element with wait         //*[contains(text(), "testcode01 - Testikoodi 01")]    

    Wait until page contains        testcode01 - Testikoodi 01    
    Click element with wait         ${CODE_DDL}
    Click element with wait         ${REMOVE_CODE_BTN}
    Click element with wait         ${REMOVE_CODE_CONF_BTN}
    Wait until page contains        ${Error_linked_code} http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}_2/extension/O1234567890123456789012345678901234567111/member/

    Click element with wait         ${CLOSE_ERROR_MESSAGE_BTN}

    Select breadcrump link 2
    Click element with wait         ${EXTENSIONS_TAB}
    Click element with wait         //*[contains(@id,'111_view_extension')]
    Delete extension

    Wait Until Element Is Visible    ${VERSION_TAB}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

627. Extend front page search to extensions and codes
    [Documentation]    Import two code lists with extensions. Check that front page search with extensions and codes without prefLabel
    ...    is successfull.
    [Tags]    koodistot    regression    600    test    search
    Set default codelist variables    627
    Set selenium speed  0.3

    ${excel_file_path}=    Create excel filter 1 Code list three extensions
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    ${excel_file_path}=    Create excel filter 2 Code list one extension
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}_2
    ...                    ${DEFAULT_CODELIST_CODE_ID}_2
    ...                    ${DEFAULT_PREFLABEL_SCHEME}_2
    ...                    ${DEFAULT_PREFLABEL_CODE}_"
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    26 koodia    

    Return to Koodistot frontpage
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}_2
    Wait Until Page Contains    25 koodia    

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rtt     
    Click element with wait      ${SEARCH_CODE_CHECKBOX}        

    Wait Until Page Contains    Hakutulokset    
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Wait Until Page Contains Element    //*[contains(text(), "RTT")]    

    Input Text with wait   ${SEARCH_BOX_INPUT}    rty789         
    Click element with wait      ${SEARCH_EXTENSION_CHECKBOX}    

    sleep  2
    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}    
    Click element with wait      ${PROPERTYTYPE_CROSSREFERENCELIST_FILTER}    
    Wait Until Page Contains            Hakutulokset                                
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Page Should Not Contain Element     //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}_2")]

    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     
    Click element with wait      ${PROPERTYTYPE_CALCULATIONHIERARCHY_FILTER}    

    Wait Until Page Contains                Hakutulokset                                
    Wait Until Page Contains Element        //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}_2")]    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}    ${DEFAULT_CODELIST_SCHEME_ID}_2

628. Clear values for calculation hierarchy member
    [Documentation]    Check that clearing the comparison operator and unary operator values
    ...    for Calculation hierarchy member is successfull, YTI-468.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    628

    ${excel_file_path}=    Create excel Code list calc hier members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    25 koodia    

    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CALC_HIERARCHY_TAB}    
    Click element with wait      //*[contains(@id,'222_view_extension')]    

    Wait until page contains    9 jäsentä    
    Click element with wait      //*[contains(text(), "+ Jäsen1")]    
    Click element with wait      ${MODIFY_MEMBER_BTN}    
    Click element with wait      ${COMPARISON_OPERATOR_INPUT}    
    Repeat Keyword    2 times    Press Key    ${COMPARISON_OPERATOR_INPUT}    \\08

    Click element with wait      ${UNARY_OPERATOR_INPUT}    
    Repeat Keyword    2 times    Press Key    ${UNARY_OPERATOR_INPUT}    \\08

    Click element with wait      ${SAVE_MEMBER}    
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    

    Wait Until Page Does Not Contain    <=    
    Wait Until Page Does Not Contain    +    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

629. Add values for new calculation hierarchy member
    [Documentation]    Add new calculation hierarchy member without unary operator and comparison operator values.
    ...    Check that modifying only one value (unary operator) for member is successful after member creation, YTI-468.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    629

    ${excel_file_path}=    Create excel Code list calc hier members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist   ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    25 koodia    

    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CALC_HIERARCHY_TAB}    
    Click element with wait      //*[contains(@id,'222_view_extension')]    
    Wait until page contains    9 jäsentä    

    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Testikoodi 18    ${EMPTY}
    Click element with wait      ${MODIFY_MEMBER_BTN}    
    Click element with wait      ${COMPARISON_OPERATOR_INPUT}    
    Input Text with wait    ${COMPARISON_OPERATOR_INPUT}    <=      

    Wait Until Element Is Enabled    ${SAVE_MEMBER}    
    Click Button    ${SAVE_MEMBER}
    Wait Until Element Is Enabled    ${MODIFY_MEMBER_BTN}    
    Wait until page contains    <=    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

630. Update members with duplicate member values
    [Documentation]    Import new code list with definition hierarchy extension and members.
    ...    Check that correct error message is dispalyed when trying to import members with duplicate member values, YTI-503.
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    630

    ${excel_file_path}=    Create excel Code list with def hierarchy extension and members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    30 koodia    

    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${UPDATE_CODE_LIST_FROM_FILE_BTN}    
    Click element with wait      ${FILE_FORMAT_BTN}    
    Click element with wait      ${FILE_FORMAT_Excel}    
    Wait until page contains element    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel Update code list with duplicate member id values
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait      ${UPLOAD_FILE_BTN}    
    Wait until page contains    ${Error_duplicate_member_id_values}    
    Cancel code import

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

631. Update member relations with member URI, code URI, codeValue and MEMBER_ID
    [Documentation]    Import code list and update member relations with member URI, code URI,
    ...    codeValue and MEMBER_ID. YTI-639, YTI-696.
    [Tags]    regression    koodistot    test    600
    Set default codelist variables    631

    Import code list in Excel format
    ${excel_file_path}=    Create excel Codelist with codes extensions and broader members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Wait until page contains    25 koodia    
    ${excel_file_path}=    Create excel Code list with update members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_Excel}
    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      //*[contains(@id,'222_view_extension')]    

    Page Should Not Contain Element    //*[contains(text(), "Jäsen2")]
    Page Should Not Contain Element    //*[contains(text(), "Jäsen4")]
    Page Should Not Contain Element    //*[contains(text(), "Jäsen9")]

    Click element with wait      ${EXPAND_ALL_BTN}    
    Page Should Contain Element    //*[contains(text(), "Jäsen2")]
    Page Should Contain Element    //*[contains(text(), "Jäsen4")]
    Page Should Contain Element    //*[contains(text(), "Jäsen9")]

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

632. Export JSON for code list
    [Documentation]    Import code list with codes, extensions and members,
    ...    Check that JSON export for code list is successful. YTI-18
    [Tags]    regression    koodistot    600    test
    Set default codelist variables    632

    ${excel_file_path}=    Create excel Extensions and members for new version creation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    25 koodia    

    Click element with wait      ${EXPORT_DDL}    
    Click element with wait      ${EXPORT_JSON}    

    Switch window with wait     url=${REFERENCE_DATA_ENVIRONMENT_URL}codelist-api/api/v1/coderegistries/test/codeschemes/${DEFAULT_CODELIST_SCHEME_ID}/?format=json&embedCodes=true&embedExtensions=true&embedMembers=true&expand=extension,member,codeScheme,code,memberValue,codeRegistry,organization,valueType,externalReference,propertyType&downloadFile=false&pretty
    Page should contain    "codeValue" : "${DEFAULT_CODELIST_SCHEME_ID}",
    Page should contain    "uri" : "http://uri.suomi.fi/codelist/test/${DEFAULT_CODELIST_SCHEME_ID}",
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Click element with wait      ${EXPORT_DDL}    
    Click element with wait      ${EXPORT_JSON_AS_FILE_BTN}    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

633. Update members with invalid relation value
    [Documentation]    Update members with invalid relation value
    ...    and check error message
    [Tags]    regression    test    600
    Set default codelist variables    633
    
    ${excel_file_path}=    Create excel Codelist with codes extensions and broader members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    25 koodia    

    Click element with wait      ${CODE_LIST_DDL}    
    Click element with wait      ${UPDATE_CODE_LIST_FROM_FILE_BTN}    
    Click element with wait      ${FILE_FORMAT_BTN}    
    Click element with wait      ${FILE_FORMAT_Excel}    
    Wait until page contains element    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel Update members invalid relation
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait      ${UPLOAD_FILE_BTN}    
    Wait until page contains    ${Error_invalid_member_relation}    
    Cancel code import

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

634. Import code list and extensions with 100 members
    [Documentation]    Import Code list with extensions and 100 members, check that import is successfull. YTI-691
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    634

    ${excel_file_path}=    Create excel Code list with extensions and 100 members
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait until page contains    115 koodia    timeout=90

    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      id=test_${DEFAULT_CODELIST_SCHEME_ID}ext1_view_extension    
    Wait until page contains    115 jäsentä    
    Wait Until Element Is Enabled    ${EXPAND_ALL_BTN}    

    Select breadcrump link 2
    Click element with wait      ${EXTENSIONS_TAB}    
    Click element with wait      ${CALC_HIERARCHY_TAB}    
    Click element with wait      id=test_${DEFAULT_CODELIST_SCHEME_ID}ext2_view_extension    
    Wait until page contains    9 jäsentä    
    Wait until page contains element    ${EXPAND_ALL_BTN}    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

635. Front page deep search with multiple extensions and codes
    [Documentation]    Import code list with multiple codes and extensions. Check that front page deep search function is successful.
    [Tags]    koodistot    regression    600    test    search
    Set default codelist variables    635

    ${excel_file_path}=    Create excel filter Code list with multiple extensions
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    36 koodia    

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rtt     
    Click element with wait      ${SEARCH_CODE_CHECKBOX}        

    Wait Until Page Contains            Hakutulokset                                
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    
    Wait Until Page Contains            Koodit                                      

    Click element with wait      //*[contains(text(), "Katso kaikki 11 osumaa")]    

    Wait until page contains    11 koodia    
    Wait Until Page Contains    RTT555 - aaaa    
    Wait Until Page Contains    RTT556 - bbbb (en)    
    Wait Until Page Contains    RTT557    
    Wait Until Page Contains    RTT558    
    Wait Until Page Contains    RTT559    
    Wait Until Page Contains    RTT560    
    Wait Until Page Contains    RTT561    
    Wait Until Page Contains    RTT562    
    Wait Until Page Contains    RTT563    
    Wait Until Page Contains    RTT564    
    Wait Until Page Contains    RTT565    

    Return to Koodistot frontpage
    Input Text with wait         ${SEARCH_BOX_INPUT}    rty                     
    Click element with wait      ${SEARCH_EXTENSION_CHECKBOX}                   

    Sleep                        2
    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     
    Click element with wait      ${PROPERTYTYPE_DEFINITIONHIERARCHY_FILTER}     

    Wait Until Element Is Not Visible   //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    timeout=60
    Click element with wait             ${PROPERTYTYPE_FILTER_DDL}                     
    Click element with wait             ${PROPERTYTYPE_CALCULATIONHIERARCHY_FILTER}    

    Wait Until Element Is Not Visible    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    timeout=60

    Click element with wait      ${PROPERTYTYPE_FILTER_DDL}                     
    Click element with wait      ${PROPERTYTYPE_CROSSREFERENCELIST_FILTER}      

    Wait Until Page Contains    Hakutulokset    
    Wait Until Page Contains    Laajennukset    
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    Click element with wait      //*[contains(text(), "Katso kaikki 8 osumaa")]     
    Click element with wait      ${EXTENSIONS_TAB}                                  
    Click element with wait      ${CROSS_REFERENCE_LIST_TAB}                        

    Wait Until Page Contains    rty789 - dddd (en)    
    Wait Until Page Contains    rty790    
    Wait Until Page Contains    rty791    
    Wait Until Page Contains    rty792    
    Wait Until Page Contains    rty793    
    Wait Until Page Contains    rty794    
    Wait Until Page Contains    rty795 - ffff    
    Wait Until Page Contains    rty796    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

636. Different organization between code list and linked registry
    [Documentation]    Check that creating and modifying code list is successful when code list organization
    ...    is different than linked registry organization.
    [Tags]    regression    test    600
    Set default codelist variables    636

    set selenium speed      0.5
    Create registry    Rekisteri123    Automaatiorekisteri    Automaatiotestaus    Rekisterin kuvaus
    Wait Until Page Contains    Tällä rekisterillä ei ole yhtään koodistoa.    

    Return to Koodistot frontpage
    Create code list    ${REGISTRY_2}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_SCHEME}    Asuminen
    Create new code to code list    koodi1111    Koodi1111    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    DCAT-AP-luokitus    True
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Koodi1111    ${EMPTY}

    [Teardown]    Delete registry with code lists    Rekisteri123 - Automaatiorekisteri  Rekisteri123  ${DEFAULT_CODELIST_SCHEME_ID}

637. Import code list, extensions and members, create member manually
    [Documentation]    Import code list, extensions and members with MEMBER-IDs, create member manually. YTI-1085
    [Tags]    koodistot    regression    600    test
    Set default codelist variables    637

    ${excel_file_path}=    Create excel Code list with extensions and member relations
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}
    ...                    ${DEFAULT_PREFLABEL_SCHEME}
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    25 koodia    timeout=90
    Select Tab    ${EXTENSIONS_TAB}
    Select Tab    ${CALC_HIERARCHY_TAB}
    
    Click Element with wait    id=test_${DEFAULT_CODELIST_SCHEME_ID}ext2_view_extension
    Wait Until Page Contains    25 jäsentä    
    Create member for calculation hierarchy    Jäsen10    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testikoodi 01    Testikoodi 06

    Select breadcrump link 3
    Wait Until Page Contains    26 jäsentä    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}