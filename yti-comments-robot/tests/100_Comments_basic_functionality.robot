*** Settings ***
Documentation     Test Suite for Comment Round Tool basic functionality
Suite Setup       Test Case Suite Setup Generic Setup
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown
Test Setup        Test Case Setup admin
Resource          ../resources/resources_and_libraries.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    test    100
    Click Element with wait     ${INFORMATION_LINK}      timeout=30
    Wait Until Page Contains    Tietoa Kommentit-työkalusta    timeout=20
    Wait Until Page Contains    Katso myös    timeout=20
    Wait Until Page Contains    Ota yhteyttä    timeout=20

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    test    100
    Click Element with wait    ${LICENSE_LINK}      timeout=20
    Switch window with wait    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly
    [Tags]    local
    Click Element with wait    ${DESCRIPTION_OF_FILE_LINK}      timeout=20
    Switch window with wait  url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    ...    Check that language settings do not change in page reload.
    [Tags]    regression    test    100
    Click Element with wait     ${LANGUAGE_DROPDOWN_BTN}        timeout=40
    Click Element with wait     ${LANGUAGE_EN}                  timeout=20
    Wait Until Page Contains    Comments - ${ENVIRONMENT_IDENTIFIER}    timeout=30
    Wait Until Page Contains    Add new comment round    timeout=30
    Wait Until Page Contains    All tools    timeout=30
    Wait Until Page Contains    All organizations    timeout=30
    Wait Until Page Contains    All statuses    timeout=30
    Reload Page
    Wait Until Page Contains    Add new comment round    timeout=30
    Wait Until Page Contains    All tools    timeout=30
    Wait Until Page Contains    All organizations    timeout=30
    Wait Until Page Contains    All statuses    timeout=30
    Restore Finnish Language

104. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test    100
    [Setup]    Test Case Setup Superuser
    Select Navigation Menu Link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=20
    Wait Until Page Contains    Nimi    timeout=20
    Wait Until Page Contains    Sähköposti    timeout=20
    Wait Until Page Contains    Organisaatiot ja roolit    timeout=20
    Select Navigation Menu Link    yhteentoimiva.suomi.fi

    Switch window with wait  title=Yhteentoimivuusalusta | Suomidigi
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Select Navigation Menu Link    Suomi.fi-koodistot

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait Until Page Contains    Koodistot    timeout=40
    Wait Until Page Contains    Hae koodistoa    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit
    Select Navigation Menu Link    Suomi.fi-sanastot

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Sanastot    timeout=40
    Wait Until Page Contains    Hae sanastoja    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window

    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Kommentit

    Select Navigation Menu Link    Suomi.fi-tietomallit
    Switch window with wait  title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
