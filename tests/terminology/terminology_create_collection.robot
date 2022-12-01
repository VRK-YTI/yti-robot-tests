*** Settings ***
Force Tags           Terminology  T5
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T5C1. Verify create collection button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create collection button

    Login with no group
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain create collection button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C2. Verify collection creation error messages
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Save collect creation
    ...   Valid=${False}
    Verify error message ${Collection empty form error}

    Name new collection as ${EMPTY}
    Give new collection definition as definition
    Save collect creation
    ...   Valid=${False}
    Verify error message ${Collection empty name error}

    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as ${EMPTY}
    Save collect creation
    ...   Valid=${False}
    Verify error message ${Collection empty definition error}

    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C3. Create valid collection with multiple concepts
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
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce3
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e83

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME}_1 to collection
    Add concept ${DEFAULT CONCEPT NAME}_2 to collection
    Add concept ${DEFAULT CONCEPT NAME}_3 to collection
    Remove concept ${DEFAULT CONCEPT NAME}_3 from collection creation
    Save collect creation

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
