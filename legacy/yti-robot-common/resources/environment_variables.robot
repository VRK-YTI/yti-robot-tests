*** Variables ***
${TEST_EMAIL}                           yalusta.testitunnus@gmail.com
${TEST PASSWORD}                        ${EMPTY}
${BROWSER}                              chrome
${ENVIRONMENT_IDENTIFIER}               AWSDEV
${RECORD}                               False

${SELENIUM_SPEED}                       0
${SELENIUM_DEFAULT_TIMEOUT}             60

${DATAFOLDER}                           ${EXECDIR}${/}resources${/}test_files

${DEFAULT_CODELIST_SCHEME_ID}                  sch_id
${DEFAULT_CODELIST_CODE_ID}                    code_id
${DEFAULT_PREFLABEL_SCHEME}                    sch_label
${DEFAULT_PREFLABEL_CODE}                      code_label

${class_json_ld_frame}          blob:https://tietomallit.dev.yti.cloud.vrk.fi/46f77ed0-82b6-4d57-b771-fc9a92bf1f17
${class_json_ld_frame_test}     blob:https://tietomallit.dev.yti.cloud.vrk.fi/a93dc0f7-ee66-48ea-8723-85c89ea28e9c
${class_framed_json_ld}         blob:https://tietomallit.dev.yti.cloud.vrk.fi/61658254-be26-4815-a168-a9f4325d8d15
${class_framed_json_ld_test}    blob:https://tietomallit.dev.yti.cloud.vrk.fi/cad2b19c-faee-4aca-942c-2775ef13e268

${GROUPMANAGEMENT ENVIRONMENT URL}      https://rhp.dev.yti.cloud.vrk.fi/
${COMMENTS ENVIRONMENT URL}             https://kommentit.dev.yti.cloud.vrk.fi/
${TERMINOLOGIES ENVIRONMENT URL}        https://sanastot.dev.yti.cloud.vrk.fi/
${DATA VOCABULARIES ENVIRONMENT URL}    https://tietomallit.dev.yti.cloud.vrk.fi/
${REFERENCE DATA ENVIRONMENT URL}       https://koodistot.dev.yti.cloud.vrk.fi/