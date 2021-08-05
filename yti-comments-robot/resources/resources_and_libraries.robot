*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Data_Vocabularies_resources.robot
Resource          ../resources/keywords/Email_subscription_resources.robot
Resource          ../resources/keywords/Generic_resources.robot
Resource          ../resources/keywords/Reference_Data_resources.robot
Resource          ../resources/keywords/Terminologies_resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files

*** Keywords ***
Test Case Teardown Generic Teardown
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers
