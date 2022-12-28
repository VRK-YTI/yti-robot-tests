*** Settings ***
Documentation     Test Suite for Koodistot basic functionality
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${navigation_menu_link}    Käyttäjätiedot
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly. YTI-460
    [Tags]    regression    test    100
    Set default codelist variables    100

    Click element with wait     id=information_link    

    Wait Until Page Contains    Tietoa Koodistoista    
    Wait Until Page Contains    Koodistot-työkalu on tarkoitettu    
    Wait Until Page Contains    Koodistot-työkalulla voi    
    Wait Until Page Contains    Hyödyt käyttäjille    
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi    
    Wait Until Page Contains    Katso myös    
    Wait Until Page Contains    Ota yhteyttä    

101. Open EUPL-1.2 licence page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-457, YTI-877.
    [Tags]    regression    test    100    koodistot
    Set default codelist variables    101

    Click element with wait     ${EUPL_LICENCE_PAGE}    

    Switch window with wait     url=https://commission.europa.eu/content/european-union-public-licence_en

    Wait Until Page Contains    European Union Public Licence    
    Wait Until Page Contains    What is the EUPL?    

    Switch window with wait        title=${ENVIRONMENT_IDENTIFIER} - Koodistot

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly. YTI-459
    [Tags]    regression    test    100
    Set default codelist variables    102

    Click element with wait     id=description_of_file_link    
    Switch window with wait     url=https://wiki.dvv.fi/display/YTIJD/Tietosuojaseloste

103. Search for VALID code list
    [Documentation]    Search for VALID code list with frontpage search function.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    103

    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto2 with code
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Return to Koodistot frontpage

    Input text with wait        id=search_box_input     ${DEFAULT_PREFLABEL_SCHEME}          
    Click element with wait     //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]         

    Wait Until Page Contains            ${DEFAULT_PREFLABEL_SCHEME}                          
    Wait Until Page Contains Element    id=content_language_dropdown_button     
    Wait Until Page Contains Element    id=exportDropdown                       
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}")]      

    Click element with wait     //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}")]
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}                   
    Wait Until Page Contains    Koodisto                    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}   
    Wait Until Page Contains    Koodin arvo                   
    Wait Until Page Contains    Koodin nimi                    
    Wait Until Page Contains    Tila                        
    Wait Until Page Contains    Voimassa oleva              
    Wait Until Page Contains    Viimeisin muokkaus          
    Wait Until Page Contains    Voimassa oleva              

    [Teardown]    Remove codelist teardown     ${DEFAULT_CODELIST_SCHEME_ID}

104. Search for code list with codeValue
    [Documentation]    Search for code list with codeValue with frontpage search function. YTI-651
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    104

    Import code list in Excel format
    ${excel_file_path}=    Create excel Testikoodisto T200
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist                     ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME} 

    Return to Koodistot frontpage
    Wait Until Page Contains Element    ${STATUS_DROPDOWN_BTN}                      

    Click element with wait             ${STATUS_DROPDOWN_BTN}
    Click element with wait             //*[contains(text(), "${ALL_STATUSES_FI}")]

    Input text with wait                ${SEARCH_BOX_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}       
    Click element with wait             //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")] 

    Wait Until Page Contains Element    id=content_language_dropdown_button         
    Wait Until Page Contains Element    id=exportDropdown                           
    Wait Until Page Contains            ${DEFAULT_PREFLABEL_SCHEME}                               

    Click element with wait      //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains    Tunnus              
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                 
    Wait Until Page Contains    Rekisteri           
    Wait Until Page Contains    Testirekisteri      
    Wait Until Page Contains    Tietoalue           
    Wait Until Page Contains    Eläkkeet            

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

105. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    test    100
    Set default codelist variables    105

    Change UI Language          ${LANGUAGE_EN}

    Wait Until Page Contains    ${CODE_LIST_KUNNAT_EN}    
    Wait Until Page Contains    Add code list               
    Wait Until Page Contains    All registries              
    Wait Until Page Contains    All organizations           
    Wait Until Page Contains    Classification              

106. Export Excel and CSV for Kunnat 2018 Code list
    [Tags]    regression    test    100
    Set default codelist variables    106

    Click element with wait             //*[contains(text(), "${CODE_LIST_KUNNAT}")]
    Wait Until Page Contains Element    id=exportDropdown    

    Click element with wait     id=exportDropdown
    Click element with wait     ${EXPORT_TYPE_EXCEL}

    Click element with wait     id=exportDropdown    
    Click element with wait     ${EXPORT_TYPE_CSV}   

107. Export Excel and CSV for Palveluluokitus Code list
    [Tags]    regression    test    100
    Set default codelist variables    107

    Click element with wait     //*[contains(text(), "Palveluluokitus")]    

    Click element with wait     id=exportDropdown       
    Click element with wait     ${EXPORT_TYPE_EXCEL}    

    Click element with wait     id=exportDropdown       
    Click element with wait     ${EXPORT_TYPE_CSV}      

109. Check ChangeNote information from code list
    [Documentation]    Check ChangeNote information from Code list. YTI-489
    [Tags]    regression    test    100
    Set default codelist variables    109

    Input text with wait            id=search_box_input  Ammattiluokitus 2010  
    Click element with wait         //*[contains(text(), "Ammattiluokitus 2010")]     
    Wait Until Page Contains        Ammattiluokitus 2010                         

    Click element with wait         //*[contains(text(), "TIEDOT")]
    Wait Until Page Contains        Muutostieto

110. Search for code list and extend search to codes
    [Documentation]    Search for code list with frontpage search function and extend search to codes.
    ...    Check that the correct code list which contains the searched code is listed as a result.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    110


    Import code list in Excel format
    ${excel_file_path}=    Create excel testiautomaatiokoodisto1 with codes
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Return to Koodistot frontpage
    Click element with wait     ${SEARCH_CODE_CHECKBOX}    
    Input text with wait        ${SEARCH_BOX_INPUT}     ${DEFAULT_PREFLABEL_SCHEME}   
    Click element with wait     //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]     
    Click element with wait     //*[contains(text(), "${DEFAULT_PREFLABEL_CODE}")]     
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}                              
    Wait Until Page Contains    Koodisto                                    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                 
    Wait Until Page Contains    Koodin arvo                                 
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}                                   
    Wait Until Page Contains    Koodin nimi                              
    Wait Until Page Contains    Tila                                        
    Wait Until Page Contains    Luonnos                                     
    Wait Until Page Contains    Viimeisin muokkaus                          

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

111. Filter Codes by codeValue and prefLabel
    [Documentation]    Import codelist and filter Codes by codeValue and prefLabel
    [Tags]    regression    test    100    search
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    111

    Import code list in Excel format
    ${excel_file_path}=    Create excel Code filter
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Return to Koodistot frontpage

    Input text with wait     ${SEARCH_BOX_INPUT}    ${DEFAULT_PREFLABEL_SCHEME}   
    Click element with wait  //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]  

    Input text with wait                ${SEARCH_CODE_BOX_INPUT}    ${DEFAULT_CODELIST_CODE_ID}_2                 
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_CODELIST_CODE_ID}_2")]
    Wait Until Page Contains Element    ${SEARCH_CODE_BOX_INPUT}

    Input text with wait        ${SEARCH_CODE_BOX_INPUT}    ${DEFAULT_CODELIST_CODE_ID}_6 
    Click element with wait     //*[contains(text(), "${DEFAULT_CODELIST_CODE_ID}_6")]
    Wait Until Page Contains    Koodisto                  
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_6      
    Wait Until Page Contains    Koodin arvo          
    Wait Until Page Contains    ${DEFAULT_CODELIST_CODE_ID}_6                       
    Wait Until Page Contains    Koodin nimi           

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

112. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    112

    Select navigation menu link     Käyttäjätiedot
    Wait Until Page Contains        Käyttäjätiedot              
    Wait Until Page Contains        Nimi                        
    Wait Until Page Contains        Sähköposti                  
    Wait Until Page Contains        Organisaatiot ja roolit     

    Select navigation menu link         Rekisterit
    Wait Until Page Contains            Rekisterit              
    Wait Until Page Contains Element    ${REGISTRY_DDL}         
    Select navigation menu link         yhteentoimiva.suomi.fi

    Switch window with wait             title=Yhteentoimivuusalusta | Suomidigi
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    Select navigation menu link     Suomi.fi-sanastot
    Switch window with wait         url=${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait Until Page Contains        Sanastot                
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link     Suomi.fi-tietomallit

    Switch window with wait         url=${DATA_VOCABULARIES_ENVIRONMENT_URL}
    Wait Until Page Contains        Tietomallit         
    Wait Until Page Contains        Etusivu             
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Select navigation menu link     Suomi.fi-kommentit

    Switch window with wait         url=${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains        Kommentit           
    Wait Until Page Contains        Etusivu             
    Close Window

    Switch window with wait         title=${ENVIRONMENT_IDENTIFIER} - Koodistot

113. Change content language for code list
    [Documentation]    Change content language for code list and check
    ...    that language change applies to code level as well. YTI-1053
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    113

    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list testi dcat    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    
    Change Content Language     ${CONTENT_LANGUAGE_EN}

    Click element with wait     //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    
    Wait Until Page Contains    Koodisto                                    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                 
    Wait Until Page Contains    Koodin arvo                                 
    Wait Until Page Contains    AGRI                                        
    Wait Until Page Contains    Koodin nimi                                 
    Wait Until Page Contains    Agriculture, fisheries, forestry and food   
    Wait Until Page Contains    Voimassa oleva                              
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    
    Wait Until Page Contains    URI                                         
    Wait Until Page Contains    Viimeisin muokkaus                          

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus                                      
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}               
    Wait Until Page Contains    Koodiston nimi                              
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                 
    Wait Until Page Contains    Rekisteri                                   
    Wait Until Page Contains    Test registry                               

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

114. Check user interface language and content language in page reload
    [Documentation]    Check that user interface language and content language settings are correct after page reload. YTI-1222.
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Set default codelist variables    114

    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list testi dcat    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    

    Change UI Language    ${LANGUAGE_EN}
    Wait Until Page Contains            ${DEFAULT_PREFLABEL_SCHEME}                                    
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]                                  
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]                         
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]                          
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    
    Wait Until Page Contains            AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       

    Reload Page
    Wait Until Page Contains            ${DEFAULT_PREFLABEL_SCHEME}                                     
    Wait Until Page Contains Element    //*[contains(text(), "CODES")]                                  
    Wait Until Page Contains Element    //*[contains(text(), "INFORMATION")]                           
    Wait Until Page Contains Element    //*[contains(text(), "Test registry")]                          
    Wait Until Page Contains Element    //*[contains(text(), "General information and administrative services")]    
    Wait Until Page Contains            AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       

    Change UI Language    ${LANGUAGE_FI}
    Wait Until Page Contains            ${DEFAULT_PREFLABEL_SCHEME}                                              
    Wait Until Page Contains Element    //*[contains(text(), "KOODIT")]                         
    Wait Until Page Contains Element    //*[contains(text(), "TIEDOT")]                         
    Wait Until Page Contains Element    //*[contains(text(), "Testirekisteri")]                 
    Wait Until Page Contains Element    //*[contains(text(), "Yleiset tieto- ja hallintopalvelut")]    
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet       

    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Click element with wait     //*[contains(text(), "AGRI - Agriculture, fisheries, forestry and food")]    
    Wait Until Page Contains    Koodisto                                        
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                     
    Wait Until Page Contains    Koodin arvo                                     
    Wait Until Page Contains    AGRI                                            
    Wait Until Page Contains    Koodin nimi                                     
    Wait Until Page Contains    Agriculture, fisheries, forestry and food       
    Wait Until Page Contains    Voimassa oleva                                  
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.    
    Wait Until Page Contains    URI                                             
    Wait Until Page Contains    Viimeisin muokkaus                              

    Reload Page
    Wait Until Page Contains    Koodisto                                        
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                     
    Wait Until Page Contains    Koodin arvo                                     
    Wait Until Page Contains    AGRI                                            
    Wait Until Page Contains    Koodin nimi                                     
    Wait Until Page Contains    Agriculture, fisheries, forestry and food       
    Wait Until Page Contains    Voimassa oleva                                  
    Wait Until Page Contains    This concept identifies datasets covering such domains as agriculture, fisheries, forestry or food.
    Wait Until Page Contains    URI                                             
    Wait Until Page Contains    Viimeisin muokkaus                              

    Select breadcrump link 2
    Click Code List Info Tab
    Wait Until Page Contains    Tunnus                              
    Wait Until Page Contains    ${DEFAULT_CODELIST_SCHEME_ID}       
    Wait Until Page Contains    Koodiston nimi                      
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}         
    Wait Until Page Contains    Rekisteri                           
    Wait Until Page Contains    Test registry                       
    Wait Until Page Contains    Tietoalue                           
    Wait Until Page Contains    Yleiset tieto- ja hallintopalvelut  

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

115. Check the visibility of the INCOMPLETE status code list
    [Documentation]    Check that code list with INCOMPLETE status is visible
    ...    in frontpage search for certain users only. YTI-903.
    [Tags]    regression    test    100
    Set default codelist variables    115

    Import code list in Excel format
    ${excel_file_path}=    Create excel Code list with 30 codes incomplete    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}

    Return to Koodistot frontpage
    Input text with wait                id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}        
    Wait Until Page Contains            1 hakutulos                                     
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]        

    Close all browsers
    Open Koodistot
    Select superuser user
    Input text with wait                id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}        
    Wait Until Page Contains            1 hakutulos                                     
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]        

    Close all browsers
    Open Koodistot
    Select codelist user
    Input text with wait                    id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains                1 hakutulos                                 
    Wait Until Page Contains Element        //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    Close all browsers
    Open Koodistot
    Select Datamodel user
    Input text with wait                id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains            1 hakutulos                                 
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    Close all browsers
    Open Koodistot
    Select no group user
    Input text with wait        id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}            
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.                

    Close all browsers
    Open Koodistot
    Select member user
    Input text with wait                id=search_box_input      ${DEFAULT_PREFLABEL_SCHEME}    
    Wait Until Page Contains            1 hakutulos                                 
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    Close all browsers
    Open Koodistot
    Select terminology user
    Input text with wait                id=search_box_input     ${DEFAULT_PREFLABEL_SCHEME}     
    Wait Until Page Contains            1 hakutulos                                 
    Wait Until Page Contains Element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

116. Check URI links
    [Documentation]    Check that URI links are working correctly in DEV, TEST and PROD environments
    [Tags]    regression    koodistot    test    100
    Set default codelist variables    116

    Go To    http://uri.suomi.fi/codelist/eu/dcat
    Wait Until Page Contains    DCAT-AP-luokitus                                             

    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    

    Go To    http://uri.suomi.fi/codelist/eu/dcat?env=awsdev
    Wait Until Page Contains    DCAT-AP-luokitus                                             
    
    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI?env=awsdev
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    

    Go To    http://uri.suomi.fi/codelist/eu/dcat?env=awstest
    Wait Until Page Contains    DCAT-AP-luokitus                                             

    Go To    http://uri.suomi.fi/codelist/eu/dcat/code/AGRI?env=awstest
    Wait Until Page Contains    AGRI - Maatalous, kalastus, metsätalous ja elintarvikkeet    

117. Create codelist from Excel and delete it
    [Tags]    regression    koodistot    test    100
    Set default codelist variables    117

    ${excel_file_path}=    Default koodisto excel with schemes and codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codelist in Excel format     ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}
    Remove list of codes                ${DEFAULT_PREFLABEL_SCHEME}
    [Teardown]  run keyword if test failed   Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}