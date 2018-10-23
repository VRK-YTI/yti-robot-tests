*** Settings ***
Documentation     Test Suite for basic functionality of Datamodel application
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/Datamodel_Resources.robot

*** Variables ***
${Application_profile_text}    Onnittelut soveltamisprofiilin luomisessa onnistumisesta!
${Core_vocabulary_text}    Onnittelut tietokomponenttikirjaston luomisessa onnistumisesta!
${Namespace_text}    Onnittelut nimiavaruuden lisäämisessä onnistumisesta!
${Create_class_text}    Onnittelut uuden luokan lisäämisessä onnistumisesta!
${Specialize_class_text}    Onnittelut luokan erikoistamisessa onnistumisesta!
${Add_attribute_text}    Onnittelut attribuutin lisäämisessä onnstumisesta!
${Add_association_text}    Onnittelut assosiaation lisäämisessä onnistumisesta!

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
    Change user interface language    ${LANGUAGE_EN}
    Wait until page contains    Data Vocabularies    timeout=20
    Wait until page contains    All organizations    timeout=20
    Wait until page contains    All types    timeout=20
    [Teardown]    Change user interface language    ${LANGUAGE_FI}

104. Search for DRAFT model
    [Documentation]    Search for DRAFT model with frontpage search function.
    [Tags]    regression    tietomallit    test
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Wait until page contains element    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait until page contains element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait until page contains element    ${SHOW_MODEL_DETAILS_BTN}    timeout=30
    Click Element    ${SHOW_MODEL_DETAILS_BTN}
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

106. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait until page contains    Käyttäjätiedot
    Wait until page contains    Nimi
    Wait until page contains    Sähköposti
    Wait until page contains    Organisaatiot ja roolit
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=Tietomallit
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=Sanastot
    Wait until page contains    Sanastot
    Wait until page contains    Hae sanastoja
    Wait until page contains    Rajaa tietoalueella
    Close Window
    Select Window    title=Tietomallit
    Sleep    1
    Select navigation menu link    Suomi.fi-koodistot
    Select Window    title=Koodistot
    Wait until page contains    Koodistot
    Wait until page contains    Etusivu
    Close Window
    Select Window    title=Tietomallit
    Sleep    1
    Change user interface language    ${LANGUAGE_EN}
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains    User details
    Wait until page contains    yhteentoimiva.suomi.fi
    Wait until page contains    Suomi.fi Controlled Vocabularies
    Wait until page contains    Suomi.fi Reference Data
    Wait until page contains    User right management
    Close All Browsers

107. Guide through creating new Core Vocabulary
    [Documentation]    Guide through creating new Core Vocabulary
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_CORE_VOCABULARY}    timeout=20
    Click element    ${GUIDE_CORE_VOCABULARY}
    Click through guide    ${Core_vocabulary_text}
    Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

108. Guide through creating new Application Profile
    [Documentation]    Guide through creating new Application Profile
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_APPLICATION_PROFILE}    timeout=20
    Click element    ${GUIDE_APPLICATION_PROFILE}
    Click through guide    ${Application_profile_text}
    Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

109. Guide through requiring a namespace
    [Documentation]    Guide through requiring a namespace
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_NAMESPACE}    timeout=20
    Click element    ${GUIDE_NAMESPACE}
    Click through guide    ${Namespace_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

110. Guide through creating a class
    [Documentation]    Guide through creating a class
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_CREATE_CLASS}    timeout=20
    Click element    ${GUIDE_CREATE_CLASS}
    Click through guide    ${Create_class_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

111. Guide through specializing a class
    [Documentation]    Guide through specializing a class
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_SPECIALIZE_CLASS}    timeout=20
    Click element    ${GUIDE_SPECIALIZE_CLASS}
    Click through guide    ${Specialize_class_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

112. Guide through adding an attribute
    [Documentation]    Guide through adding an attribute
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_ADD_ATTRIBUTE}    timeout=20
    Click element    ${GUIDE_ADD_ATTRIBUTE}
    Click through guide    ${Add_attribute_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

113. Guide through adding an association
    [Documentation]    Guide through adding an association
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait until page contains element    ${GUIDE_BTN}    timeout=20
    Click element    ${GUIDE_BTN}
    Sleep    1
    Wait until page contains element    ${GUIDE_ADD_ASSOCIATION}    timeout=20
    Click element    ${GUIDE_ADD_ASSOCIATION}
    Click through guide    ${Add_association_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

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

Select navigation menu link
    [Arguments]    ${navigation_menu_link}=Käyttäjätiedot
    Wait until page contains element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click element    ${NAVIGATION_MENU_DDL}
    Wait until page contains element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2

Change user interface language
    [Arguments]    ${language}
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    2
    Click element    ${language}
    Sleep    2

Click through guide
    [Arguments]    ${final_text}
    : FOR    ${ClickNext}    IN RANGE    300
    \    ${Next}    Get Text    ${GUIDE_NEXT_BTN}
    \    Page Should Contain    ${Next}
    \    Wait until page contains element    ${GUIDE_NEXT_BTN}    timeout=20
    \    Click element    ${GUIDE_NEXT_BTN}
    \    ${exit}=    Run Keyword And Return Status    Page Should Contain element    //*[contains(text(), "${final_text}")]
    \    Exit For Loop If    ${exit}
    Wait until page contains element    ${GUIDE_CLOSE_BTN}    timeout=20
    Click element    ${GUIDE_CLOSE_BTN}
    Log to Console    Guide through succesfully!
    Sleep    3
