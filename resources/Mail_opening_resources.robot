*** Settings ***
Documentation     Resource file for opening mailbox
Library           ImapLibrary
Library           Selenium2Library
Library           Collections

*** Keywords ***
Check Mailbox
    Open Mailbox    host=imap.gmail.com    user=ydfgdgdgdgdfg    password=asdasdasasd
    ${LATEST} =    Wait For Email    sender=xsfsdfsdfsd    timeout=30
    ${body}    Get Email Body    ${LATEST}
    ${ret}    Should Match Regexp    ${body}    (http:\/\/uri\.suomi\.fi\/comments\/round\/(.*)&token=(.*))
    ${token}    Get From List    ${ret}    1
    Set Test Variable    ${token}
    Open Browser    ${token}    ${browser}
    Sleep    1
    Close Mailbox
