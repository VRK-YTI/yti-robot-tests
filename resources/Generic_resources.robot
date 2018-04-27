*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://koodistot-dev.suomi.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}      id=testiadmin@localhost
${ADMIN_USER_NAME}    Testi Admin
${SUPER_USER_ID}      id=testisuperuser@localhost
${SUPER_USER_NAME}    Testi Superuser

*** Keywords ***
Test Case Setup Admin
    Open Koodistot
    Set Selenium Speed    0.5
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Test Case Setup Superuser
    Open Koodistot
    Set Selenium Speed    0.5
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Sleep    1
    Click element    ${user_id}
    Wait Until Page Contains    ${user_name}
    Sleep    5

Open Koodistot
    Open Browser with Settings
    Sleep    5
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
