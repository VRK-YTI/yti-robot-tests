*** Settings ***
Documentation     Test Suite for basic functionality of Data Vocabularies application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Variables ***
${class}          Asiakirja
${namespace}      Julkishallinnon tietokomponentit

*** Test Cases ***
200. Modify profile
    [Documentation]    Modify existing profile and restore changes
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Log to Console    Classification removed
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää luokitus")]    timeout=30
    Click Element    //*[contains(text(), "Lisää luokitus")]
    Wait until page contains element    //*[contains(text(), "Kulttuuri")]    timeout=30
    Click Element    //*[contains(text(), "Kulttuuri")]
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Log to Console    Contributor removed
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää sisällöntuottaja")]    timeout=30
    Click Element    //*[contains(text(), "Lisää sisällöntuottaja")]
    Wait until page contains element    //*[contains(text(), "Väestörekisterikeskus")]    timeout=30
    Click Element    //*[contains(text(), "Väestörekisterikeskus")]
    Log to Console    New contributor added
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait until page contains element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log to Console    New link added
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log to Console    Modifications saved
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=30
    Click Element    //*[contains(text(), "Muokkaa")]
    Sleep    2
    Restore profile modifications
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Testiautomaatio profile

201. Add new class to profile
    [Documentation]    Add new class to profile
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Add class    Henkilö
    Sleep    2
    Wait until page contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Sleep    2
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Log to Console    Class "Henkilö" added
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Testiautomaatio profile

202. Add new Core Vocabulary
    [Documentation]    Add new Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup
    Create Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary created
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Automaatiokirjasto Core Vocabulary

203. Modify Core Vocabulary
    [Documentation]    Modify Core Vocabulary and delete Core Vocabulary
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary created
    Select and edit Automaatiokirjasto Core Vocabulary
    Log to Console    Automaatiokirjasto Core Vocabulary selcted
    Wait until page contains element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Log to Console    Classification removed
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää luokitus")]    timeout=30
    Click Element    //*[contains(text(), "Lisää luokitus")]
    Wait until page contains element    //*[contains(text(), "Kulttuuri")]    timeout=30
    Click Element    //*[contains(text(), "Kulttuuri")]
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Log to Console    Contributor removed
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää sisällöntuottaja")]    timeout=30
    Click Element    //*[contains(text(), "Lisää sisällöntuottaja")]
    Wait until page contains element    //*[contains(text(), "Väestörekisterikeskus")]    timeout=30
    Click Element    //*[contains(text(), "Väestörekisterikeskus")]
    Log to Console    New contributor added
    Wait until page contains element    ${ADD_LINK}    timeout=30
    Click Element    ${ADD_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=30
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi/etusivu/
    Wait until page contains element    ${LINK_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${LINK_DESCRIPTION_INPUT}    Tämä on suomi.fi linkki
    Wait until page contains element    ${CREATE_NEW_LINK}    timeout=30
    Click Element    ${CREATE_NEW_LINK}
    Log to Console    New link added
    Sleep    3
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log to Console    Modifications saved
    Sleep    3
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=30
    Click Element    //*[contains(text(), "Muokkaa")]
    Sleep    2
    Restore Core Vocabulary modifications
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Automaatiokirjasto Core Vocabulary

*** Keywords ***
Select and edit Testiautomaatio profile
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${MODIFY_MODEL}    timeout=30
    Click Element    ${MODIFY_MODEL}

Select and edit Automaatiokirjasto Core Vocabulary
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${CORE_VOCABULARY_1}
    Wait until page contains element    //*[contains(text(), "Automaatiokirjasto")]    timeout=30
    Click Element    //*[contains(text(), "Automaatiokirjasto")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${MODIFY_CORE_VOCABULARY_BTN}    timeout=30
    Click Element    ${MODIFY_CORE_VOCABULARY_BTN}

Import namespace
    [Arguments]    ${namespace}=Julkishallinnon tietokomponentit
    Wait until page contains element    ${IMPORT_NAMESPACE}    timeout=30
    Click Element    ${IMPORT_NAMESPACE}
    Wait until page contains element    ${SEARCH_NAMESPACE_INPUT}    timeout=30
    Input Text    ${SEARCH_NAMESPACE_INPUT}    ${namespace}
    Click Element    //*[contains(text(), "${namespace}")]
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Sleep    2

Add class
    [Arguments]    ${class}=Asiakirja
    Wait until page contains element    ${ADD_NEW_CLASS}    timeout=30
    Click Element    ${ADD_NEW_CLASS}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    ${class}
    Click Element    //*[contains(text(), "${class}")]
    Sleep    2
    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2

Restore profile modifications
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    ${MODEL_1}
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää luokitus")]    timeout=30
    Click Element    //*[contains(text(), "Lisää luokitus")]
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää sisällöntuottaja")]    timeout=30
    Click Element    //*[contains(text(), "Lisää sisällöntuottaja")]
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${REMOVE_LINK}    timeout=30
    Click Element    ${REMOVE_LINK}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Sleep    2
    Page should contain    Testiautomaatio
    Page should contain    Tämä on kuvaus
    Page should contain    Asuminen
    Page should contain    Testiorganisaatio
    Page should not contain    www.suomi.fi/etusivu/
    Log to Console    Modifications restored
    Sleep    2
    Go back to Data Vocabularies frontpage

Restore Core Vocabulary modifications
    Wait until page contains element    ${CORE_VOCABULARY_LABEL_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_LABEL_INPUT}    ${CORE_VOCABULARY_1}
    Wait until page contains element    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${CORE_VOCABULARY_DESCRIPTION_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${REMOVE_CLASSIFICATION}    timeout=30
    Click Element    ${REMOVE_CLASSIFICATION}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää luokitus")]    timeout=30
    Click Element    //*[contains(text(), "Lisää luokitus")]
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=30
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    ${REMOVE_CONTRIBUTOR}    timeout=30
    Click Element    ${REMOVE_CONTRIBUTOR}
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Lisää sisällöntuottaja")]    timeout=30
    Click Element    //*[contains(text(), "Lisää sisällöntuottaja")]
    Wait until page contains element    //*[contains(text(), "Testiorganisaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiorganisaatio")]
    Wait until page contains element    ${REMOVE_LINK}    timeout=30
    Click Element    ${REMOVE_LINK}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Sleep    2
    Page should contain    Automaatiokirjasto
    Page should contain    Tämä on kuvaus
    Page should contain    Asuminen
    Page should contain    Testiorganisaatio
    Page should not contain    www.suomi.fi/etusivu/
    Log to Console    Modifications restored
    Sleep    2
    Go back to Data Vocabularies frontpage
