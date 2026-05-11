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
    Verify page does not contain create collection button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings
    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}
    Open create collection dialog
    Cancel collection create

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}

T5C2. Verify collection creation error messages
    # TODO: remove skip after fixing the underlying issue (YTI-4387)
    Skip 
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
    ...  Valid=${False}
    Verify error message ${Collection empty name error}

    Name new collection as ${EMPTY}
    Give new collection definition as definition
    Save collect creation
    ...  Valid=${False}
    Verify error message ${Collection empty name error}

    Give new collection identifier as ${DEFAULT COLLECTION PREFIX}
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
    ...                                  concept-1
    ...                                  ${DRAFT}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_2
    ...                                  concept-2
    ...                                  ${DRAFT}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}_3
    ...                                  concept-3
    ...                                  ${DRAFT}

    Open terminology search page
    Login with Admin
    Search and select terminology ${DEFAULT TERMINOLOGY NAME}

    Open create collection dialog
    Give new collection identifier as ${DEFAULT COLLECTION PREFIX}
    Name new collection as ${DEFAULT COLLECTION NAME}
    Give new collection definition as definition
    Add concept ${DEFAULT CONCEPT NAME}_1 to collection
    Add concept ${DEFAULT CONCEPT NAME}_2 to collection
    Add concept ${DEFAULT CONCEPT NAME}_3 to collection
    Remove concept ${DEFAULT CONCEPT NAME}_3 from collection creation
    Save collect creation

    Select terminology ${DEFAULT TERMINOLOGY NAME} from breadcrumps
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME}_1 on terminology ${DEFAULT TERMINOLOGY NAME}
    Verify collection ${DEFAULT COLLECTION NAME} containing concept ${DEFAULT CONCEPT NAME}_2 on terminology ${DEFAULT TERMINOLOGY NAME}

    [Teardown]  Teardown test Case delete terminology ${DEFAULT TERMINOLOGY NAME}
