*** Settings ***
Documentation     Test Suite for DPM extensions
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

Test Setup        Test Case Setup Superuser


Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown

*** Test Cases ***
700. Create DPM Metric extension and update code extensions
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    Update code extensions with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    700

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME} 
    Wait Until Page Contains    30 koodia    
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    DPM Metric (en)   

    Return to Koodistot frontpage
    ${excel_file_path}=    Create excel Modify dpm metric    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist in excel format    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME} 

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_30   
    Wait Until Page Contains    dpmMetric                             
    Wait Until Page Contains    Balance type (en)                    
    Wait Until Page Contains    Debit                                 
    Wait Until Page Contains    Data type (en)                         
    Wait Until Page Contains    Isin                                   
    Wait Until Page Contains    Domain reference (en)                
    Wait Until Page Contains    ccc                                  
    Wait Until Page Contains    Flow type (en)                      
    Wait Until Page Contains    Duration                            
    Wait Until Page Contains    Hierarchy reference (en)             
    Wait Until Page Contains    eee                                   

    Select breadcrump link 2
    Click Element with wait    ${EXTENSIONS_TAB}      
    Click Element with wait    ${EXPORT_DDL}            
    Click Element with wait    ${EXPORT_TYPE_EXCEL}  
    Click Element with wait    ${EXPORT_DDL}         
    Click Element with wait    ${EXPORT_TYPE_CSV}   

701. Update DPM Metric extension with invalid Excel sheet
    [Documentation]    Import new code list and try to update DPM Metric extension
    ...    with invalid Excel sheet with two DMP Metric values defined. Check error message.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    701

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia  

    Return to Koodistot frontpage
    Import code list in Excel format
    ${excel_file_path}=    Create excel Modify dpm metric 2 dpms should fail
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Click element with wait     ${UPLOAD_FILE_BTN}  
    Wait Until Page Contains    ${Error_2_dpms}       
    Cancel code list import

702. Create DPM Metric extension
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    set DPM Metric values for code.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    702
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    30 koodia    
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    DPM Metric (en)    

    Select breadcrump link 2
    Click element that contains text       ${DEFAULT_CODELIST_CODE_ID}_1                  
    Click element with wait     ${MODIFY_CODE_BTN}                                   
    Input Text with wait        ${DPM_BALANCE_TYPE_INPUT}           Credit        
    Input Text with wait        ${DPM_METRIC_DATA_TYPE_INPUT}       Integer          
    Input Text with wait        ${DPM_DOMAIN_REFERENCE_INPUT}       ccc             
    Input Text with wait        ${DPM_FLOW_TYPE_INPUT}              Duration         
    Input Text with wait        ${DPM_HIERARCHY_REFERENCE_INPUT}    eee               
    Click element with wait     ${SAVE_CODE_MOD_BTN}             

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}   
    Wait Until Page Contains    dpmMetric                 
    Wait Until Page Contains    Balance type (en)          
    Wait Until Page Contains    Credit                    
    Wait Until Page Contains    Data type (en)            
    Wait Until Page Contains    Integer                    
    Wait Until Page Contains    Domain reference (en)      
    Wait Until Page Contains    ccc                 
    Wait Until Page Contains    Flow type (en)           
    Wait Until Page Contains    Duration                 
    Wait Until Page Contains    Hierarchy reference (en)   
    Wait Until Page Contains    eee                       

703. Create DPM explicit domain extension
    [Documentation]    Import new code list and Create DPM explicit domain extension.
    ...    Set Member XBRL code prefix value for code. Update all code extensions in code list with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    703
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia                              
    Create DPM extension        ${CREATE_DPM_EXPLICIT_DOMAIN_BTN}       False           ${DRAFT_STATUS}
    Wait Until Page Contains    dpmExplicitDomain                       

    Select breadcrump link 2
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_30    
    Click element with wait     ${MODIFY_CODE_BTN}                    
    Input Text with wait        ${DPM_EXPLICIT_DOMAIN_INPUT}    yyy    
    Click element with wait     ${SAVE_CODE_MOD_BTN}                   

    Wait Until Element Is Enabled       ${MODIFY_CODE_BTN}             
    Wait Until Page Contains            dpmExplicitDomain               
    Wait Until Page Contains            Member XBRL code prefix (en)   
    Wait Until Page Contains            yyy                             

    Return to Koodistot frontpage
    Import code list in Excel format

    ${excel_file_path}=    Create excel Modify DPM explicit domain extension    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist             ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia                           

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1    

    Wait Until Page Contains    dpmExplicitDomain               
    Wait Until Page Contains    Member XBRL code prefix (en)    
    Wait Until Page Contains    yyy                             

    Select breadcrump link 2
    Click element with wait     ${EXTENSIONS_TAB}       
    Click element with wait     ${EXPORT_DDL}           
    Click element with wait     ${EXPORT_TYPE_EXCEL}    
    Click element with wait     ${EXPORT_DDL}           
    Click element with wait     ${EXPORT_TYPE_CSV}      

704. Create DPM Dimension extension
    [Documentation]    Import new code list and create DPM Dimension extension.
    ...    set DPM Dimension values for code.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    704
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia
    Create DPM extension        ${CREATE_DPM_DIMENSION_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    dpmDimension

    Select breadcrump link 2
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1          
    Click element with wait     ${MODIFY_CODE_BTN}                                  
    Input Text with wait        ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    aaa     
    Click element with wait     ${SAVE_CODE_MOD_BTN}

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    

    Wait Until Page Contains    dpmDimension 
    Wait Until Page Contains    Domain reference (en) 
    Wait Until Page Contains    aaa

705. Import DPM Dimension extension
    [Documentation]    Import new code list with codes and DPM Dimension extension.
    ...    Check Domain reference values for codes.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    705
    
    ${excel_file_path}=    Create excel Code list codes DPM Dimension extension    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_1

    Wait Until Page Contains    dpmDimension
    Wait Until Page Contains    Domain reference (en)
    Wait Until Page Contains    yyy

    Select breadcrump link 2
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_30

    Wait Until Page Contains    dpmDimension
    Wait Until Page Contains    Domain reference (en)
    Wait Until Page Contains    yyy

706. Import all DPM extensions
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check extension values for codes.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    706
    
    ${excel_file_path}=    Create excel Code list codes DPM all    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_30
    Wait Until Page Contains    dpmDimension
    Wait Until Page Contains    Domain reference (en)
    Wait Until Page Contains    yyy
    Wait Until Page Contains    dpmTypedDomain
    Wait Until Page Contains    Data type (en)
    Wait Until Page Contains    Boolean
    Wait Until Page Contains    dpmMetric
    Wait Until Page Contains    Balance type (en)
    Wait Until Page Contains    Debit
    Wait Until Page Contains    Data type (en)
    Wait Until Page Contains    Isin
    Wait Until Page Contains    Domain reference (en)
    Wait Until Page Contains    ccc
    Wait Until Page Contains    Flow type (en)
    Wait Until Page Contains    Duration
    Wait Until Page Contains    Hierarchy reference (en)
    Wait Until Page Contains    eee    
    Wait Until Page Contains    dpmExplicitDomain
    Wait Until Page Contains    Member XBRL code prefix (en)
    Wait Until Page Contains    xxx 

    Select breadcrump link 2
    Click element with wait             ${EXTENSIONS_TAB}

    Wait Until Element Is Visible    //*[contains(text(), "dpmDimension")]
    Wait Until Element Is Visible    //*[contains(text(), "dpmExplicitDomain")]
    Wait Until Element Is Visible    //*[contains(text(), "dpmMetric")]
    Wait Until Element Is Visible    //*[contains(text(), "dpmTypedDomain")]

707. Import DPM extensions when members contain relations to other members
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check error message when code extension members contain relations to other members.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Admin
    Set default codelist variables    707
    
    Import code list in Excel format
    ${excel_file_path}=    Create excel DPM extensions relations to other members  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}
    Click element with wait             ${UPLOAD_FILE_BTN}                     
    Wait Until Page Contains            ${Error_relations_to_other_members}
    Cancel code list import
    [Teardown]      Test Case Teardown Generic Teardown

708. Create DPM Typed Domain extension with automatic member creation
    [Documentation]    Import new code list and create Typed Domain extension with automatic member creation.
    ...    Check and modify Typed Domain value for code.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    708

    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia

    Create DPM extension    ${CREATE_DPM_TYPED_DOMAIN_BTN}    True    ${DRAFT_STATUS}
    Wait Until Page Contains    dpmTypedDomain 

    Select breadcrump link 2
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_1

    Wait Until Page Contains    dpmTypedDomain  
    Wait Until Page Contains    Data type (en)   
    Wait Until Page Contains    -   

    Select breadcrump link 2
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_26

    Wait Until Page Contains    dpmTypedDomain  
    Wait Until Page Contains    Data type (en)
    Wait Until Page Contains    -

    Click element with wait     ${MODIFY_CODE_BTN}
    Input Text with wait        ${DPM_DATA_TYPE_INPUT}    Boolean
    Click element with wait     ${SAVE_CODE_MOD_BTN}

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}
    Wait Until Page Contains    Data type (en)
    Wait Until Page Contains    Boolean

709. Remove code with code extension member
    [Documentation]    Import new code list with codes and all DPM extensions. Check that removing code
    ...    with code extension member is successful.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    709
    
    ${excel_file_path}=    Create excel Code list codes DPM all
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia  
    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_29

    Wait Until Page Contains    dpmDimension    
    Wait Until Page Contains    Domain reference (en)    
    Wait Until Page Contains    yyy    
    Wait Until Page Contains    dpmTypedDomain    
    Wait Until Page Contains    Data type (en)    
    Wait Until Page Contains    Boolean    
    Wait Until Page Contains    dpmMetric    
    Wait Until Page Contains    Balance type (en)    
    Wait Until Page Contains    Debit    
    Wait Until Page Contains    Data type (en)    
    Wait Until Page Contains    Isin    
    Wait Until Page Contains    Domain reference (en)    
    Wait Until Page Contains    ccc    
    Wait Until Page Contains    Flow type (en)    
    Wait Until Page Contains    Duration    
    Wait Until Page Contains    Hierarchy reference (en)    
    Wait Until Page Contains    eee    
    Wait Until Page Contains    dpmExplicitDomain    
    Wait Until Page Contains    Member XBRL code prefix (en)    
    Wait Until Page Contains    xxx    

    Remove code    ${DEFAULT_CODELIST_CODE_ID}_29
    Wait Until Page Does Not Contain Element    //*[contains(text(), "${DEFAULT_CODELIST_CODE_ID}_29")]

    Select breadcrump link 2
    Click element with wait     ${EXTENSIONS_TAB}       

    Wait Until Element Is Visible    //*[contains(text(), "dpmDimension")]    
    Wait Until Element Is Visible    //*[contains(text(), "dpmExplicitDomain")]    
    Wait Until Element Is Visible    //*[contains(text(), "dpmMetric")]    
    Wait Until Element Is Visible    //*[contains(text(), "dpmTypedDomain")]    

710. Update DPM Metric members with and without sequence ID values
    [Documentation]    Import new code list with DPM Metric extension.
    ...    Check that correct error message is displayed when trying to import members without sequence IDs,
    ...    Check that updating DPM Metric values is successful with correct sequence ID values in Excel sheet. YTI-612.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    710
    
    ${excel_file_path}=    Create excel Code list with DPM Metric extension
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    

    Click element with wait     ${CODE_LIST_DDL}                    
    Click element with wait     ${UPDATE_CODE_LIST_FROM_FILE_BTN}   
    Click element with wait     ${FILE_FORMAT_BTN}                  
    Click element with wait     ${FILE_FORMAT_Excel}                

    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    
    ${excel_file_path}=    Create excel DPM Metric Credit no member id
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Choose File    ${FILE_UPLOAD_BTN}    ${excel_file_path}

    Click element with wait     ${UPLOAD_FILE_BTN}    

    Wait Until Page Contains    ${Error_duplicate_members_for_same_code}    
    Cancel code import

    ${excel_file_path}=    Create excel DPM Metric Credit
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_Excel}

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_2    
    Wait Until Page Contains    Balance type (en)    
    Wait Until Page Contains    Credit    

711. Import DPM extension with invalid PROPERTYTYPE
    [Documentation]    Import DPM extension with invalid PROPERTYTYPE and check error message. YTI-682.
    [Tags]    regression    test    700
    [Setup]    Test Case Setup Admin
    Set default codelist variables    711
    
    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list codes DPM all invalid propertytype
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    
    Choose File                         ${FILE_UPLOAD_BTN}          ${excel_file_path}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}             
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_invalid_propertytype}       
    Cancel code list import
    [Teardown]     Test Case Teardown Generic Teardown

712. Import all DPM extensions and remove extension values with update
    [Documentation]    Import all DPM extensions and remove extension values with Update code list function.
    ...    Check that extension values are removed from code information.
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    712
    
    ${excel_file_path}=    Create excel Code list codes DPM all
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api
    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_29   
    Wait Until Page Contains    dpmDimension    
    Wait Until Page Contains    Domain reference (en)    
    Wait Until Page Contains    yyy    
    Wait Until Page Contains    dpmTypedDomain    
    Wait Until Page Contains    Data type (en)    
    Wait Until Page Contains    Boolean    
    Wait Until Page Contains    dpmMetric    
    Wait Until Page Contains    Balance type (en)    
    Wait Until Page Contains    Debit    
    Wait Until Page Contains    Data type (en)    
    Wait Until Page Contains    Isin    
    Wait Until Page Contains    Domain reference (en)    
    Wait Until Page Contains    ccc    
    Wait Until Page Contains    Flow type (en)    
    Wait Until Page Contains    Duration    
    Wait Until Page Contains    Hierarchy reference (en)    
    Wait Until Page Contains    eee    
    Wait Until Page Contains    dpmExplicitDomain    
    Wait Until Page Contains    Member XBRL code prefix (en)    
    Wait Until Page Contains    xxx    

    Select breadcrump link 2
    ${excel_file_path}=    Create excel Code list codes DPM all no values
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_Excel}

    Click element that contains text        ${DEFAULT_CODELIST_CODE_ID}_30
    Wait Until Page Does Not Contain    eee    
    Wait Until Page Does Not Contain    yyy    
    Wait Until Page Does Not Contain    Boolean    
    Wait Until Page Does Not Contain    Debit    
    Wait Until Page Does Not Contain    Isin    
    Wait Until Page Does Not Contain    ccc    
    Wait Until Page Does Not Contain    Duration   
    Wait Until Page Does Not Contain    xxx    
    Wait Until Page Contains    Koodin arvo    
    Wait Until Page Contains    Koodin nimi    
    Wait Until Page Contains    dpmDimension    
    Wait Until Page Contains    Domain reference (en)  
    Wait Until Page Contains    dpmTypedDomain 
    Wait Until Page Contains    Data type (en)  
    Wait Until Page Contains    dpmMetric   
    Wait Until Page Contains    Balance type (en)    
    Wait Until Page Contains    Data type (en)  
    Wait Until Page Contains    Domain reference (en)    
    Wait Until Page Contains    Flow type (en)    
    Wait Until Page Contains    Hierarchy reference (en)    
    Wait Until Page Contains    dpmExplicitDomain    
    Wait Until Page Contains    Member XBRL code prefix (en)    

713. Create DPM Metric extension and create new code for code list
    [Documentation]    Create DPM Metric extension and create new code for code list.
    ...    Check that code creation is successful. YTI-1307
    [Tags]    koodistot    regression    700    test
    Set default codelist variables    713
    
    Set selenium speed              0.3
    Create code list                ${REGISTRY_1}    notCumulative    ${DEFAULT_CODELIST_SCHEME_ID}    ${ORGANIZATION_1}    ${DEFAULT_PREFLABEL_CODE}    Asuminen

    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    NewCode002    newCode002    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Create new code to code list    NewCode003    newCode003    ${DRAFT_STATUS}    ${EMPTY}


    Select breadcrump link 2
    Create DPM extension            ${CREATE_DPM_METRIC_BTN}    True    ${DRAFT_STATUS}
    Wait Until Page Contains        DPM Metric (en)  

    Select breadcrump link 2
    Create new code to code list    NewCode004    newCode004    ${DRAFT_STATUS}    ${EMPTY}

    Select breadcrump link 2
    Wait Until Page Contains        4 koodia   

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}
