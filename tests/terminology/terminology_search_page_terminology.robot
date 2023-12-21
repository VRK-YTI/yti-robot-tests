*** Settings ***
Force Tags           Terminology  T2
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T2C1. Verify terminology language options
    [Tags]  PROD 
    ...     BETA
    Open terminology search page
    Select first terminology on list
    
    Change language to english
    Verify terminology search page language is english

    # TODO Swedish does not work
    #Change language to swedish
    #Verify terminology search page language is swedish
    
    Change language to finnish
    Verify terminology search page language is finnish

T2C2. Terminology page filter checkbox and buttons tests
    [Tags]  PROD 
    ...     BETA
    Open terminology search page
    Select first terminology on list
    Get filter counts from search page

    Verify concepts search page contains ${Draft + Valid count} items with filters

    Verify filter Voimassa oleva with checkbox and search count ${Valid count}
    Verify filter Luonnos with checkbox and search count ${Draft count}
    Verify filter Korvattu with checkbox and search count ${Superseded count}
    Verify filter Poistettu käytöstä with checkbox and search count ${Retired count}
    Verify concepts search page contains ${Draft + Valid count} items with filters

    Set filter Voimassa oleva checkbox
    Set filter Luonnos checkbox
    Set filter Korvattu checkbox
    Set filter Poistettu käytöstä checkbox
    Remove all filters

    Verify filter Voimassa oleva with buttons and search count ${Valid count}
    Verify filter Luonnos with buttons and search count ${Draft count}
    Verify filter Korvattu with buttons and search count ${Superseded count}
    Verify filter Poistettu käytöstä with buttons and search count ${Retired count}

    Verify concepts search page contains ${Draft + Valid count} items with filters

T2C3. Test and create terminology with concepts
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

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

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce3
    ...                                  ${SUPERSEDED}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e83

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_4
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce4
    ...                                  ${RETIRED}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e84

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    # TODO bug comes up when uncommented
    #Verify concept ${DEFAULT CONCEPT NAME}_1 on terminology ${DEFAULT TERMINOLOGY NAME}
    #Verify concept ${DEFAULT CONCEPT NAME}_2 on terminology ${DEFAULT TERMINOLOGY NAME}
    #Verify concept ${DEFAULT CONCEPT NAME}_3 on terminology ${DEFAULT TERMINOLOGY NAME}
    #Verify concept ${DEFAULT CONCEPT NAME}_4 on terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Luonnos checkbox
    Verify concept ${DEFAULT CONCEPT NAME}_1 on terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Voimassa oleva checkbox
    Verify concept ${DEFAULT CONCEPT NAME}_2 on terminology ${DEFAULT TERMINOLOGY NAME}
    
    Set filter Korvattu checkbox
    Verify concept ${DEFAULT CONCEPT NAME}_3 on terminology ${DEFAULT TERMINOLOGY NAME}
    
    Set filter Poistettu käytöstä checkbox
    Verify concept ${DEFAULT CONCEPT NAME}_4 on terminology ${DEFAULT TERMINOLOGY NAME}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T2C4. Test and create terminology with collection containin concepts and without concepts
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

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

    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME}_1 on terminology ${DEFAULT TERMINOLOGY NAME}
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME}_2 on terminology ${DEFAULT TERMINOLOGY NAME}

    ${emptylist}=                           Create List
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${emptylist}
    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify collection ${DEFAULT COLLECTION NAME} on terminology ${DEFAULT TERMINOLOGY NAME} does not contain concepts

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

*** Keywords ***
Verify filter ${filter} with buttons and search count ${count}
    Set filter ${filter} checkbox
    Verify page contains remove all filters
    Verify concepts search page contains ${count} items with filters

    Remove filter ${filter} with button
    Verify status filter ${filter} is not Set
    Verify filters are defaults

Verify filter ${filter} with checkbox and search count ${count}
    Set filter ${filter} checkbox
    Verify page contains remove all filters
    Verify concepts search page contains ${count} items with filters

    Set filter ${filter} checkbox
    Verify status filter ${filter} is not Set
    Verify filters are defaults

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
    ${Draft + Valid + Superseded + Retired count}=    Evaluate    ${Draft + Valid count}+${Superseded count}+${Retired count}
    Set test variable  ${Draft + Valid count}                   ${Draft + Valid count}
    Set test variable  ${Draft + Valid + Retired count}         ${Draft + Valid + Retired count}
    Set test variable  ${Draft + Valid + Superseded count}      ${Draft + Valid + Superseded count}
    Set test variable  ${Draft + Valid + Superseded + Retired count}      ${Draft + Valid + Superseded + Retired count}
