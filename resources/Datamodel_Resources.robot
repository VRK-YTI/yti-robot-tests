*** Settings ***
Documentation     Resource file for Datamodel application
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://tietomallit-dev.suomi.fi/
${USER_1}         //a[@class='dropdown-item ng-binding ng-scope'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    //application/ng-container/navigation-bar/nav/ul/li[3]/div/a[2]/span
${LANGUAGE_FI}    //application/ng-container/navigation-bar/nav/ul/li[3]/div/a[1]/span
${MODEL_1}        Testiautomaatio
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    //application/ng-container/navigation-bar/nav/ul/li[3]/a
${IMPERSONATE_USER_DROPDOWN}    //application/ng-container/navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    //application/ng-container/div/div/front-page/div/div[1]/div/div/input
${SHOW_MODEL_DETAILS_BTN}    //application/ng-container/div/div/model-page/div/div[1]/div/model-view/div/div/div/h2/button[1]
${ADD_CLASS_BTN}    //application/ng-container/div/div/model-page/div/div[2]/div/div[1]/div[2]/div/div/div[1]/div/div[1]/div/div/button/span[2]

*** Keywords ***
Test Case Setup
    Set Selenium Speed    0.5
    Open Tietomallit
    Select user

Open Tietomallit
    Open Tietomallit in '${BROWSER}'
    Sleep    1

Select user
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${USER_1}
    Click element    ${USER_1}
    Wait Until Page Contains    Testi Admin    timeout=20
    Sleep    2

Open Tietomallit in '${BROWSER}'
    Open Tietomallit in environment    ${BROWSER}
    Wait until page contains    Tietomallit    timeout=20
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=20

Open Tietomallit in environment
    [Arguments]    ${browser}
    Open Browser    ${ENVIRONMENT_URL}    browser=${browser}

Go back to Tietomallit frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers
