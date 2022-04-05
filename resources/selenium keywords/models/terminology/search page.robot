*** Variables ***
${search box terminology}  //*[@id="2"]

*** Keywords ***
Open terminology search page
    Go to  ${TERMINOLOGIES_URL}

Find terminology
    [Arguments]             ${Terminology search}
    Input text with wait    ${search box terminology}  ${Terminology search}

Find and select terminology
    [Arguments]                       ${Terminology}
    Find terminology                  ${Terminology}  
    Press Keys                        None      ENTER
    Click element with wait           //h2[contains(text(), "${Terminology}")]