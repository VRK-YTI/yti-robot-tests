*** Variables ***
${Terminology title}                //span[text()="Sanaston tiedot ja toiminnot"]  |  //span[text()="Terminology"]
${Terminology download button}      //button[contains(text(), "Lataa sanasto")]

*** Keywords ***
Verify page is terminology page
    Wait until page contains element    ${Terminology title}

Open terminology information page
    Click element with wait             ${Terminology title}

Download terminology
    Open terminology information page
    Click element with wait             ${Terminology download button}