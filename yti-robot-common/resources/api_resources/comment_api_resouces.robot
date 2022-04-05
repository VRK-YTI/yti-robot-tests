*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Library               Process
Resource              common_api_resources.robot

*** Variables ***
${GET_COMMENT_ROUNDS_API_POINT}=    ${COMMENTS ENVIRONMENT URL}comments-api/api/v1/organizations

*** Keywords ***
Get urls for comment rounds ${comment_round} with api
    ${headers}=     Create authentication header
    ${data}=        Catenate    expand=commentRound&hasCommentRounds=true
    ${response}=    Get      ${GET_COMMENT_ROUNDS_API_POINT}?${data}  headers=${headers}
    @{comment_round_urls}=  parse comment round urls with label  ${response.json()}  ${comment_round}
    [Return]  @{comment_round_urls}

Delete comment ${comment} with api
    @{comment_round_urls}=     Get urls for comment rounds ${comment} with api
    ${headers}=             Create authentication header
    FOR    ${comment_round_url}    IN    @{comment_round_urls}
        ${response}=    Delete     ${comment_round_url}  headers=${headers}
    END
