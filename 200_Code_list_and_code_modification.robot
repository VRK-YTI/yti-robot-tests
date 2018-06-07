*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Setup       Create draft codelist
Suite Teardown    Remove draft codelist
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot

*** Variables ***
#Error messages
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Test Cases ***
200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}
    Click element    ${CANCEL_CODE_MOD_BTN}
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Wait until page contains element    ${CODE_DESC_INPUT}    timeout=20
    Input Text    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Wait until page contains element    ${CODE_SHORT_NAME_INPUT}    timeout=20
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Tämä on uusi nimi koodille
    Wait until page contains    Tämä on uusi kuvaus koodille
    Wait until page contains    Tämä on uusi lyhyt nimi
    Sleep    1
    [Teardown]    Restore code modify

201. Add link to the DRAFT Code
    [Documentation]    Add link to the draft code, check link functionalty and remove the link.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Sleep    1
    Wait until page contains element    ${ADD_NEW_LINK_BTN}    timeout=20
    Click element    ${ADD_NEW_LINK_BTN}
    Sleep    1
    Wait until page contains element    ${LINK_TYPE_DROPDOWN}    timeout=20
    Click element    ${LINK_TYPE_DROPDOWN}
    Sleep    1
    Wait until page contains element    ${DROPDOWN_ITEM_LINK}    timeout=20
    Click element    ${DROPDOWN_ITEM_LINK}
    Sleep    1
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Sleep    1
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${ADD_BTN}    timeout=20
    Click element    ${ADD_BTN}
    Sleep    1
    Wait until page contains    Linkki
    Page should contain    https://www.suomi.fi/etusivu/
    Click element    //*[contains(text(), "https://www.suomi.fi/etusivu/")]
    Sleep    1
    Wait until page contains element    ${LINK_1}    timeout=20
    Click element    ${LINK_1}
    Sleep    1
    Select Window    title=Etusivu - Suomi.fi
    Sleep    1
    Select Window    title=Koodistot
    Wait until page contains element    ${LINK_MODAL_OK_BTN}    timeout=20
    Click element    ${LINK_MODAL_OK_BTN}
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    [Teardown]    Remove links from draft code

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Sleep    1
    Select Radio Button    externalReference    9a25f7fc-e4be-11e7-82ab-479f4f288376_external_reference_input
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=20
    Click element    ${SELECT_LINK_BTN}
    Sleep    1
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    Modify code
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Sleep    1
    Page should not contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    [Teardown]    Go back to Koodistot frontpage

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=20
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Wait until page contains element    ${ADD_NEW_LINK_BTN}    timeout=20
    Click element    ${ADD_NEW_LINK_BTN}
    Wait until page contains element    ${LINK_TYPE_DROPDOWN}    timeout=20
    Click element    ${LINK_TYPE_DROPDOWN}
    Wait until page contains element    ${DROPDOWN_ITEM_LINK}    timeout=20
    Click Element    ${DROPDOWN_ITEM_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Click Element    ${ADD_BTN}
    Wait until page contains    Linkki
    Save code modification
    Sleep    3
    Modify code
    Wait until page contains element    ${MODIFY_LINK_ICON}
    Click element    ${MODIFY_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=20
    Click element    ${LINK_NAME_INPUT}
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi
    Wait until page contains element    ${SAVE_LINK_MODIFY_BTN}    timeout=20
    Click Element    ${SAVE_LINK_MODIFY_BTN}
    Wait until page contains    Linkki
    Page should contain    www.suomi.fi
    Save code modification
    Reload Page
    [Teardown]    Delete link from code

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${CODE_START_DATE_BTN}    timeout=20
    Click element    ${CODE_START_DATE_BTN}
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)
    Sleep    5
    Wait until page contains element    ${CODE_END_DATE_BTN}    timeout=20
    Click element    ${CODE_END_DATE_BTN}
    Sleep    1
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Sleep    1
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)
    Sleep    1
    Save code modification
    Sleep    3
    Page should contain    02.01.2018 - 27.02.2018
    [Teardown]    Clear dates from code

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${CODE_LIST_START_DATE_BTN}    timeout=20
    Click element    ${CODE_LIST_START_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Sleep    1
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(2)    timeout=20
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Sleep    2
    Wait until page contains element    ${CODE_LIST_END_DATE_BTN}    timeout=20
    Click element    ${CODE_LIST_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Sleep    2
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)
    Save code list
    Sleep    5
    Wait until page contains    ${Error_end_date_before_start_date}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=20
    Click element    ${CANCEL_CODE_MOD_BTN}
    [Teardown]    Go back to Koodistot frontpage

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list and restore original status. YTI-445
    [Tags]    regression
    [Setup]    Test Case Setup create valid codelist
    Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click element    ${CODE_LIST_STATUS_DDL}
    Sleep    2
    Page should not contain    Luonnos
    Page should not contain    Odottaa hyväksyntää
    Click button    Korvattu
    Save code list
    Sleep    5
    Wait until page contains element    //*[contains(text(), "Korvattu")]
    Sleep    2
    Go back to Koodistot frontpage
    [Teardown]    Test Case Teardown remove valid codelist

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list and restore original values. YTI-523
    [Tags]    regression
    [Setup]    Test Case Setup create valid codelist
    Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    Testinimi
    Sleep    1
    Wait until page contains element    ${CODE_LIST_DESC_INPUT}    timeout=20
    Input text    ${CODE_LIST_DESC_INPUT}    Uusi kuvaus
    Sleep    1
    Wait until page contains element    ${CODE_LIST_DEF_INPUT}    timeout=20
    Input text    ${CODE_LIST_DEF_INPUT}    Uusi määritelmä
    Sleep    1
    Wait until page contains element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=20
    Input text    ${CODE_LIST_CHANGENOTE_INPUT}    Uusi muutostieto
    Sleep    1
    Save code list
    Sleep    2
    Page should contain    Testinimi
    Page should contain    Uusi kuvaus
    Page should contain    Uusi määritelmä
    Page should contain    Uusi muutostieto
    Page should contain    Oikeusturva
    Restore valid Code list
    [Teardown]    Test Case Teardown remove valid codelist

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression
    [Setup]    Test Case Setup Admin
    Choose testiautomaatiokoodisto and edit
    Page should contain element    ${CLASSIFICATION_2}
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Sleep    1
    Save code list
    Sleep    5
    Wait until page contains element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    //*[contains(text(), "Koulutus")]
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Sleep    1
    Click element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Asuminen")]
    Click element    //*[contains(text(), "Asuminen")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    2
    [Teardown]    Remove classification from code list

*** Keywords ***
Restore code modify
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    Automaatiokoodi
    Wait until page contains element    ${CODE_DESC_INPUT}    timeout=20
    Input Text    ${CODE_DESC_INPUT}    Tämä on kuvaus koodille
    Wait until page contains element    ${CODE_SHORT_NAME_INPUT}    timeout=20
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on lyhyt nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Automaatiokoodi
    Wait until page contains    Tämä on kuvaus koodille
    Wait until page contains    Tämä on lyhyt nimi
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers

Go back to Koodistot frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers

Remove links from draft code
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=20
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    1
    Choose testiautomaatiokoodisto code and edit
    Sleep    3
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Sleep    1
    Page should not contain    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers

Clear dates from code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_START_DATE_INPUT}    timeout=20
    Clear element text    ${CODE_START_DATE_INPUT}
    Wait until page contains element    ${CODE_END_DATE_INPUT}    timeout=20
    Clear element text    ${CODE_END_DATE_INPUT}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Page should not contain    02.01.2018 - 27.02.2018
    Go back to Koodistot frontpage
    Close All Browsers

Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains    ${TEST_CODE_1}
    Sleep    1
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Sleep    1

Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=20
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=20
    Click element    //*[contains(text(), "Muokkaa")]
    Sleep    1

Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${STATUS_VALID_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_6}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_6}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_6}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=20
    Click element    //*[contains(text(), "Muokkaa")]
    Sleep    1

Restore valid Code list status
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click element    ${CODE_LIST_STATUS_DDL}
    Click button    Voimassa oleva
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Sleep    3
    Wait until page contains    Voimassa oleva
    Sleep    2
    Go back to Koodistot frontpage
    Close All Browsers

Restore valid Code list
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    //*[contains(text(), "Muokkaa")]
    Sleep    1
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    testiautomaatiokoodisto 2
    Sleep    1
    Wait until page contains element    ${CODE_LIST_DESC_INPUT}    timeout=20
    Input text    ${CODE_LIST_DESC_INPUT}    Tämä on kuvaus
    Sleep    1
    Wait until page contains element    ${CODE_LIST_DEF_INPUT}    timeout=20
    Input text    ${CODE_LIST_DEF_INPUT}    Tämä on määritelmä
    Sleep    1
    Wait until page contains element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=20
    Input text    ${CODE_LIST_CHANGENOTE_INPUT}    Muutostieto
    Sleep    1
    Click element    //*[contains(text(), "Tallenna")]
    Sleep    1
    Wait until page contains    testiautomaatiokoodisto2    timeout=20
    Wait until page contains    testiautomaatiokoodisto 2    timeout=20
    Wait until page contains    Tämä on kuvaus    timeout=20
    Wait until page contains    Tämä on määritelmä    timeout=20
    Wait until page contains    Muutostieto    timeout=20
    Wait until page contains    Oikeusturva    timeout=20
    Sleep    2
    Go back to Koodistot frontpage
    Close All Browsers

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Sleep    1

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Sleep    1

Save code modification
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    4

Delete link from code
    Modify code
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Page should not contain    www.suomi.fi
    Save code modification
    Sleep    2
    Go back to Koodistot frontpage

Remove classification from code list
    Choose testiautomaatiokoodisto and edit
    Page should contain element    //*[contains(text(), "Asuminen")]
    Page should contain element    //*[contains(text(), "Koulutus")]
    Wait until page contains element    ${CLASSIFICATION_3}
    Click element    ${CLASSIFICATION_3}
    Save code list
    Sleep    3
    Page should not contain element    //*[contains(text(), "Asuminen")]
    Page should contain element    //*[contains(text(), "Koulutus")]
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers

Create draft codelist
    Test Case Setup Admin
    Create testiautomaatiokoodisto with one code
    Close All Browsers

Remove draft codelist
    Test Case Setup Superuser
    Remove testiautomaatiokoodisto with one code
    Close All Browsers

Test Case Setup create valid codelist
    Test Case Setup Admin
    Create testiautomaatiokoodisto 2 with one code

Test Case Teardown remove valid codelist
    Test Case Setup Superuser
    Remove testiautomaatiokoodisto 2 with one code
