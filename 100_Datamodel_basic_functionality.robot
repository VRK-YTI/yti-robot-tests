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
${Add_attribute_text}    Onnittelut attribuutin lisäämisessä onnistumisesta!
${Add_association_text}    Onnittelut assosiaation lisäämisessä onnistumisesta!

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    tietomallit    test    100
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    ${INFORMATION_LINK}    timeout=20
    Click Element    ${INFORMATION_LINK}
    Wait Until Page Contains    Tietoa Tietomalleista    timeout=20
    Wait Until Page Contains    Tietomallit-työkalu on tarkoitettu    timeout=20
    Wait Until Page Contains    Tietomallit-työkalu    timeout=20
    Wait Until Page Contains    Hyödyt käyttäjille    timeout=20
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi?    timeout=20
    Wait Until Page Contains    Katso myös    timeout=20
    Wait Until Page Contains    Ota yhteyttä    timeout=20
    [Teardown]    Go back to Data Vocabularies frontpage and close browsers

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    tietomallit    test    100
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    ${EUPL_LICENSE_LINK}    timeout=20
    Click Element    ${EUPL_LICENSE_LINK}
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait Until Page Contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2    timeout=20
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    tietomallit
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    ${DESCRIPTION_OF_FILE_LINK}    timeout=20
    Click Element    ${DESCRIPTION_OF_FILE_LINK}
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    tietomallit    test    100
    [Setup]    Test Case Setup
    Change user interface language    ${LANGUAGE_EN}
    Wait Until Page Contains    Data Vocabularies    timeout=20
    Wait Until Page Contains    All organizations    timeout=20
    Wait Until Page Contains    All model types    timeout=20
    [Teardown]    Change user interface language    ${LANGUAGE_FI}

104. Search for DRAFT model
    [Documentation]    Search for DRAFT model with frontpage search function.
    [Tags]    regression    tietomallit    test    100
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage
    Wait Until Element Is Enabled    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${MODEL_1}
    Wait Until Page Contains Element    //*[contains(text(), "Testiautomaatio")]    timeout=30
    Click Element    //*[contains(text(), "Testiautomaatio")]
    Wait Until Page Contains Element    ${ADD_CLASS_BTN}    timeout=30
    Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Test Case Teardown Delete Testiautomaatio profile

105. Frontpage advanced search
    [Documentation]    Search attribute with frontpage advanced search function.
    [Tags]    regression    tietomallit    test    100
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_ADVANCED_SEARCH}    timeout=30
    Click Element    ${FRONTPAGE_ADVANCED_SEARCH}
    Wait Until Element Is Visible    ${TEXT_FILTER_SEARCH_INPUT}    timeout=30
    Input Text    ${TEXT_FILTER_SEARCH_INPUT}    Entinen nimi
    Wait Until Page Contains Element    //*[contains(text(), "Entinen nimi")]    timeout=30
    Click Element    //*[contains(text(), "Entinen nimi")]
    Sleep    1
    Wait Until Page Contains    Julkishallinnon tietokomponentit    timeout=30
    Wait Until Page Contains    Entinen nimi    timeout=30
    Sleep    2
    [Teardown]    Go back to Data Vocabularies frontpage and close browsers

106. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Sähköposti    timeout=20
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=20
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=yhteentoimiva.suomi.fi – yhteentoimiva.suomi.fi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Select navigation menu link    Suomi.fi-sanastot
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Sanastot    timeout=20
    Wait Until Page Contains    Hae sanastoja    timeout=20
    Wait Until Page Contains    Rajaa tietoalueella    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Select navigation menu link    Suomi.fi-koodistot
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=20
    Wait Until Page Contains    Etusivu    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Select navigation menu link    Suomi.fi-kommentit
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Wait Until Page Contains    Kommentit    timeout=20
    Wait Until Page Contains    Etusivu    timeout=20
    Wait Until Page Contains    Rajaa hakutuloksia    timeout=20
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Sleep    1
    Change user interface language    ${LANGUAGE_EN}
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains    User details    timeout=20
    Wait Until Page Contains    yhteentoimiva.suomi.fi    timeout=20
    Wait Until Page Contains    Suomi.fi Terminologies    timeout=20
    Wait Until Page Contains    Suomi.fi Reference Data    timeout=20
    Wait Until Page Contains    User right management    timeout=20
    Wait Until Page Contains    Suomi.fi Comments    timeout=20
    Close All Browsers

107. Guide through creating new Core Vocabulary
    [Documentation]    Guide through creating new Core Vocabulary
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    #Sleep    1
    Wait Until Page Contains Element    ${GUIDE_CORE_VOCABULARY}    timeout=20
    Click Element    ${GUIDE_CORE_VOCABULARY}
    Click through guide    ${Core_vocabulary_text}
    #Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

108. Guide through creating new Application Profile
    [Documentation]    Guide through creating new Application Profile
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Go back to Data Vocabularies frontpage
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_APPLICATION_PROFILE}    timeout=20
    Click Element    ${GUIDE_APPLICATION_PROFILE}
    Click through guide    ${Application_profile_text}
    Sleep    1
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

109. Guide through requiring a namespace
    [Documentation]    Guide through requiring a namespace
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_NAMESPACE}    timeout=20
    Click Element    ${GUIDE_NAMESPACE}
    Click through guide    ${Namespace_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

110. Guide through creating a class
    [Documentation]    Guide through creating a class
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_CREATE_CLASS}    timeout=20
    Click Element    ${GUIDE_CREATE_CLASS}
    Click through guide    ${Create_class_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

111. Guide through specializing a class
    [Documentation]    Guide through specializing a class
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_SPECIALIZE_CLASS}    timeout=20
    Click Element    ${GUIDE_SPECIALIZE_CLASS}
    Click through guide    ${Specialize_class_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

112. Guide through adding an attribute
    [Documentation]    Guide through adding an attribute
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_ADD_ATTRIBUTE}    timeout=20
    Click Element    ${GUIDE_ADD_ATTRIBUTE}
    Click through guide    ${Add_attribute_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

113. Guide through adding an association
    [Documentation]    Guide through adding an association
    [Tags]    tietomallit
    [Setup]    Test Case Setup Create Testiautomaatio profile
    Select model    ${MODEL_1}
    Wait Until Page Contains Element    ${GUIDE_BTN}    timeout=20
    Click Element    ${GUIDE_BTN}
    Sleep    1
    Wait Until Page Contains Element    ${GUIDE_ADD_ASSOCIATION}    timeout=20
    Click Element    ${GUIDE_ADD_ASSOCIATION}
    Click through guide    ${Add_association_text}
    Go back to Data Vocabularies frontpage
    [Teardown]    Delete profile    ${MODEL_1}

114. Open CC BY 4.0 license page
    [Documentation]    Verify that CC BY 4.0 license page is opened correctly.
    [Tags]    regression    tietomallit
    [Setup]    Test Case Setup
    Wait Until Page Contains Element    ${LICENSE_ICON_TEXT_LINK}    timeout=20
    Click Element    ${LICENSE_ICON_TEXT_LINK}
    Select Window    title=Creative Commons — Attribution 4.0 International — CC BY 4.0
    Wait Until Page Contains    Attribution 4.0 International    timeout=20
    Sleep    2
    Log To Console    CC BY 4.0 license page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit

*** Keywords ***
Restore Finnish language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}    timeout=20
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Wait Until Page Contains Element    ${LANGUAGE_FI}    timeout=20
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    Kaikki organisaatiot    timeout=20
    Wait Until Page Contains    Kaikki tyypit    timeout=20
    Wait Until Page Contains    Luokitus    timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}=Käyttäjätiedot
    Wait Until Page Contains Element    ${NAVIGATION_MENU_DDL}    timeout=20
    Click Element    ${NAVIGATION_MENU_DDL}
    Wait Until Page Contains Element    //*[contains(text(), "${navigation_menu_link}")]    timeout=30
    Click Element    //*[contains(text(), "${navigation_menu_link}")]
    Sleep    2

Change user interface language
    [Arguments]    ${language}
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}    timeout=20
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Sleep    2
    Click Element    ${language}
    Sleep    2

Click through guide
    [Arguments]    ${final_text}
    : FOR    ${ClickNext}    IN RANGE    300
    \    ${Next}    Get Text    ${GUIDE_NEXT_BTN}
    \    Page Should Contain    ${Next}
    \    Wait Until Page Contains Element    ${GUIDE_NEXT_BTN}    timeout=20
    \    Click Element    ${GUIDE_NEXT_BTN}
    \    ${exit}=    Run Keyword And Return Status    Page Should Contain element    //*[contains(text(), "${final_text}")]
    \    Exit For Loop If    ${exit}
    Wait Until Page Contains Element    ${GUIDE_CLOSE_BTN}    timeout=20
    Click Element    ${GUIDE_CLOSE_BTN}
    Log To Console    Guide through succesfully!
    Sleep    3
