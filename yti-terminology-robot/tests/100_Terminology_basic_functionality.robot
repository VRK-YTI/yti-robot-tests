*** Settings ***
Documentation     Test Suite for basic functionality of Terminology application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${IMPERSONATE_USER_DROPDOWN}=  fakeable_user_dropdown
${LANGUAGE_DROPDOWN_BTN}    id=ui_language_dropdown
${LANGUAGE_EN}    id=en_language_selection_link
${LANGUAGE_FI}    id=fi_language_selection_link

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    id=information_link    timeout=20
    Click Element    id=information_link
    Wait Until Page Contains    Tietoa Sanastoista    timeout=20
    Wait Until Page Contains    Sanastot-työkalu on tarkoitettu    timeout=20
    Wait Until Page Contains    Sanastot-työkalulla    timeout=20
    Wait Until Page Contains    Hyödyt käyttäjille    timeout=20
    Wait Until Page Contains    Miten voin liittyä työkalun käyttäjäksi?    timeout=20
    Wait Until Page Contains    Katso myös    timeout=20
    Wait Until Page Contains    Ota yhteyttä    timeout=20
    Log To Console    Information about the service page opened    timeout=20
    Go Back To Sanastot Frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${EUPL_LICENCE_LINK}    timeout=20
    Click Element    ${EUPL_LICENCE_LINK}
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30
    Log To Console    European Union Public Licence page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    sanastot
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    id=description_of_file_link    timeout=20
    Click Element    id=description_of_file_link
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Log To Console    Description of file page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_EN}
    Wait Until Page Contains    All organizations    timeout=20
    Wait Until Page Contains    Search terminologies    timeout=20
    Wait Until Page Contains    Filter with information domain
    Log To Console    User interface language changed
    [Teardown]    Restore Finnish language

104. Search for DRAFT vocabulary
    [Documentation]    Search for DRAFT vocabulary with frontpage search function.
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Create Terminological Vocabulary without concepts    ${VOCABULARY_2}
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${VOCABULARY_2}
    Wait Until Page Contains Element    //*[contains(text(), "${VOCABULARY_2}")]    timeout=30
    Click Element    //*[contains(text(), "${VOCABULARY_2}")]
    Wait Until Page Contains    ${VOCABULARY_2}    timeout=30
    Wait Until Page Contains Element    ${TERMINOLOGY_TAB}    timeout=30
    Wait Until Page Contains Element    ${ADD_NEW_CONCEPT_BTN}    timeout=30
    Log To Console    Terminology found
    Go Back To Sanastot Frontpage
    [Teardown]    Delete Terminology    ${VOCABULARY_2}

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    sanastot    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=60
    Wait Until Page Contains    Nimi    timeout=60
    Wait Until Page Contains    Test Admin    timeout=60
    Wait Until Page Contains    Sähköposti    timeout=60
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=60
    Wait Until Page Contains    Lähetä käyttöoikeuspyyntö    timeout=60
    Select navigation menu link    yhteentoimiva.suomi.fi
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=Yhteentoimivuusalusta | Suomidigi
    Wait Until Page Contains    Yhteentoimivuusalusta    timeout=60
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Select navigation menu link    Suomi.fi-koodistot
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=40
    Wait Until Page Contains    Hae koodistoa    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Select navigation menu link    Suomi.fi-tietomallit
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Hae tietomallia    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Select navigation menu link    Suomi.fi-kommentit
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Wait Until Page Contains    Kommentit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Wait Until Page Contains    Rajaa hakutuloksia    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Close All Browsers

106. Open CC BY 4.0 license page
    [Documentation]    Verify that CC BY 4.0 license page is opened correctly.
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Wait Until Page Contains Element    ${LICENSE_ICON_TEXT_LINK}    timeout=20
    Click Element    ${LICENSE_ICON_TEXT_LINK}
    Select Window    title=Creative Commons — Attribution 4.0 International — CC BY 4.0
    Wait Until Page Contains    Attribution 4.0 International    timeout=20
    Sleep    2
    Log To Console    CC BY 4.0 license page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot

107. Check URI links
    [Documentation]    Check that URI links are working correctly
    [Tags]    regression    sanastot    test    100
    [Setup]    Test Case Setup    ${TEST_ADMIN_ID}    ${TEST_ADMIN_NAME}
    Open Sanastot
    Set Selenium Speed    ${SELENIUM_SPEED}
    GO To    http://uri.suomi.fi/terminology/jhs/
    Wait Until Page Contains    Julkisen hallinnon yhteinen sanasto    timeout=30
    Sleep    2
    GO To    http://uri.suomi.fi/terminology/jhs/J187
    Wait Until Page Contains    aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30
    Sleep    2
    GO To    http://uri.suomi.fi/terminology/jhs/?env=awsdev
    Wait Until Page Contains    JHSMETA    timeout=30
    Sleep    2
    GO To    http://uri.suomi.fi/terminology/jhs/J187?env=awsdev
    Wait Until Page Contains    aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30
    Sleep    2
    GO To    http://uri.suomi.fi/terminology/jhs/?env=awstest
    Wait Until Page Contains    Julkisen hallinnon yhteinen sanasto    timeout=30
    Sleep    2
    GO To    http://uri.suomi.fi/terminology/jhs/J187?env=awstest
    Wait Until Page Contains    aihe    timeout=30
    Wait Until Page Contains    URI    timeout=30
    Wait Until Page Contains    http://uri.suomi.fi/terminology/jhs/J187    timeout=30
    Sleep    2

*** Keywords ***
Restore Finnish language
    Wait Until Page Contains Element    ${LANGUAGE_DROPDOWN_BTN}    timeout=30
    Click Element    ${LANGUAGE_DROPDOWN_BTN}
    Click Element    ${LANGUAGE_FI}
    Wait Until Page Contains    Kaikki organisaatiot    timeout=30
    Wait Until Page Contains    Rajaa tietoalueella    timeout=30
    Close All Browsers
