*** Variables ***
${CALCULATION_HIERARCHY}    id=create_extension_calculationhierarchy_button
${DEFINITION_HIERARCHY}    id=create_extension_definitionhierarchy_button
${CROSS_REFERENCE_LIST}    id=create_extension_cross-reference-list_button

#error messages
${Error_missing_codeschemes}    Jäseneen liitetty koodi ei kuulu tähän koodistoon tai laajennukseen liitettyihin koodistoihin.
${Error_invalid_code}    Jäseneen liitettyä koodia ei ole olemassa tunnisteella:
${Error_max_hierarchy_level}    Jäsenten hierarkkisten tasojen maksimiarvo ylittyi.
${Error_member_value_missing}    Aineistossa puuttuu pakollinen arvo jostain jäsenen arvo-sarakkeesta riviltä 6.
${Error_member_value_invalid}    Jäsenen arvo ei ole sallittu rivillä 3.
${Error_codes_linked}    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa:
${Error_relations_to_other_members}    Koodilaajennuksissa ei sallita jäsenten välisiä linkityksiä.
${Error_2_dpms}    Aineistossa on useita samantyyppisiä koodilaajennuksia.
${Error_linked_code}    Koodia ei voi poistaa, koska se on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567333/extension/O1234567890123456789012345678901234567111/member/
${Error_duplicate_members_for_same_code}    Koodilaajennuksella ei voi olla useita jäseniä samalla koodilla.
${Error_duplicate_member_id_values}    MEMBER_ID-sarakkeessa esiintyvät seuraavat arvot useammin kuin kerran: 1, 3.
${Error_invalid_member_relation}    Jäsentä ei voitu määrittää tunnisteella: testcode10
${Error_invalid_propertytype}    Ei sallittu tyypitys laajennus-aineistolle: ExternalReference

*** Keywords ***
Upload extension
    [Arguments]    ${extension}    ${file_format}
    Click element with wait     ${CODE_LIST_DDL}                timeout=30
    Click element with wait     ${IMPORT_EXTENSIONS_BTN}        timeout=30
    Click element with wait     ${FILE_FORMAT_UPLOAD}           timeout=20
    Click element with wait     ${file_format}                  timeout=20

    Sleep                       2
    Choose File                 ${EXTENSION_FILE_UPLOAD}        ${extension}
    Click element with wait     ${EXTENSION_UPLOAD_BTN}         timeout=20
    Click element with wait     ${EXTENSIONS_TAB}               timeout=20
    Log To Console    Extension imported

Upload members
    [Arguments]    ${member}    ${file_format}
    Click element with wait     ${EXTENSION_DDL}                    timeout=30
    Click element with wait     ${IMPORT_MEMBERS_BTN}               timeout=30
    Click element with wait     ${FILE_FORMAT_UPLOAD}               timeout=20
    Click element with wait     ${file_format}                      timeout=20
    Wait until page contains element    ${EXTENSION_FILE_UPLOAD}    timeout=20
    Choose File                         ${EXTENSION_FILE_UPLOAD}    ${member}

    Wait until page contains element    ${MEMBER_UPLOAD_BTN}        timeout=20
    Click Button                        ${MEMBER_UPLOAD_BTN}
    Log To Console    Member imported

Create extension
    [Arguments]    ${property_type}    ${extension_codevalue}    ${extension_name}    ${extension_status}    ${code_list_name}    ${member_auto_create}
    Click element with wait     ${CODE_LIST_DDL}    timeout=30
    Click element with wait     ${property_type}    timeout=30

    Input text with wait                ${EXTENSION_VALUE_INPUT}    ${extension_codevalue}      timeout=30
    Input text with wait                ${EXTENSION_NAME_INPUT}     ${extension_name}           timeout=30
    Click element with wait             ${EXTENSION_STATUS_DDL}                                 timeout=20
    Click element with wait             ${extension_status}                                     timeout=20

    Run Keyword If  "${code_list_name}"!="${EMPTY}"    Add code list to extension    ${code_list_name}
    Run Keyword If    '${member_auto_create}' == 'True'    Click element with wait  ${AUTO_CREATE_MEMBERS_CHECKBOX}
    Capture Page Screenshot
    Wait Until Element Is Enabled       ${SAVE_EXTENSION}       timeout=30
    Click Button                        ${SAVE_EXTENSION}
    Wait Until Element Is Visible        ${MEMBERS_TAB}         timeout=60
    Log To Console    ${extension_name} created

Delete extension
    Click element with wait             ${EXTENSION_DDL}                    timeout=30
    Click element with wait             ${EXTENSION_DELETE_BTN}             timeout=30
    Click element with wait             ${CONFIRM_DELETE_EXTENSION_BTN}     timeout=30
    Log To Console    Extension deleted

Add code list to extension
    [Arguments]    ${code_list_name}
    Click element with wait             ${ADD_CODE_LIST_TO_EXTENSION_BTN}                   timeout=30
    Input text with wait                ${SEARCH_LINKED_CODE_INPUT}    ${code_list_name}    timeout=30
    Click element that contains text    ${code_list_name}                                   timeout=30

Create member for definition hierarchy
    [Arguments]    ${member_name}    ${code_list_name}    ${code}
    Wait Until Page Contains Element    ${EXTENSION_DDL}                        timeout=30
    Click Button                        ${EXTENSION_DDL}
    Wait Until Page Contains Element    ${CREATE_MEMBER_BTN}                    timeout=30
    Click Button                        ${CREATE_MEMBER_BTN}
    Input text with wait                ${MEMBER_NAME_INPUT}    ${member_name}  timeout=30

    Run Keyword If  "${code_list_name}"!="${EMPTY}"    Add code to member from code list    ${code_list_name}    ${code}
    ...    ELSE    Add code to member    ${code}
    Wait Until Page Contains Element    ${SAVE_MEMBER}              timeout=30
    Click Button                        ${SAVE_MEMBER}
    Wait Until Element Is Visible        ${MODIFY_MEMBER_BTN}       timeout=60
    Log To Console    ${member_name} created

Create member for calculation hierarchy
    [Arguments]    ${member_name}    ${comparison_operator}    ${unary_operator}    ${code_list_name}    ${code}    ${broader_member}
    Wait Until Page Contains Element    ${EXTENSION_DDL}                        timeout=30
    Click Button                        ${EXTENSION_DDL}
    Wait Until Page Contains Element    ${CREATE_MEMBER_BTN}                    timeout=30
    Click Button                        ${CREATE_MEMBER_BTN}
    Input text with wait                ${MEMBER_NAME_INPUT}    ${member_name}  timeout=30

    ${comparison_operator_length}=    Get Length    ${comparison_operator}
    Run Keyword If    ${comparison_operator_length} > 0    Add comparison operator    ${comparison_operator}
    ${unary_operator_length}=    Get Length    ${unary_operator}
    Run Keyword If    ${unary_operator_length} > 0    Add unary operator    ${unary_operator}
    Run Keyword If  "${code_list_name}"!="${EMPTY}"   Add code to member from code list    ${code_list_name}    ${code}
    ...    ELSE    Add code to member    ${code}

    ${broader_member_length}=    Get Length    ${broader_member}
    Run Keyword If    ${broader_member_length} > 0    Add broader member    ${broader_member}

    Wait Until Page Contains Element    ${SAVE_MEMBER}    timeout=30
    Click Button                        ${SAVE_MEMBER}
    Wait Until Element Is Enabled       ${MODIFY_MEMBER_BTN}    timeout=60
    Log To Console    ${member_name} created

Add comparison operator
    [Arguments]    ${comparison_operator}
    Input text with wait        ${COMPARISON_OPERATOR_INPUT}    ${comparison_operator}      timeout=30

Add unary operator
    [Arguments]    ${unary_operator}
    Input text with wait        ${UNARY_OPERATOR_INPUT}    ${unary_operator}        timeout=30

Add broader member
    [Arguments]    ${broader_member}
    Wait Until Page Contains Element    ${ADD_MEMBER_BTN}                               timeout=30
    Click Button                        ${ADD_MEMBER_BTN}
    Input text with wait                ${SEARCH_MEMBER_INPUT}    ${broader_member}     timeout=30
    Click element that contains text    ${broader_member}                               timeout=20

Add code to member from code list
    [Arguments]    ${code_list_name}    ${code}
    Wait Until Page Contains Element    ${ADD_CODE_TO_MEMBER_BTN}                   timeout=30
    Click Button                        ${ADD_CODE_TO_MEMBER_BTN}
    Click element with wait             ${CODE_SCHEME_DDL_BTN}                      timeout=30
    Click element that contains text    ${code_list_name}                           timeout=20
    Input text with wait                ${SEARCH_CODE_TO_MEMBER_INPUT}    ${code}   timeout=30
    Click element that contains text    ${code}                                     timeout=30

Add code to member
    [Arguments]    ${code}
    Wait Until Page Contains Element    ${ADD_CODE_TO_MEMBER_BTN}                   timeout=30
    Click Button                        ${ADD_CODE_TO_MEMBER_BTN}
    Input text with wait                ${SEARCH_CODE_TO_MEMBER_INPUT}    ${code}   timeout=30
    Click element that contains text    ${code}                                     timeout=30

Delete member
    Click element with wait             ${MEMBER_DDL}                       timeout=30
    Click element with wait             ${MEMBER_DELETE_BTN}                timeout=30
    Click element with wait             ${CONFIRM_DELETE_EXTENSION_BTN}     timeout=30
    Log To Console    Member deleted

Remove codelist
    [Arguments]    ${code_list}
    Input text with wait                id=search_box_input    ${code_list}     timeout=30
    Click element that contains text    ${code_list}                            timeout=30
    Wait Until Page Contains            ${code_list}
    Click element that contains text    TIEDOT                                  timeout=20
    Page Should Contain                 testiautomaatiokoodisto
    Page Should Contain                 testiautomaatiokoodisto1

    Click element with wait             ${DELETE_CODE_LIST_BTN}                 timeout=20
    Click element with wait             ${REMOVE_CODE_LIST_CONF_BTN}            timeout=20
    Input text with wait                id=search_box_input    ${code_list}     timeout=30
    Wait Until Page Contains    Haulla ei löytynyt yhtään koodistoa.

Remove code lists with extensions
    [Arguments]    @{code_list_items}
    FOR    ${code_list_item}    IN    @{code_list_items}
        Return to Koodistot frontpage
        Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

        Input text with wait                ${SEARCH_BOX_INPUT}    ${code_list_item}    timeout=30
        Click element that contains text    ${code_list_item}                           timeout=30
        Wait Until Page Contains            ${code_list_item}                           timeout=60
        ${extension_exists}=    Run Keyword And Return Status    Page should contain element    ${EXTENSIONS_TAB}
        Run Keyword If    ${extension_exists}    Delete extension before code list    ${code_list_item}
        ...    ELSE    Continue code list deletion    ${code_list_item}
    END
    Close All Browsers

Continue code list deletion
    [Arguments]    ${code_list_item}
    Click element with wait             ${CODE_LIST_DDL}                timeout=20
    Click element with wait             ${DELETE_CODE_LIST_BTN}         timeout=20
    Click element with wait             ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20

    Input text with wait                ${SEARCH_BOX_INPUT}    ${code_list_item}    timeout=60
    Wait Until Page Contains            Haulla ei löytynyt yhtään koodistoa.    timeout=60
    Log To Console    ${code_list_item} removed

Delete extension before code list
    [Arguments]    ${code_list_item}
    FOR    ${CheckStatus}    IN RANGE    10
        ${Status}    Get Text               //*[contains(text(), "LAAJENNUKSET")]
        Page Should Contain                 ${status}
        Click element with wait             ${EXTENSIONS_TAB}                       timeout=20
        Click element with wait             //*[contains(@id,'_view_extension')]    timeout=20
        Click element with wait             ${EXTENSION_DDL}                        timeout=30
        Click element with wait             ${EXTENSION_DELETE_BTN}                 timeout=30
        Click element with wait             ${CONFIRM_DELETE_EXTENSION_BTN}         timeout=30
        Log To Console                      Extension deleted
        ${exit}=    Run Keyword And Return Status    Page Should Not Contain element    //*[contains(text(), "LAAJENNUKSET")]   timeout=20
        Exit For Loop If    ${exit}
    END
    Continue code list deletion    ${code_list_item}

Create DPM extension
    [Arguments]    ${extension_type}    ${member_auto_create}    ${extension_status}
    Click element with wait             ${CODE_LIST_DDL}        timeout=30
    Click element with wait             ${extension_type}       timeout=30
    Run Keyword If    '${member_auto_create}' == 'True'    Click element with wait      ${AUTO_CREATE_MEMBERS_CHECKBOX}     timeout=20

    Input Text with wait                ${START_DATE_INPUT}     2018-11-01      timeout=20
    Input Text with wait                ${END_DATE_INPUT}       2020-11-01      timeout=20
    Click element with wait             ${CODE_STATUS_DDL}                      timeout=20
    Click element with wait             ${extension_status}                     timeout=20
    Click element with wait             ${SAVE_EXTENSION}                       timeout=30
    Wait Until Element Is Enabled       ${MODIFY_EXTENSION_BTN}                 timeout=60
    Log To Console    DPM extension created
