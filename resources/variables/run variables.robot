*** Variables ***
${HEADLESS}                     True
${BROWSER}                      Chrome
${RECORD}                       False
${HIGHLIGHT ELEMENT}            False
${SELENIUM_SPEED}               0
${SELENIUM_DEFAULT_TIMEOUT}     30
${CHROME_DRIVER_PATH}           ${EMPTY}
${ENVIRONMENT}                  dev
${API_KEY}                      ${EMPTY}

${DEFAULT TERMINOLOGY NAME}         Auto_TC
${DEFAULT CONCEPT NAME}             Auto_Concept
${DEFAULT COLLECTION NAME}          Auto_Collection
${DEFAULT TERMINOLOGY PREFIX}       auto_prefix

${DEFAULT DATAMODEL NAME}           auto_DM
${DEFAULT DATAMODEL PREFIX}         pr

${DEFAULT DATAMODEL CLASS NAME}     auto_cl
${DEFAULT DATAMODEL CLASS PREFIX}   cl

${DEFAULT DATAMODEL ATTRIBUTE NAME}     auto_attr
${DEFAULT DATAMODEL ATTRIBUTE PREFIX}   attr

${DEFAULT ORGANIZATION}             Automaatiotestaus
${DEFAULT DOMAIN}                   Asuminen

${EDUUNI_EMAIL_PASSWORD}            ${EMPTY}

${ADMIN_EDUUNI_EMAIL}               ytiautomaatioad@outlook.com
${ADMIN_EDUUNI_PASSWORD}            ${EDUUNI_EMAIL_PASSWORD}

${SUPER_EDUUNI_EMAIL}               ytiautomaatiosuper@outlook.com
${SUPER_EDUUNI_PASSWORD}            ${EDUUNI_EMAIL_PASSWORD}

${DATAMODEL_EDUUNI_EMAIL}           ytiautomaatiodatamodel@outlook.com
${DATAMODEL_EDUUNI_PASSWORD}        ${EDUUNI_EMAIL_PASSWORD}

${TEST_EDUUNI_EMAIL}                ytiautomaatiotest@outlook.com
${TEST_EDUUNI_PASSWORD}             ${EDUUNI_EMAIL_PASSWORD}

${CODELIST_EDUUNI_EMAIL}            ytiautomaatiocode@outlook.com
${CODELIST_EDUUNI_PASSWORD}         ${EDUUNI_EMAIL_PASSWORD}

${TERMINOLOGY_EDUUNI_EMAIL}         ytiautomaatioterminology@outlook.com
${TERMINOLOGY_EDUUNI_PASSWORD}      ${EDUUNI_EMAIL_PASSWORD}

${MEMBER_EDUUNI_EMAIL}              ytiautomaatiomember@outlook.com
${MEMBER_EDUUNI_PASSWORD}           ${EDUUNI_EMAIL_PASSWORD}

${NOGROUP_EDUUNI_EMAIL}             ytiautomaationogroup@outlook.com
${NOGROUP_EDUUNI_PASSWORD}          ${EDUUNI_EMAIL_PASSWORD}

*** Keywords ***
Set default terminology variables
    [Arguments]          ${test_case_id}
    Set Test Variable    ${DEFAULT TERMINOLOGY NAME}    ${DEFAULT TERMINOLOGY NAME}_${test_case_id}
    Set Test Variable    ${DEFAULT TERMINOLOGY PREFIX}  ${DEFAULT TERMINOLOGY PREFIX}_${test_case_id.lower()}
    Set Test Variable    ${DEFAULT CONCEPT NAME}        ${DEFAULT CONCEPT NAME}_${test_case_id}
    Set Test Variable    ${DEFAULT COLLECTION NAME}     ${DEFAULT COLLECTION NAME}_${test_case_id}

Set default datamodel variables
    [Arguments]          ${test_case_id}
    Set Test Variable    ${DEFAULT DATAMODEL NAME}    ${DEFAULT DATAMODEL NAME}_${test_case_id}
    Set Test Variable    ${DEFAULT DATAMODEL PREFIX}  ${DEFAULT DATAMODEL PREFIX}_${test_case_id.lower()}
    Set Test Variable    ${DEFAULT DATAMODEL CLASS NAME}        ${DEFAULT DATAMODEL CLASS NAME}_${test_case_id.lower()}
    Set Test Variable    ${DEFAULT DATAMODEL CLASS PREFIX}      ${DEFAULT DATAMODEL CLASS PREFIX}_${test_case_id.lower()}
    Set Test Variable    ${DEFAULT DATAMODEL ATTRIBUTE NAME}        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_${test_case_id.lower()}
    Set Test Variable    ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}      ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_${test_case_id.lower()}
