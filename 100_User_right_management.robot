*** Settings ***
Documentation     Test Suite for basic functionality of User right management application
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          resources/User_right_management_Resources.robot
Resource          resources/Login_details.robot

*** Test Cases ***
100. Open Information about the service page
    [Documentation]    Verify that Information about the service page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[2]/ul/li[1]/a
    Wait until page contains    Tietoa yhteentoimivuusalustan oikeuksienhallinnasta (käyttövaltuuksien hallinnasta)
    Wait until page contains    Katso myös
    Wait until page contains    Ota yhteyttä
    [Teardown]    Go back to RHP frontpage

101. Open EUPL-1.2 license page
    [Documentation]    Verify that EUPL-1.2 license page is opened correctly.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[3]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[3]/a
    Select Window    title=EUPL - v1.2 [FI / suomi]
    Wait until page contains    EUROOPAN UNIONIN YLEINEN LISENSSI v. 1.2
    Sleep    2
    Select Window    title=Yhteentoimivuusalustan oikeuksienhallinta
    Close All Browsers

102. Open Description of file page
    [Documentation]    Verify that Description of file page is opened correctly.
    [Tags]    local    rhp
    [Setup]    Test Case Setup
    Wait until page contains element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a    timeout=20
    Click element    //app-root/app-footer/div/div[2]/div[2]/ul/li[2]/a
    Select Window    url=https://yhteentoimiva.suomi.fi/tietosuojaseloste.pdf
    Sleep    2
    Select Window    title=Yhteentoimivuusalustan oikeuksienhallinta
    Close All Browsers

103. Change user interface language
    [Documentation]    Change user interface language in English and in Finnish.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_EN}
    Click element    ${LANGUAGE_EN}
    Wait until page contains    ORGANIZATIONS    timeout=20
    Wait until page contains    USERS    timeout=20
    [Teardown]    Restore Finnish language

104. Search organization
    [Documentation]    Search for organization with frontpage search function.
    [Tags]    regression    rhp    test
    [Setup]    Test Case Setup
    Wait Until Element Is Visible    ${FRONTPAGE_SEARCH_BOX}    timeout=30
    Input Text    ${FRONTPAGE_SEARCH_BOX}    ${ORGANIZATION_1}
    Wait until page contains element    //*[contains(text(), "${ORGANIZATION_1}")]    timeout=30
    Click element    //*[contains(text(), "${ORGANIZATION_1}")]
    Wait until page contains    ${ORGANIZATION_1}    timeout=30
    Wait until page contains element    ${EDIT_ORGANIZATION_BTN}    timeout=30
    [Teardown]    Go back to RHP frontpage

*** Keywords ***
Restore Finnish language
    Wait until page contains element    ${LANGUAGE_DROPDOWN_BTN}
    Click element    ${LANGUAGE_DROPDOWN_BTN}
    Wait until page contains element    ${LANGUAGE_FI}
    Click element    ${LANGUAGE_FI}
    Wait until page contains    ORGANISAATIOT    timeout=20
    Wait until page contains    KÄYTTÄJÄT    timeout=20
    Close All Browsers
