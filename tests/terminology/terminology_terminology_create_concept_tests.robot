*** Settings ***
Force Tags           Terminology  T4
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T4C1. Verify create concept button is not shown without access rights
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create concept button

    Login with no group
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create concept button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C2. Cancel concept creation before naming
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create concept dialog
    Input concept name as ${DEFAULT CONCEPT NAME}
    Cancel concept creation
    Verify create concept dialog is not open

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C3. Create valid concept
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Create concept
    ...  name=${DEFAULT CONCEPT NAME}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C4. Verify empty concept name
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Start concept creation for ${EMPTY}
    Verify concept creation name is not empty error

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C5. Verify empty concept name with space
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Start concept creation for ${SPACE}  
    Verify concept creation name is not empty error

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C6. Verify too long concept Name
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Set test variable  ${long prefix}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long prefix}=  Catenate  ${long prefix}a
    END
    Create concept
    ...  name=${long prefix}
    ...  valid=${False}
    # TODO when added verify error
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C7. Cancel creation after selection concept name
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Start concept creation for ${DEFAULT CONCEPT NAME}
    Verify new concept page is open
    Cancel concept creation
    Verify new concept page is not open
    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C8. Create valid concept with all information and relations
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}_2

    Add information to concept
    ...  definition=definition
    ...  example=example
    ...  subject=subject
    ...  Note=Note
    ...  diagram=diagram
    ...  Sources=Sources
    ...  change history=change history
    ...  etymology=etymology
    ...  concept class=concept class
    ...  word class=adjektiivi
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Modify to prefered term information
    ...  name=${DEFAULT CONCEPT NAME}_changed
    ...  homograph=1
    ...  extra info=extra info
    ...  scope=scope
    #...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Add new term to new concept
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=2
    ...  Term type=Synonyymi
    ...  Term language=suomi FI
    ...  Term status=Luonnos
    ...  extra info=extra info
    ...  scope=scope
    ...  term equivalency=${True}
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Save concept creation
    Verify concept page contains all information
    ...  definition=definition
    ...  example=example
    ...  subject=subject
    ...  Note=Note
    ...  diagram=diagram
    #...  Sources=Sources
    ...  change history=change history
    ...  etymology=etymology
    #...  concept class=conceptclass
    ...  word class=adjektiivi
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Verify term page contains all information
    ...  name=${DEFAULT CONCEPT NAME}_changed
    ...  homograph=1
    ...  Term type=Suositettava termi
    ...  Term language=suomi FI
    ...  Term status=Luonnos
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Verify term page contains all information
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=2
    ...  Term type=Synonyymi
    ...  Term language=suomi FI
    ...  Term status=Luonnos
    ...  extra info=extra info
    ...  scope=scope
    ...  term equivalency=<
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    #...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C9. Verify empty input fields and that concept information is right
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}_2

    Add information to concept
    ...  definition=${EMPTY}
    ...  Sources=${EMPTY}
    ...  subject=${EMPTY}
    ...  diagram=${EMPTY}
    ...  change history=${EMPTY}
    ...  etymology=${EMPTY}
    ...  concept class=${EMPTY}
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Modify to prefered term information
    ...  homograph=${EMPTY}
    ...  extra info=${EMPTY}
    ...  scope=${EMPTY}
    ...  Change note=${EMPTY}
    ...  etymology=${EMPTY}

    Add new term to new concept
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=${EMPTY}
    ...  Term type=Synonyymi
    ...  Term language=suomi FI
    ...  Term status=Luonnos
    ...  extra info=${EMPTY}
    ...  scope=${EMPTY}
    ...  sources=${EMPTY}
    ...  Change note=${EMPTY}
    ...  etymology=${EMPTY}
    Save concept creation

    Verify concept page does not contain all information
    ...  definition=definition
    ...  example=example
    ...  subject=subject
    ...  Note=Note
    ...  diagram=diagram
    ...  Sources=Sources
    ...  change history=change history
    ...  etymology=etymology
    ...  concept class=concept class
    ...  word class=adjektiivi
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_2
    ...  homograph=1
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=2
    ...  extra info=extra info
    ...  scope=scope
    ...  term equivalency=<
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C10. Verify term contains only set information
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}_2

    Add new term to new concept
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  Term type=Synonyymi
    ...  Term language=suomi FI
    Save concept creation

    Verify concept page does not contain all information
    ...  definition=definition
    ...  example=example
    ...  subject=subject
    ...  Note=Note
    ...  diagram=diagram
    ...  Sources=Sources
    ...  change history=change history
    ...  etymology=etymology
    ...  concept class=concept class
    ...  word class=adjektiivi
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_2
    ...  homograph=1
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=2
    ...  extra info=extra info
    ...  scope=scope
    ...  term equivalency=<
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C11. Verify empty input fields with spaces
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_1
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}_2

    Add information to concept
    ...  definition=${SPACE}
    ...  Sources=${SPACE}
    ...  subject=${SPACE}
    #...  Note=Note
    ...  diagram=${SPACE}
    ...  change history=${SPACE}
    ...  etymology=${SPACE}
    ...  concept class=${SPACE}
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Modify to prefered term information
    ...  homograph=${SPACE}
    ...  extra info=${SPACE}
    ...  scope=${SPACE}
    #...  sources=${SPACE}
    ...  Change note=${SPACE}
    ...  etymology=${SPACE}

    Add new term to new concept
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=${SPACE}
    ...  Term type=Synonyymi
    ...  Term language=suomi FI
    ...  Term status=Luonnos
    ...  extra info=${SPACE}
    ...  scope=${SPACE}
    ...  sources=${SPACE}
    ...  Change note=${SPACE}
    ...  etymology=${SPACE}

    Save concept creation

    Verify concept page does not contain all information
    ...  definition=definition
    ...  example=example
    ...  subject=subject
    ...  Note=Note
    ...  diagram=diagram
    ...  Sources=Sources
    ...  change history=change history
    ...  etymology=etymology
    ...  concept class=concept class
    ...  word class=adjektiivi
    ...  broader concept=${DEFAULT CONCEPT NAME}_1
    ...  narrower concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept=${DEFAULT CONCEPT NAME}_1
    ...  Is part of concept=${DEFAULT CONCEPT NAME}_1
    ...  Has part concept=${DEFAULT CONCEPT NAME}_1
    ...  Related concept in other vocabulary=${NONE}
    ...  Match in other vocabulary=${NONE}

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_2
    ...  homograph=1
    ...  extra info=extra info
    ...  scope=scope
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    Verify term page does not contain all information
    ...  name=${DEFAULT CONCEPT NAME}_3
    ...  homograph=2
    ...  extra info=extra info
    ...  scope=scope
    ...  term equivalency=<
    ...  sources=sources
    ...  Change note=Change note
    ...  etymology=etymology
    ...  Admin note=Admin note
    ...  Term style=puhekieli
    ...  Term family=maskuliini
    ...  Term conjugation=yksikkö
    ...  Term word class=adjektiivi

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T4C12. Verify recommended term type can't be changed when its only one
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    Start concept creation for ${DEFAULT CONCEPT NAME}
    Try to change term type
    Verify recommended term can't be changed when its only one

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}