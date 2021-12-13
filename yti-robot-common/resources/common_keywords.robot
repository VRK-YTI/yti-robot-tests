*** Variables ***
${ADMIN_USER_ID}            //*[@id="testiadmin@localhost"] | //*[@id="impersonate_user_testiadmin@localhost_link"] | //*[@id="testiadmin@localhost_fakeable_user_link"]
${ADMIN_USER_NAME}          Test Admin

${SUPER_USER_ID}            //*[@id="testisuperuser@localhost"] | //*[@id="impersonate_user_testisuperuser@localhost_link"] | //*[@id="testisuperuser@localhost_fakeable_user_link"]
${SUPER_USER_NAME}          Test Superuser

${TEST_DATAMODEL_ID}        //*[@id="testdatamodel@localhost"] | //*[@id="impersonate_user_testdatamodel@localhost_link"]
${TEST_DATAMODEL_NAME}      Test Datamodel

${TEST_TERMINOLOGY_ID}      //*[@id="testterminology@localhost"] | //*[@id="testterminology@localhost_fakeable_user_link"]
${TEST_TERMINOLOGY_NAME}    Test Terminology

${TEST_NOGROUP_ID}          //*[@id="dummy@localhost"] | //*[@id="dummy@localhost_fakeable_user_link"]
${TEST_NOGROUP_NAME}        Test Nogroup

${CODELIST_USER_ID}          //*[@id="testcodelist@localhost"] | //*[@id=""]
${CODELIST_USER_NAME}        Test Codelist

${MEMBER_USER_ID}           //*[@id="testmember@localhost"] | //*[@id="dummy@localhost_fakeable_user_link"]
${MEMBER_USER_NAME}         Test Member

${IMPERSONATE_USER_DROPDOWN}    //*[@id="impersonate_user_link"] | //*[@id="fakeable_user_dropdown"]
${LANGUAGE_DROPDOWN_BTN}        id=select_lang_dropdown
${LANGUAGE_EN}                  id=en
${LANGUAGE_FI}                  id=fi

${2_BREADCRUMB_LINK}            id=2_breadcrumb_link
${3_BREADCRUMB_LINK}            id=3_breadcrumb_link

${EDUUNI_EMAIL_PASSWORD}            ${EMPTY}

${ADMIN_EDUUNI_EMAIL}               ytiautomaatioad@outlook.com
${ADMIN_EDUUNI_PASSWORD}            ${EDUUNI_EMAIL_PASSWORD}

${SUPER_EDUUNI_EMAIL}               ytiautomaatiosuper@outlook.com
${SUPER_EDUUNI_PASSWORD}            ${EDUUNI_EMAIL_PASSWORD}

${DATAMODEL_EDUUNI_EMAIL}           ytiautomaatiodatamodel@outlook.com
${DATAMODEL_EDUUNI_PASSWORD}        ${EDUUNI_EMAIL_PASSWORD}

${TEST_EDUUNI_EMAIL}                ytiautomaatiotest@outlook.com
${TEST_EDUUNI_PASSWORD}             ${EDUUNI_EMAIL_PASSWORD}

${CODELIST_EDUUNI_EMAIL}            ytiautomaatiocodelist@outlook.com
${CODELIST_EDUUNI_PASSWORD}         ${EDUUNI_EMAIL_PASSWORD}

${TERMINOLOGY_EDUUNI_EMAIL}         ytiautomaatioterminology@outlook.com
${TERMINOLOGY_EDUUNI_PASSWORD}      ${EDUUNI_EMAIL_PASSWORD}

${MEMBER_EDUUNI_EMAIL}              ytiautomaatiomember@outlook.com
${MEMBER_EDUUNI_PASSWORD}           ${EDUUNI_EMAIL_PASSWORD}

${NOGROUP_EDUUNI_EMAIL}             ytiautomaationogroup@outlook.com
${NOGROUP_EDUUNI_PASSWORD}          ${EDUUNI_EMAIL_PASSWORD}

${EDUUNI_LOGIN}                 id=log_in_link
${EDUUNI_LOGIN_EXISTING}        id=login_modal_button

${EDUUNI_MICROSOFT}                       //*[contains(text(), "Microsoft Account")]
${EDUUNI_MICROSOFT_EMAIL_INPUT}           //*[@name="loginfmt"]
${EDUUNI_MICROSOFT_PASSWORD_INPUT}        //*[@name="passwd"]
${EDUUNI_MICROSOFT_NEXT_BUTTON}           //*[@id="idSIButton9"]

${EDUUNI_GOOGLE}                        //*[contains(text(), "Google")]
${EDUUNI_GOOGLE_EMAIL_INPUT}            //*[@name="identifier"]
${EDUUNI_GOOGLE_PASSWORD_INPUT}         //*[@name="password"]
${EDUUNI_GOOGLE_NEXT_BUTTON}            //*[@jsname="LgbsSe"]

${EDUUNI_TYPE}                          MICROSOFT


*** Keywords ***
Select Superuser user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user      ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    ...    ELSE       Logging with eDuuni      ${SUPER_EDUUNI_EMAIL}  ${SUPER_EDUUNI_PASSWORD}

Select Admin user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user      ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    ...    ELSE       Logging with eDuuni      ${ADMIN_EDUUNI_EMAIL}  ${ADMIN_EDUUNI_PASSWORD}

Select datamodel user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user      ${TEST_DATAMODEL_ID}    ${TEST_DATAMODEL_NAME}
    ...    ELSE       Logging with eDuuni      ${DATAMODEL_EDUUNI_EMAIL}  ${DATAMODEL_EDUUNI_PASSWORD}

Select terminology user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user  ${TEST_TERMINOLOGY_ID}   ${TEST_TERMINOLOGY_NAME}
    ...    ELSE       Logging with eDuuni      ${TERMINOLOGY_EDUUNI_EMAIL}  ${TERMINOLOGY_EDUUNI_PASSWORD}

Select no group user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user  ${TEST_NOGROUP_ID}  ${TEST_NOGROUP_NAME}
    ...    ELSE        Logging with eDuuni      ${NOGROUP_EDUUNI_EMAIL}  ${NOGROUP_EDUUNI_PASSWORD}

Select codelist user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user  ${CODELIST_USER_ID}    ${CODELIST_USER_NAME}
    ...    ELSE       Logging with eDuuni      ${CODELIST_EDUUNI_EMAIL}  ${CODELIST_EDUUNI_PASSWORD}

Select member user
    Run Keyword If    '${ENVIRONMENT_IDENTIFIER}' == 'AWSDEV'  Select user      ${MEMBER_USER_ID}   ${MEMBER_USER_NAME}
    ...    ELSE       Logging with eDuuni      ${MEMBER_EDUUNI_EMAIL}   ${MEMBER_EDUUNI_PASSWORD}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Click element with wait             ${IMPERSONATE_USER_DROPDOWN}
    Click element with wait             ${user_id}
    Wait Until Page Contains Element    xpath://*[contains(@class, 'logged-in')]/*[contains(text(), '${user_name}')]    timeout=20

Open sanastot
    Open Browser with Settings      ${TERMINOLOGIES_ENVIRONMENT_URL}
    Click element with wait         //section/a[@href="/search"]
    Wait Until Page Contains        Sanastot            timeout=20

Open Tietomallit
    Open Browser with Settings      ${DATA_VOCABULARIES_ENVIRONMENT_URL}
    Wait Until Page Contains        Tietomallit         timeout=20
    Wait Until Page Contains        KIRJAUDU SISÄÄN     timeout=20

Open RHP
    Open Browser with Settings      ${GROUPMANAGEMENT_ENVIRONMENT_URL}
    Wait Until Page Contains        KIRJAUDU SISÄÄN     timeout=20

Open Comments
    Open Browser with Settings      ${COMMENTS_ENVIRONMENT_URL}
    Wait Until Page Contains        Kommentit    timeout=60
    Wait Until Page Contains        KIRJAUDU SISÄÄN    timeout=60

Check Mailbox
    Open Mailbox    host=imap.gmail.com    user=${TEST_TEMPUSER_EMAIL}    password=${TEST_TEMPUSER_PASSWORD}
    ${LATEST} =    Wait For Email    sender=${TEST_EMAIL_SENDER}    timeout=30    status=UNSEEN
    ${body}    Get Email Body    ${LATEST}
    ${ret}    Should Match Regexp    ${body}    (http:\/\/uri\.suomi\.fi\/comments\/round\/(.*)&token=(.[^"]*))
    ${invitationLink}    Get From List    ${ret}    1
    Open Chrome to Environment    ${invitationLink}

    Close Mailbox

Select breadcrump link 2
    Sleep                       10
    Click element with wait     ${2_BREADCRUMB_LINK}                        timeout=20


Select breadcrump link 3
    Sleep                       10
    Click element with wait     ${3_BREADCRUMB_LINK}                        timeout=20

Logging with eDuuni
    [Arguments]     ${email}       ${password}
    Click element with wait         ${EDUUNI_LOGIN}
    Click element with wait         ${EDUUNI_LOGIN_EXISTING}
    Run keyword                     Logging eDuuni with ${EDUUNI_TYPE}       ${email}       ${password}

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