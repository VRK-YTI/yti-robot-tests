*** Settings ***
Documentation     Resource file for opening mailbox
Library           ImapLibrary
Library           SeleniumLibrary
Library           Collections
Resource          Generic_resources.robot

*** Keywords ***
Check Mailbox
    Open Mailbox    host=imap.gmail.com    user=${TEST_TEMPUSER_EMAIL}    password=${TEST_TEMPUSER_PASSWORD}
    ${LATEST} =    Wait For Email    sender=${TEST_EMAIL_SENDER}    timeout=30    status=UNSEEN
    ${body}    Get Email Body    ${LATEST}
    ${ret}    Should Match Regexp    ${body}    (http:\/\/uri\.suomi\.fi\/comments\/round\/(.*)&token=(.[^"]*))
    ${invitationLink}    Get From List    ${ret}    1
    Open Chrome to URL    ${invitationLink}
    Sleep    1
    Close Mailbox
