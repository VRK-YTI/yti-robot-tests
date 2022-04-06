*** Settings ***
Resource  ../../variables/run variables.robot
Resource  ../../selenium keywords/generic/generic selenium.robot
Library   ../../selenium keywords/generic/generic selenium.py

*** Variables ***
${EDUUNI_LOGIN}                           //*[contains(text(), "Kirjaudu sisään")]
${EDUUNI_LOGIN_EXISTING}                  //*[contains(text(), "Jatka kirjautumaan")]

${EDUUNI_MICROSOFT}                       //*[contains(text(), "Microsoft Account")]
${EDUUNI_MICROSOFT_EMAIL_INPUT}           //*[@name="loginfmt"]
${EDUUNI_MICROSOFT_PASSWORD_INPUT}        //*[@name="passwd"]
${EDUUNI_MICROSOFT_NEXT_BUTTON}           //*[@id="idSIButton9"]

${EDUUNI_GOOGLE}                          //*[contains(text(), "Google")]
${EDUUNI_GOOGLE_EMAIL_INPUT}              //*[@name="identifier"]
${EDUUNI_GOOGLE_PASSWORD_INPUT}           //*[@name="password"]
${EDUUNI_GOOGLE_NEXT_BUTTON}              //*[@jsname="LgbsSe"]

${EDUUNI_TYPE}                            MICROSOFT


*** Keywords ***
Login with ${user}
    Run keyword              Select ${user} user 

Select Superuser user
    Logging with eDuuni      ${SUPER_EDUUNI_EMAIL}  ${SUPER_EDUUNI_PASSWORD}

Select Admin user
    Logging with eDuuni      ${ADMIN_EDUUNI_EMAIL}  ${ADMIN_EDUUNI_PASSWORD}

Select datamodel user
    Logging with eDuuni      ${DATAMODEL_EDUUNI_EMAIL}  ${DATAMODEL_EDUUNI_PASSWORD}

Select terminology user
    Logging with eDuuni      ${TERMINOLOGY_EDUUNI_EMAIL}  ${TERMINOLOGY_EDUUNI_PASSWORD}

Select no group user
    Logging with eDuuni      ${NOGROUP_EDUUNI_EMAIL}  ${NOGROUP_EDUUNI_PASSWORD}

Select codelist user
    Logging with eDuuni      ${CODELIST_EDUUNI_EMAIL}  ${CODELIST_EDUUNI_PASSWORD}

Select member user
    Logging with eDuuni      ${MEMBER_EDUUNI_EMAIL}   ${MEMBER_EDUUNI_PASSWORD}

Select test user
    Logging with eDuuni      ${TEST_EDUUNI_EMAIL}  ${TEST_EDUUNI_PASSWORD}  

Logging with eDuuni
    [Arguments]     ${email}       ${password}
    Set tags      Log in
    Click element with wait             ${EDUUNI_LOGIN}
    Wait Until Page Contains Element    ${EDUUNI_LOGIN_EXISTING}
    Press Keys    None      TAB
    Press Keys    None      TAB
    Press Keys    None      ENTER
    Run keyword   Logging eDuuni with ${EDUUNI_TYPE}       ${email}       ${password}

Logging eDuuni with google
    [Arguments]     ${email}       ${password}
    Click element with wait             ${EDUUNI_GOOGLE}
    Input text with wait                ${EDUUNI_GOOGLE_EMAIL_INPUT}       ${email}
    Click element with wait             ${EDUUNI_GOOGLE_NEXT_BUTTON}
    Input text with wait                ${EDUUNI_GOOGLE_PASSWORD_INPUT}    ${password}
    Click element with wait             ${EDUUNI_GOOGLE_NEXT_BUTTON}

Logging eDuuni with microsoft
    [Arguments]     ${email}       ${password}
    Click element with wait             ${EDUUNI_MICROSOFT}
    Input text with wait                ${EDUUNI_MICROSOFT_EMAIL_INPUT}         ${email}
    Click element with wait             ${EDUUNI_MICROSOFT_NEXT_BUTTON}
    Input text with wait                ${EDUUNI_MICROSOFT_PASSWORD_INPUT}      ${password}
    Click element with wait             ${EDUUNI_MICROSOFT_NEXT_BUTTON}
    Click element with wait             ${EDUUNI_MICROSOFT_NEXT_BUTTON}