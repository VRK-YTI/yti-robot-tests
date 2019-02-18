*** Variables ***
${CALCULATION_HIERARCHY}    id=create_extension_calculationhierarchy_button
${DEFINITION_HIERARCHY}    id=create_extension_definitionhierarchy_button
${CROSS_REFERENCE_LIST}    id=create_extension_cross-reference-list_button
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Codelist_Extensions_members}    ${DATAFOLDER}${/}Codelist_with_def_hierarchy_extensions_and_members.xlsx
${Code_list_with_30_Codes}    ${DATAFOLDER}${/}Code_list_with_30_Codes.xlsx
${Extension_calculation_hierarchy}    ${DATAFOLDER}${/}Extension_calculation_hierarchy.xlsx
${Extension_definition_hierarchy}    ${DATAFOLDER}${/}Extension_definition_hierarchy.xlsx
${Calculation_hierarchy_members}    ${DATAFOLDER}${/}Calculation_hierarchy_members.xlsx
${Definition_hierarchy_members}    ${DATAFOLDER}${/}Definition_hierarchy_members.xlsx
${Extensions_without_codeschemes_value}    ${DATAFOLDER}${/}Extensions_without_codeschemes_value.xlsx
${Extensions_invalid_code_in_members_sheet}    ${DATAFOLDER}${/}Extensions_invalid_code_in_members_sheet.xlsx
${Extensios_max_hierarchy_level}    ${DATAFOLDER}${/}Extensions_max_hierarchy_level.xlsx
${Extension_Scheme_calculation_hierarchy}    ${DATAFOLDER}${/}Extension_Scheme_calculation_hierarchy.xlsx
${Unaryoperator_value_missing}    ${DATAFOLDER}${/}Calculation_hierarchy_members_unaryoperator_value_missing.xlsx
${Extensions_no_extensionvalue_column}    ${DATAFOLDER}${/}Extensions_no_extensionvalue_column.xlsx
${Code_list_with_30_Codes_valid}    ${DATAFOLDER}${/}Code_list_with_30_Codes_valid.xlsx
${Extensions_new_version_creation}    ${DATAFOLDER}${/}Extensions_and_members_for_new_version_creation.xlsx
${Invalid_unaryoperator_value}    ${DATAFOLDER}${/}Calculation_members_invalid_unary_operator.xlsx
${Code_list_extensions_broader_members}    ${DATAFOLDER}${/}Codelist_with_codes_extensions_ and_broader_members.xlsx
${Modify_dpm_metric}    ${DATAFOLDER}${/}Modify_dpm_metric.xlsx
${2_dpms_should_fail}    ${DATAFOLDER}${/}Modify_dpm_metric_2_dpms_should_fail.xlsx
${Modify_DPM_explicit_domain}    ${DATAFOLDER}${/}Modify_DPM_explicit_domain_extension.xlsx
${Code_list_codes_DPM_Dimension_extension}    ${DATAFOLDER}${/}Code_list_codes_DPM_Dimension_extension.xlsx
${Code_list_codes_DPM_extension_all}    ${DATAFOLDER}${/}Code_list_codes_DPM_all.xlsx
${DPM_extension_relations_to_other_members}    ${DATAFOLDER}${/}DPM_extensions_relations_to_other_members.xlsx
${Code_list_for_cross_reference_list_creation}    ${DATAFOLDER}${/}Code_list_and_codes_for_cross_reference_list.xlsx
${Code_list_with_links_and_default_code}    ${DATAFOLDER}${/}Code_list_with_links_and_default_code.xlsx
${Code_list_with_cross_reference_list}    ${DATAFOLDER}${/}Code_list_with_cross_reference_list.xlsx
${filter_1_Code_list_three_extensions}    ${DATAFOLDER}${/}filter_1_Code_list_three_extensions.xlsx
${filter_2_Code_list_one_extension}    ${DATAFOLDER}${/}filter_2_Code_list_one_extension.xlsx
${Code_list_with_calculation_hierarchy_members}    ${DATAFOLDER}${/}Code_list_calc_hier_members.xlsx
#CSV paths
${Calculation_hierarchy_members_csv}    ${DATAFOLDER}${/}Calculation_hierarchy_members_csv.csv
${Unaryoperator_value_missing_csv}    ${DATAFOLDER}${/}Calculation_hierarchy_members_unaryoperator_value_missing_csv.csv
${Invalid_unaryoperator_value_csv}    ${DATAFOLDER}${/}Calculation_members_invalid_unary_operator_csv.csv
${Calc_def_hierarchy_extensions_csv}    ${DATAFOLDER}${/}Calculation_definition_extensions_csv.csv
#error messages
${Error_missing_codeschemes}    Jäseneen liitetty koodi ei kuulu tähän koodistoon tai laajennukseen liitettyihin koodistoihin.
${Error_invalid_code}    Jäseneen liitettyä koodia ei ole olemassa tunnisteella:
${Error_max_hierarchy_level}    Jäsenten maksimi hierarkkinen taso ylittyi.
${Error_member_value_missing}    Aineistossa puuttuu pakollinen arvo jostain jäsenen arvo-sarakkeesta riviltä 6.
${Error_member_value_invalid}    Jäsenen arvo ei ole sallittu rivillä 3.
${Error_codes_linked}    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa:
${Error_relations_to_other_members}    Koodilaajennuksissa ei sallita jäsenten välisiä linkityksiä.
${Error_2_dpms}    Aineistossa on useita samantyyppisiä koodilaajennuksia.
${Error_linked_code}    Koodia ei voi poistaa, koska se on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567333/extension/O1234567890123456789012345678901234567111/member/

*** Keywords ***
Upload extension
    [Arguments]    ${extension}    ${file_format}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=30
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${IMPORT_EXTENSIONS_BTN}    timeout=30
    Click element    ${IMPORT_EXTENSIONS_BTN}
    Wait until page contains element    ${FILE_FORMAT_UPLOAD}    timeout=20
    Click element    ${FILE_FORMAT_UPLOAD}
    Wait until page contains element    ${file_format}    timeout=20
    Click element    ${file_format}
    Sleep    2
    Choose file    ${EXTENSION_FILE_UPLOAD}    ${extension}
    Sleep    2
    Wait until page contains element    ${EXTENSION_UPLOAD_BTN}    timeout=20
    Click button    ${EXTENSION_UPLOAD_BTN}
    Sleep    2
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Log to Console    Extension imported
    Sleep    1

Upload members
    [Arguments]    ${member}    ${file_format}
    Wait until page contains element    ${EXTENSION_DDL}    timeout=30
    Click element    ${EXTENSION_DDL}
    Wait until page contains element    ${IMPORT_MEMBERS_BTN}    timeout=30
    Click element    ${IMPORT_MEMBERS_BTN}
    Wait until page contains element    ${FILE_FORMAT_UPLOAD}    timeout=20
    Click element    ${FILE_FORMAT_UPLOAD}
    Wait until page contains element    ${file_format}    timeout=20
    Click element    ${file_format}
    Wait until page contains element    ${EXTENSION_FILE_UPLOAD}    timeout=20
    Choose file    ${EXTENSION_FILE_UPLOAD}    ${member}
    Sleep    2
    Wait until page contains element    ${MEMBER_UPLOAD_BTN}    timeout=20
    Click button    ${MEMBER_UPLOAD_BTN}
    Log to Console    Member imported
    Sleep    2

Create extension
    [Arguments]    ${property_type}    ${extension_codevalue}    ${extension_name}    ${extension_status}    ${code_list_name}    ${member_auto_create}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=30
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${property_type}    timeout=30
    Click element    ${property_type}
    Sleep    2
    Wait until page contains element    ${EXTENSION_VALUE_INPUT}    timeout=30
    Input Text    ${EXTENSION_VALUE_INPUT}    ${extension_codevalue}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}    timeout=30
    Input Text    ${EXTENSION_NAME_INPUT}    ${extension_name}
    Wait until page contains element    ${EXTENSION_STATUS_DDL}    timeout=20
    Click element    ${EXTENSION_STATUS_DDL}
    Wait until page contains element    ${extension_status}    timeout=20
    Click element    ${extension_status}
    ${code_list_name_length}=    Get Length    ${code_list_name}
    run keyword if    ${code_list_name_length} > 0    Add code list to extension    ${code_list_name}
    Sleep    1
    Run Keyword If    '${member_auto_create}' == 'True'    Click element    ${AUTO_CREATE_MEMBERS_CHECKBOX}
    Sleep    1
    Capture Page Screenshot
    Sleep    2
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Wait until element is visible    ${MEMBERS_TAB}    timeout=60
    Log to Console    ${extension_name} created
    Sleep    2

Delete extension
    Wait until page contains element    ${EXTENSION_DDL}    timeout=30
    Click element    ${EXTENSION_DDL}
    Wait until page contains element    ${EXTENSION_DELETE_BTN}    timeout=30
    Click element    ${EXTENSION_DELETE_BTN}
    Wait until page contains element    ${CONFIRM_DELETE_EXTENSION_BTN}    timeout=30
    Click element    ${CONFIRM_DELETE_EXTENSION_BTN}
    Log to Console    Extension deleted
    Sleep    2

Add code list to extension
    [Arguments]    ${code_list_name}
    Wait until page contains element    ${ADD_CODE_LIST_TO_EXTENSION_BTN}    timeout=30
    Click element    ${ADD_CODE_LIST_TO_EXTENSION_BTN}
    Sleep    2
    Wait until page contains element    ${SEARCH_LINKED_CODE_INPUT}    timeout=30
    Input Text    ${SEARCH_LINKED_CODE_INPUT}    ${code_list_name}
    Click element    //*[contains(text(), "${code_list_name}")]
    Sleep    2

Create member for definition hierarchy
    [Arguments]    ${member_name}    ${code_list_name}    ${code}
    Wait until page contains element    ${EXTENSION_DDL}    timeout=30
    Click button    ${EXTENSION_DDL}
    Wait until page contains element    ${CREATE_MEMBER_BTN}    timeout=30
    Click button    ${CREATE_MEMBER_BTN}
    Wait until page contains element    ${MEMBER_NAME_INPUT}    timeout=30
    Input Text    ${MEMBER_NAME_INPUT}    ${member_name}
    ${code_list_name_length}=    Get Length    ${code_list_name}
    run keyword if    ${code_list_name_length} > 0    Add code to member from code list    ${code_list_name}    ${code}
    ...    ELSE    Add code to member    ${code}
    Wait until page contains element    ${SAVE_MEMBER}    timeout=30
    Click button    ${SAVE_MEMBER}
    Wait until element is visible    ${MODIFY_MEMBER_BTN}    timeout=60
    Log to Console    ${member_name} created
    Sleep    2

Create member for calculation hierarchy
    [Arguments]    ${member_name}    ${comparison_operator}    ${unary_operator}    ${code_list_name}    ${code}    ${broader_member}
    Wait until page contains element    ${EXTENSION_DDL}    timeout=30
    Click button    ${EXTENSION_DDL}
    Wait until page contains element    ${CREATE_MEMBER_BTN}    timeout=30
    Click button    ${CREATE_MEMBER_BTN}
    Wait until page contains element    ${MEMBER_NAME_INPUT}    timeout=30
    Input Text    ${MEMBER_NAME_INPUT}    ${member_name}
    Wait until page contains element    ${COMPARISON_OPERATOR_INPUT}    timeout=30
    Input Text    ${COMPARISON_OPERATOR_INPUT}    ${comparison_operator}
    Wait until page contains element    ${UNARY_OPERATOR_INPUT}    timeout=30
    Input Text    ${UNARY_OPERATOR_INPUT}    ${unary_operator}
    ${code_list_name_length}=    Get Length    ${code_list_name}
    run keyword if    ${code_list_name_length} > 0    Add code to member from code list    ${code_list_name}    ${code}
    ...    ELSE    Add code to member    ${code}
    ${broader_member_length}=    Get Length    ${broader_member}
    run keyword if    ${broader_member_length} > 0    Add broader member    ${broader_member}
    Wait until page contains element    ${SAVE_MEMBER}    timeout=30
    Click button    ${SAVE_MEMBER}
    Wait until element is visible    ${MODIFY_MEMBER_BTN}    timeout=60
    Log to Console    ${member_name} created
    Sleep    2

Add broader member
    [Arguments]    ${broader_member}
    Wait until page contains element    ${ADD_MEMBER_BTN}    timeout=30
    Click button    ${ADD_MEMBER_BTN}
    Wait until page contains element    ${SEARCH_MEMBER_INPUT}    timeout=30
    Input Text    ${SEARCH_MEMBER_INPUT}    ${broader_member}
    Wait until page contains element    //*[contains(text(), "${broader_member}")]    timeout=30
    Click element    //*[contains(text(), "${broader_member}")]
    Sleep    2

Add code to member from code list
    [Arguments]    ${code_list_name}    ${code}
    Wait until page contains element    ${ADD_CODE_TO_MEMBER_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_MEMBER_BTN}
    Wait until page contains element    ${CODE_SCHEME_DDL_BTN}    timeout=30
    Click element    ${CODE_SCHEME_DDL_BTN}
    Click element    //*[contains(text(), "${code_list_name}")]
    Wait until page contains element    ${SEARCH_CODE_TO_MEMBER_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_MEMBER_INPUT}    ${code}
    Wait until page contains element    //*[contains(text(), "${code}")]    timeout=30
    Click element    //*[contains(text(), "${code}")]
    Sleep    2

Add code to member
    [Arguments]    ${code}
    Wait until page contains element    ${ADD_CODE_TO_MEMBER_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_MEMBER_BTN}
    Wait until page contains element    ${SEARCH_CODE_TO_MEMBER_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_MEMBER_INPUT}    ${code}
    Wait until page contains element    //*[contains(text(), "${code}")]    timeout=30
    Click element    //*[contains(text(), "${code}")]
    Sleep    2

Delete member
    Wait until page contains element    ${MEMBER_DDL}    timeout=30
    Click element    ${MEMBER_DDL}
    Wait until page contains element    ${MEMBER_DELETE_BTN}    timeout=30
    Click element    ${MEMBER_DELETE_BTN}
    Wait until page contains element    ${CONFIRM_DELETE_EXTENSION_BTN}    timeout=30
    Click element    ${CONFIRM_DELETE_EXTENSION_BTN}
    Log to Console    Member deleted
    Sleep    2

Remove codelist
    [Arguments]    ${code_list}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${code_list}
    Wait until page contains element    //*[contains(text(), "${code_list}")]    timeout=30
    Click element    //*[contains(text(), "${code_list}")]
    Wait until page contains    ${code_list}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Page should contain    testiautomaatiokoodisto
    Page should contain    testiautomaatiokoodisto1
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    id=search_box_input    timeout=30
    Input Text    id=search_box_input    ${code_list}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.

Remove code lists with extensions
    [Arguments]    @{code_list_items}
    : FOR    ${code_list_item}    IN    @{code_list_items}
    \    Return to Koodistot frontpage
    \    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    \    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    \    Input Text    ${SEARCH_BOX_INPUT}    ${code_list_item}
    \    Wait until page contains element    //*[contains(text(), "${code_list_item}")]    timeout=30
    \    Click element    //*[contains(text(), "${code_list_item}")]
    \    Wait until page contains    ${code_list_item}
    \    ${extension_exists}=    Run Keyword And Return Status    Page should contain element    ${EXTENSIONS_TAB}
    \    run keyword if    ${extension_exists}    Delete extension before code list    ${code_list_item}
    \    ...    ELSE    Continue code list deletion    ${code_list_item}
    \    Sleep    2

Continue code list deletion
    [Arguments]    ${code_list_item}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${code_list_item}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Log to Console    ${code_list_item} removed
    Sleep    3

Delete extension before code list
    [Arguments]    ${code_list_item}
    : FOR    ${CheckStatus}    IN RANGE    10
    \    ${Status}    Get Text    //*[contains(text(), "LAAJENNUKSET")]
    \    Page Should Contain    ${status}
    \    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    \    Click element    ${EXTENSIONS_TAB}
    \    Wait until page contains element    //*[contains(@id,'_view_extension')]    timeout=20
    \    Click Element    //*[contains(@id,'_view_extension')]
    \    Wait until page contains element    ${EXTENSION_DDL}    timeout=30
    \    Click element    ${EXTENSION_DDL}
    \    Wait until page contains element    ${EXTENSION_DELETE_BTN}    timeout=30
    \    Click element    ${EXTENSION_DELETE_BTN}
    \    Wait until page contains element    ${CONFIRM_DELETE_EXTENSION_BTN}    timeout=30
    \    Click element    ${CONFIRM_DELETE_EXTENSION_BTN}
    \    Log to Console    Extension deleted
    \    Sleep    3
    \    ${exit}=    Run Keyword And Return Status    Page Should Not Contain element    //*[contains(text(), "LAAJENNUKSET")]
    \    Exit For Loop If    ${exit}
    Continue code list deletion    ${code_list_item}

Create DPM extension
    [Arguments]    ${extension_type}    ${member_auto_create}    ${extension_status}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=30
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${extension_type}    timeout=30
    Click element    ${extension_type}
    Sleep    2
    Run Keyword If    '${member_auto_create}' == 'True'    Click element    ${AUTO_CREATE_MEMBERS_CHECKBOX}
    Sleep    1
    Wait until page contains element    ${START_DATE_INPUT}    timeout=20
    Input text    ${START_DATE_INPUT}    2018-11-01
    Wait until page contains element    ${END_DATE_INPUT}    timeout=20
    Input text    ${END_DATE_INPUT}    2020-11-01
    Wait until page contains element    ${CODE_STATUS_DDL}    timeout=20
    Click element    ${CODE_STATUS_DDL}
    Wait until page contains element    ${extension_status}    timeout=20
    Click element    ${extension_status}
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Wait until element is visible    ${MODIFY_EXTENSION_BTN}    timeout=60
    Log to Console    DPM extension created
    Sleep    3
