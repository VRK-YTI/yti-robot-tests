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

${GROUPMANAGEMENT ENVIRONMENT URL}      https://rhp.dev.yti.cloud.vrk.fi/
${COMMENTS ENVIRONMENT URL}             https://kommentit.dev.yti.cloud.vrk.fi/
${TERMINOLOGIES ENVIRONMENT URL}        https://sanastot.dev.yti.cloud.vrk.fi/
${DATA VOCABULARIES ENVIRONMENT URL}    https://tietomallit.dev.yti.cloud.vrk.fi/
${REFERENCE DATA ENVIRONMENT URL}       https://koodistot.dev.yti.cloud.vrk.fi/

${2_BREADCRUMB_LINK}            id=2_breadcrumb_link
${3_BREADCRUMB_LINK}            id=3_breadcrumb_link

*** Keywords ***
Select Superuser
    Select user             ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select Admin
    Select user             ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Select datamodel user
    Select user             ${TEST_DATAMODEL_ID}    ${TEST_DATAMODEL_NAME}

Select terminology user
    Select user             ${TEST_TERMINOLOGY_ID}    ${TEST_TERMINOLOGY_NAME}

Select no group user
    Select user             ${TEST_NOGROUP_ID}    ${TEST_NOGROUP_NAME}

Select codelist user
    Select user             ${CODELIST_USER_ID}    ${CODELIST_USER_NAME}

Select memeber user
    Select user             ${MEMBER_USER_ID}    ${MEMBER_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Click element with wait             ${IMPERSONATE_USER_DROPDOWN}
    Click element with wait             ${user_id}
    Wait Until Page Contains Element    xpath://*[contains(@class, 'logged-in')]/*[contains(text(), '${user_name}')]    timeout=20

Open sanastot
    Open Browser with Settings      ${TERMINOLOGIES_ENVIRONMENT_URL}
    Wait Until Page Contains        sanastot            timeout=20
    Wait Until Page Contains        KIRJAUDU SISÄÄN     timeout=20

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
    sleep                       10
    Click element with wait     ${2_BREADCRUMB_LINK}                        timeout=20


Select breadcrump link 3
    sleep                       10
    Click element with wait     ${3_BREADCRUMB_LINK}                        timeout=20