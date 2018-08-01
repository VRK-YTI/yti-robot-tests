*** Settings ***
Documentation     Test Suite for basic functionality of Datamodel application
Suite Setup       Datamodel Suite Setup
Suite Teardown    Datamodel Suite Teardown
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Test Cases ***
200. Modify Testiautomaatio model
    [Documentation]    Modify Testiautomaatio model
    [Tags]    tietomallit
    [Setup]    Test Case Setup
    Select and edit Testiautomaatio model
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${MODEL_LANGUAGE_INTPUT}    timeout=30
    Sleep    2
    Click Element    ${MODEL_LANGUAGE_INTPUT}
    Sleep    2
    Click Element    //*[contains(text(), "sv")]
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "Kulttuuri")]    timeout=30
    Click Element    //*[contains(text(), "Kulttuuri")]
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "Väestörekisterikeskus")]    timeout=30
    Click Element    //*[contains(text(), "Väestörekisterikeskus")]
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    suomi.fi
    Wait until page contains element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tänä on suomi.fi linkki
    Wait until page contains element    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Sleep    2
    Restore model modify
    Go back to Tietomallit frontpage and close browsers

*** Keywords ***
Select and edit Testiautomaatio model
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}

Datamodel Suite Setup
    Test Case Setup
    Create Testiautomaatio model

Datamodel Suite Teardown
    Test Case Setup
    Delete Testiautomaatio model

Restore model modify
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    ${MODEL_1}
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${MODEL_PREFIX_INTPUT}    timeout=30
    Input Text    ${MODEL_PREFIX_INTPUT}    test
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${SAVE_MODEL_BTN}    timeout=30
    Click Element    ${SAVE_MODEL_BTN}
    Sleep    2
