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

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Create copy terminology dialog

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T10C3. Create valid copy with own prefix
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Input manual prefix new_${DEFAULT TERMINOLOGY PREFIX} on copy dialog
    
    Create copy terminology dialog

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