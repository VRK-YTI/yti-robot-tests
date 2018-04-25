*** Settings ***
Documentation     Resource file for User right management application
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://rhp-dev.suomi.fi/
#${USER_1}        //a[@class='dropdown-item ng-binding ng-scope'][contains(text(),'Testi Admin')]
${LANGUAGE_EN}    //app-root/app-navigation-bar/nav/ul/li[2]/div/a[2]/span
${LANGUAGE_FI}    //app-root/app-navigation-bar/nav/ul/li[2]/div/a[1]/span
${ORGANIZATION_1}    Testiorganisaatio
#Buttons and links
${LANGUAGE_DROPDOWN_BTN}    //app-root/app-navigation-bar/nav/ul/li[2]/a
#${IMPERSONATE_USER_DROPDOWN}    //application/ng-container/navigation-bar/nav/ul/li[1]/a
${FRONTPAGE_SEARCH_BOX}    //app-root/div/app-frontpage/div/ngb-tabset/div/div/app-organizations/div/div[1]/div[1]/input
${ADD_ORGANIZATION_BTN}    //*[@id="ngb-tab-0-panel"]/app-organizations/div/div[1]/button/span
${EDIT_ORGANIZATION_BTN}    //app-root/div/app-organization/div/div/button/span

*** Keywords ***
Test Case Setup
    Set Selenium Speed    0.5
    Open RHP
    eDuuni Login

eDuuni Login
    Wait until page contains element    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList    timeout=30
    Click element    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList
    Select From List    id=ContentPlaceHolder1_PassiveIdentityProvidersDropDownList    https://googlelogin.eduuni.fi
    Wait Until Page Contains element    id=ContentPlaceHolder1_Button1    timeout=30
    Click element    id=ContentPlaceHolder1_Button1
    Wait Until Page Contains element    id=identifierId
    Input text    id=identifierId    ${TEST_EMAIL}
    Wait Until Page Contains element    id=identifierNext    timeout=20
    Click element    id=identifierNext
    Wait Until Page Contains element    //div[1]/div[1]/div[2]/div[2]/div/div[2]/div/form/div[1]/div/div[1]/div/div[1]/input    timeout=20
    Input text    //div[1]/div[1]/div[2]/div[2]/div/div[2]/div/form/div[1]/div/div[1]/div/div[1]/input    ${TEST_PASSWORD}
    #Wait Until Page Contains element    //div[@id="passwordNext"]/content/span
    Wait Until Page Contains element    id=passwordNext
    Capture Page Screenshot
    #Click element    //div[@id="passwordNext"]/content/span
    Click element    id=passwordNext
    Wait Until Page Contains    Yhteentoimivuusalustan oikeuksienhallinta    timeout=20
    Sleep    5

Open RHP
    Open Browser with Settings
    Wait until page contains    Sign In    timeout=20

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument      --headless
    Call Method    ${chrome_options}    add_argument      --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}

Go back to RHP frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers
