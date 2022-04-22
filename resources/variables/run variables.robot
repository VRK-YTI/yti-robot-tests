*** Variables ***
${HEADLESS}                     True
${BROWSER}                      Chrome
${RECORD}                       False
${HIGHLIGHT ELEMENT}            False
${SELENIUM_SPEED}               0
${SELENIUM_DEFAULT_TIMEOUT}     30
${CHROME_DRIVER_PATH}           ${EMPTY}
${ENVIRONMENT}                  dev
${API_KEY}                      eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlYmU5NDhhNi00MmRhLTdjNGItNDIxZS1kZTlmZjBkZGMwYmEiLCJleHAiOjE2NTExODYyOTAsImlhdCI6MTYzNTQ2MTQ5MH0.uP3o5jgqMsmzRcVhJviwln7vC4JC2FA4XEIsLHzfeZzvGQK1gQB5DpfXfTCADsSNbS8Jn4OoG5pYdg4zhi153w

${DEFAULT TERMINOLOGY NAME}         Auto_Term

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
    Set Test Variable    ${DEFAULT TERMINOLOGY NAME}  ${DEFAULT TERMINOLOGY NAME}_${test_case_id}