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

401. Change resource statuses with enforcing transition rules
    [Documentation]    Change all resource statuses from DRAFT to INCOMPLETE as superuser with
    ...    enforcing transition rules. Check that certain status elements are not visible.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create new attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Mass Migrate Statuses
    Enforce Status Transition Rules
    Set Startig Status    ${STARTING_STATUS_DRAFT}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}    timeout=30
    Page Should Not Contain Element    ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element    ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element    ${TARGET_STATUS_RETIRED}
    Page Should Not Contain Element    ${TARGET_STATUS_INVALID}
    Click Element    ${TARGET_STATUS_INCOMPLETE}
    Save Migrate Resource Statuses
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}

402. Change resource statuses without enforcing transition rules
    [Documentation]    Change all resource statuses from DRAFT to INCOMPLETE as superuser without
    ...    enforcing transition rules.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create new attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Mass Migrate Statuses
    Set Startig Status    ${STARTING_STATUS_DRAFT}
    Wait Until Page Contains    Resursseja: 3    timeout=10
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_DRAFT}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_SUPERSEDED}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_RETIRED}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_INVALID}    timeout=30
    Click Element    ${TARGET_STATUS_INCOMPLETE}
    Save Migrate Resource Statuses
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}

403. Change resource statuses as Test Admin
    [Documentation]    Change all resource statuses from DRAFT to VALID as Test Admin.
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
    Mass Migrate Statuses
    Set Startig Status    ${STARTING_STATUS_DRAFT}
    Wait Until Page Contains    Resursseja: 3    timeout=10
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}    timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}    timeout=30
    Page Should Not Contain Element    ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element    ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element    ${TARGET_STATUS_RETIRED}
    Page Should Not Contain Element    ${TARGET_STATUS_INVALID}
    Click Element    ${TARGET_STATUS_VALID}
    Save Migrate Resource Statuses
    Confirm Action
    Confirm Alert
    Select user    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}
