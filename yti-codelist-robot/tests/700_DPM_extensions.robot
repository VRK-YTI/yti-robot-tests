*** Settings ***
Documentation     Test Suite for DPM extensions
Suite Teardown    Test Case Suite Teardown Generic Teardown
Test Teardown     Remove codelist teardown      ${CODE_LIST_16}

Test Setup        Test Case Setup Superuser


Resource          ../resources/resources_and_libraries.robot

*** Variables ***
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${TERMINOLOGY_USER_DROPDOWN}    id=fakeable_user_dropdown

*** Test Cases ***
700. Create DPM Metric extension and update code extensions
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    Update code extensions with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    DPM Metric (en)    timeout=20

    Return to Koodistot frontpage
    Upload codelist in excel format    ${Modify_dpm_metric}    ${CODE_LIST_16}

    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Contains    dpmMetric                               timeout=20
    Wait Until Page Contains    Balance type (en)                       timeout=20
    Wait Until Page Contains    Debit                                   timeout=20
    Wait Until Page Contains    Data type (en)                          timeout=20
    Wait Until Page Contains    Isin                                    timeout=20
    Wait Until Page Contains    Domain reference (en)                   timeout=20
    Wait Until Page Contains    ccc                                     timeout=20
    Wait Until Page Contains    Flow type (en)                          timeout=20
    Wait Until Page Contains    Duration                                timeout=20
    Wait Until Page Contains    Hierarchy reference (en)                timeout=20
    Wait Until Page Contains    eee                                     timeout=20

    Click Element with wait    ${2_BREADCRUMB_LINK}     timeout=30
    Click Element with wait    ${EXTENSIONS_TAB}        timeout=20
    Click Element with wait    ${EXPORT_DDL}            timeout=20
    Click Element with wait    ${EXPORT_TYPE_EXCEL}     timeout=20
    Click Element with wait    ${EXPORT_DDL}            timeout=20
    Click Element with wait    ${EXPORT_TYPE_CSV}       timeout=20

701. Update DPM Metric extension with invalid Excel sheet
    [Documentation]    Import new code list and try to update DPM Metric extension
    ...    with invalid Excel sheet with two DMP Metric values defined. Check error message.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Return to Koodistot frontpage
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${2_dpms_should_fail}
    Click element with wait     ${UPLOAD_FILE_BTN}    timeout=20
    Wait Until Page Contains    ${Error_2_dpms}         timeout=20
    Cancel code list import

702. Create DPM Metric extension
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    set DPM Metric values for code.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    DPM Metric (en)    timeout=20

    Sleep                       5
    Click element with wait     ${2_BREADCRUMB_LINK}                                    timeout=30
    Click element that contains text       testcode28 - Testcode 28                    timeout=20
    Click element with wait     ${MODIFY_CODE_BTN}                                      timeout=20
    Input Text with wait        ${DPM_BALANCE_TYPE_INPUT}           Credit              timeout=20
    Input Text with wait        ${DPM_METRIC_DATA_TYPE_INPUT}       Integer             timeout=20
    Input Text with wait        ${DPM_DOMAIN_REFERENCE_INPUT}       ccc                 timeout=20
    Input Text with wait        ${DPM_FLOW_TYPE_INPUT}              Duration            timeout=20
    Input Text with wait        ${DPM_HIERARCHY_REFERENCE_INPUT}    eee                 timeout=20
    Click element with wait     ${SAVE_CODE_MOD_BTN}                timeout=20

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}     timeout=60
    Wait Until Page Contains    dpmMetric                   timeout=20
    Wait Until Page Contains    Balance type (en)           timeout=20
    Wait Until Page Contains    Credit                      timeout=20
    Wait Until Page Contains    Data type (en)              timeout=20
    Wait Until Page Contains    Integer                     timeout=20
    Wait Until Page Contains    Domain reference (en)       timeout=20
    Wait Until Page Contains    ccc                         timeout=20
    Wait Until Page Contains    Flow type (en)              timeout=20
    Wait Until Page Contains    Duration                    timeout=20
    Wait Until Page Contains    Hierarchy reference (en)    timeout=20
    Wait Until Page Contains    eee                         timeout=20

703. Create DPM explicit domain extension
    [Documentation]    Import new code list and Create DPM explicit domain extension.
    ...    Set Member XBRL code prefix value for code. Update all code extensions in code list with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia                               timeout=20
    Create DPM extension        ${CREATE_DPM_EXPLICIT_DOMAIN_BTN}       False           ${DRAFT_STATUS}
    Wait Until Page Contains    dpmExplicitDomain                       timeout=20

    Sleep                       5
    Click element with wait     ${2_BREADCRUMB_LINK}                    timeout=30
    Click element that contains text        testcode57 - Testcode 57    timeout=60
    Click element with wait     ${MODIFY_CODE_BTN}                      timeout=20
    Input Text with wait        ${DPM_EXPLICIT_DOMAIN_INPUT}    yyy     timeout=20
    Click element with wait     ${SAVE_CODE_MOD_BTN}                    timeout=20

    Wait Until Element Is Enabled       ${MODIFY_CODE_BTN}              timeout=60
    Wait Until Page Contains            dpmExplicitDomain               timeout=20
    Wait Until Page Contains            Member XBRL code prefix (en)    timeout=20
    Wait Until Page Contains            yyy                             timeout=20

    Return to Koodistot frontpage
    Import code list in Excel format

    Upload codelist             ${Modify_DPM_explicit_domain}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia                           timeout=20

    Click element that contains text        testcode28 - Testcode 28    timeout=20

    Wait Until Page Contains    dpmExplicitDomain               timeout=20
    Wait Until Page Contains    Member XBRL code prefix (en)    timeout=20
    Wait Until Page Contains    yyy                             timeout=20

    Click element with wait     ${2_BREADCRUMB_LINK}    timeout=30
    Click element with wait     ${EXTENSIONS_TAB}       timeout=20
    Click element with wait     ${EXPORT_DDL}           timeout=20
    Click element with wait     ${EXPORT_TYPE_EXCEL}    timeout=20
    Click element with wait     ${EXPORT_DDL}           timeout=20
    Click element with wait     ${EXPORT_TYPE_CSV}      timeout=20

704. Create DPM Dimension extension
    [Documentation]    Import new code list and create DPM Dimension extension.
    ...    set DPM Dimension values for code.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20
    Create DPM extension        ${CREATE_DPM_DIMENSION_BTN}    False    ${DRAFT_STATUS}
    Wait Until Page Contains    dpmDimension                                        timeout=20

    Sleep                       5
    Click element with wait     ${2_BREADCRUMB_LINK}                                timeout=30
    Click element that contains text        testcode28 - Testcode 28                timeout=20
    Click element with wait     ${MODIFY_CODE_BTN}                                  timeout=20
    Input Text with wait        ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    aaa      timeout=20
    Click element with wait     ${SAVE_CODE_MOD_BTN}                                timeout=20

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=60

    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    aaa    timeout=20

705. Import DPM Dimension extension
    [Documentation]    Import new code list with codes and DPM Dimension extension.
    ...    Check Domain reference values for codes.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_codes_DPM_Dimension_extension}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20
    Click element that contains text        testcode28 - Testcode 28    timeout=20

    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    yyy    timeout=20

    Click element with wait                 ${2_BREADCRUMB_LINK}        timeout=30
    Click element that contains text        testcode57 - Testcode 57    timeout=20

    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    yyy    timeout=20

706. Import all DPM extensions
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check extension values for codes.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    yyy    timeout=20
    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Boolean    timeout=20
    Wait Until Page Contains    dpmMetric    timeout=20
    Wait Until Page Contains    Balance type (en)    timeout=20
    Wait Until Page Contains    Debit    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Isin    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    ccc    timeout=20
    Wait Until Page Contains    Flow type (en)    timeout=20
    Wait Until Page Contains    Duration    timeout=20
    Wait Until Page Contains    Hierarchy reference (en)    timeout=20
    Wait Until Page Contains    eee    timeout=20
    Wait Until Page Contains    dpmExplicitDomain    timeout=20
    Wait Until Page Contains    Member XBRL code prefix (en)    timeout=20
    Wait Until Page Contains    xxx    timeout=20

    Click element with wait             ${2_BREADCRUMB_LINK}    timeout=30
    Click element with wait             ${EXTENSIONS_TAB}       timeout=20

    Wait Until Element Is Visible    //*[contains(text(), "dpmDimension")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmExplicitDomain")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmMetric")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmTypedDomain")]    timeout=20

707. Import DPM extensions when members contain relations to other members
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check error message when code extension members contain relations to other members.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File    ${FILE_UPLOAD_BTN}    ${DPM_extension_relations_to_other_members}
    Click element with wait             ${UPLOAD_FILE_BTN}                      timeout=20
    Wait Until Page Contains            ${Error_relations_to_other_members}     timeout=20
    Cancel code list import
    [Teardown]      Test Case Teardown Generic Teardown

708. Create DPM Typed Domain extension with automatic member creation
    [Documentation]    Import new code list and create Typed Domain extension with automatic member creation.
    ...    Check and modify Typed Domain value for code.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Create DPM extension    ${CREATE_DPM_TYPED_DOMAIN_BTN}    True    ${DRAFT_STATUS}
    Wait Until Page Contains    dpmTypedDomain    timeout=20

    Sleep                       5
    Click element with wait             ${2_BREADCRUMB_LINK}        timeout=30
    Click element that contains text    testcode28 - Testcode 28    timeout=20

    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    -    timeout=20

    Click element with wait             ${2_BREADCRUMB_LINK}        timeout=30
    Click element that contains text    testcode54 - Testcode 54    timeout=20

    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    -    timeout=20

    Click element with wait     ${MODIFY_CODE_BTN}                  timeout=20
    Input Text with wait        ${DPM_DATA_TYPE_INPUT}    Boolean   timeout=20
    Click element with wait     ${SAVE_CODE_MOD_BTN}                timeout=20

    Wait Until Element Is Enabled    ${MODIFY_CODE_BTN}    timeout=60
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Boolean    timeout=20

709. Remove code with code extension member
    [Documentation]    Import new code list with codes and all DPM extensions. Check that removing code
    ...    with code extension member is successful.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20
    Click element that contains text        testcode57 - Testcode 57    timeout=20

    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    yyy    timeout=20
    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Boolean    timeout=20
    Wait Until Page Contains    dpmMetric    timeout=20
    Wait Until Page Contains    Balance type (en)    timeout=20
    Wait Until Page Contains    Debit    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Isin    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    ccc    timeout=20
    Wait Until Page Contains    Flow type (en)    timeout=20
    Wait Until Page Contains    Duration    timeout=20
    Wait Until Page Contains    Hierarchy reference (en)    timeout=20
    Wait Until Page Contains    eee    timeout=20
    Wait Until Page Contains    dpmExplicitDomain    timeout=20
    Wait Until Page Contains    Member XBRL code prefix (en)    timeout=20
    Wait Until Page Contains    xxx    timeout=20
    Remove code    testcode57 - Testcode 57
    Wait Until Page Does Not Contain Element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20

    Click element with wait     ${2_BREADCRUMB_LINK}    timeout=30
    Click element with wait     ${EXTENSIONS_TAB}       timeout=20

    Wait Until Element Is Visible    //*[contains(text(), "dpmDimension")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmExplicitDomain")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmMetric")]    timeout=20
    Wait Until Element Is Visible    //*[contains(text(), "dpmTypedDomain")]    timeout=20

710. Update DPM Metric members with and without sequence ID values
    [Documentation]    Import new code list with DPM Metric extension.
    ...    Check that correct error message is displayed when trying to import members without sequence IDs,
    ...    Check that updating DPM Metric values is successful with correct sequence ID values in Excel sheet. YTI-612.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_with_DPM_Metric_extension}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Click element with wait     ${CODE_LIST_DDL}                    timeout=20
    Click element with wait     ${UPDATE_CODE_LIST_FROM_FILE_BTN}   timeout=20
    Click element with wait     ${FILE_FORMAT_BTN}                  timeout=20
    Click element with wait     ${FILE_FORMAT_Excel}                timeout=20

    Wait Until Element Is Enabled    ${FILE_UPLOAD_BTN}    timeout=20
    Choose File    ${FILE_UPLOAD_BTN}    ${Code_list_DPM_Metric_Credit_no_member_id}

    Click element with wait     ${UPLOAD_FILE_BTN}    timeout=20

    Wait Until Page Contains    ${Error_duplicate_members_for_same_code}    timeout=20
    Cancel code import

    Update code list    ${Code_list_DPM_Metric_Credit}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}

    Click element that contains text        testcode29 - Testcode 29    timeout=60
    Wait Until Page Contains    Balance type (en)    timeout=20
    Wait Until Page Contains    Credit    timeout=20

711. Import DPM extension with invalid PROPERTYTYPE
    [Documentation]    Import DPM extension with invalid PROPERTYTYPE and check error message. YTI-682.
    [Tags]    regression    test    700
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose File                         ${FILE_UPLOAD_BTN}          ${Code_list_codes_DPM_all_invalid_propertytype}
    Wait Until Page Contains Element    ${IMPORT_CODE_LIST_BTN}             timeout=20
    Click Button                        ${UPLOAD_FILE_BTN}
    Wait Until Page Contains            ${Error_invalid_propertytype}       timeout=20
    Cancel code list import
    [Teardown]     Test Case Teardown Generic Teardown

712. Import all DPM extensions and remove extension values with update
    [Documentation]    Import all DPM extensions and remove extension values with Update code list function.
    ...    Check that extension values are removed from code information.
    [Tags]    koodistot    regression    700    test
    Upload codelist in excel format    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait Until Page Contains    30 koodia    timeout=20

    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    yyy    timeout=20
    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Boolean    timeout=20
    Wait Until Page Contains    dpmMetric    timeout=20
    Wait Until Page Contains    Balance type (en)    timeout=20
    Wait Until Page Contains    Debit    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Isin    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    ccc    timeout=20
    Wait Until Page Contains    Flow type (en)    timeout=20
    Wait Until Page Contains    Duration    timeout=20
    Wait Until Page Contains    Hierarchy reference (en)    timeout=20
    Wait Until Page Contains    eee    timeout=20
    Wait Until Page Contains    dpmExplicitDomain    timeout=20
    Wait Until Page Contains    Member XBRL code prefix (en)    timeout=20
    Wait Until Page Contains    xxx    timeout=20

    Click element with wait         ${2_BREADCRUMB_LINK}    timeout=30
    Update code list    ${Code_list_codes_DPM_all_no_values}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}

    Click element that contains text        testcode57 - Testcode 57    timeout=20
    Wait Until Page Does Not Contain    eee    timeout=20
    Wait Until Page Does Not Contain    yyy    timeout=20
    Wait Until Page Does Not Contain    Boolean    timeout=20
    Wait Until Page Does Not Contain    Debit    timeout=20
    Wait Until Page Does Not Contain    Isin    timeout=20
    Wait Until Page Does Not Contain    ccc    timeout=20
    Wait Until Page Does Not Contain    Duration    timeout=20
    Wait Until Page Does Not Contain    xxx    timeout=20
    Wait Until Page Contains    Koodin arvo    timeout=20
    Wait Until Page Contains    Koodin nimi    timeout=20
    Wait Until Page Contains    dpmDimension    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    dpmTypedDomain    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    dpmMetric    timeout=20
    Wait Until Page Contains    Balance type (en)    timeout=20
    Wait Until Page Contains    Data type (en)    timeout=20
    Wait Until Page Contains    Domain reference (en)    timeout=20
    Wait Until Page Contains    Flow type (en)    timeout=20
    Wait Until Page Contains    Hierarchy reference (en)    timeout=20
    Wait Until Page Contains    dpmExplicitDomain    timeout=20
    Wait Until Page Contains    Member XBRL code prefix (en)    timeout=20

713. Create DPM Metric extension and create new code for code list
    [Documentation]    Create DPM Metric extension and create new code for code list.
    ...    Check that code creation is successful. YTI-1307
    [Tags]    koodistot    regression    700    test
    Set selenium speed              0.5
    Create code list                ${REGISTRY_1}    notCumulative    ${CODE_LIST_VALUE_1}    ${ORGANIZATION_1}    ${CODE_LIST_8}    Asuminen

    Create new code to code list    NewCode001    newCode001    ${DRAFT_STATUS}    ${EMPTY}
    Sleep                           2
    Click element with wait         ${2_BREADCRUMB_LINK}       timeout=30

    Create new code to code list    NewCode002    newCode002    ${DRAFT_STATUS}    ${EMPTY}
    Sleep                           2
    Click element with wait         ${2_BREADCRUMB_LINK}       timeout=30

    Create new code to code list    NewCode003    newCode003    ${DRAFT_STATUS}    ${EMPTY}
    Sleep                           2
    Click element with wait         ${2_BREADCRUMB_LINK}       timeout=30

    Sleep                           2
    Create DPM extension            ${CREATE_DPM_METRIC_BTN}    True    ${DRAFT_STATUS}
    Wait Until Page Contains        DPM Metric (en)    timeout=20
    Sleep                           2
    Click element with wait         ${2_BREADCRUMB_LINK}       timeout=30

    Create new code to code list    NewCode004    newCode004    ${DRAFT_STATUS}    ${EMPTY}
    Sleep                           2
    Click element with wait         ${2_BREADCRUMB_LINK}       timeout=30

    Wait Until Page Contains        4 koodia    timeout=20

    [Teardown]    Remove codelist teardown    ${CODE_LIST_8}
