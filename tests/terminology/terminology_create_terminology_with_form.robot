*** Settings ***
Force Tags           Terminology  T3
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T3C1. Verify create terminology button permissions
    Open terminology search page
    Verify create terminology button is not shown
    
    Login with no group
    Verify create terminology button is not shown

T3C2. Verify create terminology error messages
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=${NONE}
    ...  title=${NONE}
    ...  description=${NONE}
    ...  organization=${NONE}
    ...  domain=${NONE}
    ...  prefix=${NONE}
    ...  email=${NONE}

    Verify alert Sanaston kieliä ei ole määritelty
    Verify alert Sisällöntuottajia ei ole määritelty
    Verify alert Tietoaluetta ei ole määritelty

    Cancel creating terminology dialog
    Verify dialog is not open

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${NONE}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}

    Verify alert Sanaston nimi puuttuu kieleltä

    Cancel creating terminology dialog
    Verify dialog is not open

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${EMPTY}
    ...  email=${NONE}

    Verify alert Tunnusta ei ole määritelty
    
    Cancel creating terminology dialog
    Verify dialog is not open

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY PREFIX}
    ...  email=${NONE}
    Verify dialog is not open

    Open terminology search page

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${DEFAULT TERMINOLOGY NAME}_2
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY PREFIX}
    ...  email=${NONE}
    Verify alert Tunnus ei oikeassa muodossa tai se on jo käytössä

    Cancel creating terminology dialog
    Verify dialog is not open
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C3. Create valid terminology from dialog
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}
    Verify dialog is not open
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C4. Create other vocabulary with email and custom prefix
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=${Concept language finnish}
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY PREFIX}
    ...  email=${ADMIN_EDUUNI_EMAIL}
    ...  another vocabulary=${True}

    Verify dialog is not open
    Verify terminology is not vocabulary Terminologinen sanasto
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}