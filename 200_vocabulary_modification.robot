*** Settings ***
Documentation     Test Suite for vocabulary modification
Suite Teardown    Close All Browsers
Library           Selenium2Library
Library           XvfbRobot
Resource          resources/Terminology_Resources.robot

*** Test Cases ***
200. Modify DRAFT vocabulary
    [Documentation]    Modify DRAFT vocabulary
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Select and edit Draft vocabulary
    Wait until page contains element    ${VOCBULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCBULARY_TITLE_TEXTAREA}    Uusi sanasto
    Wait until page contains element    ${VOCBULARY_DESCRIPTION_TEXTAREA}    timeout=30
    Input text    ${VOCBULARY_DESCRIPTION_TEXTAREA}    Uusi kuvaus
    Wait until page contains element    ${SAVE_VOCBULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCBULARY_BTN}
    Wait until page contains    Uusi sanasto    timeout=20
    Wait until page contains    Uusi kuvaus    timeout=20
    Wait until page contains element    ${EDIT_VOCBULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCBULARY_BTN}
    Wait until page contains element    ${VOCBULARY_TITLE_TEXTAREA}    timeout=30
    Input text    ${VOCBULARY_TITLE_TEXTAREA}    Testiautomaatiosanasto
    Wait until page contains element    ${VOCBULARY_DESCRIPTION_TEXTAREA}    timeout=30
    Input text    ${VOCBULARY_DESCRIPTION_TEXTAREA}    Tämä on kuvaus
    Wait until page contains element    ${SAVE_VOCBULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCBULARY_BTN}
    Wait until page contains    Testiautomaatiosanasto    timeout=30
    Wait until page contains    Tämä on kuvaus    timeout=30
    [Teardown]    Go back to Sanastot frontpage

201. Add new organization and classification for DRAFT vocabulary
    [Documentation]    Add new organization and classification for DRAFT vocabulary
    [Tags]    regression    sanastot
    [Setup]    Test Case Setup
    Select and edit Draft vocabulary
    Wait until page contains element    ${ADD_ORGANIZATION_BTN}    timeout=30
    Click element    ${ADD_ORGANIZATION_BTN}
    Wait until page contains element    ${SEARCH_ORGANIZATION_INPUT}    timeout=30
    Input text    ${SEARCH_ORGANIZATION_INPUT}    ${ORGANIZATION_1}
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}    timeout=30
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=30
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    ${SAVE_VOCBULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCBULARY_BTN}
    Go back to Sanastot frontpage
    [Teardown]    Restore organization and classification for DRAFT vocabulary

*** Keywords ***
Select and edit Draft vocabulary
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "${VOCABULARY_1}")]    timeout=30
    Click element    //*[contains(text(), "${VOCABULARY_1}")]
    Wait until page contains    ${VOCABULARY_1}    timeout=30
    Wait until page contains element    ${SHOW_VOCABULARY_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_VOCABULARY_DETAILS_BTN}
    Wait until page contains    Testiautomaatiosanasto    timeout=20
    Wait until page contains    Testiorganisaatio    timeout=20
    Wait until page contains    Eläkkeet    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Tämä on kuvaus    timeout=20
    Wait until page contains element    ${EDIT_VOCBULARY_BTN}    timeout=30
    Click element    ${EDIT_VOCBULARY_BTN}

Restore organization and classification for DRAFT vocabulary
    Select and edit Draft vocabulary
    Wait until page contains element    ${REMOVE_ORGANIZATION_1}    timeout=30
    Click element    ${REMOVE_ORGANIZATION_1}
    Wait until page contains element    ${REMOVE_CLASSIFICATION_1}    timeout=30
    Click element    ${REMOVE_CLASSIFICATION_1}
    Wait until page contains element    ${SAVE_VOCBULARY_BTN}    timeout=30
    Click element    ${SAVE_VOCBULARY_BTN}
    Page should not contain    ${ORGANIZATION_1}
    Page should not contain    ${CLASSIFICATION_1}
    Go back to Sanastot frontpage
