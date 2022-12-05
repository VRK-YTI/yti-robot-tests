*** Settings ***
Force Tags           Datamodel  T1
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Create datamodel and search it
    Create profile ${DEFAULT DATAMODEL NAME} with prefix ${DEFAULT DATAMODEL PREFIX} with api
    
    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}