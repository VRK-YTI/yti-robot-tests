*** Settings ***
Force Tags           T10  Terminology
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T10C1. Verify copy button permissions
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain copy terminology button

    Login with no group
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Verify page does not contain copy terminology button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T10C2. Create valid copy with automatically generated prefix
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    ${members}=    Create List              04bb2206-ba9e-4007-920d-f57ed0d4bce1
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${members}

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Create copy terminology dialog
    
    # TODO bug where concept is not shown before refreshing page
    Sleep  2
    Reload page

    Verify concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T10C3. Create valid copy with own prefix
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81

    ${members}=    Create List              04bb2206-ba9e-4007-920d-f57ed0d4bce1
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${members}

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Input manual prefix new_${DEFAULT TERMINOLOGY PREFIX} on copy dialog
    
    Create copy terminology dialog

    # TODO bug where concept is not shown before refreshing page
    Sleep  2
    Reload page

    Verify concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T10C4. Verify copy dialog errors    
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Input manual prefix ${EMPTY} on copy dialog
    Create copy terminology dialog
    ...   Valid=${False}
    
    Input manual prefix ${DEFAULT TERMINOLOGY NAME} on copy dialog
    Create copy terminology dialog
    ...   Valid=${False}

    Input manual prefix ${DEFAULT TERMINOLOGY PREFIX} on copy dialog
    Create copy terminology dialog
    ...   Valid=${False}

    Input manual prefix new_${DEFAULT TERMINOLOGY PREFIX} on copy dialog
    Create copy terminology dialog

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}