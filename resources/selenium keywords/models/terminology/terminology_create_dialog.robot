*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Create terminology dialog}      //div[@role="dialog"]
${Select fill information}        ${Create terminology dialog}//label[text()="Täytän tiedot itse"]
${Select import file}             ${Create terminology dialog}//label[text()="Tuon tiedostolla"]
${Select different terminology}   ${Create terminology dialog}//label[text()="Muu sanasto"]
${Create terminology button dialog}       ${Create terminology dialog}//button[@id="submit-button"]
${Cancel creating terminology button}     ${Create terminology dialog}//button[@id="cancel-button"]
${Terminology select language input}      ${Create terminology dialog}//input[@placeholder="Valitse sanaston kielet"]
${Terminology title input}             ${Create terminology dialog}//input[@placeholder="Kirjoita otsikko"]
${Terminology description input}       ${Create terminology dialog}//textarea[@placeholder="Kirjoita kuvaus"]
${Terminology select organization input}      ${Create terminology dialog}//input[@id="organizations-selector"]
${Terminology select domain input}      ${Create terminology dialog}//input[@placeholder="Valitse sanaston tietoalueet"]
${Alert on create terminology}          ${Create terminology dialog}//section[@role="alert"]//div[text()="Puuttuvia tietoja"]
${Terminology create email input}      ${Create terminology dialog}//input[@placeholder="Esim. yllapito@example.org"]
${Select own prefix}   ${Create terminology dialog}//label[text()="Valitse oma tunnus"]
${Prefix input}    ${Create terminology dialog}//fieldset/div/span/div/input

${Concept language finnish}  suomi FI

*** Keywords ***
Create terminology from dialog
    [Arguments]     ${language} 
    ...             ${title}
    ...             ${description}
    ...             ${organization}
    ...             ${domain}
    ...             ${prefix}
    ...             ${email}
    ...             ${another vocabulary}=${NONE}
    Open create terminology dialog  
    # Radio button select has been disabled for now  
    # Click element with wait  ${Select fill information}    

    IF  '${language}' != '${NONE}'
        Click element with wait  ${Terminology select language input}
        Click element with wait  //li[text()="${language}"]
        Press Keys               None  TAB
    END
    IF  '${title}' != '${NONE}'
        Input text with wait    ${Terminology title input}    ${title}
    END
    IF  '${description}' != '${NONE}'
        Input text with wait    ${Terminology description input}    ${description}
    END
    IF  '${organization}' != '${NONE}'
        Scroll create dialog down
        Click element with wait  ${Terminology select organization input}
        Click element with wait  //li[text()="${organization}"]
    END
    IF  '${domain}' != '${NONE}'
        Scroll create dialog down
        Click element with wait  ${Terminology select domain input}
        Click element with wait  //li[text()="${domain}"]
        Press Keys               None  TAB
    END
    IF  '${prefix}' != '${NONE}'
        Scroll create dialog down
        Click element with wait  ${Select own prefix}
        Press Keys               None  TAB
        Press Keys               None  ${prefix}
        #Input text with wait  ${Prefix input}  ${prefix}
    END
    IF  '${email}' != '${NONE}'
        Scroll create dialog down
        Input text with wait  ${Terminology create email input}  ${email}
        #Press Keys               None  TAB
    END
    IF  '${another vocabulary}' != '${NONE}'
        Scroll create dialog down
        Click element with wait  ${Select different terminology}
    END
    Sleep  1

    Click element with wait  ${Create terminology button dialog}  

Scroll create dialog down
    # Quick fix, element is in way of the input, so dialog has to be scrolled
    Click element with wait  //h1[text()="Lisää uusi sanasto"]
    FOR    ${index}    IN RANGE    1    12
        Press Keys               None  TAB
    END  

Verify alert ${alert}
    Wait until page contains element  //*[contains(text(), "${alert}")]

Cancel creating terminology dialog
    Click element with wait  ${Cancel creating terminology button}

Verify dialog is not open
    Wait until page does not contain element  ${Create terminology button dialog}  timeout=60
    






