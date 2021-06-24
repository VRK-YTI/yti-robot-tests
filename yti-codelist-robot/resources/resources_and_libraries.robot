*** Settings ***
Resource          resources/keywords/eDuuni_login_resources.robot
Resource          resources/keywords/Generic_resources.robot
Resource          resources/keywords/Extension_resources.robot
Resource          resources/keywords/Terminologies_resources.robot

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

Test Case Teardown restoring Finnish language
    Click element with wait     ${LANGUAGE_DROPDOWN_BTN}   timeout=30
    Click element with wait     ${LANGUAGE_FI}

    Wait Until Page Contains    ${CODE_LIST_1}
    Wait Until Page Contains    Kaikki tilat                timeout=30
    Wait Until Page Contains    Kaikki rekisterit           timeout=30
    Wait Until Page Contains    Kaikki organisaatiot        timeout=30
    Wait Until Page Contains    Luokitus                    timeout=30

    Test Case Teardown Generic Teardown

Test Case Setup Generic Setup
    Open Koodistot
    Set Selenium Speed      ${SELENIUM_SPEED}

Test Case Suite Setup Generic Setup
    Log  generic suite setup

Test Case Setup Admin
    Test Case Setup Generic Setup
    Select Admin

Test Case Setup Superuser
    Test Case Setup Generic Setup
    Select Superuser

Test Case Setup Terminologies
    Terminology Setup
    Test Case Setup Superuser

Test Case Teardown Terminologies
    Terminology Teardown
    Test Case Setup Superuser
    Remove code lists    automobiili

Test Case Teardown concept for code list from Terminologies
    Terminology Teardown
    Log to Console    Terminology teardown done
    Test Case Setup Superuser
    Log to Console    Test Case Setup Superuser done
    Remove code lists    tutkija

Test Case Teardown Code with concept
    Terminology Teardown
    Log to Console    Test Case Teardown Code with concept done
    Test Case Setup Superuser
    Log to Console    Test Case Setup Superuser done
    Remove code lists    ${CODE_LIST_8}

Terminology Setup
    Test Case Setup Create Testiautomaatiosanasto

Terminology Teardown
    Delete Testiautomaatiosanasto

Terminology Test Case Setup
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Terminology Select user

Terminology Test Case Teardown
    Close All Browsers

Test Case Setup Create Testiautomaatiosanasto
    Terminology Test Case Setup
    Input Text with wait        ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}      timeout=60
    ${vocabulary_exists}=    Run Keyword And Return Status    Page Should Contain Element    //*[contains(text(), "Testiautomaatiosanasto")]
    Run Keyword If    ${vocabulary_exists}    Delete existing terminological vocabulary and create new
    ...    ELSE    Create Testiautomaatiosanasto and import vocabulary
    Go back to Sanastot frontpage
