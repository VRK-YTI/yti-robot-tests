*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T2C1. Select first terminology on list and download it
    [Tags]  Terminology  
    ...     T2 
    ...     PROD 
    Open terminology search page
    Select first terminology on list
    Get filter counts from search page

    Download terminology

T2C2. Change page languages
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Open terminology search page
    Select first terminology on list
    
    Change language to english
    Verify terminology search page language is english

    Change language to swedish
    Verify terminology search page language is swedish
    
    Change language to finnish
    Verify terminology search page language is finnish

T2C3. Terminology page filter checkbox tests
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Open terminology search page
    Select first terminology on list
    Get filter counts from search page

    Verify concepts search page contains ${Draft + Valid count} items with filters

    Set filter Voimassa oleva checkbox
    Verify status filter Voimassa oleva is not Set
    Verify page contains remove all filters
    Verify concepts search page contains ${Draft count} items with filters
    
    Set filter Luonnos checkbox
    Verify concepts search page contains ${Draft + Valid count} items with filters
    Verify filters are defaults
    
    Set filter Luonnos checkbox
    Verify status filter Luonnos is not Set
    Verify page contains remove all filters
    Verify concepts search page contains ${Valid count} items with filters

    Remove all filters
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify concepts search page contains ${Draft + Valid +Superseded count} items with filters
    Verify status filter Korvattu is Set
    Verify page contains remove all filters
    Set filter Korvattu checkbox
    Verify status filter Korvattu is not Set
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify concepts search page contains ${Draft + Valid + Retired count} items with filters
    Verify status filter Poistettu käytöstä is Set
    Verify page contains remove all filters
    Set filter Poistettu käytöstä checkbox
    Verify status filter Poistettu käytöstä is not Set
    Verify filters are defaults
    
    Verify concepts search page contains ${Draft + Valid count} items with filters

T2C4. Terminology page filter buttons tests
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Open terminology search page
    Select first terminology on list
    Get filter counts from search page
    Verify concepts search page contains ${Draft + Valid count} items with filters

    Remove filter Voimassa oleva with button
    Verify status filter Voimassa oleva is not Set
    Verify page contains remove all filters

    Verify concepts search page contains ${Draft count} items with filters
    Remove filter Luonnos with button
    Verify filters are defaults
    
    Remove filter Luonnos with button
    Verify status filter Luonnos is not Set
    Verify page contains remove all filters
    Verify concepts search page contains ${Valid count} items with filters

    Remove all filters
    Verify filters are defaults

    Set filter Korvattu checkbox
    Verify concepts search page contains ${Draft + Valid + Superseded count} items with filters
    Remove filter Korvattu with button
    Verify status filter Korvattu is not Set
    Verify filters are defaults

    Set filter Poistettu käytöstä checkbox
    Verify concepts search page contains ${Draft + Valid + Retired count} items with filters
    Remove filter Poistettu käytöstä with button
    Verify status filter Korvattu is not Set
    Verify filters are defaults
    
    Verify concepts search page contains ${Draft + Valid count} items with filters

T2C5. Test and create terminology with concepts
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_2
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce2
    ...                                  ${VALID}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce3
    ...                                  ${SUPERSEDED}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_4
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce4
    ...                                  ${RETIRED}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Select concept ${DEFAULT CONCEPT NAME}_1
    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps

    Select concept ${DEFAULT CONCEPT NAME}_2
    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps
    
    Set filter Korvattu checkbox
    Select concept ${DEFAULT CONCEPT NAME}_3
    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps
    
    Set filter Poistettu käytöstä checkbox
    Select concept ${DEFAULT CONCEPT NAME}_4

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T2C6. Test and create terminology with collection containin concepts
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_2
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce2
    ...                                  ${VALID}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82

    ${members}=    Create List              04bb2206-ba9e-4007-920d-f57ed0d4bce1       04bb2206-ba9e-4007-920d-f57ed0d4bce2
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${members}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}
    Verify collection contains concepts

    Select concept ${DEFAULT CONCEPT NAME}_1
    Verify concept is part of collection
    Select concept ${DEFAULT COLLECTION NAME}

    Select concept ${DEFAULT CONCEPT NAME}_2
    Verify concept is part of collection
    Select concept ${DEFAULT COLLECTION NAME}

    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T2C7. Test and create terminology with collection without concepts
    [Tags]  Terminology  
    ...     T2
    ...     PROD
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    ${emptylist}=                           Create List
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${emptylist}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}
    Sleep  1
    Verify collection does not contain concepts
    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

*** Keywords ***
Get filter counts from search page
    Sleep                   2
    ${Concepts count}=            Get status count from Käsitteet filter
    ${Collections count}=         Get status count from Käsitekokoelmat filter
    ${Valid count}=         Get status count from Voimassa oleva filter
    ${Draft count}=         Get status count from Luonnos filter
    ${Superseded count}=    Get status count from Korvattu filter
    ${Retired count}=       Get status count from Poistettu käytöstä filter
    Set test variable  ${Concepts count}                ${Concepts count}
    Set test variable  ${Collections count}             ${Collections count}
    Set test variable  ${Valid count}                   ${Valid count}
    Set test variable  ${Draft count}                   ${Draft count}
    Set test variable  ${Superseded count}              ${Superseded count}
    Set test variable  ${Retired count}                 ${Retired count}

    ${Draft + Valid count}=                 Evaluate    ${Draft count}+${Valid count}
    ${Draft + Valid + Retired count}=       Evaluate    ${Draft + Valid count}+${Retired count}
    ${Draft + Valid + Superseded count}=    Evaluate    ${Draft + Valid count}+${Superseded count}
    Set test variable  ${Draft + Valid count}                   ${Draft + Valid count}
    Set test variable  ${Draft + Valid + Retired count}         ${Draft + Valid + Retired count}
    Set test variable  ${Draft + Valid + Superseded count}      ${Draft + Valid + Superseded count}
