*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Open terminology page and log in
    [Tags]  Terminology  
    ...     T1  
    Open terminology search page
    Login with Admin
    
T1C2. Create new terminology and select it
    [Tags]  Terminology 
    ...     T1  
    Create terminology ${DEFAULT TERMINOLOGY NAME} with api

    Open terminology search page
    Find and select terminology                         ${DEFAULT TERMINOLOGY NAME}

    [Teardown]  Teardown test Case delete terminology   ${DEFAULT TERMINOLOGY NAME}