*** Keywords ***
Open koodistot in environment
    [Arguments]    ${browser}
    Set Selenium Speed    0.3
    Run Keyword If       '${browser}' == 'chrome'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${browser}

Open Chrome to Environment
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument      --no-sandbox
    Call Method    ${chrome_options}    add_argument      --single-process
    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}
    Go To    ${ENVIRONMENT_URL}

