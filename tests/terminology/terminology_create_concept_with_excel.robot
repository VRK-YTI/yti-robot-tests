*** Settings ***
Force Tags           T11  TERMINOLOGY
Resource             ../../tests/setup_and_teardowns.robot

Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T11C1. Verify creat concept with excel button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain bring concepts button

    Login with no group
    Verify page does not contain bring concepts button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings
    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Open bring concept dialog
    Cancel bring concept dialog

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T11C2. Create valid concepts with excel file
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
    ${excel file 1}=    Create valid status concept excel
    ${excel file 2}=    Create valid status concept excel with 100 concepts

    Open terminology search page
    
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Open bring concept dialog
    Upload concept file                 ${excel file 1}
    Click element with wait             ${bring concepts file upload button}
    Click element with wait             ${bring concepts file close after upload button}  timeout=120
    
    Select concept ${DEFAULT CONCEPT NAME} 

    Verify term page contains all information
    ...  name=${DEFAULT CONCEPT NAME}
    
    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open bring concept dialog
    Upload concept file                 ${excel file 2}
    Click element with wait             ${bring concepts file upload button}
    Click element with wait             ${bring concepts file close after upload button}  timeout=120

    Wait until page contains element    //span[text()="Käsitteitä 101 kpl seuraavilla rajauksilla"]
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T11C3. Verify invalid excel files
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
    ${excel file 1}=    Create missing language concept excel
    ${excel file 2}=    Create missing status concept excel
    ${excel file 3}=    Create missing preflable_fi concept excel

    Open terminology search page
    
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Verify error on upload concepts  
    ...    Sanastossa ei ole annettua kieltä
    ...    ${excel file 1}

    Verify error on upload concepts  
    ...    Tila kenttä puuttuu
    ...    ${excel file 2}

    Verify error on upload concepts  
    ...    prefLabel pitää määrittää vähintään yhdellä kielellä
    ...    ${excel file 3}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

*** Keywords ***
Verify error on upload concepts    
    [Arguments]
    ...  ${error}
    ...  ${file}
    Open bring concept dialog
    Upload concept file                 ${file}
    Click element with wait             ${bring concepts file upload button}
    Wait until page contains element    //div[text()="${error}"]
    Click element with wait             ${bring concepts file close after upload button}

Upload concept file
    [Arguments]
    ...  ${file}
    Wait Until Page Contains Element        ${bring concepts file upload button}
    Choose File    //input[@type="file"]    ${file}