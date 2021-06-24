*** Settings ***
Resource          resoureces/keywords/Email_subsription_resouces.robot
Resource          resoureces/keywords/Terminology_Resources.robot

Resource          resources/variables/test_files.robot

Resource          ../yti-robot-common/resources/resources_and_libraries.robot

*** Variables ***
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files

*** Keywords ***
Test Case Teardown Generic Teardown
    Close All Browsers

Test Case Suite Teardown Generic Teardown
    Close All Browsers
