*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T2C1. Click first terminology on list and download it
    [Tags]  Terminology  
    ...     T2 
    ...     PROD 
    Open terminology search page
    Select first terminology on list
    Get filter counts from search page

    Download terminology

    Remove filter Voimassa oleva with Button
    Verify page contains remove all filters
    Verify status filter Voimassa oleva is not Set

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
