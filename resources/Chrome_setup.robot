*** Keywords ***
Setup Chrome Options
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument      no-sandbox
    Call Method    ${options}    add_argument      single-process
    Call Method    ${options}    add_argument      --no-sandbox
    Call Method    ${options}    add_argument      --single-process

