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
    [Tags]    tietomallit
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Profile    ${MODEL_1}    ${PREFIX_1}
    Select model    Testiautomaatiomalli
    Create New Class Without Referencing Concept    Testiluokka
    Save Class
    Select Tab    ${ATTRIBUTE_TAB}
    Create new attribute    Testiattribuutti
    Select Tab    ${ASSOCIATION_TAB}
    Create new association    Testiassosiaatio
    Modify Profile
    Change Profile Status    Voimassa oleva    True
    Save Model
    Go Back To Data Vocabularies Frontpage
    [Teardown]    Delete profile    ${MODEL_1}
