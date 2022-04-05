*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Browser with Settings
    Open browser       browser=${BROWSER}    executable_path=${CHROME_DRIVER_PATH}
    Set Window Size    1920    1080

Input text with wait
    [Arguments]  ${element}  ${text}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Input Text                          ${element}    ${text}

Click element with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Wait Until Keyword Succeeds         5x  500ms  Click Element  ${element}

Unselect Checkbox with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Unselect Checkbox                   ${element}
    Checkbox Should Not Be Selected      ${element}

Select Checkbox with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Select Checkbox                   ${element}
    Checkbox Should Be Selected         ${element}

Switch window with wait
    [Arguments]     ${window}
    Wait Until Keyword Succeeds     90 seconds    5 seconds    Switch window    ${window}

Click element that contains text
    [Arguments]  ${text}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Click element with wait     //*[contains(text(), "${text}")]   ${timeout}

Print console logs
    ${logs}     Run keyword     Get browser logs
    log         ${logs}