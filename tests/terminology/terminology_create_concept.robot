*** Settings ***
Force Tags           Terminology  T4
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T4C1. Verify create concept button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create concept button

    Login with no group
    Verify page does not contain create concept button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C2. Verify concept creation error messages
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Start concept creation for ${EMPTY}
    Verify concept creation name is not empty error
    Cancel concept creation

    Start concept creation for ${SPACE}  
    Verify concept creation name is not empty error
    Cancel concept creation

    Start concept creation for ${DEFAULT CONCEPT NAME}
    Verify new concept page is open

    Add information to concept
    ...  example=${EMPTY}
    ...  usage=${EMPTY}
    ...  Note=${EMPTY}
    ...  sources=${EMPTY}
    ...  diagram=${EMPTY}
    Clear concept status input

    Save concept creation  ${False}

    Verify concept error message ${Admin note missing error}
    Verify concept error message ${Note missing error}
    Verify concept error message ${Example missing error} 
    Verify concept error message ${Source missing error} 
    Verify concept error message ${Url missing error}
    
    Try to change term type
    Verify recommended term can't be changed when its only one
    Cancel term creation

    Click element with wait  ${new term add term button}
    Click element with wait  ${new term accept button}

    Verify term error message ${New term missing name error}
    Verify term error message ${New term missing type error}
    Verify term error message ${New term missing language error}
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C3. Create valid concept with all information and relations
    # TODO remove skip when bug is fixed (YTI-3755)
    Skip
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1

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

    ${definition}      Set Variable    definition
    ${example}         Set Variable    example
    ${subject}         Set Variable    subject
    ${Note}            Set Variable    Note
    ${change history}  Set Variable    change history
    ${etymology}       Set Variable    etymology
    ${concept class}   Set Variable    conceptclass
    ${sources}         Set Variable    source

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}_2

    Add information to concept
    ...  definition=${definition}
    ...  example=${example}
    ...  subject=${subject}
    ...  Note=${Note}
    ...  change history=${change history}
    ...  etymology=${etymology}
    ...  sources=${sources}
    ...  concept class=${concept class}
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Match in other vocabulary=${DEFAULT CONCEPT NAME}_3
    ...  Almost match in other vocabulary=${DEFAULT CONCEPT NAME}_3

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
    ...  name=${DEFAULT CONCEPT NAME}_3
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
    
    Save concept creation

    Verify concept page contains all information
    ...  definition=${definition}
    ...  example=${example}
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
    ...  name=${DEFAULT CONCEPT NAME}_3
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

    [Teardown]  Run keywords
    ...         Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME}_2 with api