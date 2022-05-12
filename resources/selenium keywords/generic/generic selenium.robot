*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Browser with Settings
    Open browser       browser=${BROWSER}    executable_path=${CHROME_DRIVER_PATH}
    Set Window Size    1920    1080

Find and highlight element
    [Arguments]     ${element}
    IF    '${RECORD}' == 'True'
        ${elem}=  Get WebElement  ${element}
        Run keyword and ignore error  Highlight element             ${elem}
    END

Input text with wait
    [Arguments]  ${element}  ${text}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Find and highlight element          ${element}
    Input Text                          ${element}    ${text}

Click element with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Find and highlight element          ${element}
    Wait Until Keyword Succeeds         5x  500ms  Click Element  ${element}

Unselect Checkbox with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Find and highlight element          ${element}
    Unselect Checkbox                   ${element}
    Checkbox Should Not Be Selected     ${element}

Select Checkbox with wait
    [Arguments]  ${element}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${element}    timeout=${timeout}
    Wait Until Element Is Visible       ${element}    timeout=${timeout}
    Wait Until Element Is Enabled       ${element}    timeout=${timeout}
    Wait For Condition                  return document.readyState=="complete"      timeout=${timeout}
    Find and highlight element          ${element}
    Select Checkbox                     ${element}
    Checkbox Should Be Selected         ${element}

Switch window with wait
    [Arguments]     ${window}
    Wait Until Keyword Succeeds     90 seconds    5 seconds    Switch window    ${window}

Click element that contains text
    [Arguments]  ${text}  ${timeout}=${SELENIUM_DEFAULT_TIMEOUT}
    Click element with wait     //*[contains(text(), "${text}")]   ${timeout}