*** Settings ***
Documentation     Test Suite for basic functionality of Datamodel application
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup
    Wait until page contains element    //application/ng-container/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=20
    Click element    //application/ng-container/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait until page contains    Tietoa Tietomalleista
    Wait until page contains    Tietomallit-työkalu on tarkoitettu
    Wait until page contains    Tietomallit-työkalu
    Wait until page contains    Hyödyt käyttäjille
    Wait until page contains    Miten voin liittyä työkalun käyttäjäksi?
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Go back to Data Vocabularies frontpage and close browsers

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup
    Wait until page contains element    //application/ng-container/app-footer/div/div[2]/div[3]/a    timeout=20
    Click element    //application/ng-container/app-footer/div/div[2]/div[3]/a
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=Tietomallit
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    tietomallit
    [Setup]    Test Case Setup
    Wait until page contains element    //a[@target='_blank'][contains(text(),'Tietosuojaseloste')]    timeout=20
    Click element    //a[@target='_blank'][contains(text(),'Tietosuojaseloste')]
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=Tietomallit
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_EN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    All types    timeout=20
    [Teardown]    Restore Finnish language

104. Search for DRAFT model
    [Documentation]    Search for DRAFT model with frontpage search function.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "${MODEL_1}")]    timeout=30
    Sleep    1
    Click element    //*[contains(text(), "${MODEL_1}")]
    Wait until page contains    ${MODEL_1}    timeout=30
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click element    ${SHOW_MODEL_DETAILS_BTN}
    Wait until page contains element    ${ADD_CLASS_BTN}    timeout=30
    Sleep    5
    Go back to Data Vocabularies frontpage
    [Teardown]    Test Case Teardown Delete Testiautomaatio profile

105. Frontpage advanced search
    [Documentation]    Search attribute with frontpage advanced search function.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_ADVANCED_SEARCH}    timeout=30
    Click Element    ${FRONTPAGE_ADVANCED_SEARCH}
    Wait Until Element Is Visible    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Entinen nimi
    Wait until page contains element    //*[contains(text(), "Entinen nimi")]    timeout=30
    Click element    //*[contains(text(), "Entinen nimi")]
    Sleep    1
    Wait until page contains    Julkishallinnon tietokomponentit    timeout=30
    Wait until page contains    Entinen nimi    timeout=30
    Sleep    2
    [Teardown]    Go back to Data Vocabularies frontpage and close browsers

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_FI}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    Kaikki organisaatiot    timeout=20
    Wait until page contains    Kaikki tyypit    timeout=20
    Wait until page contains    Luokitus    timeout=20
    Close All Browsers
