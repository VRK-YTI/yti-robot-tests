*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Extension_resources.robot

*** Test Cases ***
200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait Until Element Is Enabled    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait Until Element Is Enabled    ${CODE_NAME_INPUT}    timeout=20
    Input Text    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Wait Until Element Is Enabled    ${CODE_DESC_INPUT}    timeout=20
    Input Text    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Wait Until Element Is Enabled    ${CODE_SHORT_NAME_INPUT}    timeout=20
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Wait Until Element Is Enabled    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
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
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click Element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click Element    ${LINK_BTN}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click Element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Element Is Enabled    ${ADD_BTN}    timeout=20
    Click Element    ${ADD_BTN}
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Click Element    //*[contains(text(), "https://www.suomi.fi/etusivu/")]
    Wait until page contains element    id=external_ref_url_link
    Click Element    id=external_ref_url_link
    Select Window    url=https://www.suomi.fi/etusivu/
    Select Window    title=${ENVIRONMENT_IDENTIFIER} - Koodistot
    Wait until page contains element    ${LINK_MODAL_OK_BTN}    timeout=20
    Click Element    ${LINK_MODAL_OK_BTN}
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Visible    ${MODIFY_CODE_BTN}    timeout=120
    Click Element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click Element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click Element    ${LINK_BTN}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click Element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains    Linkki on jo käytössä tässä koodistossa.    timeout=20
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click Element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${DELETE_LINK_ICON}    timeout=20
    Click Element    ${DELETE_LINK_ICON}
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Wait Until Page Does Not Contain    https://www.suomi.fi/etusivu/    timeout=20
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Visible    ${MODIFY_CODE_BTN}    timeout=120
    [Teardown]    Remove code lists    ${CODE_LIST_4}

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait Until Element Is Enabled    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Sleep    1
    Wait Until Element Is Enabled    ${ADD_LINK_DDL}    timeout=30
    Click Element    ${ADD_LINK_DDL}
    Wait Until Element Is Enabled    ${LICENSE_BTN}    timeout=20
    Click Element    ${LICENSE_BTN}
    Wait Until Element Is Enabled    ${CCBY4.0}    timeout=20
    Click Element    ${CCBY4.0}
    Wait Until Element Is Enabled    ${SELECT_LINK_BTN}    timeout=20
    Click Element    ${SELECT_LINK_BTN}
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Visible    ${MODIFY_CODE_BTN}    timeout=90
    Modify code
    Wait Until Page Contains    Lisenssi    timeout=20
    Wait Until Page Contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${DELETE_LINK_ICON}    timeout=20
    Click Element    ${DELETE_LINK_ICON}
    Wait Until Element Is Enabled    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Wait Until Page Does Not Contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait Until Element Is Enabled    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
    [Teardown]    Remove code lists    ${CODE_LIST_4}

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Wait Until Element Is Enabled    //*[contains(text(), "${CODE_1000}")]    timeout=20
    Click Element    //*[contains(text(), "${CODE_1000}")]
    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait Until Element Is Enabled    ${ADD_LINK_DDL}    timeout=20
    Click Element    ${ADD_LINK_DDL}
    Wait Until Element Is Enabled    ${LINK_BTN}    timeout=20
    Click Element    ${LINK_BTN}
    Wait Until Element Is Enabled    ${LINK_URL_INPUT}    timeout=20
    Click Element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Element Is Enabled    ${ADD_BTN}    timeout=20
    Click Element    ${ADD_BTN}
    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Save code modification
    Modify code
    Wait Until Element Is Enabled    ${MODIFY_LINK_ICON}    timeout=20
    Click Element    ${MODIFY_LINK_ICON}
    Wait Until Element Is Enabled    ${LINK_NAME_INPUT}    timeout=20
    Click Element    ${LINK_NAME_INPUT}
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi
    Wait Until Element Is Enabled    ${SAVE_LINK_MODIFY_BTN}    timeout=20
    Click Element    ${SAVE_LINK_MODIFY_BTN}
    Wait Until Page Contains    Liittyvä linkki    timeout=20
    Wait Until Page Contains    www.suomi.fi    timeout=20
    Save code modification
    Reload Page
    [Teardown]    Remove code lists    ${CODE_LIST_2}

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_START_DATE_BTN}    timeout=20
    Click Element    ${CODE_START_DATE_BTN}
    Click Element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)    timeout=20
    Click Element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click Element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)
    Wait until page contains element    ${CODE_END_DATE_BTN}    timeout=20
    Click Element    ${CODE_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click Element    css=select.custom-select:nth-child(1)
    Click Element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)    timeout=20
    Click Element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)
    Save code modification
    Wait Until Page Contains    02.01.2018 - 27.02.2018    timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click Element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_LIST_START_DATE_BTN}    timeout=20
    Click Element    ${CODE_LIST_START_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click Element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(2)    timeout=20
    Click Element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)    timeout=20
    Click Element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Wait until page contains element    ${CODE_LIST_END_DATE_BTN}    timeout=20
    Click Element    ${CODE_LIST_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click Element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click Element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click Element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)
    Save code list
    Wait until page contains    ${Error_end_date_before_start_date}    timeout=20
    Click Element    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=20
    Click Element    ${CANCEL_CODE_MOD_BTN}
    [Teardown]    Remove code lists    ${CODE_LIST_4}

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list. YTI-445
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list
    Wait Until Page Contains Element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click Element    ${CODE_LIST_STATUS_DDL}
    Page Should Contain    Keskeneräinen
    Page Should Contain    Luonnos
    Page Should Contain    Korvattu
    Click Button    Virheellinen
    Save code list
    Wait Until Element Is Enabled    ${MODIFY_CODE_LIST}    timeout=60
    Wait Until Page Contains    Virheellinen    timeout=20
    Go back to Koodistot frontpage
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    [Teardown]    Remove code lists    ${CODE_LIST_6}

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list. YTI-523, YTI-873.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list
    Wait Until Element Is Enabled    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input Text    ${CODE_LIST_NAME_INPUT}    Testinimi
    Wait Until Element Is Enabled    ${CODE_LIST_DESC_INPUT}    timeout=20
    Input Text    ${CODE_LIST_DESC_INPUT}    Uusi kuvaus
    Wait Until Element Is Enabled    ${CODE_LIST_DEF_INPUT}    timeout=20
    Input Text    ${CODE_LIST_DEF_INPUT}    Uusi määritelmä
    Wait Until Element Is Enabled    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=20
    Input Text    ${CODE_LIST_CHANGENOTE_INPUT}    Uusi muutostieto
    Wait Until Element Is Enabled    ${CODE_LIST_FEEDBACK_INPUT}    timeout=20
    Input Text    ${CODE_LIST_FEEDBACK_INPUT}    Ylläpitäjän yhteystiedot
    Save code list
    Wait Until Page Contains    Testinimi    timeout=20
    Wait Until Page Contains    Uusi kuvaus    timeout=20
    Wait Until Page Contains    Uusi määritelmä    timeout=20
    Wait Until Page Contains    Uusi muutostieto    timeout=20
    Wait Until Page Contains    Oikeusturva    timeout=20
    Wait Until Page Contains    Ylläpitäjän yhteystiedot    timeout=20
    [Teardown]    Remove code lists    Testinimi

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Modify code list
    Page should contain element    ${CLASSIFICATION_2}
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}    timeout=20
    Click Element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input Text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click Element    //*[contains(text(), "Asuminen")]
    Save code list
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Koulutus")]    timeout=20
    Go back to Koodistot frontpage
    Wait Until Element Is Visible    ${STATUS_DROPDOWN_BTN}    timeout=60
    Click Element    ${STATUS_DROPDOWN_BTN}
    Click Element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=60
    Click Element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_4}

209. Add broader code for code when code is not found from the system
    [Documentation]    Add broader code for code when broader code is not found from the system. Check error message. YTI-499.
    [Tags]    koodistot
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click Element    //*[contains(text(), "Testcode 29")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click Element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_BROADER_CODE}    timeout=20
    Click Element    ${ADD_BROADER_CODE}
    Wait until page contains element    //*[contains(text(), "Testcode 28")]    timeout=20
    Click Element    //*[contains(text(), "Testcode 28")]
    Open Koodistot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    GO To    ${REFERENCE_DATA_ENVIRONMENT_URL}/codescheme;registryCode=test;schemeCode=600
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click Element    //*[contains(text(), "testcode28 - Testcode 28")]
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait until page contains element    ${CODE_DDL}    timeout=30
    Click Element    ${CODE_DDL}
    Wait until page contains element    ${REMOVE_CODE_BTN}    timeout=20
    Click Element    ${REMOVE_CODE_BTN}
    Wait until page contains element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click Element    ${CONFIRMATION_YES_BTN}
    Switch Browser    1
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Koodia ei löydy.    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click Element    ${CLOSE_ERROR_MESSAGE_BTN}
    [Teardown]    Remove code lists    ${CODE_LIST_16}

210. Update code list values vith different languages
    [Documentation]    Import code list and update code list and code values vith different languages. YTI-674
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_codes_with_languages_empty}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Update code list    ${Code_list_codes_with_languages}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}
    Wait until page contains    30 koodia    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "testcode28 - Testcode 28_fi")]    timeout=60
    Click Element    //*[contains(text(), "testcode28 - Testcode 28_fi")]
    Wait Until Page Contains    Koodisto600    timeout=60
    Wait Until Page Contains    Testcode 28_fi    timeout=60
    Wait Until Page Contains    Kuvaus_fi    timeout=60
    Wait Until Page Contains    Määritelmä_fi    timeout=60
    Change content language    ${CONTENT_LANGUAGE_EN}
    Wait Until Page Contains    Koodisto600_en    timeout=60
    Wait Until Page Contains    Testcode 28_en    timeout=60
    Wait Until Page Contains    Kuvaus_en    timeout=60
    Wait Until Page Contains    Määritelmä_en    timeout=60
    Change content language    ${CONTENT_LANGUAGE_SW_UG}
    Wait Until Page Contains    Koodisto600_sw    timeout=60
    Wait Until Page Contains    Testcode 28_sw    timeout=60
    Wait Until Page Contains    Kuvaus_sw    timeout=60
    Wait Until Page Contains    Määritelmä_sw    timeout=60
    Wait Until Element Is Visible    ${2_BREADCRUMB_LINK}    timeout=60
    Click Element    ${2_BREADCRUMB_LINK}
    Wait Until Element Is Visible    ${CODE_LIST_DDL}    timeout=60
    Wait Until Element Is Visible    ${CODELIST_INFO_TAB}    timeout=60
    Click Element    ${CODELIST_INFO_TAB}
    Change content language    ${CONTENT_LANGUAGE_SV}
    Wait Until Page Contains    Koodisto600_sv    timeout=60
    Wait Until Page Contains    Kuvaus_sv    timeout=60
    Wait Until Page Contains    Määritelmä_sv    timeout=60
    Wait Until Page Contains    muutostieto_sv    timeout=60
    Import codes in Excel format
    Upload codes    ${Update_codes_with_languages}
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Visible    //*[contains(text(), "testcode28 - Testcode 28_sv")]    timeout=60
    Click Element    //*[contains(text(), "testcode28 - Testcode 28_sv")]
    Change content language    ${CONTENT_LANGUAGE_AR_SO}
    Wait Until Page Contains    Testcode 28_ar    timeout=60
    Wait Until Page Contains    Kuvaus_ar    timeout=60
    Wait Until Page Contains    Määritelmä_ar    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

211. Change code statuses with code list status change
    [Documentation]    Change code statuses with code list status change. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Page Contains Element    ${CODELIST_INFO_TAB}    timeout=20
    Click Element    ${CODELIST_INFO_TAB}
    Wait Until Page Contains Element    ${MODIFY_CODE_LIST}    timeout=20
    Click Element    ${MODIFY_CODE_LIST}
    Wait Until Page Contains Element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click Element    ${CODE_LIST_STATUS_DDL}
    Wait Until Page Contains Element    ${VALID_STATUS}    timeout=20
    Click Element    ${VALID_STATUS}
    Wait Until Element Is Enabled    ${CHANGE_CODE_STATUSES_CHECKBOX}    timeout=20
    Select Checkbox    ${CHANGE_CODE_STATUSES_CHECKBOX}
    Wait Until Element Is Enabled    ${SAVE_CODE_LIST_MOD_BTN}    timeout=30
    Click Element    ${SAVE_CODE_LIST_MOD_BTN}
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=30
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait until page contains    Vaihda samalla koodien tilat?    timeout=20
    Wait Until Element Is Enabled    ${CONFIRMATION_YES_BTN}    timeout=30
    Click Element    ${CONFIRMATION_YES_BTN}
    Wait Until Page Contains    Koodien tilojen vaihtamisen tulos    timeout=20
    Wait Until Page Contains    Tila vaihdettu 30 koodiin    timeout=20
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    Wait Until Page Contains    Voimassa oleva    timeout=20
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Element Is Visible    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=60
    Click Element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

212. Change code statuses with mass function
    [Documentation]    Change code statuses with mass function. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Admin
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CHANGE_CODE_STATUSES_BTN}    timeout=20
    Click Element    ${CHANGE_CODE_STATUSES_BTN}
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_ORIGINAL}    timeout=20
    Click Element    ${DRAFT_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Visible    ${VALID_STATUS_TARGET}    timeout=20
    Click Element    ${VALID_STATUS_TARGET}
    Wait Until Element Is Enabled    ${SAVE_CODE_STATUS_CHANGE_BTN}    timeout=20
    Click Element    ${SAVE_CODE_STATUS_CHANGE_BTN}
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Element Is Visible    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=60
    Click Element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_16}

213. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CHANGE_CODE_STATUSES_BTN}    timeout=20
    Click Element    ${CHANGE_CODE_STATUSES_BTN}
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${VALID_STATUS_ORIGINAL}    timeout=20
    Click Element    ${VALID_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_TARGET}    timeout=20
    Click Element    ${DRAFT_STATUS_TARGET}
    Wait Until Element Is Enabled    ${SAVE_CODE_STATUS_CHANGE_BTN}    timeout=20
    Click Element    ${SAVE_CODE_STATUS_CHANGE_BTN}
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Element Is Visible    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=60
    Click Element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Luonnos    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_17}

214. Change code statuses with mass function as superuser
    [Documentation]    Change code statuses with mass function as superuser from Valid to Draft.
    ...    Check that status change is successful. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CHANGE_CODE_STATUSES_BTN}    timeout=20
    Click Element    ${CHANGE_CODE_STATUSES_BTN}
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${VALID_STATUS_ORIGINAL}    timeout=20
    Click Element    ${VALID_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_TARGET}    timeout=20
    Click Element    ${DRAFT_STATUS_TARGET}
    Wait Until Element Is Enabled    ${SAVE_CODE_STATUS_CHANGE_BTN}    timeout=20
    Click Element    ${SAVE_CODE_STATUS_CHANGE_BTN}
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Element Is Visible    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=60
    Click Element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Luonnos    timeout=60
    [Teardown]    Remove code lists    ${CODE_LIST_17}

215. Change code statuses with mass function and with invalid original status
    [Documentation]    Change code statuses with mass function and with invalid original status. Check Error message. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CHANGE_CODE_STATUSES_BTN}    timeout=20
    Click Element    ${CHANGE_CODE_STATUSES_BTN}
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_ORIGINAL}    timeout=20
    Click Element    ${DRAFT_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Element Is Visible    ${INCOMPLETE_STATUS_TARGET}    timeout=20
    Click Element    ${INCOMPLETE_STATUS_TARGET}
    Wait Until Element Is Enabled    ${SAVE_CODE_STATUS_CHANGE_BTN}    timeout=20
    Click Element    ${SAVE_CODE_STATUS_CHANGE_BTN}
    Wait Until Page Contains    ${Error_no_code_status_changes}    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    [Teardown]    Remove code lists    ${CODE_LIST_17}

216. Enforce status transition rules with code status change mass function
    [Documentation]    Enforce status transition rules with code status change mass function for superuser. YTI-41.
    [Tags]    regression    test    200    status_change
    [Setup]    Test Case Setup Superuser
    Upload codelist in Excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=60
    Wait Until Element Is Enabled    ${CODE_LIST_DDL}    timeout=20
    Click Element    ${CODE_LIST_DDL}
    Wait Until Page Contains Element    ${CHANGE_CODE_STATUSES_BTN}    timeout=20
    Click Element    ${CHANGE_CODE_STATUSES_BTN}
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_ORIGINAL}    timeout=20
    Click Element    ${DRAFT_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Wait Until Page Contains Element    ${INCOMPLETE_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${DRAFT_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${SUGGESTED_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${VALID_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${SUPERSEDED_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${RETIRED_STATUS_TARGET}    timeout=60
    Wait Until Page Contains Element    ${INVALID_STATUS_TARGET}    timeout=60
    Sleep    1
    Select Checkbox    ${ENFORCE_STATUS_TRANSITION_CHECKBOX}
    Sleep    1
    Wait Until Element Is Enabled    ${ORIGINAL_STATUS_DDL}    timeout=20
    Click Element    ${ORIGINAL_STATUS_DDL}
    Wait Until Element Is Visible    ${DRAFT_STATUS_ORIGINAL}    timeout=20
    Click Element    ${DRAFT_STATUS_ORIGINAL}
    Wait Until Element Is Enabled    ${TARGET_STATUS_DDL}    timeout=20
    Click Element    ${TARGET_STATUS_DDL}
    Sleep    1
    Page Should Not Contain Element    ${DRAFT_STATUS_TARGET}    timeout=60
    Page Should Not Contain Element    ${SUGGESTED_STATUS_TARGET}    timeout=60
    Page Should Not Contain Element    ${SUPERSEDED_STATUS_TARGET}    timeout=60
    Page Should Not Contain Element    ${RETIRED_STATUS_TARGET}    timeout=60
    Page Should Not Contain Element    ${INVALID_STATUS_TARGET}    timeout=60
    Page Should Contain Element    ${INCOMPLETE_STATUS_TARGET}    timeout=20
    Wait Until Element Is Visible    ${VALID_STATUS_TARGET}    timeout=20
    Click Element    ${VALID_STATUS_TARGET}
    Wait Until Element Is Enabled    ${SAVE_CODE_STATUS_CHANGE_BTN}    timeout=20
    Click Element    ${SAVE_CODE_STATUS_CHANGE_BTN}
    Wait Until Page Contains    Tila vaihdettu 30 koodiin.    timeout=20
    Sleep    1
    Wait Until Element Is Enabled    ${CLOSE_ALERT_MODAL_LINK}    timeout=30
    Click Element    ${CLOSE_ALERT_MODAL_LINK}
    Wait Until Page Contains Element    ${CODELIST_CODES_TAB}    timeout=20
    Click Element    ${CODELIST_CODES_TAB}
    Wait Until Element Is Visible    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=60
    Click Element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Koodin nimi    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
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
    Wait Until Page Contains Element    //*[contains(text(), "testcode56 - Testcode 56")]    timeout=20
    Click Element    //*[contains(text(), "testcode56 - Testcode 56")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
    Wait Until Element Is Visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click Element    ${2_BREADCRUMB_LINK}
    Sleep    1
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=30
    Import codes in CSV format
    Upload codes    ${Codes_status_with_space_csv}
    Wait Until Page Contains Element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click Element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait Until Page Contains    Koodin arvo    timeout=60
    Wait Until Page Contains    Voimassa oleva    timeout=60
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
    Wait Until Page Contains Element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click Element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait Until Page Contains    Käyttöohje    timeout=60
    Wait Until Page Contains    https://www.suomi.fi/viestit    timeout=60
    Wait Until Page Contains    Liittyvä linkki    timeout=60
    Wait Until Page Contains    https://www.suomi.fi/etusivu/    timeout=60
    Wait Until Page Contains    https://yle.fi/    timeout=60
    Wait Until Page Contains    Lisenssi    timeout=60
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=60
    Wait Until Element Is Visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click Element    ${2_BREADCRUMB_LINK}
    Sleep    1
    Wait Until Page Contains Element    ${CODE_LIST_DDL}    timeout=30
    Import codes in CSV format
    Upload codes    ${Code_links_with_space_csv}
    Wait Until Page Contains Element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click Element    //*[contains(text(), "testcode56 - Testcode 56")]
    Page Should Not Contain    Käyttöohje
    Page Should Not Contain    Liittyvä linkki
    Page Should Not Contain    Lisenssi
    Wait Until Element Is Visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click Element    ${2_BREADCRUMB_LINK}
    Sleep    1
    Wait Until Page Contains Element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click Element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait Until Page Contains    Käyttöohje    timeout=60
    Wait Until Page Contains    https://www.suomi.fi/viestit    timeout=60
    Wait Until Page Contains    Liittyvä linkki    timeout=60
    Wait Until Page Contains    https://www.suomi.fi/etusivu/    timeout=60
    Wait Until Page Contains    https://yle.fi/    timeout=60
    Wait Until Page Contains    Lisenssi    timeout=60
    Wait Until Page Contains    Creative Commons CC0 1.0 Yleismaailmallinen (CC0 1.0)    timeout=60
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

219. Create new code list and codes with different languages
    [Documentation]    Create new code list and codes with different languages
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Create Code List With All Languages    ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    koodisto6000_fi    koodisto6000_en
    ...    koodisto6000_sv    Asuminen
    Wait Until Page Contains    koodisto6000_fi    timeout=20
    Wait Until Page Contains    koodisto6000_en    timeout=20
    Wait Until Page Contains    koodisto6000_sv    timeout=20
    Create New Code With All Languages    NewCode001    newCode001_fi    newCode001_en    newCode001_sv    ${DRAFT_STATUS}    ${EMPTY}
    Wait Until Page Contains    NewCode001 - newCode001_fi    timeout=30
    Wait Until Page Contains    koodisto6000_fi    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    NewCode001    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    newCode001_en    timeout=20
    Wait Until Page Contains    newCode001_fi    timeout=20
    Wait Until Page Contains    newCode001_sv    timeout=20
    Wait Until Element Is Visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click Element    ${2_BREADCRUMB_LINK}
    Sleep    1
    Remove code    NewCode001 - newCode001_fi
    Click Element    ${CODELIST_INFO_TAB}
    Wait Until Page Contains    koodisto6000_fi    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    koodisto6000_fi

*** Keywords ***
Go back to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click Element    ${FRONTPAGE_LINK}
    Sleep    2

Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=20
    Click Element    ${STATUS_DROPDOWN_BTN}
    Click Element    //*[contains(text(), "${STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=20
    Click Element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=20
    Click Element    //*[contains(text(), "Muokkaa")]
    Sleep    1

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click Element    ${SAVE_CODE_LIST_MOD_BTN}
    Wait Until Page Contains Element    ${MODIFY_CODE_LIST}    timeout=90
