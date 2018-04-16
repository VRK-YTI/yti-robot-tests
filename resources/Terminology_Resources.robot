*** Settings ***
Documentation     Resource file for terminology application
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://sanastot-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    //app-root/app-navigation-bar/nav/ul/li[3]/div/a[2]/span
${LANGUAGE_FI}    //app-root/app-navigation-bar/nav/ul/li[3]/div/a[1]/span
${VOCABULARY_1}    Testiautomaatiosanasto
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    //app-root/app-navigation-bar/nav/ul/li[3]/a
${IMPERSONATE_USER_DROPDOWN}    //app-root/app-navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    //app-root/div/app-frontpage/app-vocabularies/div/div[1]/div/div/input
${SHOW_VOCABULARY_DETAILS_BTN}    //app-root/div/app-concepts/div/div[1]/div/app-vocabulary/div/div/div/h2/button[1]
${ADD_NEW_CONCEPT_BTN}    //button[@class='btn btn-action mb-3']//span

*** Keywords ***
Test Case Setup
    Set Selenium Speed    0.5
    Open Sanastot
    Select user

Open Sanastot
    Open Sanastot in '${BROWSER}'
    Sleep    1

Select user
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=20
    Reload Page
    Sleep    2

Open Sanastot in '${BROWSER}'
    Open Sanastot in environment    ${BROWSER}
    Wait until page contains    Sanastot    timeout=20
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=20

Open Sanastot in environment
    [Arguments]    ${browser}
    Open Browser    ${ENVIRONMENT_URL}    browser=${browser}

Go back to Sanastot frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers
