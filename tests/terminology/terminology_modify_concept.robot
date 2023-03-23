*** Settings ***
Force Tags           T8  TERMINOLOGY
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T8C1. Verify concept modify button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
 
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}
    Verify concept modify button is not shown

    Login with no group
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}
    Verify concept modify button is not shown

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings
    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}
    Modify concept
    Cancel concept creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T8C2. Modify concept
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
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
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82
  
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_4
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce4
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e84
    
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}_2
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}_2
    
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}_2
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce3
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e83
   
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}_2
    ...                                  ${DEFAULT CONCEPT NAME}_5
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce5
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e85

    Open terminology search page
    Login with Admin

    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}_2
    Modify concept

    ${definition}      Set Variable    definition
    ${example}         Set Variable    example
    ${usage}           Set Variable    usage
    ${subject}         Set Variable    subject
    ${Note}            Set Variable    Note
    ${change history}  Set Variable    change history
    ${etymology}       Set Variable    etymology
    ${concept class}   Set Variable    conceptclass
    ${sources}         Set Variable    source

    Add information to concept
    ...  definition=${definition}
    ...  example=${example}
    ...  usage=${usage}
    ...  subject=${subject}
    ...  Note=${Note}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  concept class=${concept class}
    ...  sources=${sources}
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

    Save concept modify
    
    Verify concept page contains all information
    ...  definition=${definition}
    ...  example=${example}
    ...  usage=${usage}
    ...  subject=${subject}
    ...  Note=${Note}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  concept class=${concept class}
    ...  sources=${sources}
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    
    Modify concept
    
    Add information to concept
    ...  definition=${EMPTY}
    ...  example=CLEAR
    ...  usage=CLEAR
    ...  subject=${EMPTY}
    ...  Note=CLEAR
    ...  change history=CLEAR
    ...  etymology=CLEAR
    ...  concept class=CLEAR
    ...  sources=CLEAR
    #...  broader concept=${DEFAULT CONCEPT NAME}_1
    #...  narrower concept=${DEFAULT CONCEPT NAME}_1
    #...  Related concept=${DEFAULT CONCEPT NAME}_1
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    #...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

    Save concept modify
    
    Verify concept page does not contain all information
    ...  definition=${definition}
    ...  example=${example}
    ...  usage=${usage}
    ...  subject=${subject}
    ...  Note=${Note}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  concept class=${concept class}
    ...  sources=${sources}
    #...  broader concept=${DEFAULT CONCEPT NAME}_1
    #...  narrower concept=${DEFAULT CONCEPT NAME}_1
    #...  Related concept=${DEFAULT CONCEPT NAME}_1
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    #...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

    Modify concept

    Add information to concept
    ...  definition=${definition}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  concept class=${concept class}
    ...  example=${example}_1
    ...  usage=${usage}_1
    ...  Note=${Note}_1
    ...  sources=${sources}_1
    #...  broader concept=${DEFAULT CONCEPT NAME}_1
    #...  narrower concept=${DEFAULT CONCEPT NAME}_1
    #...  Related concept=${DEFAULT CONCEPT NAME}_1
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    #...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

    Add information to concept
    ...  example=${example}_2
    ...  usage=${usage}_2
    ...  Note=${Note}_2
    ...  sources=${sources}_2
    #...  broader concept=${DEFAULT CONCEPT NAME}_4
    #...  narrower concept=${DEFAULT CONCEPT NAME}_4
    #...  Related concept=${DEFAULT CONCEPT NAME}_4
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_4
    #...  Has part concept=${DEFAULT CONCEPT NAME}_4
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_5
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_5
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_5

    Save concept modify

    Verify concept page contains all information
    ...  definition=${definition}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  concept class=${concept class}
    ...  example=${example}_1
    ...  usage=${usage}_1
    ...  Note=${Note}_1
    ...  sources=${sources}_1
    #...  broader concept=${DEFAULT CONCEPT NAME}_1
    #...  narrower concept=${DEFAULT CONCEPT NAME}_1
    #...  Related concept=${DEFAULT CONCEPT NAME}_1
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    #...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

    Verify concept page contains all information
    ...  example=${example}_2
    ...  usage=${usage}_2
    ...  Note=${Note}_2
    ...  sources=${sources}_2
    #...  broader concept=${DEFAULT CONCEPT NAME}_4
    #...  narrower concept=${DEFAULT CONCEPT NAME}_4
    #...  Related concept=${DEFAULT CONCEPT NAME}_4
    #...  Is part of concept=${DEFAULT CONCEPT NAME}_4
    #...  Has part concept=${DEFAULT CONCEPT NAME}_4
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_5
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_5
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_5

    [Teardown]  Run keywords
    ...         Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME}_2 with api

T8C3. Modify terms
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
 
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}

    Modify concept
    Modify to prefered term information
    ...  name=${DEFAULT CONCEPT NAME}_changed
    ...  homograph=1
    ...  extra info=extra info
    ...  scope=scope
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=${Term style spoken}
    ...  Term family=${Term family masculine}
    ...  Term conjugation=${Term conjugation single}
    ...  Term word class=${Term word class adjective}
    
    Add new term to new concept
    ...  name=${DEFAULT CONCEPT NAME}_2
    ...  homograph=2
    ...  Term type=${Term type synonym}
    ...  Term language=${Term language finnish}
    ...  Term status=${Term state draft}
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=${Term style spoken}
    ...  Term family=${Term family masculine}
    ...  Term conjugation=${Term conjugation single}
    ...  Term word class=${Term word class adjective}
    Save concept modify

    Verify term page contains all information
    ...  name=${DEFAULT CONCEPT NAME}_changed
    ...  homograph=1
    ...  Term type=${Term type recommended}
    ...  Term language=${Term language finnish}
    ...  Term status=${Term state draft}
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=${Term style spoken}
    ...  Term family=${Term family masculine}
    ...  Term conjugation=${Term conjugation single}
    ...  Term word class=${Term word class adjective}

    Verify term page contains all information
    ...  name=${DEFAULT CONCEPT NAME}_2
    ...  homograph=2
    ...  Term type=${Term type synonym}
    ...  Term language=${Term language finnish}
    ...  Term status=${Term state draft}
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Term style=${Term style spoken}
    ...  Term family=${Term family masculine}
    ...  Term conjugation=${Term conjugation single}
    ...  Term word class=${Term word class adjective}
    
    Modify concept
    Modify to prefered term information
    ...  name=${DEFAULT CONCEPT NAME}
    ...  homograph=CLEAR
    ...  extra info=${SPACE}
    ...  scope=${SPACE}
    ...  Change note=${SPACE}
    ...  etymology=${SPACE}
    ...  Admin note=CLEAR
    ...  Term style=${SPACE}
    ...  Term family=CLEAR
    ...  Term conjugation=CLEAR
    ...  Term word class=CLEAR
    Save concept modify
    
    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}
    ...  homograph=1
    ...  Term language=${Term language finnish}
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=${Term style spoken}
    #...  Term family=${Term family masculine}
    ...  Term conjugation=${Term conjugation single}
    ...  Term word class=${Term word class adjective}

    Modify concept
    Delete term
    Save concept modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T8C4. Verify modify concept errors
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
 
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}
    Modify concept

    Add information to concept
    ...  example=${EMPTY}
    ...  usage=${EMPTY}
    ...  Note=${EMPTY}
    ...  sources=${EMPTY}
    ...  diagram=${EMPTY}
    Clear concept status input

    Save concept modify  
    ...  ${False}

    Verify concept error message ${Admin note missing error}
    Verify concept error message ${Note missing error}
    Verify concept error message ${Example missing error} 
    Verify concept error message ${Source missing error} 
    Verify concept error message ${Url missing error}

    Add information to concept
    ...  definition=${EMPTY}
    ...  example=CLEAR
    ...  usage=CLEAR
    ...  subject=${EMPTY}
    ...  Note=CLEAR
    ...  change history=CLEAR
    ...  etymology=CLEAR
    ...  concept class=CLEAR
    ...  sources=CLEAR
    ...  diagram=CLEAR
    Save concept modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T8C5. Verify modify term errors
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}
 
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Select concept ${DEFAULT CONCEPT NAME}
    Modify concept

    Try to change term type
    Verify recommended term can't be changed when its only one
    Cancel term creation

    Click element with wait  ${new term add term button}
    Click element with wait  ${new term accept button}

    Verify term error message ${New term missing name error}
    Verify term error message ${New term missing type error}
    Verify term error message ${New term missing language error}

    Cancel term creation
    Save concept modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}