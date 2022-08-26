*** Settings ***
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T5C1. Verify create collection button is not shown without log in
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create collection button

    Login with no group
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create collection button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C2. Create valid collection
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C3. Verify empty collection name
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${EMPTY}
    Give new collection definition as definition
    Save collect creation
    ...   Valid=${False}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C4. Verify too long collection name
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Set test variable  ${long prefix}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long prefix}=  Catenate  ${long prefix}a
    END
    Name new collection as ${long prefix}
    Give new collection definition as definition
    Verify new collection page is open

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C5. Verify empty definition
    [Tags]  Terminology  
    ...     T5
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as ${EMPTY}
    Save collect creation
    ...   Valid=${False}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C6. Verify too long collection definition
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Set test variable  ${long prefix}  ${EMPTY}
    FOR    ${index}    IN RANGE    1000
        ${long prefix}=  Catenate  ${long prefix}a
    END
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as ${long prefix}
    Save collect creation
    ...   Valid=${False}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C7. Create valid collection with term
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    
    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME} to collection
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C8. Create valid collection with multiple concepts
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
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
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME}_1 to collection
    Add concept ${DEFAULT CONCEPT NAME}_2 to collection
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C9. Create collection, add concepts and remove 1
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
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
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME}_1 to collection
    Add concept ${DEFAULT CONCEPT NAME}_2 to collection
    Remove concept ${DEFAULT CONCEPT NAME}_1 from collection creation
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C10. Create collection, add concepts and remove them all
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
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
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME}_1 to collection
    Add concept ${DEFAULT CONCEPT NAME}_2 to collection
    Remove concept ${DEFAULT CONCEPT NAME}_1 from collection creation
    Remove concept ${DEFAULT CONCEPT NAME}_2 from collection creation
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C11. Add 30 concepts to collection
    [Tags]  Terminology  
    ...     T5 
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    
    # TODO Find out why api gives error when more concepts are added (around 9-10)
    #FOR    ${index}    IN RANGE    1    30
    #    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    #    ...                                  ${DEFAULT CONCEPT NAME}_${index}
    #    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce${index}
    #    ...                                  ${DRAFT}
    #    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e8${index}
    #END

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    
    # TODO change to api call if reason is found why it does not work
    FOR    ${index}    IN RANGE    1    31
        Create concept
        ...  name=${DEFAULT CONCEPT NAME}_${index}
        Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps
    END
    
    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    FOR    ${index}    IN RANGE    1    31
        Add concept ${DEFAULT CONCEPT NAME}_${index} to collection
    END
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
