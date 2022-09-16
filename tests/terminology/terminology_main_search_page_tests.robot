*** Settings ***
Force Tags           Terminology  T1
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Open terminology page and log in
    [Tags]  PROD
    Open terminology search page

    Login with Admin
    Log out user

T1C2. Select first terminology on search page
    [Tags]  PROD
    ...     BETA
    Open terminology search page
    Select first terminology on list

T1C3. Change page languages
    [Tags]  PROD
    ...     BETA
    Open terminology search page
    
    Change language to english
    Verify search page language is english

    Change language to swedish
    Verify search page language is swedish
    
    Change language to finnish
    Verify search page language is finnish

T1C4. Test status filter checkbox
    [Tags]  PROD
    ...     BETA
    Open terminology search page
    Get filter counts from search page
    Verify search page contains ${Draft + Valid + retired + Superseded count} items with filters
    
    Set filter Voimassa oleva checkbox
    Verify search page contains ${Valid count} items with filters
    Remove all filters
    
    Set filter Luonnos checkbox
    Verify search page contains ${Draft count} items with filters
    Remove all filters
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify search page contains ${Superseded count} items with filters
    Verify status filter Korvattu is Set
    Verify page contains remove all filters

    Set filter Korvattu checkbox
    Verify status filter Korvattu is not Set
    Verify page does not contain terminologies with status Korvattu
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify search page contains ${Retired count} items with filters
    Verify status filter Poistettu käytöstä is Set
    Verify page contains remove all filters

    Set filter Poistettu käytöstä checkbox
    Verify status filter Poistettu käytöstä is not Set
    Verify page does not contain terminologies with status Poistettu käytöstä
    Verify filters are defaults
    
    Verify search page contains ${Draft + Valid + retired + Superseded count} items with filters

T1C5. Test status filter buttons
    [Tags]  PROD
    ...     BETA
    Open terminology search page
    Get filter counts from search page
    Verify search page contains ${Draft + Valid + retired + Superseded count} items with filters
    
    Set filter Voimassa oleva checkbox
    Verify search page contains ${Valid count} items with filters
    Remove filter Voimassa oleva with button
    
    Set filter Luonnos checkbox
    Verify search page contains ${Draft count} items with filters
    Remove filter Luonnos with button
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify search page contains ${Superseded count} items with filters
    Verify status filter Korvattu is Set
    Verify page contains remove all filters

    Remove filter Korvattu with button
    Verify status filter Korvattu is not Set
    Verify page does not contain terminologies with status Korvattu
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify search page contains ${Retired count} items with filters
    Verify status filter Poistettu käytöstä is Set
    Verify page contains remove all filters

    Remove filter Poistettu käytöstä with button
    Verify status filter Poistettu käytöstä is not Set
    Verify page does not contain terminologies with status Poistettu käytöstä
    Verify filters are defaults
    
    Verify search page contains ${Draft + Valid + retired + Superseded count} items with filters

T1C6. Test domain filter checkbox
    [Tags]  PROD
    ...     BETA
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
    [Tags]  PROD
    ...     BETA
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
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    Open terminology search page

    Select organization ${DEFAULT ORGANIZATION}
    Verify organization filter ${DEFAULT ORGANIZATION} is set
    #Verify search page contains 1 items with filters

    Remove filter ${DEFAULT ORGANIZATION} with button
    Verify organization filter ${DEFAULT ORGANIZATION} is not set
    #Verify search page does not contain 1 items with filters
    Verify filters are defaults
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C9. Create and test Valid terminology search page
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    Verify page contains ${${Valid count}+1} terminologies with Voimassa oleva
    Verify page contains ${${Housing count}+1} terminologies with ${DEFAULT DOMAIN}
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Clear terminology search
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C10. Create and test draft terminology search page
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    Verify page contains ${${Draft count}+1} terminologies with Luonnos
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Clear terminology search
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C11. Create and test Superseeded terminology search page
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${SUPERSEDED}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    Verify page contains ${${Superseded count}+1} terminologies with Korvattu
    Set filter Korvattu checkbox
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Clear terminology search
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C12. Create and test Retired terminology search page
    Open terminology search page
    Get filter counts from search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${RETIRED}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    Verify page contains ${${Retired count}+1} terminologies with Poistettu käytöstä
    Set filter Poistettu käytöstä checkbox
    Search terminology ${DEFAULT TERMINOLOGY NAME}
    Verify search page contains 1 items with filters
    Clear terminology search
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T1C13. Create and test INCOMPLETE terminology search page
    Open terminology search page

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${INCOMPLETE}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Login with Admin
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
    ${Draft + Valid + retired + Superseded count}=    Evaluate    ${Draft + Valid count}+${Superseded count}+${Retired count}
    Set test variable  ${Draft + Valid count}                   ${Draft + Valid count}
    Set test variable  ${Draft + Valid + Retired count}         ${Draft + Valid + Retired count}
    Set test variable  ${Draft + Valid + Superseded count}      ${Draft + Valid + Superseded count}
    Set test variable  ${Draft + Valid + retired + Superseded count}      ${Draft + Valid + retired + Superseded count}