*** Settings ***
Documentation     Test Suite for documentation functionality of Datamodel
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Delete model    ${DEFAULT_DATAMODEL_PREFIX} 
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${datamodel_name}      automation_documentation
${datamodel_prefix}    auto_doc

*** Test Cases ***
600. Open documentation page without login
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    [Setup]   Test Case Setup ${NONE}
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Verify edit documentation button is not shown

601. Open documentation page with unauthorized user
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    [Setup]   Test Case Setup No group
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Verify edit documentation button is not shown

602. Open documentation page and cancel empty editing
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Cancel editing documentation

603. Open documentation page and save empty edit
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Save edited documentation

604. Open documentation page and cancel ongoing editing
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Write to editor  test
    Cancel editing documentation

605. Open documentation page and save edited document
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Write to editor           test
    Save edited documentation
    Wait until page contains  test

606. Open documentation page and change page while editing empty document
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Open model details tab

607. Open documentation page, change page while editing and cancel editing
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Open model details tab
    Verify ongoing editing warning
    Cancel ongoing editing warning
    Cancel editing documentation

608. Open documentation page, change page while editing and save editing
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Write to editor           test
    Open model details tab
    Verify ongoing editing warning
    Cancel ongoing editing warning
    Save edited documentation
    Wait until page contains  test

609. Open documentation page, change page while editing and confirm warning
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Open model details tab
    Verify ongoing editing warning
    Confirm ongoing editing warning
    Verify model tab is open

610. Open documentation page add link
    [Tags]     regression    
    ...        tietomallit        
    ...        test        
    ...        600
    Create profile ${DEFAULT_DATAMODEL_NAME} with prefix ${DEFAULT_DATAMODEL_PREFIX} api
    Select model   ${DEFAULT_DATAMODEL_NAME}
    Open documentation page
    Edit documentation
    Write to editor           ${DATA VOCABULARIES ENVIRONMENT URL}
    Save edited documentation
    Click edited link         ${DATA VOCABULARIES ENVIRONMENT URL}  
    Select model              ${DEFAULT_DATAMODEL_NAME}