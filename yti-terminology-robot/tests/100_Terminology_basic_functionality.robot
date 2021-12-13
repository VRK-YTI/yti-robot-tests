*** Settings ***
Documentation     Test Suite for basic functionality of Terminology application
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup admin

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=language_dropdown_link
${LANGUAGE_EN}    id=en_language_selection_link
${LANGUAGE_FI}    id=fi_language_selection_link
${NAVIGATION_MENU_DDL}    id=nav_item_dropdown_link

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    sanastot    test    100
    Click Element with wait   id=information_link

    Wait Until Page Contains    Tietoa Sanastoista    timeout=20
    Wait Until Page Contains    Sanastot-työkalu on tarkoitettu    timeout=20
    Wait Until Page Contains    Sanastot-työkalulla    timeout=20
    Wait Until Page Contains    Hyödyt käyttäjille    timeout=20
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi?    timeout=20
    Wait Until Page Contains    Katso myös    timeout=20
    Wait Until Page Contains    Ota yhteyttä    timeout=20

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    sanastot    test    100
    Click Element with wait         ${EUPL_LICENCE_LINK}

    Switch window with wait    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains        European Union Public Licence       timeout=30
    Wait Until Page Contains        What is the EUPL?                   timeout=30

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    regression    sanastot    test    100
    Click Element with wait   id=description_of_file_link
    Switch window with wait     url=https://wiki.dvv.fi/display/YTIJD/Tietosuojaseloste

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    sanastot    test    100
    Click Element with wait     ${LANGUAGE_DROPDOWN_BTN}
    Click Element with wait     ${LANGUAGE_EN}

    Wait Until Page Contains    All organizations       timeout=20
    Wait Until Page Contains    Search terminologies    timeout=20
    Wait Until Page Contains    Filter with information domain

104. Search for DRAFT vocabulary
    [Documentation]    Search for DRAFT vocabulary with frontpage search function.
    [Tags]    regression    sanastot    test    100
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}

    Input Text with wait    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}

    Click Element with wait             //*[contains(text(), "${VOCABULARY_2}")]
    Wait Until Page Contains            ${VOCABULARY_2}    timeout=30
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Wait Until Page Contains Element    ${ADD_NEW_CONCEPT_BTN}    timeout=30

    [Teardown]    Test case teardown delete terminology    ${VOCABULARY_2}

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    sanastot    100

    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=60
    Wait Until Page Contains    Nimi    timeout=60
    Wait Until Page Contains    Sähköposti    timeout=60
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=60
    Wait Until Page Contains    Lähetä käyttöoikeuspyyntö    timeout=60
    Select navigation menu link    yhteentoimiva.suomi.fi

    Switch window with wait    title=Yhteentoimivuusalusta | Suomidigi
    Wait Until Page Contains    Yhteentoimivuusalusta    timeout=60
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Sanastot

    Select navigation menu link    Suomi.fi-koodistot
    Switch window with wait    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=40
    Wait Until Page Contains    Hae koodistoa    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Sanastot

    Select navigation menu link    Suomi.fi-tietomallit
    Switch window with wait    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Hae tietomallia    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Select navigation menu link    Suomi.fi-kommentit

    Switch window with wait    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Wait Until Page Contains    Kommentit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Wait Until Page Contains    Rajaa hakutuloksia    timeout=40
    Close Window

106. Open CC BY 4.0 license page
    [Documentation]    Verify that CC BY 4.0 license page is opened correctly.
    [Tags]    regression    sanastot    test    100
    Click Element with wait     ${LICENSE_ICON_TEXT_LINK}

    Switch window with wait  title=Creative Commons — Attribution 4.0 International — CC BY 4.0
    Wait Until Page Contains    Attribution 4.0 International    timeout=20

107. Check URI links
    [Documentation]    Check that URI links are working correctly
    [Tags]    regression    sanastot    test    100
    GO To    http://uri.suomi.fi/terminology/jhs/
    Wait Until Page Contains    Julkisen hallinnon yhteinen sanasto    timeout=30

    GO To    http://uri.suomi.fi/terminology/jhs/J187
    Wait Until Page Contains    aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30

    GO To    http://uri.suomi.fi/terminology/jhs/?env=awsdev
    Wait Until Page Contains    JHSMETA    timeout=30

    GO To    http://uri.suomi.fi/terminology/jhs/J187?env=awsdev
    Wait Until Page Contains    Aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30

    GO To    http://uri.suomi.fi/terminology/jhs/?env=awstest
    Wait Until Page Contains    Julkisen hallinnon yhteinen sanasto    timeout=30

    GO To    http://uri.suomi.fi/terminology/jhs/J187?env=awstest
    Wait Until Page Contains    aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30


