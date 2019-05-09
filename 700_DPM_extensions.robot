*** Settings ***
Documentation     Test Suite for DPM extensions
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Controlled_vocabularies_resources.robot
Resource          resources/Extension_resources.robot

*** Test Cases ***
700. Create DPM Metric extension and update code extensions
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    Update code extensions with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=30
    Click element    ${MODIFY_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}
    Input text    ${EXTENSION_NAME_INPUT}    DPM Metric laajennus
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains    DPM Metric laajennus    timeout=20
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Modify_dpm_metric}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    DPM Metric laajennus    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    Debit    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Isin    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    Duration    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    2
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

701. Update DPM Metric extension with invalid Excel sheet
    [Documentation]    Import new code list and try to update DPM Metric extension
    ...    with invalid Excel sheet with two DMP Metric values defined. Check error message.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Sleep    2
    Return to Koodistot frontpage
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${2_dpms_should_fail}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_2_dpms}    timeout=20
    Cancel code list import
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

702. Create DPM Metric extension
    [Documentation]    Import new code list and create DPM Metric extension.
    ...    set DPM Metric values for code.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    False    ${DRAFT_STATUS}
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_BALANCE_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_BALANCE_TYPE_INPUT}    Credit
    Wait until page contains element    ${DPM_METRIC_DATA_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_METRIC_DATA_TYPE_INPUT}    Integer
    Wait until page contains element    ${DPM_DOMAIN_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_DOMAIN_REFERENCE_INPUT}    ccc
    Wait until page contains element    ${DPM_FLOW_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_FLOW_TYPE_INPUT}    Duration
    Wait until page contains element    ${DPM_HIERARCHY_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_HIERARCHY_REFERENCE_INPUT}    eee
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    Credit    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Integer    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    Duration    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

703. Create DPM explicit domain extension
    [Documentation]    Import new code list and Create DPM explicit domain extension. Modify extension name.
    ...    Set Member XBRL code prefix value for code. Update all code extensions in code list with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_EXPLICIT_DOMAIN_BTN}    False    ${DRAFT_STATUS}
    Wait until page contains    DPM Explicit Domain (en)    timeout=20
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=30
    Click element    ${MODIFY_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}
    Input text    ${EXTENSION_NAME_INPUT}    DPM Explicit Domain laajennus
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_EXPLICIT_DOMAIN_INPUT}    timeout=20
    Input Text    ${DPM_EXPLICIT_DOMAIN_INPUT}    yyy
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains    Member XBRL code prefix (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Modify_DPM_explicit_domain}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains    Member XBRL code prefix (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    2
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

704. Create DPM Dimension extension
    [Documentation]    Import new code list and create DPM Dimension extension.
    ...    set DPM Dimension values for code.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_DIMENSION_BTN}    False    ${DRAFT_STATUS}
    Wait until page contains    DPM Dimension (en)    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    aaa
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=60
    Wait until page contains    DPM Dimension (en)    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    aaa    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

705. Import DPM Dimension extension
    [Documentation]    Import new code list with codes and DPM Dimension extension.
    ...    Check Domain reference values for codes.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_codes_DPM_Dimension_extension}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

706. Import all DPM extensions
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check extension values for codes.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until page contains    DPM Typed Domain laajennus    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Boolean    timeout=20
    Wait until page contains    DPM Metric laajennus    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    Debit    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Isin    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    Duration    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains    Member XBRL code prefix (en)    timeout=20
    Wait until page contains    xxx    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    //*[contains(text(), "dpmDimension - DPM Dimension laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmExplicitDomain - DPM Explicit Domain laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmMetric - DPM Metric laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmTypedDomain - DPM Typed Domain laajennus")]    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

707. Import DPM extensions when members contain relations to other members
    [Documentation]    Import new code list with codes and all DPM extensions.
    ...    Check error message when code extension members contain relations to other members.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${DPM_extension_relations_to_other_members}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_relations_to_other_members}    timeout=20
    Cancel code list import
    Sleep    2
    Return to Koodistot frontpage

708. Create DPM Typed Domain extension with automatic member creation
    [Documentation]    Import new code list and create Typed Domain extension with automatic member creation.
    ...    Check and modify Typed Domain value for code.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_TYPED_DOMAIN_BTN}    True    ${DRAFT_STATUS}
    Wait until page contains    DPM Typed Domain (en)    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    DPM Typed Domain (en)    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    -    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode54 - Testcode 54")]    timeout=20
    Click element    //*[contains(text(), "testcode54 - Testcode 54")]
    Wait until page contains    DPM Typed Domain (en)    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    -    timeout=20
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_DATA_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_DATA_TYPE_INPUT}    Boolean
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
    Wait until element is visible    ${MODIFY_CODE_BTN}    timeout=60
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Boolean    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

709. Remove code with code extension member
    [Documentation]    Import new code list with codes and all DPM extensions. Check that removing code
    ...    with code extension member is successful.
    [Tags]    koodistot    regression    700    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until page contains    DPM Typed Domain laajennus    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Boolean    timeout=20
    Wait until page contains    DPM Metric laajennus    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    Debit    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    Isin    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    Duration    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains    Member XBRL code prefix (en)    timeout=20
    Wait until page contains    xxx    timeout=20
    Remove code    testcode57 - Testcode 57
    Wait until page does not contain element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=30
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    //*[contains(text(), "dpmDimension - DPM Dimension laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmExplicitDomain - DPM Explicit Domain laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmMetric - DPM Metric laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmTypedDomain - DPM Typed Domain laajennus")]    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

710. Update DPM Metric members with and without sequence ID values
    [Documentation]    Import new code list with DPM Metric extension.
    ...    Check that correct error message is displayed when trying to import members without sequence IDs,
    ...    Check that updating DPM Metric values is successful with correct sequence ID values in Excel sheet. YTI-612.
    [Tags]    koodistot    regression    600    test
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_with_DPM_Metric_extension}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${UPDATE_CODE_LIST_FROM_FILE_BTN}    timeout=20
    Click element    ${UPDATE_CODE_LIST_FROM_FILE_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Choose file    ${FILE_UPLOAD_BTN}    ${Code_list_DPM_Metric_Credit_no_member_id}
    Sleep    1
    Wait until page contains element    ${UPLOAD_FILE_BTN}    timeout=20
    Click element    ${UPLOAD_FILE_BTN}
    Wait until page contains    ${Error_duplicate_members_for_same_code}    timeout=20
    Cancel code import
    Update code list    ${Code_list_DPM_Metric_Credit}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}
    Sleep    8
    Wait until element is enabled    //*[contains(text(), "testcode29 - Testcode 29")]    timeout=60
    Click Element    //*[contains(text(), "testcode29 - Testcode 29")]
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    Credit    timeout=20
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}
