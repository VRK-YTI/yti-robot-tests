*** Settings ***
Force Tags           Datamodel  T1
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Open datamodel page
    [Tags]  PROD
    ...     BETA
    Open datamodel search page
