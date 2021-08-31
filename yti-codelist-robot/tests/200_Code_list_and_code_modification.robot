*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Test Case Teardown Generic Teardown

Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${TERMINOLOGY_USER_DROPDOWN}    id=fakeable_user_dropdown

*** Test Cases ***
200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format     ${testiautomaatiokoodisto_with_code}                ${CODE_LIST_4}
    Click element that contains text    ${TEST_CODE_1}                                      timeout=20
    Modify code
    Input text with wait        ${CODE_NAME_INPUT}          Tämä on uusi nimi koodille      timeout=20
    Input text with wait        ${CODE_DESC_INPUT}          Tämä on uusi kuvaus koodille    timeout=20
    Input text with wait        ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi         timeout=20

    Save code modification
    Wait Until Page Contains    Tämä on uusi nimi koodille    timeout=20
    Wait Until Page Contains    Tämä on uusi kuvaus koodille    timeout=20
    Wait Until Page Contains    Tämä on uusi lyhyt nimi    timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

201. Add link to the DRAFT Code
    [Documentation]    Add link to the draft code, check link functionalty, check that it is not possible to add
    ...    same link url again and remove the link.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Click element that contains text    ${TEST_CODE_1}      timeout=20

    Modify code

    Click element with wait         ${ADD_LINK_DDL}         timeout=30
    Click element with wait         ${LINK_BTN}             timeout=20
    Click element with wait         ${LINK_URL_INPUT}       timeout=20

    Input text with wait            ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/  timeout=20

    Click element with wait         ${ADD_BTN}                          timeout=20

    Wait until page contains        Liittyvä linkki                     timeout=20
    Wait until page contains        https://www.suomi.fi/etusivu/       timeout=20


    Click element that contains text    https://www.suomi.fi/etusivu/   timeout=20
    Click element with wait             id=external_ref_url_link        timeout=20

    Select Window    url=https://www.suomi.fi/etusivu/
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot

    Click element with wait             ${LINK_MODAL_OK_BTN}    timeout=20

    Save code modification
    Modify code
    Click element with wait             ${ADD_LINK_DDL}         timeout=30
    Click element with wait             ${LINK_BTN}             timeout=20
    Click element with wait             ${LINK_URL_INPUT}       timeout=20

    Input text with wait                ${LINK_URL_INPUT}   https://www.suomi.fi/etusivu/  timeout=20

    Wait until page contains            Linkki on jo käytössä tässä koodistossa.    timeout=20

    Click element with wait             ${CANCEL_CREATION_BTN}                      timeout=20
    Click element with wait             ${DELETE_LINK_ICON}                         timeout=20
    Click element with wait             ${REMOVE_LINK_CONF_BTN}                     timeout=20

    Wait Until Page Does Not Contain    https://www.suomi.fi/etusivu/    timeout=20
    Save code modification
    Wait Until Page Does Not Contain    https://www.suomi.fi/etusivu/    timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Click element that contains text    ${TEST_CODE_1}      timeout=20

    Modify code
    Click element with wait     ${ADD_LINK_DDL}         timeout=30
    Click element with wait     ${LICENSE_BTN}          timeout=20
    Click element with wait     ${CCBY4.0}              timeout=20
    Click element with wait     ${SELECT_LINK_BTN}      timeout=20

    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)               timeout=20
    Save code modification
    Modify code
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)               timeout=20

    Click element with wait     ${DELETE_LINK_ICON}         timeout=20
    Click element with wait     ${REMOVE_LINK_CONF_BTN}     timeout=20
    Wait Until Page Does Not Contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)       timeout=20
    Save code modification
    [Teardown]    Remove code lists    ${CODE_LIST_4}

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Codes_list_with_languages}    ${CODE_LIST_9}
    Wait Until Page Contains    30 koodia    timeout=20
    Change Content Language    ${ALL_LANGUAGE_BTN}

    Click element that contains text  testcode28 - Testcode28_fi  timeout=20

    Modify code
    Click element with wait    ${ADD_LINK_DDL}          timeout=20
    Click element with wait    ${LINK_BTN}              timeout=20
    Click element with wait    ${LINK_NAME_INPUT_FI}    timeout=20

    Input text with wait       ${LINK_NAME_INPUT_FI}    suomi.fi                        timeout=20
    Click element with wait    ${LINK_NAME_INPUT_AB}                                    timeout=20
    Input text with wait       ${LINK_NAME_INPUT_AB}    www.suomi.fi_ab                 timeout=20
    Click element with wait    ${LINK_URL_INPUT}                                        timeout=20
    Input text with wait       ${LINK_URL_INPUT}        https://www.suomi.fi/etusivu/   timeout=20
    Click element with wait    ${ADD_BTN}               timeout=20

    Wait Until Page Contains    Liittyvä linkki         timeout=20
    Save code modification
    Modify code
    Click element with wait    ${MODIFY_LINK_ICON}                      timeout=20
    Click element with wait    ${LINK_NAME_INPUT_FI}                    timeout=20
    Input text with wait       ${LINK_NAME_INPUT_FI}    www.suomi.fi    timeout=20
    Click element with wait    ${SAVE_LINK_MODIFY_BTN}                  timeout=20

    Wait Until Page Contains    Liittyvä linkki     timeout=20
    Wait Until Page Contains    www.suomi.fi        timeout=20
    Save code modification
    Reload Page
    [Teardown]    Remove code lists    ${CODE_LIST_9}

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Click element that contains text  ${TEST_CODE_1}    timeout=20

    Click element with wait     ${MODIFY_CODE_BTN}                                                  timeout=20
    Click element with wait     ${CODE_START_DATE_BTN}                                              timeout=20
    Click element with wait     css=select.custom-select:nth-child(1)                               timeout=20
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(1)         timeout=20
    Click element with wait     css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)                 timeout=20
    Click element with wait     ${CODE_END_DATE_BTN}                                                timeout=20
    Click element with wait     css=select.custom-select:nth-child(1)                               timeout=20
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(2)         timeout=20
    Click element with wait     css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)                 timeout=20

    Save code modification
    Wait Until Page Contains    02.01.2018 - 27.02.2018    timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Click element that contains text   ${TEST_CODE_1}                                           timeout=20

    Click element with wait     ${MODIFY_CODE_BTN}                                              timeout=20
    Click element with wait     ${CODE_LIST_START_DATE_BTN}                                     timeout=20
    Click element with wait     css=select.custom-select:nth-child(1)                           timeout=20
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(2)     timeout=20
    Click element with wait     css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)             timeout=20
    Click element with wait     ${CODE_LIST_END_DATE_BTN}                                       timeout=20
    Click element with wait     css=select.custom-select:nth-child(1)                           timeout=20
    Click element with wait     css=select.custom-select:nth-child(1) > option:nth-child(1)     timeout=20
    Click element with wait     css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)             timeout=20

    Save code list
    Wait until page contains    ${Error_end_date_before_start_date}     timeout=20
    Click element with wait     id=close_error_modal_button             timeout=20
    Click element with wait     ${CANCEL_CODE_MOD_BTN}                  timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list. YTI-445
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list

    Click element with wait     ${CODE_LIST_STATUS_DDL}    timeout=20
    Page Should Contain         Keskeneräinen
    Page Should Contain         Luonnos
    Page Should Contain         Korvattu

    Click Button                        Virheellinen
    Save code list
    Wait Until Element Is Enabled       ${MODIFY_CODE_LIST}    timeout=60
    Wait Until Page Contains            Virheellinen           timeout=20
    Go back to Koodistot frontpage
    Select user                         ${SUPER_USER_ID}        ${SUPER_USER_NAME}
    [Teardown]    Remove code lists    ${CODE_LIST_6}

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list. YTI-523, YTI-873.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list
    Input text with wait        ${CODE_LIST_NAME_INPUT}         Testinimi                   timeout=20
    Input text with wait        ${CODE_LIST_DESC_INPUT}         Uusi kuvaus                 timeout=20
    Input text with wait        ${CODE_LIST_DEF_INPUT}          Uusi määritelmä             timeout=20
    Input text with wait        ${CODE_LIST_CHANGENOTE_INPUT}   Uusi muutostieto            timeout=20
    Input text with wait        ${CODE_LIST_FEEDBACK_INPUT}     Ylläpitäjän yhteystiedot    timeout=20

    Save code list
    Wait Until Page Contains    Testinimi                   timeout=20
    Wait Until Page Contains    Uusi kuvaus                 timeout=20
    Wait Until Page Contains    Uusi määritelmä             timeout=20
    Wait Until Page Contains    Uusi muutostieto            timeout=20
    Wait Until Page Contains    Oikeusturva                 timeout=20
    Wait Until Page Contains    Yhteydenotto                timeout=20
    Wait Until Page Contains    Ylläpitäjän yhteystiedot    timeout=20
    [Teardown]    Remove code lists    Testinimi

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Modify code list

    Page should contain element         ${CLASSIFICATION_2}
    Click element with wait             ${ADD_CLASSIFICATION_BTN}                       timeout=20
    Input text with wait                ${SEARCH_CLASSIFICATION_INPUT}    Asuminen      timeout=20

    Click element that contains text    Asuminen

    Save code list
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Koulutus")]    timeout=20

    Go back to Koodistot frontpage
    Click element with wait             ${STATUS_DROPDOWN_BTN}    timeout=60
    Click element that contains text    ${ALL_STATUSES_FI}        timeout=60
    Click element that contains text    Asuminen                  timeout=60

    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_4}

209. Add broader code for code when code is not found from the system
    [Documentation]    Add broader code for code when broader code is not found from the system. Check error message. YTI-499.
    [Tags]    koodistot    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}


    Click element that contains text    Testcode 29                  timeout=20

    Click element with wait             ${MODIFY_CODE_BTN}           timeout=20
    Click element with wait             ${ADD_BROADER_CODE}          timeout=20

    Click element that contains text    Testcode 28                  timeout=20

    Open Koodistot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Go To    ${REFERENCE_DATA_ENVIRONMENT_URL}/codescheme;registryCode=test;schemeCode=600

    Click element that contains text    Testcode 28                  timeout=20
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Click element with wait             ${CODE_DDL}                  timeout=30
    Click element with wait             ${REMOVE_CODE_BTN}           timeout=20
    Click element with wait             ${CONFIRMATION_YES_BTN}      timeout=20

    Switch Browser    1
    Click element with wait             ${SAVE_CODE_MOD_BTN}         timeout=20

    Wait until page contains    Koodia ei löydy.    timeout=20
    Click element with wait             ${CLOSE_ERROR_MESSAGE_BTN}   timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_16}

210. Update code list values vith different languages
    [Documentation]    Import code list and update code list and code values vith different languages. YTI-674
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_codes_with_languages_empty}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60

    Update code list    ${Code_list_codes_with_languages}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}
    Wait until page contains    30 koodia    timeout=60


    Click element that contains text    testcode28 - Testcode 28_fi                  timeout=20

    Wait Until Page Contains    Koodisto600             timeout=60
    Wait Until Page Contains    Testcode 28_fi          timeout=60
    Wait Until Page Contains    Kuvaus_fi               timeout=60
    Wait Until Page Contains    Määritelmä_fi           timeout=60

    Change Content Language    ${CONTENT_LANGUAGE_EN}
    Wait Until Page Contains    Koodisto600_en          timeout=60
    Wait Until Page Contains    Testcode 28_en          timeout=60
    Wait Until Page Contains    Kuvaus_en               timeout=60
    Wait Until Page Contains    Määritelmä_en           timeout=60

    Change Content Language    ${CONTENT_LANGUAGE_SW_UG}
    Wait Until Page Contains    Koodisto600_sw          timeout=60
    Wait Until Page Contains    Testcode 28_sw          timeout=60
    Wait Until Page Contains    Kuvaus_sw               timeout=60
    Wait Until Page Contains    Määritelmä_sw           timeout=60

    Click element with wait         ${2_BREADCRUMB_LINK}    timeout=60
    Wait Until Element Is Visible   ${CODE_LIST_DDL}        timeout=60
    Click Code List Info Tab

    Change Content Language    ${CONTENT_LANGUAGE_SV}
    Wait Until Page Contains    Koodisto600_sv          timeout=60
    Wait Until Page Contains    Kuvaus_sv               timeout=60
    Wait Until Page Contains    Määritelmä_sv           timeout=60
    Wait Until Page Contains    muutostieto_sv          timeout=60
    Import codes in Excel format

    Upload codes    ${Update_codes_with_languages}

    Click element with wait     ${CODELIST_CODES_TAB}    timeout=20

    Wait Until Page Contains    30 koodia    timeout=60
    Click element that contains text    testcode28 - Testcode 28_sv     timeout=20

    Change Content Language    ${CONTENT_LANGUAGE_AR_SO}
    Wait Until Page Contains    Testcode 28_ar      timeout=60
    Wait Until Page Contains    Kuvaus_ar           timeout=60
    Wait Until Page Contains    Määritelmä_ar       timeout=60

    [Teardown]    Remove code lists    ${CODE_LIST_16}

211. Change code statuses with code list status change
    [Documentation]    Change code statuses with code list status change. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Click Code List Info Tab

    Click element with wait     ${MODIFY_CODE_LIST}         timeout=20
    Click element with wait     ${CODE_LIST_STATUS_DDL}     timeout=20
    Click element with wait     ${VALID_STATUS}             timeout=20

    Wait Until Element Is Enabled    ${CHANGE_CODE_STATUSES_CHECKBOX}    timeout=20
    Select Checkbox    ${CHANGE_CODE_STATUSES_CHECKBOX}

    Click element with wait     ${SAVE_CODE_LIST_MOD_BTN}   timeout=30
    Click element with wait     ${CONFIRMATION_YES_BTN}    timeout=30

    Wait until page contains    Vaihda samalla koodien tilat?       timeout=20
    Click element with wait     ${CONFIRMATION_YES_BTN}             timeout=30

    Wait Until Page Contains    Koodien tilojen vaihtamisen tulos    timeout=20
    Wait Until Page Contains    Tila vaihdettu 30 koodiin            timeout=20

    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}            timeout=30
    Wait Until Page Contains    Voimassa oleva                       timeout=20
    Click element with wait     ${CODELIST_CODES_TAB}                timeout=20

    Click element that contains text    testcode28 - Testcode 28

    Wait Until Page Contains    Koodin arvo         timeout=60
    Wait Until Page Contains    Koodin nimi         timeout=60
    Wait Until Page Contains    Voimassa oleva      timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

212. Change code statuses with mass function
    [Documentation]    Change code statuses with mass function. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60

    Click element with wait     ${CODE_LIST_DDL}                timeout=20
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}     timeout=20
    Click element with wait     ${ORIGINAL_STATUS_DDL}          timeout=20
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}        timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}            timeout=20
    Click element with wait     ${VALID_STATUS_TARGET}          timeout=20
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}  timeout=20

    Click Yes Confirmation
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.      timeout=20

    Click element with wait      ${CLOSE_ALERT_MODAL_LINK}       timeout=30

    Select Tab    ${CODELIST_CODES_TAB}
    Click element that contains text    testcode29 - Testcode 29    timeout=60

    Wait Until Page Contains    Koodin arvo         timeout=60
    Wait Until Page Contains    Koodin nimi         timeout=60
    Wait Until Page Contains    Voimassa oleva      timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

213. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60

    Click element with wait     ${CODE_LIST_DDL}                timeout=20
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}     timeout=20
    Click element with wait     ${ORIGINAL_STATUS_DDL}          timeout=20
    Click element with wait     ${VALID_STATUS_ORIGINAL}        timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}            timeout=20
    Click element with wait     ${DRAFT_STATUS_TARGET}          timeout=20
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}  timeout=20

    Wait Until Page Contains    Tila vaihdettu 30 koodiin.      timeout=20
    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}       timeout=30
    Click element with wait     ${CODELIST_CODES_TAB}           timeout=20

    Click element that contains text    testcode29 - Testcode 29    timeout=60

    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Luonnos        timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_17}

214. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60

    Click element with wait     ${CODE_LIST_DDL}                    timeout=20
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}         timeout=20
    Click element with wait     ${ORIGINAL_STATUS_DDL}              timeout=20
    Click element with wait     ${VALID_STATUS_ORIGINAL}            timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}                timeout=20
    Click element with wait     ${DRAFT_STATUS_TARGET}              timeout=20
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}      timeout=20

    Wait Until Page Contains    Tila vaihdettu 30 koodiin.          timeout=20
    Sleep    1
    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}           timeout=30
    Click element with wait     ${CODELIST_CODES_TAB}               timeout=20
    Click element that contains text    testcode29 - Testcode 29    timeout=60

    Wait Until Page Contains    Koodin arvo     timeout=60
    Wait Until Page Contains    Koodin nimi     timeout=60
    Wait Until Page Contains    Luonnos         timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_17}

215. Change code statuses with mass function and with invalid original status
    [Documentation]    Change code statuses with mass function and with invalid original status. Check Error message. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60

    Click element with wait     ${CODE_LIST_DDL}                    timeout=20
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}         timeout=20
    Click element with wait     ${ORIGINAL_STATUS_DDL}              timeout=20
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}            timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}                timeout=20
    Click element with wait     ${INCOMPLETE_STATUS_TARGET}         timeout=20
    Click element with wait     ${SAVE_CODE_STATUS_CHANGE_BTN}      timeout=20

    Wait Until Page Contains    ${Error_no_code_status_changes}     timeout=20
    Sleep    1
    Click element with wait     ${CLOSE_ALERT_MODAL_LINK}           timeout=30
    [Teardown]    Remove code lists    ${CODE_LIST_17}

216. Enforce status transition rules with code status change mass function
    [Documentation]    Enforce status transition rules with code status change mass function for superuser. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60

    Click element with wait     ${CODE_LIST_DDL}                timeout=20
    Click element with wait     ${CHANGE_CODE_STATUSES_BTN}     timeout=20
    Click element with wait     ${ORIGINAL_STATUS_DDL}          timeout=20
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}        timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}            timeout=20

    Wait Until Page Contains Element    ${INCOMPLETE_STATUS_TARGET}     timeout=60
    Wait Until Page Contains Element    ${DRAFT_STATUS_TARGET}          timeout=60
    Wait Until Page Contains Element    ${VALID_STATUS_TARGET}          timeout=60
    Wait Until Page Contains Element    ${SUPERSEDED_STATUS_TARGET}     timeout=60
    Wait Until Page Contains Element    ${RETIRED_STATUS_TARGET}        timeout=60
    Wait Until Page Contains Element    ${INVALID_STATUS_TARGET}        timeout=60

    Sleep    1
    Select Checkbox    ${ENFORCE_STATUS_TRANSITION_CHECKBOX}
    Sleep    1
    Click element with wait     ${ORIGINAL_STATUS_DDL}      timeout=20
    Click element with wait     ${DRAFT_STATUS_ORIGINAL}    timeout=20
    Click element with wait     ${TARGET_STATUS_DDL}        timeout=20

    Sleep    1
    Page Should Not Contain Element    ${DRAFT_STATUS_TARGET}           timeout=60
    Page Should Not Contain Element    ${SUPERSEDED_STATUS_TARGET}      timeout=60
    Page Should Not Contain Element    ${RETIRED_STATUS_TARGET}         timeout=60
    Page Should Not Contain Element    ${INVALID_STATUS_TARGET}         timeout=60
    Page Should Contain Element        ${INCOMPLETE_STATUS_TARGET}      timeout=20

    Click element with wait            ${VALID_STATUS_TARGET}           timeout=20
    Click element with wait            ${SAVE_CODE_STATUS_CHANGE_BTN}   timeout=20

    Click Yes Confirmation
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.    timeout=20
    Sleep    1
    Click element with wait             ${CLOSE_ALERT_MODAL_LINK}       timeout=30
    Click element with wait             ${CODELIST_CODES_TAB}           timeout=20
    Click element that contains text    testcode29 - Testcode 29        timeout=20

    Wait Until Page Contains    Koodin arvo         timeout=60
    Wait Until Page Contains    Koodin nimi         timeout=60
    Wait Until Page Contains    Voimassa oleva      timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

217. Import code list and codes with upper case/lower case status values
    [Documentation]    Import code list and codes (Excel,CSV) with extra space and upper case/lower case letters in status values.
    ...    Check that import is successful.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes_status_with_space}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60

    Import codes in Excel format
    Upload codes    ${Codes_status_with_space}
    Click element that contains text    testcode56 - Testcode 56        timeout=20

    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60

    Click element with wait             ${2_BREADCRUMB_LINK}    timeout=30
    Sleep    1
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=30
    Import codes in CSV format
    Upload codes    ${Codes_status_with_space_csv}

    Click element that contains text    testcode28 - Testcode 28        timeout=20
    Wait Until Page Contains    Koodin arvo         timeout=60
    Wait Until Page Contains    Voimassa oleva      timeout=60
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

218. Import links to codes with Import codes function
    [Documentation]    Import links to codes with Import codes function (Excel,CSV).
    ...    Check that links are working when extra space is defined in HREF columns in code Excel.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_codes_and_instructions_link}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Import codes in Excel format

    Upload codes    ${Code_links_with_space}

    Click element that contains text    testcode57 - Testcode 57    timeout=20

    Wait Until Page Contains    Käyttöohje                          timeout=60
    Wait Until Page Contains    https://www.suomi.fi/viestit        timeout=60
    Wait Until Page Contains    Liittyvä linkki                     timeout=60
    Wait Until Page Contains    https://www.suomi.fi/etusivu/       timeout=60
    Wait Until Page Contains    https://yle.fi/                     timeout=60
    Wait Until Page Contains    Lisenssi                            timeout=60
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=60

    Click element with wait             ${2_BREADCRUMB_LINK}    timeout=30
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=30
    Import codes in CSV format
    Upload codes    ${Code_links_with_space_csv}

    Wait Until Page Contains Element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click Element                       //*[contains(text(), "testcode56 - Testcode 56")]
    Page Should Not Contain    Käyttöohje
    Page Should Not Contain    Liittyvä linkki
    Page Should Not Contain    Lisenssi

    Click element with wait             ${2_BREADCRUMB_LINK}    timeout=30

    Click element that contains text    testcode28 - Testcode 28    timeout=20
    Wait Until Page Contains    Käyttöohje                      timeout=60
    Wait Until Page Contains    https://www.suomi.fi/viestit    timeout=60
    Wait Until Page Contains    Liittyvä linkki                 timeout=60
    Wait Until Page Contains    https://www.suomi.fi/etusivu/   timeout=60
    Wait Until Page Contains    https://yle.fi/                 timeout=60
    Wait Until Page Contains    Lisenssi                        timeout=60
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=60
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

219. Create new code list and codes with different languages
    [Documentation]    Create new code list and codes with different languages
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Create Code List With All Languages    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    koodisto6000_fi    koodisto6000_en    koodisto6000_sv    Asuminen
    Wait Until Page Contains    koodisto6000_fi    timeout=20
    Wait Until Page Contains    koodisto6000_en    timeout=20
    Wait Until Page Contains    koodisto6000_sv    timeout=20
    Create New Code With All Languages    NewCode001    newCode001_fi    newCode001_en    newCode001_sv    ${DRAFT_STATUS}    @{EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001_fi      timeout=30
    Wait Until Page Contains    koodisto6000_fi                 timeout=20
    Wait Until Page Contains    Koodin arvo                     timeout=20
    Wait Until Page Contains    NewCode001                      timeout=20
    Wait Until Page Contains    Koodin nimi                     timeout=20
    Wait Until Page Contains    newCode001_en                   timeout=20
    Wait Until Page Contains    newCode001_fi                   timeout=20
    Wait Until Page Contains    newCode001_sv                   timeout=20

    Click element with wait             ${2_BREADCRUMB_LINK}    timeout=30
    Remove code    NewCode001 - newCode001_fi
    Click Code List Info Tab
    Wait Until Page Contains    koodisto6000_fi    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    koodisto6000_fi

220. Remove language that is in use in the code list
    [Documentation]    Import code list, codes and extension with different languages.
    ...    Try to remove languages that are in use in the code list and check error message. YTI-1048.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Codes_list_and_extension_with_languages}    ${CODE_LIST_14}
    Wait Until Page Contains    25 koodia    timeout=20

    Click Code List Info Tab
    Change Content Language    ${ALL_LANGUAGE_BTN}
    Wait Until Page Contains    Test codescheme2 with long names    timeout=20
    Wait Until Page Contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Modify code list

    Click element with wait             ${REMOVE_AB_LANGUAGE}    timeout=20
    Click element with wait             ${REMOVE_EN_LANGUAGE}    timeout=20
    Click element with wait             ${REMOVE_FI_LANGUAGE}    timeout=20
    Click element with wait             ${REMOVE_TT_LANGUAGE}    timeout=20

    Save code list
    Wait Until Page Contains    ${Error_remove_languages}    timeout=60
    Click Confirmation
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_14}

*** Keywords ***
Go back to Koodistot frontpage
    Click element with wait     ${FRONTPAGE_LINK}    timeout=20
    Sleep    1

Choose testiautomaatiokoodisto and edit
    Click element with wait             ${STATUS_DROPDOWN_BTN}    timeout=20
    Click element that contains text    ${STATUS_DRAFT_FI}        timeout=20
    Click element that contains text    ${CODE_LIST_4}            timeout=20
    Wait until page contains            ${CODE_LIST_4}            timeout=20
    Click element that contains text    TIEDOT                    timeout=20
    Click element that contains text    Muokkaa                   timeout=20

Save code list
    Click element with wait             ${SAVE_CODE_LIST_MOD_BTN}       timeout=20
    Wait Until Page Contains Element    ${MODIFY_CODE_LIST}             timeout=90
