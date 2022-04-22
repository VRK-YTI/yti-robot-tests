*** Variables ***
${Concept title}  //span[text()="Käsite"]  |  //span[text()="Concept"]

*** Keywords ***
Verify page is concept page
    Wait until page contains element  ${Concept title}
