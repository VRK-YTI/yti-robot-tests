*** Settings ***
Resource          ../../yti-robot-common/resources/resources_and_libraries.robot

Resource          ../resources/keywords/Datamodel_Resources.robot
Resource          ../resources/keywords/Email_subscription_resources.robot
Resource          ../resources/keywords/Terminologies_Resources.robot

Resource          ../resources/variables/test_files.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files

*** Keywords ***
Test Case Teardown Generic Teardown
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers
