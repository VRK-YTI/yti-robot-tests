*** Settings ***
Documentation     Test Suite for datamodel and resource status change
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          resources/Datamodel_Resources.robot

*** Test Cases ***
400. Change status for profile and resources
    [Documentation]    Change status for profile and resources
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create new attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Modify Profile
    Change Profile Status    Voimassa oleva
    Enforce Resource Status Change
    Wait Until Element Is Enabled    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Confirm Action
    Confirm Action
    Confirm Alert
    Select user    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Select Model Tab    ${MODEL_DATA_TAB}
    Modify Profile
    Change Profile Status    Luonnos
    Save Model
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}
