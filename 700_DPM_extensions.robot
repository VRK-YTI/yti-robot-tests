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
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    ${DRAFT_STATUS}
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
    Wait until page contains    aaa    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    bbb    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    ddd    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
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
    [Tags]    koodistot    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Sleep    2
    Wait until page contains    DPM Metric laajennus    timeout=20
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
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_METRIC_BTN}    ${DRAFT_STATUS}
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_BALANCE_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_BALANCE_TYPE_INPUT}    aaa
    Wait until page contains element    ${DPM_METRIC_DATA_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_METRIC_DATA_TYPE_INPUT}    bbb
    Wait until page contains element    ${DPM_DOMAIN_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_DOMAIN_REFERENCE_INPUT}    ccc
    Wait until page contains element    ${DPM_FLOW_TYPE_INPUT}    timeout=20
    Input Text    ${DPM_FLOW_TYPE_INPUT}    ddd
    Wait until page contains element    ${DPM_HIERARCHY_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_HIERARCHY_REFERENCE_INPUT}    eee
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
    Wait until page contains    DPM Metric (en)    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    aaa    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    bbb    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    ddd    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

703. Create DPM explicit domain extension
    [Documentation]    Import new code list and Create DPM explicit domain extension. Modify extension name.
    ...    Set Member XBRL code prefix value for code. Update all code extensions in code list with Excel import and export Excel and CSV.
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_EXPLICIT_DOMAIN_BTN}    ${DRAFT_STATUS}
    Wait until page contains    DPM Explicit Domain (en)    timeout=20
    Wait until page contains element    ${MODIFY_EXTENSION_BTN}    timeout=30
    Click element    ${MODIFY_EXTENSION_BTN}
    Wait until page contains element    ${EXTENSION_NAME_INPUT}
    Input text    ${EXTENSION_NAME_INPUT}    DPM Explicit Domain laajennus
    Wait until page contains element    ${SAVE_EXTENSION}    timeout=30
    Click button    ${SAVE_EXTENSION}
    Sleep    2
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    #Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_EXPLICIT_DOMAIN_INPUT}    timeout=20
    Input Text    ${DPM_EXPLICIT_DOMAIN_INPUT}    yyy
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
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
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
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
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create DPM extension    ${CREATE_DPM_DIMENSION_BTN}    ${DRAFT_STATUS}
    Wait until page contains    DPM Dimension (en)    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    timeout=20
    Input Text    ${DPM_DIMENSION_DOMAIN_REFERENCE_INPUT}    aaa
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    3
    Wait until page contains    DPM Dimension (en)    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    aaa    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

705. Import DPM Dimension extension
    [Documentation]    Import new code list with codes and DPM Dimension extension.
    ...    Check Domain reference values for codes.
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_codes_DPM_Dimension_extension}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
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
    [Tags]    koodistot    regression    700
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_codes_DPM_extension_all}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "testcode57 - Testcode 57")]    timeout=20
    Click element    //*[contains(text(), "testcode57 - Testcode 57")]
    Wait until page contains    DPM Dimension laajennus    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    yyy    timeout=20
    Wait until page contains    DPM Typed Domain laajennus    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    zzz    timeout=20
    Wait until page contains    DPM Metric laajennus    timeout=20
    Wait until page contains    Balance type (en)    timeout=20
    Wait until page contains    aaa    timeout=20
    Wait until page contains    Data type (en)    timeout=20
    Wait until page contains    bbb    timeout=20
    Wait until page contains    Domain reference (en)    timeout=20
    Wait until page contains    ccc    timeout=20
    Wait until page contains    Flow type (en)    timeout=20
    Wait until page contains    ddd    timeout=20
    Wait until page contains    Hierarchy reference (en)    timeout=20
    Wait until page contains    eee    timeout=20
    Wait until page contains    DPM Explicit Domain laajennus    timeout=20
    Wait until page contains    Member XBRL code prefix (en)    timeout=20
    Wait until page contains    xxx    timeout=20
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    //*[contains(text(), "dpmDimension - DPM Dimension laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmExplicitDomain - DPM Explicit Domain laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmMetric - DPM Metric laajennus")]    timeout=20
    Wait until page contains element    //*[contains(text(), "dpmTypedDomain - DPM Typed Domain laajennus")]    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}
