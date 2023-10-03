*** Settings ***
Resource  ../../variables/run variables.robot
Resource  ../../selenium keywords/generic/generic selenium.robot
Library   ../../selenium keywords/generic/generic selenium.py

*** Variables ***
${IMPERSONATE_LOGIN}        //*[@id="login-button"]
${IMPERSONATE_LIST_ITEM}    //div[@id="impersonate-block"]/div/ul/li


*** Keywords ***
Impersonate with ${user}
    Impersonate  ${user}
    Verify user is impersonated

Impersonate
    [Arguments]     ${user}
    Mouse Over  ${IMPERSONATE_LOGIN}
    Click element with wait    ${IMPERSONATE_LIST_ITEM}/a[text()="Test ${user.replace(" ", "").capitalize()}"]

Verify user is impersonated
    Wait until page contains element    //a[text()="Kirjaudu ulos"]