*** Variables ***
${SELENIUM_SPEED}       0

${ADMIN_USER_ID}        id=testiadmin@localhost
${ADMIN_USER_NAME}      Test Admin

${SUPER_USER_ID}        id=testisuperuser@localhost
${SUPER_USER_NAME}      Test Superuser

${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link

*** Keywords ***
Select Superuser
    Select user             ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select Admin
    Select user             ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Click element with wait             ${IMPERSONATE_USER_DROPDOWN}                                                    timeout=30
    Click element with wait             ${user_id}
    Wait Until Page Contains Element    xpath://*[contains(@class, 'logged-in')]/*[contains(text(), '${user_name}')]    timeout=20

Check Mailbox
    Open Mailbox    host=imap.gmail.com    user=${TEST_TEMPUSER_EMAIL}    password=${TEST_TEMPUSER_PASSWORD}
    ${LATEST} =    Wait For Email    sender=${TEST_EMAIL_SENDER}    timeout=30    status=UNSEEN
    ${body}    Get Email Body    ${LATEST}
    ${ret}    Should Match Regexp    ${body}    (http:\/\/uri\.suomi\.fi\/comments\/round\/(.*)&token=(.[^"]*))
    ${invitationLink}    Get From List    ${ret}    1
    Open Chrome to Environment    ${invitationLink}
    Sleep    1
    Close Mailbox