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
    Verify page does not contain copy terminology button

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T10C2. Create valid copy with own prefix
    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  concept-1
    ...                                  ${DRAFT}

    ${members}=    Create List              concept-1
    Create terminology collection with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                     ${DEFAULT COLLECTION NAME}
    ...                                     ${COLLECTION ID DEFAULT}
    ...                                     ${members}

    Open terminology search page

    Login with admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open copy terminology dialog
    Input manual prefix ${DEFAULT TERMINOLOGY PREFIX}_copy on copy dialog
    Create copy terminology dialog
    Close copy confirmation dialog


    Verify displayed finish name is ${DEFAULT TERMINOLOGY NAME} (Copy)
    Verify displayed status is Luonnos
    Verify displayed domains are Asuminen
    Verify displayed organizations are Automaatiotestaus
    Verify displayed languages are suomi FI
    Verify displayed type is Terminologinen sanasto

    Verify concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME} on terminology ${DEFAULT TERMINOLOGY NAME} (Copy)

    [Teardown]  Run Keywords
    ...         Teardown test Case    AND
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME} with api    AND
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME} (Copy) with api

T10C3. Verify copy dialog errors    
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

    [Teardown]  Run Keywords
    ...         Teardown test Case    AND
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME} with api    AND
    ...         Delete terminology ${DEFAULT TERMINOLOGY NAME} (Copy) with api