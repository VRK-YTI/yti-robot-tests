*** Settings ***
Library   SeleniumLibrary
Library   ScreenCapLibrary
Library   OperatingSystem
Library   String
Resource  ../resources/selenium keywords/models/terminology/search page.robot
Resource  ../resources/selenium keywords/models/terminology/concept page.robot
Resource  ../resources/selenium keywords/models/terminology/terminology page.robot
Resource  ../resources/selenium keywords/models/terminology/terminology create dialog.robot
Resource  ../resources/selenium keywords/models/terminology/collection page.robot
Resource  ../resources/selenium keywords/models/datamodel/search page.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel create dialog.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel editing.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel documentation.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel classes.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel attributes.robot
Resource  ../resources/selenium keywords/models/datamodel/datamodel associations.robot
Resource  ../resources/selenium keywords/models/eduuni.robot
Resource  ../resources/selenium keywords/models/impersonate.robot
Resource  ../resources/selenium keywords/models/navigation bar.robot
Resource  ../resources/api keywords/terminology_api_resouces.robot
Resource  ../resources/api keywords/datamodel_api_resouces.robot
Resource  ../resources/common keywords/bring_excel.robot
Resource  ../resources/variables/${ENVIRONMENT}/urls.robot

*** Keywords ***
Setup test Case
    ${test case id}=    Fetch From Left     ${TEST NAME}        .
    Set default terminology variables       ${test case id}   
    Set default datamodel variables         ${test case id} 
    Set Selenium Timeout                    ${SELENIUM_DEFAULT_TIMEOUT}
    Open Browser with Settings
    IF  '${RECORD}' == 'True'
        Start video recording      name=${TEST NAME}
    END   

Teardown test Case
    Print console logs
    IF  '${RECORD}' == 'True'
        Stop video recording
        Run keyword If test passed      Remove File     ${OUTPUT DIR}${/}${TEST NAME}_*.webm
    END   
    Close all browsers

Teardown test Case delete terminology ${terminology}
    Teardown test Case
    Delete terminology ${terminology} with api

Teardown test Case delete datamodel ${datamodel}
    Teardown test Case
    Delete model ${datamodel} with api

Teardown test Case on failure delete datamodel ${datamodel}
    Teardown test Case
    Run keyword if test failed  Delete model ${datamodel} with api