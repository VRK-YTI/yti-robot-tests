*** Settings ***
Documentation     Test Suite for basic functionality of Datamodel application
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup Admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${Application_profile_text}    Onnittelut soveltamisprofiilin luomisessa onnistumisesta!
${Core_vocabulary_text}    Onnittelut tietokomponenttikirjaston luomisessa onnistumisesta!
${Namespace_text}    Onnittelut nimiavaruuden lisäämisessä onnistumisesta!
${Create_class_text}    Onnittelut uuden luokan lisäämisessä onnistumisesta!
${Specialize_class_text}    Onnittelut luokan erikoistamisessa onnistumisesta!
${Add_attribute_text}    Onnittelut attribuutin lisäämisessä onnistumisesta!
${Add_association_text}    Onnittelut assosiaation lisäämisessä onnistumisesta!

${LANGUAGE_DROPDOWN_BTN}    id=ui_language_dropdown
${LANGUAGE_EN}    id=en_ui_language_dropdown
${LANGUAGE_FI}    id=fi_ui_language_dropdown

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    tietomallit    test    100
    Click Element with wait     ${INFORMATION_LINK}                         timeout=30

    Wait Until Page Contains    Tietoa Tietomalleista                       timeout=20
    Wait Until Page Contains    Tietomallit-työkalu on tarkoitettu          timeout=20
    Wait Until Page Contains    Tietomallit-työkalu                         timeout=20
    Wait Until Page Contains    Hyödyt käyttäjille                          timeout=20
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi?    timeout=20
    Wait Until Page Contains    Katso myös                                  timeout=20
    Wait Until Page Contains    Ota yhteyttä                                timeout=20

    Click Element with wait     ${MAIN_PAGE_LINK}

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    tietomallit    test    100
    Click Element with wait   ${EUPL_LICENSE_LINK}      timeout=20

    Switch window with wait         url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains        European Union Public Licence    timeout=30
    Wait Until Page Contains        What is the EUPL?    timeout=30

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    regression    tietomallit    test    100
    Click Element with wait     ${DESCRIPTION_OF_FILE_LINK}    timeout=20
    Switch window with wait     url=https://wiki.dvv.fi/display/YTIJD/Tietosuojaseloste

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    tietomallit    test    100
    Change user interface language      ${LANGUAGE_EN}
    Wait Until Page Contains            Data Vocabularies   timeout=20
    Wait Until Page Contains            All organizations   timeout=20
    Wait Until Page Contains            All model types     timeout=20
    Change user interface language      ${LANGUAGE_FI}

106. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    tietomallit    test    100
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Sähköposti    timeout=20
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=20

    Select navigation menu link    yhteentoimiva.suomi.fi
    Switch window with wait    title=Yhteentoimivuusalusta | Suomidigi
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Select navigation menu link    Suomi.fi-sanastot

    Switch window with wait     NEW
    Wait Until Page Contains    Sanastot    timeout=20
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Select navigation menu link    Suomi.fi-koodistot
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=20
    Wait Until Page Contains    Etusivu    timeout=20
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Select navigation menu link    Suomi.fi-kommentit

    Switch window with wait    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Wait Until Page Contains    Kommentit    timeout=20
    Wait Until Page Contains    Etusivu    timeout=20
    Wait Until Page Contains    Rajaa hakutuloksia    timeout=20
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit

    Change user interface language    ${LANGUAGE_EN}
    Click Element with wait     ${NAVIGATION_MENU_DDL}        timeout=20
    Wait Until Page Contains    User details                timeout=20
    Wait Until Page Contains    yhteentoimiva.suomi.fi      timeout=20
    Wait Until Page Contains    Suomi.fi Terminologies      timeout=20
    Wait Until Page Contains    Suomi.fi Reference Data     timeout=20
    Wait Until Page Contains    User right management       timeout=20
    Wait Until Page Contains    Suomi.fi Comments           timeout=20

114. Open CC BY 4.0 license page
    [Documentation]    Verify that CC BY 4.0 license page is opened correctly.
    [Tags]    regression    tietomallit    test     100
    Click Element with wait    ${LICENSE_ICON_TEXT_LINK}    timeout=30

    Switch window with wait  title=Creative Commons — Attribution 4.0 International — CC BY 4.0
    Wait Until Page Contains    Attribution 4.0 International    timeout=20

115. Check URI links
    [Documentation]    Check that URI links are working correctly
    [Tags]    regression    tietomallit    test    100
    GO To    http://uri.suomi.fi/datamodel/ns/jhs
    Wait Until Page Contains    Julkishallinnon tietokomponentit    timeout=30
    Title Should Be    Tietomallit

    GO To    http://uri.suomi.fi/datamodel/ns/jhs?env=awsdev
    Wait Until Page Contains    Julkishallinnon tietokomponentit    timeout=30
    Title Should Be    AWSDEV - Tietomallit

    GO To    http://uri.suomi.fi/datamodel/ns/jhs?env=awstest
    Wait Until Page Contains    Julkishallinnon tietokomponentit    timeout=30
    Title Should Be    AWSTEST - Tietomallit

116. Create and delete profile
    [Documentation]    Create and delete profile
    [Tags]    regression    tietomallit    test    100
    Create Profile              ${MODEL_1}    ${PREFIX_1}
    Delete datamodel            ${MODEL_1}
    [Teardown]  run keyword if test failed   Test Case Teardown Delete model    ${PREFIX_1}

117. Create and delete vocabulary
    [Documentation]    Create and delete vocabulary
    [Tags]    regression    tietomallit    test    100
    Create Core Vocabulary  ${CORE_VOCABULARY_1}   ${PREFIX_2}
    Delete datamodel        ${CORE_VOCABULARY_1}
    [Teardown]  run keyword if test failed      Test Case Teardown Delete model    ${PREFIX_2}

*** Keywords ***
Change user interface language
    [Arguments]    ${language}
    Click Element with wait    ${LANGUAGE_DROPDOWN_BTN}
    Click Element with wait    ${language}
