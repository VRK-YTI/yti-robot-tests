*** Settings ***
Library           helpers.py

*** Keywords ***
Open Browser with Settings
    [Arguments]    ${environment_url}
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment  ${environment_url}
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment  ${environment_url}
    ...    ELSE    Open Browser    ${environment_url}    browser=${BROWSER}

Open Chrome to Environment
    [Arguments]    ${environment_url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --single-process
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}      executable_path=${CHROME_DRIVER_PATH}
    Set Window Size    1920    1080
    Go To    ${environment_url}

Input text with wait
    [Arguments]  ${element}  ${text}  ${timeout}=30
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Input Text                          ${element}    ${text}

Click element with wait
    [Arguments]  ${element}  ${timeout}=30
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Wait Until Keyword Succeeds         5x  500ms  Click Element  ${element}

Click element that contains text
    [Arguments]  ${text}  ${timeout}=30
    Click element with wait     //*[contains(text(), "${text}")]   ${timeout}

Print console logs
    ${logs}     Run keyword     Get browser logs
    log         ${logs}