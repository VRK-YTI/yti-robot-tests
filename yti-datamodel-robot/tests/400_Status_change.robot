*** Settings ***
Documentation     Test Suite for datamodel and resource status change
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model    ${PREFIX_3}
Test Setup        Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
400. Change status for profile and resources
    [Documentation]    Change status for profile and resources
    [Tags]    tietomallit    regression    test    400
    Select model        ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab                  ${ATTRIBUTE_TAB}
    Create New Attribute        Testiattribuutti
    Select Tab                  ${ASSOCIATION_TAB}
    Create new association      Testiassosiaatio
    Modify Profile

    Change Profile Status       Voimassa oleva
    Enforce Resource Status Change
    Click Element with wait     ${SAVE_MODEL_BTN}    timeout=30
    Confirm Action
    Confirm Action
    Confirm Alert

    Select Superuser
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page contains        Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert

    Select Model Tab                ${MODEL_DATA_TAB}
    Modify Profile
    Change Profile Status           Luonnos
    Save Model

401. Change profile resource statuses with enforcing transition rules
    [Documentation]    Change all profile resource statuses from DRAFT to INCOMPLETE as superuser with
    ...    enforcing transition rules. Check that certain status elements are not visible.
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}   superuser
    Select model        ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab              ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab              ${ASSOCIATION_TAB}
    Create new association  Testiassosiaatio

    Mass Migrate Statuses
    Enforce Status Transition Rules
    Set Startig Status    ${STARTING_STATUS_DRAFT}

    Click Element with wait             ${TARGET_STATUS_DDL}            timeout=20
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Page Should Not Contain Element     ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element     ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element     ${TARGET_STATUS_RETIRED}
    Click Element with wait             ${TARGET_STATUS_INCOMPLETE}    timeout=30
    Save Migrate Resource Statuses
    Confirm Alert

402. Change profile resource statuses without enforcing transition rules
    [Documentation]    Change all profile resource statuses from DRAFT to INCOMPLETE as superuser without
    ...    enforcing transition rules.
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}   superuser
    Select model        ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio

    Mass Migrate Statuses
    Set Startig Status    ${STARTING_STATUS_DRAFT}
    Wait Until Page Contains    Resursseja: 3    timeout=10

    Click Element with wait             ${TARGET_STATUS_DDL}
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_DRAFT}          timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_SUPERSEDED}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_RETIRED}        timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_INVALID}        timeout=30

    Click Element with wait             ${TARGET_STATUS_INCOMPLETE}
    Save Migrate Resource Statuses
    Confirm Alert

403. Change profile resource statuses as Test Admin
    [Documentation]    Change all profile resource statuses from DRAFT to VALID as Test Admin.
    [Tags]    tietomallit    regression    test    400
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

    Click Element with wait             ${TARGET_STATUS_DDL}            timeout=20
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Page Should Not Contain Element     ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element     ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element     ${TARGET_STATUS_RETIRED}
    Page Should Not Contain Element     ${TARGET_STATUS_INVALID}
    Click Element with wait             ${TARGET_STATUS_VALID}

    Save Migrate Resource Statuses
    Confirm Action
    Confirm Alert

    Select Superuser
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert

404. Change status for core vocabulary and resources
    [Documentation]    Change status for core vocabulary and resources as Test Datamodel user
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create vocabulary     ${CORE_VOCABULARY_1}   ${PREFIX_2}   datamodel

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
    Click Element with wait   ${SAVE_MODEL_BTN}    timeout=30
    Confirm Action
    Confirm Action
    Confirm Alert

    Select Superuser
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert

    Select Model Tab    ${MODEL_DATA_TAB}
    Modify Profile
    Change Profile Status    Luonnos
    Save Model

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

405. Change core vocabulary resource statuses with enforcing transition rules
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to INCOMPLETE as superuser with
    ...    enforcing transition rules. Check that certain status elements are not visible.
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create Vocabulary     ${CORE_VOCABULARY_1}   ${PREFIX_2}   superuser

    Select And Edit Profile    ${CORE_VOCABULARY_1}
    Import Namespace    Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Add Class    Rooli    ${NAMESPACE_1}

    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio

    Mass Migrate Statuses
    Enforce Status Transition Rules
    Set Startig Status    ${STARTING_STATUS_DRAFT}

    Click Element with wait             ${TARGET_STATUS_DDL}            timeout=20
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Page Should Not Contain Element     ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element     ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element     ${TARGET_STATUS_RETIRED}
    Page Should Not Contain Element     ${TARGET_STATUS_INVALID}
    Click Element with wait             ${TARGET_STATUS_INCOMPLETE}
    Save Migrate Resource Statuses
    Confirm Alert

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

406. Change core vocabulary resource statuses without enforcing transition rules
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to INCOMPLETE as superuser without
    ...    enforcing transition rules.
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create Vocabulary     ${CORE_VOCABULARY_1}   ${PREFIX_2}   superuser
    Select And Edit Profile     ${CORE_VOCABULARY_1}
    Import Namespace            Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab    ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Add Class    Rooli    ${NAMESPACE_1}

    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio

    Mass Migrate Statuses
    Set Startig Status    ${STARTING_STATUS_DRAFT}

    Wait Until Page Contains    Resursseja: 3    timeout=10
    Click Element with wait             ${TARGET_STATUS_DDL}            timeout=20
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_DRAFT}          timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_SUPERSEDED}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_RETIRED}        timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_INVALID}        timeout=30
    Click Element with wait             ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Save Migrate Resource Statuses
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

407. Change core vocabulary resource statuses as Test Admin
    [Documentation]    Change all core vocabulary resource statuses from DRAFT to VALID as Test Admin.
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create Vocabulary     ${CORE_VOCABULARY_1}   ${PREFIX_2}

    Select And Edit Profile         ${CORE_VOCABULARY_1}
    Import Namespace                Julkishallinnon tietokomponentit
    Save Model

    Select Model Tab                                ${MODEL_DATA_TAB}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Add Class    Rooli    ${NAMESPACE_1}
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio

    Mass Migrate Statuses
    Set Startig Status    ${STARTING_STATUS_DRAFT}
    Wait Until Page Contains    Resursseja: 3    timeout=10

    Click Element with wait             ${TARGET_STATUS_DDL}            timeout=20
    Wait Until Page Contains Element    ${TARGET_STATUS_INCOMPLETE}     timeout=30
    Wait Until Page Contains Element    ${TARGET_STATUS_VALID}          timeout=30
    Page Should Not Contain Element     ${TARGET_STATUS_DRAFT}
    Page Should Not Contain Element     ${TARGET_STATUS_SUPERSEDED}
    Page Should Not Contain Element     ${TARGET_STATUS_RETIRED}
    Page Should Not Contain Element     ${TARGET_STATUS_INVALID}
    Click Element with wait             ${TARGET_STATUS_VALID}
    Save Migrate Resource Statuses
    Confirm Action
    Confirm Alert

    Select Superuser
    Change All Resource Statuses    False    ${STARTING_STATUS_VALID}    ${TARGET_STATUS_DRAFT}
    Wait Until Page Contains    Tila vaihdettu 3 resurssiin.    timeout=30
    Confirm Alert

    [Teardown]    Test Case Teardown Delete model    ${PREFIX_2}

408. Change status for profile
    [Documentation]    Change status for profile
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}   datamodel
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class

    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Modify Profile
    Click Element with wait             ${MODEL_STATE_DDL}      timeout=20

    Wait Until Page Contains Element    ${MODEL_STATE_DRAFT}            timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_INCOMPLETE}       timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_VALID}            timeout=30
    Page Should Not Contain Element     ${MODEL_STATE_SUPERSEDED}
    Page Should Not Contain Element     ${MODEL_STATE_RETIRED}
    Page Should Not Contain Element     ${MODEL_STATE_INVALID}

    Click Element with wait             ${MODEL_STATE_VALID}            timeout=30
    Click Element with wait             ${SAVE_MODEL_BTN}               timeout=30
    Confirm Action

    Modify Profile
    Click Element with wait             ${MODEL_STATE_DDL}              timeout=20
    Wait Until Page Contains Element    ${MODEL_STATE_VALID}            timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_RETIRED}          timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_INVALID}          timeout=30
    Wait Until Page Contains Element    ${MODEL_STATE_SUPERSEDED}       timeout=30
    Page Should Not Contain Element    ${MODEL_STATE_DRAFT}
    Page Should Not Contain Element    ${MODEL_STATE_INCOMPLETE}
    Click Element with wait   ${MODEL_STATE_RETIRED}    timeout=30
    Click Element with wait   ${SAVE_MODEL_BTN}         timeout=30

    Select Superuser
    Modify Profile
    Change Profile Status    Luonnos
    Save Model


409. Change status for class
    [Documentation]    Change status for class
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}   datamodel
    Select model    ${MODEL_2}
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select And Edit Class    Testiluokka

    Click Element with wait             ${CLASS_STATE_DDL}              timeout=20
    Wait Until Page Contains Element    ${CLASS_STATE_DRAFT}            timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_INCOMPLETE}       timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_VALID}            timeout=30
    Page Should Not Contain Element    ${CLASS_STATE_SUPERSEDED}
    Page Should Not Contain Element    ${CLASS_STATE_RETIRED}
    Page Should Not Contain Element    ${CLASS_STATE_INVALID}
    Click Element with wait   ${CLASS_STATE_VALID}  timeout=30
    Click Element with wait   ${SAVE_CLASS}         timeout=60
    Confirm Action

    Select And Edit Class    Testiluokka
    Click Element with wait             ${CLASS_STATE_DDL}          timeout=20
    Wait Until Page Contains Element    ${CLASS_STATE_VALID}        timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_RETIRED}      timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_INVALID}      timeout=30
    Wait Until Page Contains Element    ${CLASS_STATE_SUPERSEDED}   timeout=30
    Page Should Not Contain Element    ${CLASS_STATE_DRAFT}
    Page Should Not Contain Element    ${CLASS_STATE_INCOMPLETE}
    Click Element with wait   ${CLASS_STATE_RETIRED}
    Save Class


410. Change status for predicate
    [Documentation]    Change status for predicate
    [Tags]    tietomallit    regression    test    400
    [Setup]   Test Case setup create profile     ${MODEL_2}   ${PREFIX_3}   datamodel
    Select model    ${MODEL_2}
    Select Tab    ${ATTRIBUTE_TAB}
    Create New Attribute    Testiattribuutti
    Select And Edit Predicate    ${ATTRIBUTE_TAB}    testiattribuutti
    Click Element with wait             ${PREDICATE_STATE_DDL}              timeout=20
    Wait Until Page Contains Element    ${PREDICATE_STATE_DRAFT}            timeout=30
    Wait Until Page Contains Element    ${PREDICATE_STATE_INCOMPLETE}       timeout=30
    Wait Until Page Contains Element    ${PREDICATE_STATE_VALID}            timeout=30
    Page Should Not Contain Element    ${PREDICATE_STATE_SUPERSEDED}
    Page Should Not Contain Element    ${PREDICATE_STATE_RETIRED}
    Page Should Not Contain Element    ${PREDICATE_STATE_INVALID}
    Click Element with wait   ${PREDICATE_STATE_VALID}
    Click Element with wait   ${PREDICATE_EDIT_SAVE_BTN}    timeout=60
    Confirm Action

    Select And Edit Predicate           ${ATTRIBUTE_TAB}    testiattribuutti
    Click Element with wait             ${PREDICATE_STATE_DDL}    timeout=20
    Wait Until Page Contains Element    ${PREDICATE_STATE_VALID}    timeout=30
    Wait Until Page Contains Element    ${PREDICATE_STATE_RETIRED}    timeout=30
    Wait Until Page Contains Element    ${PREDICATE_STATE_INVALID}    timeout=30
    Wait Until Page Contains Element    ${PREDICATE_STATE_SUPERSEDED}
    Page Should Not Contain Element     ${PREDICATE_STATE_DRAFT}
    Page Should Not Contain Element     ${PREDICATE_STATE_INCOMPLETE}
    Click Element with wait             ${PREDICATE_STATE_RETIRED}
    Save Predicate

