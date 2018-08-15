*** Settings ***
Documentation     Test Suite for basic functionality of Data Vocabularies application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Variables ***
${class}          Asiakirja
${namespace}      Julkishallinnon tietokomponentit
${attribute}      Entinen nimi
${association}    Jäsen
${classification}    Asuminen
${contributor}    Testiorganisaatio

*** Test Cases ***
200. Modify profile
    [Documentation]    Modify existing profile
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Wait until page contains element    ${MODEL_LABEL_INPUT}    timeout=30
    Input Text    ${MODEL_LABEL_INPUT}    Uusi nimi
    Wait until page contains element    ${MODEL_DESCRIPTION_INPUT}    timeout=30
    Input Text    ${MODEL_DESCRIPTION_INPUT}    Uusi kuvaus
    Wait until page contains element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log to Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log to Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
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
    Wait until page contains element    //*[contains(text(), "Tallenna")]    timeout=30
    Click Element    //*[contains(text(), "Tallenna")]
    Log to Console    Modifications saved
    Sleep    2
    Page should contain    Uusi nimi
    Page should contain    Uusi kuvaus
    Page should contain    Kulttuuri
    Page should contain    Väestörekisterikeskus
    Page should contain    www.suomi.fi/etusivu/
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Uusi nimi profile

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
    Confirm all properties for class
    Save class
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
    Wait until page contains element    ${REMOVE_Asuminen}    timeout=30
    Click Element    ${REMOVE_Asuminen}
    Log to Console    Classification removed
    Sleep    1
    Add classification    Kulttuuri
    Log to Console    New classification added
    Wait until page contains element    ${REMOVE_Testiorganisaatio}    timeout=30
    Click Element    ${REMOVE_Testiorganisaatio}
    Log to Console    Contributor removed
    Sleep    1
    Add contributor    Väestörekisterikeskus
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
    Sleep    2
    Page should contain    Uusi nimi
    Page should contain    Uusi kuvaus
    Page should contain    Kulttuuri
    Page should contain    Väestörekisterikeskus
    Page should contain    www.suomi.fi/etusivu/
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Uusi nimi profile

204. Add new attribute and association
    [Documentation]    Add new attribute and association for class
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Add class    Henkilö
    Sleep    2
    Confirm all properties for class
    Save class
    Log to Console    Class "Henkilö" added
    Add attribute    Entinen nimi
    Save class
    Log to Console    Attribute "Entinen nimi" added to class "Henkilö"
    Sleep    2
    Add association    Jäsen
    Save class
    Log to Console    Association "Jäsen" added to class "Henkilö"
    Sleep    2
    Page should contain    Entinen nimi
    Page should contain    Jäsen
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Testiautomaatio profile

205. Add association between two classes
    [Documentation]    Add association between two classes
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select and edit Testiautomaatio profile
    Log to Console    Testiautomaatio profile selected
    Import namespace
    Log to Console    Namespace "Julkishallinnon tietokomponentit" added
    Add class    Henkilö
    Sleep    2
    Confirm all properties for class
    Log to Console    Class "Henkilö" added
    Add class    Asiakirja
    Sleep    2
    Confirm all properties for class
    Log to Console    Class "Asiakirja" added
    Sleep    1
    Add association    Rekisteröinti
    Log to Console    Association "Rekisteröinti" added
    Wait until page contains element    ${VALUE_CLASS_BTN}    timeout=30
    Click Element    ${VALUE_CLASS_BTN}
    Wait until page contains element    ${SEARCH_CLASS_INPUT}    timeout=30
    Input Text    ${SEARCH_CLASS_INPUT}    Henkilö
    Click Element    //*[contains(text(), "Henkilö")]
    Sleep    2
    Wait until page contains element    ${SPECIALIZE_CLASS}    timeout=30
    Click Element    ${SPECIALIZE_CLASS}
    Sleep    2
    Save class
    Page should contain    Rekisteröinti
    Page should contain    test:Henkilo
    Log to Console    Association "Rekisteröinti" added between "Henkilö" and "Asiakirja"
    Sleep    3
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete Testiautomaatio profile

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

Add classification
    [Arguments]    ${classification}=Asuminen
    Wait until page contains element    ${ADD_CLASSIFICATION}    timeout=30
    Click Element    ${ADD_CLASSIFICATION}
    Wait until page contains element    //*[contains(text(), "${classification}")]    timeout=30
    Click Element    //*[contains(text(), "${classification}")]
    Sleep    2

Add contributor
    [Arguments]    ${contributor}=Testiorganisaatio
    Wait until page contains element    ${ADD_CONTRIBUTOR}    timeout=30
    Click Element    ${ADD_CONTRIBUTOR}
    Wait until page contains element    //*[contains(text(), "${contributor}")]    timeout=30
    Click Element    //*[contains(text(), "${contributor}")]
    Sleep    2

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

Save class
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Sleep    2

Confirm all properties for class
    Wait until page contains element    ${CONFIRM_ADD_PROPERTIES}    timeout=30
    Click Element    ${CONFIRM_ADD_PROPERTIES}
    Sleep    2
    Wait until page contains element    ${SAVE_CLASS}    timeout=30
    Click Element    ${SAVE_CLASS}
    Sleep    2

Add attribute
    [Arguments]    ${attribute}=Entinen nimi
    Wait until page contains element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait until page contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until page contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait until page contains element    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    #Click Element    ${ATTRIBUTE_TYPE}
    Click Element    //*[contains(text(), "Attribuutti")]
    Wait until page contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${attribute}
    Click Element    //*[contains(text(), "${attribute}")]
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Add association
    [Arguments]    ${association}=Jäsen
    Wait until page contains element    ${MODIFY_CLASS}    timeout=30
    Click Element    ${MODIFY_CLASS}
    Wait until page contains element    ${ADD_PROPERTY_DDL}    timeout=30
    Click Element    ${ADD_PROPERTY_DDL}
    Wait until page contains element    ${ADD_PROPERTY_BTN}    timeout=30
    Click Element    ${ADD_PROPERTY_BTN}
    Wait until page contains element    ${ALL_TYPES_DDL}    timeout=30
    Click Element    ${ALL_TYPES_DDL}
    #Click Element    ${ASSOCIATION_TYPE}
    Click Element    //*[contains(text(), "Assosiaatio")]
    Wait until page contains element    ${SEARCH_ATTRIBUTE_INPUT}    timeout=30
    Input Text    ${SEARCH_ATTRIBUTE_INPUT}    ${association}
    Click Element    //*[contains(text(), "${association}")]
    Wait until page contains element    ${USE_SELECTION_BTN}    timeout=30
    Click Element    ${USE_SELECTION_BTN}
    Sleep    2

Delete Uusi nimi profile
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    Uusi nimi
    Wait until page contains element    //*[contains(text(), "Uusi nimi")]    timeout=30
    Click Element    //*[contains(text(), "Uusi nimi")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${REMOVE_MODEL_BTN}
    Wait until page contains element    ${CONFIRM_REMOVE_MODEL_BTN}    timeout=30
    Click Element    ${CONFIRM_REMOVE_MODEL_BTN}
    Sleep    2
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    Uusi nimi
    Wait Until Page Contains    tietomallia    timeout=30
    Log to Console    "Uusi nimi" profile deleted
    Sleep    2
    Close All Browsers
