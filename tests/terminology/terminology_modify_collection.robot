*** Settings ***
Force Tags           T9  TERMINOLOGY
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T9C1. Verify collection modify button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    ${emptylist}=                           Create List
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${emptylist}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}
    Verify modify collection button is not shown
    
    Login with No group
    Verify modify collection button is not shown
    
    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings
    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}
    Edit collection
    Cancel collection modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T9C2. Modify collection
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
    ...                                  ${VALID}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e82

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce3
    ...                                  ${VALID}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e83

    ${members}=    Create List              
    ...    04bb2206-ba9e-4007-920d-f57ed0d4bce1       
    ...    04bb2206-ba9e-4007-920d-f57ed0d4bce2
    
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${members}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}

    Edit collection

    Name new collection as ${DEFAULT COLLECTION NAME}_2
    Give new collection definition as definition_2
    Add concept ${DEFAULT CONCEPT NAME}_3 to collection
    Save collection modify

    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps
    Sleep  0.5
    Reload page
    Verify collection ${DEFAULT COLLECTION NAME}_2 containing concept ${DEFAULT CONCEPT NAME}_1 on terminology ${DEFAULT TERMINOLOGY NAME}
    Verify collection ${DEFAULT COLLECTION NAME}_2 containing concept ${DEFAULT CONCEPT NAME}_2 on terminology ${DEFAULT TERMINOLOGY NAME}
    Verify collection ${DEFAULT COLLECTION NAME}_2 containing concept ${DEFAULT CONCEPT NAME}_3 on terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}_2
    Edit collection
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Remove concept ${DEFAULT CONCEPT NAME}_1 from collection creation
    Remove concept ${DEFAULT CONCEPT NAME}_2 from collection creation
    Remove concept ${DEFAULT CONCEPT NAME}_3 from collection creation
    Save collection modify

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T9C3. Verify collection errors
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    ${emptylist}=                           Create List
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${emptylist}

    Open terminology search page
    Login with Admin

    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Set filter Käsitekokoelmat checkbox
    Select concept ${DEFAULT COLLECTION NAME}

    Edit collection
    Name new collection as ${EMPTY}
    Save collection modify
    ...  Valid=${False}
    Verify error message ${Collection empty name error}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}