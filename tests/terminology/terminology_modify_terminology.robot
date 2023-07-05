*** Settings ***
Force Tags           T7  TERMINOLOGY
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T7C1. Verify modify terminology button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify modify terminology button is not shown

    Login with No group
    Verify modify terminology button is not shown
    
    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings
    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Open modify terminology dialog
    Cancel modify terminology

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T7C2. Modify terminology
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open modify terminology dialog
    Input finish name ${DEFAULT TERMINOLOGY NAME}_1 on modify terminology
    Input finish definition definition on modify terminology

    Select status Luonnos on modify terminology

    Input contact ${ADMIN_EDUUNI_EMAIL} on modify terminology
    Sleep 5
    Save terminolgy modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T7C3. Verify modify terminology errors
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open modify terminology dialog

    Click element with wait  //span[text()="suomi FI"]
    Save terminolgy modify  
    ...  False
    Verify modify terminology error message ${Terminology modify languages are not set error}

    Select language suomi FI on modify terminology
    Save terminolgy modify  
    ...  False
    Verify modify terminology error message ${Terminology modify name missing from finish error}
    Input finish name ${DEFAULT TERMINOLOGY NAME} on modify terminology

    Select language englanti EN on modify terminology
    Select language ruotsi SV on modify terminology
    Save terminolgy modify  
    ...  False
    Verify modify terminology error message ${Terminology modify name missing from english error}
    Verify modify terminology error message ${Terminology modify name missing from swedish error}

    Input finish name ${DEFAULT TERMINOLOGY NAME} on modify terminology
    Input english name ${DEFAULT TERMINOLOGY NAME} on modify terminology
    Input swedish name ${DEFAULT TERMINOLOGY NAME} on modify terminology

    Remove selected status on modify terminology
    On modify terminology select organization Automaatiotestaus
    Select domain Asuminen on modify terminology
    Select prefix manual on modify terminology

    Save terminolgy modify  
    ...  False
    Verify modify terminology error message ${Terminology modify status missing error}
    Verify modify terminology error message ${Terminology modify contributors missing error}
    Verify modify terminology error message ${Terminology modify domain missing error}
    Verify modify terminology error message ${Terminology modify prefix missing error}

    Select status Voimassa oleva on modify terminology
    On modify terminology select organization Automaatiotestaus
    Select domain Asuminen on modify terminology
    Input prefix ${DEFAULT TERMINOLOGY PREFIX} on modify terminology
    
    Save terminolgy modify

    Verify displayed finish name is ${DEFAULT TERMINOLOGY NAME}
    Verify displayed english name is ${DEFAULT TERMINOLOGY NAME}
    Verify displayed swedish name is ${DEFAULT TERMINOLOGY NAME}
    Verify displayed status is Voimassa oleva
    Verify displayed domains are Asuminen
    Verify displayed organizations are Automaatiotestaus
    Verify displayed languages are suomi FI, ruotsi SV, englanti EN
    Verify displayed type is Terminologinen sanasto
    Verify displayed url contains ${DEFAULT TERMINOLOGY PREFIX}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

