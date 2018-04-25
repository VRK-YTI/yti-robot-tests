*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://koodistot-dev.suomi.fi/

*** Keywords ***
Open Koodistot
    Set Selenium Speed    0.3
    Open Browser with Settings
    Page should contain    Koodistot
    Page should contain    KIRJAUDU SISÄÄN

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'      Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument      --headless
    Call Method    ${chrome_options}    add_argument      --single-process
#    Call Method    ${chrome_options}    add_argument      start-maximized
#    Call Method    ${chrome_options}    add_argument      --disable-web-security
#    Call Method    ${chrome_options}    add_argument      --allow-insecure-localhost
#    Call Method    ${chrome_options}    add_argument      --dump-dom
#    Call Method    ${chrome_options}    add_argument      --enable-crash-reporter
#    Call Method    ${chrome_options}    add_argument      --no-sandbox
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE   Create Webdriver    Chrome    chrome_options=${chrome_options} 
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}
