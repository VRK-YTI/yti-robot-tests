*** Settings ***
Documentation     Test Suite for basic functionality of User right management application
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          resources/resources_and_libraries.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Click Element with wait    ${INFORMATION_LINK}      timeout=20
    Wait Until Page Contains    Tietoa Yhteentoimivuusalustan oikeuksienhallinnasta    timeout=20
    Wait Until Page Contains    Katso myös    timeout=20
    Wait Until Page Contains    Ota yhteyttä    timeout=20

101. Open EUPL-1.2 license page
    [Documentation]    Verify that European Union Public Licence page is opened correctly. YTI-877.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Click Element with wait   ${EUPL_LICENCE_LINK}      timeout=20
    Wait Until Keyword Succeeds    90 seconds    5 seconds    Select Window    url=https://ec.europa.eu/info/european-union-public-licence
    Wait Until Page Contains    European Union Public Licence    timeout=30
    Wait Until Page Contains    What is the EUPL?    timeout=30
    Log To Console    EUPL licence page opened
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    rhp
    [Setup]    Test Case Setup
    Click Element with wait    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a       timeout=20
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Click Element with wait    ${LANGUAGE_DROPDOWN_BTN}     timeout=20
    Click Element with wait    ${LANGUAGE_EN}               timeout=20
    Wait Until Page Contains    ORGANIZATIONS    timeout=20
    Wait Until Page Contains    USERS    timeout=20
    [Teardown]    Restore Finnish language

104. Search organization
    [Documentation]    Search for organization with frontpage search function.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Input Text with wait   ${FRONTPAGE_SEARCH_BOX}    ${ORGANIZATION_1}     timeout=30
    Click Element with wait   //*[contains(text(), "${ORGANIZATION_1}")]    timeout=30
    Wait Until Page Contains    ${ORGANIZATION_1}    timeout=30
    Wait Until Page Contains Element    ${EDIT_ORGANIZATION_BTN}    timeout=30

105. Check navigation menu links
    [Documentation]    Verify that navigation menu links are opened correctly
    [Tags]    regression    test
    [Setup]    Test Case Setup
    Select navigation menu link    Käyttäjätiedot
    Wait Until Page Contains    Käyttäjätiedot    timeout=40
    Wait Until Page Contains    Nimi    timeout=40
    Wait Until Page Contains    Sähköposti    timeout=40
    Wait Until Page Contains    Organisaatio ja roolit    timeout=40
    Sleep    1
    Select navigation menu link    yhteentoimiva.suomi.fi
    Select Window    title=Yhteentoimivuusalusta | Suomidigi
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Select navigation menu link    Suomi.fi-sanastot
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Sanastot
    Wait Until Page Contains    Sanastot    timeout=40
    Wait Until Page Contains    Hae sanastoja    timeout=40
    Wait Until Page Contains    Rajaa tietoalueella    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1
    Select navigation menu link    Suomi.fi-tietomallit
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Tietomallit
    Wait Until Page Contains    Tietomallit    timeout=40
    Wait Until Page Contains    Etusivu    timeout=40
    Close Window
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Yhteentoimivuusalustan oikeuksienhallinta
    Sleep    1

*** Keywords ***
Restore Finnish language
    Click Element with wait     ${LANGUAGE_DROPDOWN_BTN}        timeout=20
    Click Element with wait     ${LANGUAGE_FI}                  timeout=20
    Wait Until Page Contains    ORGANISAATIOT                   timeout=20
    Wait Until Page Contains    KÄYTTÄJÄT                       timeout=20
    Close All Browsers

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait     ${NAVIGATION_MENU_DDL}                                  timeout=20
    Click Element with wait     //*[contains(text(), "${navigation_menu_link}")]        timeout=30
