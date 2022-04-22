*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Open terminology page and log in
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page

    Login with Admin
    Log out user

T1C2. Select first terminology on search page
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page
    Select first terminology on list

T1C3. Change page languages
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page
    
    Change language to english
    Verify search page language is english

    Change language to swedish
    Verify search page language is swedish
    
    Change language to finnish
    Verify search page language is finnish

T1C4. Test status filter checkbox
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page
    Get filter counts from search page
    Verify search page contains ${Draft + Valid count} items with filters

    Set filter Voimassa oleva checkbox
    Verify status filter Voimassa oleva is not Set
    Verify page does not contain terminologies with status Voimassa oleva
    Verify page contains remove all filters
    Verify search page contains ${Draft count} items with filters
    
    Set filter Luonnos checkbox
    Verify search page contains ${Draft + Valid count} items with filters
    Verify filters are defaults
    
    Set filter Luonnos checkbox
    Verify status filter Luonnos is not Set
    Verify page does not contain terminologies with status Luonnos
    Verify page contains remove all filters
    Verify search page contains ${Valid count} items with filters

    Remove all filters
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify search page contains ${Draft + Valid +Superseded count} items with filters
    Verify status filter Korvattu is Set
    Verify page contains remove all filters
    Set filter Korvattu checkbox
    Verify status filter Korvattu is not Set
    Verify page does not contain terminologies with status Korvattu
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify search page contains ${Draft + Valid + Retired count} items with filters
    Verify status filter Poistettu käytöstä is Set
    Verify page contains remove all filters
    Set filter Poistettu käytöstä checkbox
    Verify status filter Poistettu käytöstä is not Set
    Verify page does not contain terminologies with status Poistettu käytöstä
    Verify filters are defaults
    
    Verify search page contains ${Draft + Valid count} items with filters

T1C5. Test status filter buttons
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page
    Get filter counts from search page
    Verify search page contains ${Draft + Valid count} items with filters

    Remove filter Voimassa oleva with button
    Verify status filter Voimassa oleva is not Set
    Verify page does not contain terminologies with status Voimassa oleva
    Verify page contains remove all filters

    Verify search page contains ${Draft count} items with filters
    Remove filter Luonnos with button
    Verify filters are defaults
    
    Remove filter Luonnos with button
    Verify status filter Luonnos is not Set
    Verify page does not contain terminologies with status Luonnos
    Verify page contains remove all filters
    Verify search page contains ${Valid count} items with filters

    Remove all filters
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify search page contains ${Draft + Valid + Superseded count} items with filters
    Remove filter Korvattu with button
    Verify status filter Korvattu is not Set
    Verify page does not contain terminologies with status Korvattu
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify search page contains ${Draft + Valid + Retired count} items with filters
    Remove filter Poistettu käytöstä with button
    Verify status filter Korvattu is not Set
    Verify page does not contain terminologies with status Poistettu käytöstä
    Verify filters are defaults
    
    Verify search page contains ${Draft + Valid count} items with filters

T1C6. Test domain filter checkbox
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page

    Set filter Asuminen checkbox
    Verify domain filter Asuminen is Set
    Set filter Asuminen checkbox
    Verify domain filter Asuminen is not Set
    Verify filters are defaults

    Set filter Demokratia checkbox
    Verify domain filter Demokratia is Set
    Set filter Demokratia checkbox
    Verify domain filter Demokratia is not Set
    Verify filters are defaults

    Set filter Demokratia checkbox
    Set filter Asuminen checkbox
    Remove all filters
    Verify filters are defaults

T1C7. Test domain filter buttons
    [Tags]  Terminology  
    ...     T1  
    ...     PROD
    Open terminology search page

    Set filter Asuminen checkbox
    Remove filter Asuminen with button
    Verify domain filter Asuminen is not Set
    Verify filters are defaults

    Set filter Demokratia checkbox
    Remove filter Demokratia with button
    Verify domain filter Demokratia is not Set
    Verify filters are defaults

T1C8. Test organization selection
    [Tags]  Terminology  
    ...     T1  
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    Open terminology search page

    Sleep  5
    Select organization Testiorganisaatio
    Verify organization filter Testiorganisaatio is set
    Verify search page contains 1 items with filters

    Remove filter Testiorganisaatio with button
    Verify organization filter Testiorganisaatio is not set
    Verify search page does not contain 1 items with filters
    Verify filters are defaults
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C9. Create and test Valid terminology search page
    [Tags]  Terminology  
    ...     T1  
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    Verify page contains ${${Valid count}+1} terminologies with Voimassa oleva
    Verify page contains ${${Housing count}+1} terminologies with Asuminen
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C10. Create and test draft terminology search page
    [Tags]  Terminology  
    ...     T1  
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    Verify page contains ${${Draft count}+1} terminologies with Luonnos
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C11. Create and test Superseeded terminology search page
    [Tags]  Terminology  
    ...     T1  
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${SUPERSEDED}
    Verify page contains ${${Superseded count}+1} terminologies with Korvattu
    Set filter Korvattu checkbox
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C12. Create and test Retired terminology search page
    [Tags]  Terminology  
    ...     T1  
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${RETIRED}
    Verify page contains ${${Retired count}+1} terminologies with Poistettu käytöstä
    Set filter Poistettu käytöstä checkbox
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

*** Keywords ***
Get filter counts from search page
    Sleep                   2
    ${Valid count}=         Get status count from Voimassa oleva filter
    ${Draft count}=         Get status count from Luonnos filter
    ${Superseded count}=    Get status count from Korvattu filter
    ${Retired count}=       Get status count from Poistettu käytöstä filter
    ${Housing count}=       Get status count from Asuminen filter
    ${Democracy count}=     Get status count from Demokratia filter
    Set test variable  ${Valid count}           ${Valid count}
    Set test variable  ${Draft count}           ${Draft count}
    Set test variable  ${Superseded count}      ${Superseded count}
    Set test variable  ${Retired count}         ${Retired count}
    Set test variable  ${Housing count}         ${Housing count}
    Set test variable  ${Democracy count}       ${Democracy count}

    ${Draft + Valid count}=                 Evaluate    ${Draft count}+${Valid count}
    ${Draft + Valid + Retired count}=       Evaluate    ${Draft + Valid count}+${Retired count}
    ${Draft + Valid + Superseded count}=    Evaluate    ${Draft + Valid count}+${Superseded count}
    Set test variable  ${Draft + Valid count}                   ${Draft + Valid count}
    Set test variable  ${Draft + Valid + Retired count}         ${Draft + Valid + Retired count}
    Set test variable  ${Draft + Valid + Superseded count}      ${Draft + Valid + Superseded count}
