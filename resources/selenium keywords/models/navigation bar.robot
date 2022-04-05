*** Variables ***
${search box top bar}  //*[@role="searchbox"]

*** Keywords ***
Search from top bar
    [Arguments]           ${search text}
    Input text with wait  ${search box top bar}  ${search text}