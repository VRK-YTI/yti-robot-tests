*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***

T3C1. Verify create terminology button is not shown when not logged in or user without access
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Verify create terminology button is not shown
    Login with no group
    Verify create terminology button is not shown

T3C2. Open create terminology dialog and cancel
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Open create terminology dialog
    Cancel creating terminology dialog
    
    Verify dialog is not open

T3C3. Create valid terminology from dialog
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}

    Verify dialog is not open
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C4. Verify create missing all values in create dialog
    [Tags]  Terminology  
    ...     T3
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
    Verify alert Sisällöntuottajaa ei ole määritelty
    Verify alert Tietoaluetta ei ole määritelty

T3C5. Verify create missing title value in create dialog
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${NONE}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}

    Verify alert Sanaston nimi puuttuu kieleltä

T3C6. Verify create invalid email
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${NONE}
    ...  domain=${NONE}
    ...  prefix=${NONE}
    ...  email=asdf

    Verify alert Yhteydenotto-osoite ei ole oikeassa muodossa

T3C7. Create terminology with same name
    [Tags]  Terminology  
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}
    Verify dialog is not open

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}
    Verify dialog is not open
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C8. Verify empty own prefix
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${EMPTY}
    ...  email=${NONE}

    Verify alert Tunnusta ei ole määritelty
    
T3C9. Verify duplicate prefix
    [Tags]  Terminology  
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY NAME.lower()}
    ...  email=${NONE}
    Verify dialog is not open

    Reload page

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}_2
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY NAME.lower()}
    ...  email=${NONE}
    Verify alert Tunnus ei oikeassa muodossa tai se on jo käytössä
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
    
T3C10. Verify prefix is not valid
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${DEFAULT TERMINOLOGY NAME}
    ...  email=${NONE}

    Verify alert Tunnus ei oikeassa muodossa tai se on jo käytössä

T3C11. Create other vocabulary
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${NONE}
    ...  another vocabulary=${True}

    Verify dialog is not open
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    #Verify terminology is not vocabulary Terminologinen sanasto
    
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C12. Verify prefix max size
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin
    
    set test variable  ${long prefix}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long prefix}=  Catenate  ${long prefix}a
    END
    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${EMPTY}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${long prefix}
    ...  email=${ADMIN_EDUUNI_EMAIL}

    #Verify dialog is not open
    #[Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C13. Verify terminology name max 
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin
    
    set test variable  ${long title}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long title}=  Catenate  ${long title}a
    END
    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${long title}
    ...  description=${EMPTY}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${ADMIN_EDUUNI_EMAIL}

    Verify dialog is not open
    [Teardown]  Teardown test Case delete terminology ${long title}


T3C14. Verify terminology description max 
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin
    
    set test variable  ${long description}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long description}=  Catenate  ${long description}a
    END
    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${long description}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${ADMIN_EDUUNI_EMAIL}

    Verify dialog is not open
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T3C15. Verify create valid email
    [Tags]  Terminology  
    ...     T3
    Open terminology search page
    Login with Admin

    Create terminology from dialog  
    ...  language=suomi FI
    ...  title=${DEFAULT TERMINOLOGY NAME}
    ...  description=${NONE}
    ...  organization=${DEFAULT ORGANIZATION}
    ...  domain=${DEFAULT DOMAIN}
    ...  prefix=${NONE}
    ...  email=${ADMIN_EDUUNI_EMAIL}

    Verify dialog is not open
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
    