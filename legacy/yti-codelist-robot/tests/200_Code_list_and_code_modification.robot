*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Teardown    Test Case Suite Teardown Generic Teardown
Suite Setup       Test Case Generic Suite setup
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Superuser

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown

*** Test Cases ***

200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression    test    200
    Set default codelist variables    200

    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}

    Modify code
    Input text with wait        ${CODE_NAME_INPUT}          Tämä on uusi nimi koodille
    Input text with wait        ${CODE_DESC_INPUT}          Tämä on uusi kuvaus koodille
    Input text with wait        ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi

    Save code modification
    Wait Until Page Contains    Tämä on uusi nimi koodille     
    Wait Until Page Contains    Tämä on uusi kuvaus koodille    
    Wait Until Page Contains    Tämä on uusi lyhyt nimi         

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

201. Add link to the DRAFT Code
    [Documentation]    Add link to the draft code, check link functionalty, check that it is not possible to add
    ...    same link url again and remove the link.
    [Tags]    regression    test    200
    Set default codelist variables    201

    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}

    Modify code

    Click element with wait         ${ADD_LINK_DDL}
    Click element with wait         ${LINK_BTN}
    Click element with wait         ${LINK_URL_INPUT}

    Input text with wait            ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/

    Click element with wait         ${ADD_BTN}

    Wait until page contains        Liittyvä linkki                     
    Wait until page contains        https://www.suomi.fi/etusivu/       


    Click element that contains text    https://www.suomi.fi/etusivu/
    Click element with wait             id=external_ref_url_link

    Switch window with wait     url=https://www.suomi.fi/etusivu/
    Switch window with wait     title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    Click element with wait             ${LINK_MODAL_OK_BTN}

    Save code modification
    Modify code
    Click element with wait             ${ADD_LINK_DDL}
    Click element with wait             ${LINK_BTN}
    Click element with wait             ${LINK_URL_INPUT}

    Input text with wait                ${LINK_URL_INPUT}   https://www.suomi.fi/etusivu/

    Wait until page contains            Linkki on jo käytössä tässä koodistossa.    

    Click element with wait             ${CANCEL_CREATION_BTN}
    Click element with wait             ${DELETE_LINK_ICON}
    Click element with wait             ${REMOVE_LINK_CONF_BTN}

    Wait Until Page Does Not Contain    https://www.suomi.fi/etusivu/    
    Save code modification
    Wait Until Page Does Not Contain    https://www.suomi.fi/etusivu/    

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression    test    200
    Set default codelist variables    202

    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}      

    Modify code
    Click element with wait     ${ADD_LINK_DDL}         
    Click element with wait     ${LICENSE_BTN}          
    Click element with wait     ${CCBY4.0}              
    Click element with wait     ${SELECT_LINK_BTN}      
    Wait Until Page Contains    Lisenssi    
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)               
    Save code modification

    Modify code
    Wait Until Page Contains    Lisenssi    
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)               
    Click element with wait     ${DELETE_LINK_ICON}         
    Click element with wait     ${REMOVE_LINK_CONF_BTN}     
    Wait Until Page Does Not Contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)       
    Save code modification

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression    test    200
    Set default codelist variables    203

    ${excel_file_path}=    Create excel Code list with languages    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains            30 koodia    
    Change Content Language             ${ALL_LANGUAGE_BTN}

    Click element that contains text  ${DEFAULT_CODELIST_CODE_ID}

    Modify code
    Click element with wait    ${ADD_LINK_DDL}
    Click element with wait    ${LINK_BTN}
    Click element with wait    ${LINK_NAME_INPUT_FI} 

    Input text with wait       ${LINK_NAME_INPUT_FI}    suomi.fi
    Click element with wait    ${LINK_NAME_INPUT_AB} 
    Input text with wait       ${LINK_NAME_INPUT_AB}    www.suomi.fi_ab
    Click element with wait    ${LINK_URL_INPUT} 
    Input text with wait       ${LINK_URL_INPUT}        https://www.suomi.fi/etusivu/
    Click element with wait    ${ADD_BTN}

    Wait Until Page Contains    Liittyvä linkki
    Save code modification
    Modify code
    Click element with wait    ${MODIFY_LINK_ICON} 
    Click element with wait    ${LINK_NAME_INPUT_FI}
    Input text with wait       ${LINK_NAME_INPUT_FI}    www.suomi.fi 
    Click element with wait    ${SAVE_LINK_MODIFY_BTN}

    Wait Until Page Contains    Liittyvä linkki  
    Wait Until Page Contains    www.suomi.fi
    Save code modification

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression    test    200
    Set default codelist variables    204
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}

    Click element with wait     ${MODIFY_CODE_BTN}                                                  
    Click element with wait     ${CODE_START_DATE_BTN}                                              
    Click element with wait     css=select.custom-select:nth-child(1)                               
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(1)         
    Click element with wait     css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)                 
    Click element with wait     ${CODE_END_DATE_BTN}                                                
    Click element with wait     css=select.custom-select:nth-child(1)                               
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(2)         
    Click element with wait     css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)                 

    Save code modification
    Wait Until Page Contains    02.01.2018 - 27.02.2018    

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression    test    200
    Set default codelist variables    205
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}                                           
    Click element with wait     ${MODIFY_CODE_BTN}                                              
    Click element with wait     ${CODE_LIST_START_DATE_BTN}                                     
    Click element with wait     css=select.custom-select:nth-child(1)                           
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(2)     
    Click element with wait     css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)             
    Click element with wait     ${CODE_LIST_END_DATE_BTN}                                       
    Click element with wait     css=select.custom-select:nth-child(1)                           
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(1)     
    Click element with wait     css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)             

    Save code list
    Wait until page contains    ${Error_end_date_before_start_date}     
    Click element with wait     id=close_error_modal_button             
    Click element with wait     ${CANCEL_CODE_MOD_BTN}                  

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list. YTI-445
    [Tags]    regression    test    200    status_change
    Set default codelist variables    206
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto2 with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Modify code list

    Click element with wait     ${CODE_LIST_STATUS_DDL}    
    Page Should Contain         Keskeneräinen
    Page Should Contain         Luonnos
    Page Should Contain         Korvattu

    Click Button                        Virheellinen
    Save code list
    Wait Until Element Is Enabled       ${MODIFY_CODE_LIST}     
    Wait Until Page Contains            Virheellinen            
    Click element with wait             ${FRONTPAGE_LINK}       
    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list. YTI-523, YTI-873.
    [Tags]    regression    test    200
    Set default codelist variables    207
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto2 with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Modify code list
    Input text with wait        ${CODE_LIST_NAME_INPUT}         Testinimi                   
    Input text with wait        ${CODE_LIST_DESC_INPUT}         Uusi kuvaus                 
    Input text with wait        ${CODE_LIST_DEF_INPUT}          Uusi määritelmä             
    Input text with wait        ${CODE_LIST_CHANGENOTE_INPUT}   Uusi muutostieto            
    Input text with wait        ${CODE_LIST_FEEDBACK_INPUT}     Ylläpitäjän yhteystiedot    

    Save code list
    Wait Until Page Contains    Testinimi                   
    Wait Until Page Contains    Uusi kuvaus                 
    Wait Until Page Contains    Uusi määritelmä             
    Wait Until Page Contains    Uusi muutostieto            
    Wait Until Page Contains    Oikeusturva                 
    Wait Until Page Contains    Yhteydenotto                
    Wait Until Page Contains    Ylläpitäjän yhteystiedot    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression    test    200
    Set default codelist variables    208
    
    ${excel_file_path}=    Create excel testiautomaatiokoodisto with code    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Modify code list

    Page should contain element         ${CLASSIFICATION_2}
    Click element with wait             ${ADD_CLASSIFICATION_BTN}                       
    Input text with wait                ${SEARCH_CLASSIFICATION_INPUT}    Asuminen      

    Click element that contains text    Asuminen

    Save code list
    Wait until page contains element    //*[contains(text(), "Asuminen")]    
    Wait until page contains element    //*[contains(text(), "Koulutus")]   

    Click element with wait             ${FRONTPAGE_LINK}         
    Click element with wait             ${STATUS_DROPDOWN_BTN}    
    Click element that contains text    ${ALL_STATUSES_FI}        
    Click element that contains text    Asuminen                  

    Wait until page contains element    //*[contains(text(), "${DEFAULT_PREFLABEL_SCHEME}")]    

    [Teardown]    Remove codelist teardown      ${DEFAULT_CODELIST_SCHEME_ID}

209. Add broader code for code when code is not found from the system
    [Documentation]    Add broader code for code when broader code is not found from the system. Check error message. YTI-499.
    [Tags]    koodistot    regression    test    200
    Set default codelist variables    209
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}  
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_2

    Click element with wait             ${MODIFY_CODE_BTN}
    Click element with wait             ${ADD_BROADER_CODE}

    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_1

    Open Koodistot
    Select superuser user
    Go To    ${REFERENCE_DATA_ENVIRONMENT_URL}/codescheme;registryCode=test;schemeCode=${DEFAULT_CODELIST_SCHEME_ID}

    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_1
    Click element with wait             ${CODE_DDL}
    Click element with wait             ${REMOVE_CODE_BTN}   
    Click element with wait             ${CONFIRMATION_YES_BTN}

    Sleep             2
    Switch Browser    1
    Click element with wait             ${SAVE_CODE_MOD_BTN}
    
    Wait until page contains    Koodia ei löydy.
    Click element with wait     ${CLOSE_ERROR_MESSAGE_BTN}

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

210. Update code list values vith different languages
    [Documentation]    Import code list and update code list and code values vith different languages. YTI-674
    [Tags]    regression    test    200
    Set default codelist variables    210
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist            ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains            30 koodia    

    Set Test Variable    ${DEFAULT_CODELIST_CODE_ID}       ${DEFAULT_CODELIST_CODE_ID}_language   
    Set Test Variable    ${DEFAULT_PREFLABEL_CODE}        ${DEFAULT_PREFLABEL_CODE}_language

    ${excel_file_path}=    Create excel Code list codes with languages  
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Update code list    ${excel_file_path}    ${DEFAULT_PREFLABEL_SCHEME}    ${FILE_FORMAT_Excel}

    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}                 
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}                              
    Wait Until Page Contains    Kuvaus_fi               
    Wait Until Page Contains    Määritelmä_fi           

    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_en          
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_en          
    Wait Until Page Contains    Kuvaus_en               
    Wait Until Page Contains    Määritelmä_en           

    Change Content Language    ${CONTENT_LANGUAGE_SW_UG}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_sw          
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_CODE}_sw          
    Wait Until Page Contains    Kuvaus_sw               
    Wait Until Page Contains    Määritelmä_sw           

    Select breadcrump link 2
    Wait Until Element Is Visible   ${CODE_LIST_DDL}        
    Click Code List Info Tab

    Change Content Language     ${CONTENT_LANGUAGE_SV}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_sv          
    Wait Until Page Contains    Kuvaus_sv               
    Wait Until Page Contains    Määritelmä_sv           
    Wait Until Page Contains    muutostieto_sv          
    Import codes in Excel format

    #${excel_file_path}=    Create excel Update codes with languages
    #...                    ${DEFAULT_CODELIST_SCHEME_ID}
    #...                    ${DEFAULT_CODELIST_CODE_ID}  
    #...                    ${DEFAULT_PREFLABEL_SCHEME}  
    #...                    ${DEFAULT_PREFLABEL_CODE}
    #Upload codes    ${excel_file_path}
    #Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}    

    #Change Content Language     ${CONTENT_LANGUAGE_AR_SO}
    #Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_ar      
    #Wait Until Page Contains    Kuvaus_ar           
    #Wait Until Page Contains    Määritelmä_ar       

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

211. Change code statuses with code list status change
    [Documentation]    Change code statuses with code list status change. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Set default codelist variables    211
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    
    Click Code List Info Tab

    Click element with wait     ${MODIFY_CODE_LIST}         
    Click element with wait     ${CODE_LIST_STATUS_DDL}     
    Click element with wait     ${VALID_STATUS}             

    Select Checkbox with wait    ${CHANGE_CODE_STATUSES_CHECKBOX}

    Click element with wait     ${SAVE_CODE_LIST_MOD_BTN}   
    Click element with wait     ${CONFIRMATION_YES_BTN}    

    Wait until page contains    Vaihda samalla koodien tilat?       
    Click element with wait     ${CONFIRMATION_YES_BTN}             

    Wait Until Page Contains    Koodien tilojen vaihtamisen tulos    
    Wait Until Page Contains    Tila vaihdettu 30 koodiin            

    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}            
    Wait Until Page Contains    Voimassa oleva
    Click element with wait     ${CODELIST_CODES_TAB}                

    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_1

    Wait Until Page Contains    Koodin arvo         
    Wait Until Page Contains    Koodin nimi         
    Wait Until Page Contains    Voimassa oleva      

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

212. Change code statuses with mass function
    [Documentation]    Change code statuses with mass function. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Set default codelist variables    212
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia

    Click element with wait     ${CODE_LIST_DDL}                
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}     
    Click element with wait     ${ORIGINAL_STATUS_DDL}          
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}        
    Click element with wait     ${TARGET_STATUS_DDL}            
    Click element with wait     ${VALID_STATUS_TARGET}          
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}  

    Click Yes Confirmation
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.      

    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}       

    Select Tab    ${CODELIST_CODES_TAB}
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_2

    Wait Until Page Contains    Koodin arvo         
    Wait Until Page Contains    Koodin nimi         
    Wait Until Page Contains    Voimassa oleva      

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

213. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    Set default codelist variables    213
    
    ${excel_file_path}=    Create excel Code list with 30 Codes valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    

    Click element with wait     ${CODE_LIST_DDL}                
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}     
    Click element with wait     ${ORIGINAL_STATUS_DDL}          
    Click element with wait     ${VALID_STATUS_ORIGINAL}        
    Click element with wait     ${TARGET_STATUS_DDL}            
    Click element with wait     ${DRAFT_STATUS_TARGET}          
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}  

    Wait Until Page Contains    Tila vaihdettu 30 koodiin.      
    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}      
    Click element with wait     ${CODELIST_CODES_TAB}           

    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}_1

    Wait Until Page Contains    Koodin arvo    
    Wait Until Page Contains    Koodin nimi    
    Wait Until Page Contains    Luonnos        

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

214. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    Set default codelist variables    214
    
    ${excel_file_path}=    Create excel Code list with 30 Codes valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}  
    Wait Until Page Contains    30 koodia    

    Click element with wait     ${CODE_LIST_DDL}                    
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}         
    Click element with wait     ${ORIGINAL_STATUS_DDL}              
    Click element with wait     ${VALID_STATUS_ORIGINAL}            
    Click element with wait     ${TARGET_STATUS_DDL}                
    Click element with wait     ${DRAFT_STATUS_TARGET}              
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}      

    Wait Until Page Contains    Tila vaihdettu 30 koodiin.          

    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}           
    Click element with wait     ${CODELIST_CODES_TAB}               
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}_1

    Wait Until Page Contains    Koodin arvo     
    Wait Until Page Contains    Koodin nimi     
    Wait Until Page Contains    Luonnos         

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

215. Change code statuses with mass function and with invalid original status
    [Documentation]    Change code statuses with mass function and with invalid original status. Check Error message. YTI-41.
    [Tags]    regression    test    200    status_change
    Set default codelist variables    215
    
    ${excel_file_path}=    Create excel Code list with 30 Codes valid
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    

    Click element with wait     ${CODE_LIST_DDL}                    
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}         
    Click element with wait     ${ORIGINAL_STATUS_DDL}              
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}            
    Click element with wait     ${TARGET_STATUS_DDL}                
    Click element with wait     ${INCOMPLETE_STATUS_TARGET}         
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}      

    Wait Until Page Contains    ${Error_no_code_status_changes}     

    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}           

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

216. Enforce status transition rules with code status change mass function
    [Documentation]    Enforce status transition rules with code status change mass function for superuser. YTI-41.
    [Tags]    regression    test    200    status_change
    Set default codelist variables    216
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist           ${DEFAULT_PREFLABEL_SCHEME} 
    Wait Until Page Contains           30 koodia    

    Click element with wait     ${CODE_LIST_DDL}
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN} 
    Click element with wait     ${ORIGINAL_STATUS_DDL}
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}
    Click element with wait     ${TARGET_STATUS_DDL}

    Wait Until Page Contains Element    ${INCOMPLETE_STATUS_TARGET}     
    Wait Until Page Contains Element    ${DRAFT_STATUS_TARGET}          
    Wait Until Page Contains Element    ${VALID_STATUS_TARGET}          
    Wait Until Page Contains Element    ${SUPERSEDED_STATUS_TARGET}     
    Wait Until Page Contains Element    ${RETIRED_STATUS_TARGET}        
    Wait Until Page Contains Element    ${INVALID_STATUS_TARGET}        

    Select Checkbox with wait    ${ENFORCE_STATUS_TRANSITION_CHECKBOX}

    Click element with wait     ${ORIGINAL_STATUS_DDL}   
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}  
    Click element with wait     ${TARGET_STATUS_DDL}
    Page Should Not Contain Element    ${DRAFT_STATUS_TARGET}
    Page Should Not Contain Element    ${SUPERSEDED_STATUS_TARGET}
    Page Should Not Contain Element    ${RETIRED_STATUS_TARGET}
    Page Should Not Contain Element    ${INVALID_STATUS_TARGET}
    Page Should Contain Element        ${INCOMPLETE_STATUS_TARGET}

    Click element with wait            ${VALID_STATUS_TARGET}     
    Click element with wait            ${SAVE_CODE_STATUS_CHANGE_BTN} 

    Click Yes Confirmation
    Wait Until Page Contains            Tila vaihdettu 30 koodiin. 
    Click element with wait             ${CLOSE_ALERT_MODAL_LINK}
    Click element with wait             ${CODELIST_CODES_TAB} 
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_2

    Wait Until Page Contains    Koodin arvo         
    Wait Until Page Contains    Koodin nimi        
    Wait Until Page Contains    Voimassa oleva      

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

217. Import code list and codes with upper case-lower case status values
    [Documentation]    Import code list and codes (Excel,CSV) with extra space and upper case/lower case letters in status values.
    ...    Check that import is successful.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Admin
    Set default codelist variables    217
    
    ${excel_file_path}=    Create excel Code list with 30 Codes    
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    30 koodia    

    Import codes in Excel format
    ${excel_file_path}=    Create excel Codes status with space
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes    ${excel_file_path}
    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_30

    Wait Until Page Contains    Koodin arvo    
    Wait Until Page Contains    Voimassa oleva    

    Select breadcrump link 2
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    
    Import codes in CSV format
    ${csv_file_path}=   Create code status with space csv
    ...                 test
    ...                 ${DEFAULT_CODELIST_SCHEME_ID}
    ...                 ${DEFAULT_PREFLABEL_CODE}
    Upload codes        ${csv_file_path}

    Click element that contains text    ${DEFAULT_CODELIST_CODE_ID}_1
    Wait Until Page Contains            Koodin arvo         
    Wait Until Page Contains            Voimassa oleva      

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

218. Import links to codes with Import codes function
    [Documentation]    Import links to codes with Import codes function (Excel,CSV).
    ...    Check that links are working when extra space is defined in HREF columns in code Excel.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Admin
    Set default codelist variables    218
    
    ${excel_file_path}=    Create excel Code list with 30 codes and instructions link
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}  
    Wait Until Page Contains    30 koodia    
    Import codes in Excel format

    ${excel_file_path}=    Create excel Code links with space
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Upload codes           ${excel_file_path}
    
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}_1

    Wait Until Page Contains    Käyttöohje                          
    Wait Until Page Contains    https://www.suomi.fi/viestit        
    Wait Until Page Contains    Liittyvä linkki                     
    Wait Until Page Contains    https://www.suomi.fi/etusivu/       
    Wait Until Page Contains    https://yle.fi/                     
    Wait Until Page Contains    Lisenssi                            
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    

    Select breadcrump link 2
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    
    Import codes in CSV format

    ${csv_file_path}=   Create Code links with space csv
    ...                 test
    ...                 ${DEFAULT_CODELIST_SCHEME_ID}
    ...                 ${DEFAULT_PREFLABEL_CODE}
    Upload codes       ${csv_file_path}
    
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}_1
    Page Should Not Contain    Käyttöohje
    Page Should Not Contain    Liittyvä linkki
    Page Should Not Contain    Lisenssi

    Select breadcrump link 2
    Click element that contains text    ${DEFAULT_PREFLABEL_CODE}_1    
    Wait Until Page Contains    Käyttöohje                      
    Wait Until Page Contains    https://www.suomi.fi/viestit    
    Wait Until Page Contains    Liittyvä linkki                 
    Wait Until Page Contains    https://www.suomi.fi/etusivu/   
    Wait Until Page Contains    https://yle.fi/                 
    Wait Until Page Contains    Lisenssi                        
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

219. Create new code list and codes with different languages
    [Documentation]    Create new code list and codes with different languages
    [Tags]    regression    test    200
    Set default codelist variables    219
    
    Create Code List With All Languages    ${REGISTRY_1}    
    ...                                    notCumulative    
    ...                                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                                    ${ORGANIZATION_1}
    ...                                    ${DEFAULT_PREFLABEL_SCHEME}_fi
    ...                                    ${DEFAULT_PREFLABEL_SCHEME}_en
    ...                                    ${DEFAULT_PREFLABEL_SCHEME}_sv
    ...                                    Asuminen

    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_fi    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_en    
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_sv    
    
    Create New Code With All Languages         NewCode001
    ...                                        newCode001_fi
    ...                                        newCode001_en
    ...                                        newCode001_sv
    ...                                        ${DRAFT_STATUS}
    ...                                        ${EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001_fi      
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_fi                 
    Wait Until Page Contains    Koodin arvo                     
    Wait Until Page Contains    NewCode001                      
    Wait Until Page Contains    Koodin nimi                     
    Wait Until Page Contains    newCode001_en                   
    Wait Until Page Contains    newCode001_fi                   
    Wait Until Page Contains    newCode001_sv                   

    Select breadcrump link 2
    Remove code    NewCode001 - newCode001_fi
    Click Code List Info Tab
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_fi    

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

220. Remove language that is in use in the code list
    [Documentation]    Import code list, codes and extension with different languages.
    ...    Try to remove languages that are in use in the code list and check error message. YTI-1048.
    [Tags]    regression    test    200
    Set default codelist variables    220
    
    ${excel_file_path}=    Create excel Code list codes extensions and members with languages
    ...                    ${DEFAULT_CODELIST_SCHEME_ID}
    ...                    ${DEFAULT_CODELIST_CODE_ID}  
    ...                    ${DEFAULT_PREFLABEL_SCHEME}  
    ...                    ${DEFAULT_PREFLABEL_CODE}
    Create codelist from Excel ${excel_file_path} to test with api

    Search and open codelist    ${DEFAULT_PREFLABEL_SCHEME}
    Wait Until Page Contains    25 koodia    

    Click Code List Info Tab
    Change Content Language     ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_en   
    Wait Until Page Contains    ${DEFAULT_PREFLABEL_SCHEME}_fi  
    Modify code list

    Click element with wait             ${REMOVE_AB_LANGUAGE}    
    Click element with wait             ${REMOVE_EN_LANGUAGE}    
    Click element with wait             ${REMOVE_FI_LANGUAGE}    
    Click element with wait             ${REMOVE_TT_LANGUAGE}    

    Save code list
    Wait Until Page Contains    ${Error_remove_languages}    
    Click Confirmation

    [Teardown]    Remove codelist teardown    ${DEFAULT_CODELIST_SCHEME_ID}

*** Keywords ***
Choose testiautomaatiokoodisto and edit
    Click element with wait             ${STATUS_DROPDOWN_BTN}
    Click element that contains text    ${STATUS_DRAFT_FI}
    Click element that contains text    ${DEFAULT_PREFLABEL_SCHEME}
    Click element that contains text    TIEDOT  
    Click element that contains text    Muokkaa  

Save code list
    Click element with wait             ${SAVE_CODE_LIST_MOD_BTN}       
    Wait Until Page Contains Element    ${MODIFY_CODE_LIST}             timeout=90
