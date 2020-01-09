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
    Create New Attribute    Testiattribuutti
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

401. Change profile resource statuses with enforcing transition rules
    [Documentation]    Change all profile resource statuses from DRAFT to INCOMPLETE as superuser with
    ...    enforcing transition rules. Check that certain status elements are not visible.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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

402. Change profile resource statuses without enforcing transition rules
    [Documentation]    Change all profile resource statuses from DRAFT to INCOMPLETE as superuser without
    ...    enforcing transition rules.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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

403. Change profile resource statuses as Test Admin
    [Documentation]    Change all profile resource statuses from DRAFT to VALID as Test Admin.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}

404. Change status for core vocabulary and resources
    [Documentation]    Change status for core vocabulary and resources as Test Datamodel user
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_DATAMODEL_ID}    ${TEST_DATAMODEL_NAME}
    Create Core Vocabulary    ${CORE_VOCABULARY_1}    ${PREFIX_2}
    Select model    ${CORE_VOCABULARY_1}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Select Model Tab    ${MODEL_DATA_TAB}
    Modify Profile
    Change Profile Status    Luonnos
    Save Model
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${CORE_VOCABULARY_1}

405. Change core vocabulary resource statuses with enforcing transition rules
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to INCOMPLETE as superuser with
    ...    enforcing transition rules. Check that certain status elements are not visible.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Core Vocabulary    ${CORE_VOCABULARY_1}    ${PREFIX_2}
    Go Back To Data Vocabularies Frontpage
    Select And Edit Profile    ${CORE_VOCABULARY_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Add Class    Rooli    ${NAMESPACE_1}
    Log To Console    Class "Rooli" added
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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
    [Teardown]    Delete profile    ${CORE_VOCABULARY_1}

406. Change core vocabulary resource statuses without enforcing transition rules
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to INCOMPLETE as superuser without
    ...    enforcing transition rules.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Create Core Vocabulary    ${CORE_VOCABULARY_1}    ${PREFIX_2}
    Go Back To Data Vocabularies Frontpage
    Select And Edit Profile    ${CORE_VOCABULARY_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Add Class    Rooli    ${NAMESPACE_1}
    Log To Console    Class "Rooli" added
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${CORE_VOCABULARY_1}

407. Change core vocabulary resource statuses as Test Admin
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to VALID as Test Admin.
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Core Vocabulary    ${CORE_VOCABULARY_1}    ${PREFIX_2}
    Go Back To Data Vocabularies Frontpage
    Select And Edit Profile    ${CORE_VOCABULARY_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model
    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Add Class    Rooli    ${NAMESPACE_1}
    Log To Console    Class "Rooli" added
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
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
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${CORE_VOCABULARY_1}

408. Change status for profile
    [Documentation]    Change status for profile
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_DATAMODEL_ID}    ${TEST_DATAMODEL_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Modify Profile
    Wait Until Element Is Enabled    ${MODEL_STATE_DDL}    timeout=20
    Click Element    ${MODEL_STATE_DDL}
    Wait Until Page Contains Element    ${MODEL_STATE_DRAFT}    timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_INCOMPLETE}    timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_VALID}    timeout=30
    Page Should Not Contain Element    ${MODEL_STATE_SUPERSEDED}
    Page Should Not Contain Element    ${MODEL_STATE_RETIRED}
    Page Should Not Contain Element    ${MODEL_STATE_INVALID}
    Click Element    ${MODEL_STATE_VALID}
    Wait Until Element Is Enabled    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Confirm Action
    Modify Profile
    Wait Until Element Is Enabled    ${MODEL_STATE_DDL}    timeout=20
    Click Element    ${MODEL_STATE_DDL}
    Wait Until Page Contains Element    ${MODEL_STATE_VALID}    timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_RETIRED}    timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_INVALID}    timeout=30
    Page Should Not Contain Element    ${MODEL_STATE_DRAFT}
    Page Should Not Contain Element    ${MODEL_STATE_INCOMPLETE}
    Page Should Not Contain Element    ${MODEL_STATE_SUPERSEDED}
    Click Element    ${MODEL_STATE_RETIRED}
    Wait Until Element Is Enabled    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Select user    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Modify Profile
    Change Profile Status    Luonnos
    Save Model
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}

409. Change status for class
    [Documentation]    Change status for class
    [Tags]    tietomallit    regression    test    400
    [Setup]    Test Case Setup    ${TEST_DATAMODEL_ID}    ${TEST_DATAMODEL_NAME}
    Create Profile    ${MODEL_2}    ${PREFIX_3}
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select And Edit Class    Testiluokka
    Wait Until Element Is Enabled    ${CLASS_STATE_DDL}    timeout=20
    Click Element    ${CLASS_STATE_DDL}
    Wait Until Page Contains Element    ${CLASS_STATE_DRAFT}    timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_INCOMPLETE}    timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_VALID}    timeout=30
    Page Should Not Contain Element    ${CLASS_STATE_SUPERSEDED}
    Page Should Not Contain Element    ${CLASS_STATE_RETIRED}
    Page Should Not Contain Element    ${CLASS_STATE_INVALID}
    Click Element    ${CLASS_STATE_VALID}
    Save Class
    #Confirm Action
    Select And Edit Class    Testiluokka
    Wait Until Element Is Enabled    ${CLASS_STATE_DDL}    timeout=20
    Click Element    ${CLASS_STATE_DDL}
    Wait Until Page Contains Element    ${CLASS_STATE_VALID}    timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_RETIRED}    timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_INVALID}    timeout=30
    Page Should Not Contain Element    ${CLASS_STATE_DRAFT}
    Page Should Not Contain Element    ${CLASS_STATE_INCOMPLETE}
    Page Should Not Contain Element    ${CLASS_STATE_SUPERSEDED}
    Click Element    ${CLASS_STATE_RETIRED}
    Save Class
    Select user    ${TEST_SUPERUSER_ID}    ${TEST_SUPERUSER_NAME}
    Select And Edit Class    Testiluokka
    Wait Until Element Is Enabled    ${CLASS_STATE_DDL}    timeout=20
    Click Element    ${CLASS_STATE_DDL}
    Wait Until Page Contains Element    ${CLASS_STATE_DRAFT}    timeout=30
    Click Element    ${CLASS_STATE_DRAFT}
    Save Class
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_2}
