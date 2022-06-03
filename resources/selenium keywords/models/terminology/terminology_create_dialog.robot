*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${Create terminology button}      //button[text()="Lisää uusi sanasto"]  |  //button[text()="Add new terminology"]
${Create terminology dialog}      //div[@role="dialog"]
${Select fill information}        ${Create terminology dialog}//label[text()="Täytän tiedot itse"]
${Select import file}             ${Create terminology dialog}//label[text()="Tuon tiedostolla"]
${Select different terminology}   ${Create terminology dialog}//label[text()="Muu sanasto"]
${Create terminology button dialog}       ${Create terminology dialog}//button[text()="Lisää sanasto"]
${Cancel creating terminology button}     ${Create terminology dialog}//button[text()="Keskeytä"]
${Terminology select language input}      ${Create terminology dialog}//input[@placeholder="Valitse sanaston kielet"]
${Terminology title input}             ${Create terminology dialog}//input[@placeholder="Kirjoita otsikko"]
${Terminology description input}       ${Create terminology dialog}//textarea[@placeholder="Kirjoita kuvaus"]
${Terminology select organization input}      ${Create terminology dialog}//input[@placeholder="Valitse organisaatio"]
${Terminology select domain input}      ${Create terminology dialog}//input[@placeholder="Valitse sanaston tietoalueet"]
${Alert on create terminology}          ${Create terminology dialog}//section[@role="alert"]//div[text()="Puuttuvia tietoja"]
${Terminology create email input}      ${Create terminology dialog}//input[@placeholder="Esim. yllapito@example.org"]
${Select own prefix}   ${Create terminology dialog}//label[text()="Valitse oma tunnus"]
${Prefix input}    ${Create terminology dialog}//fieldset/div/span/div/input

*** Keywords ***
Verify create terminology button is not shown
    Wait Until Page Does Not Contain Element    ${Create terminology button}

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
    Click element with wait  ${Select fill information}    

    IF  '${language}' != '${NONE}'
        Click element with wait  ${Terminology select language input}
        Click element with wait  //li[text()="${language}"]
    END
    IF  '${title}' != '${NONE}'
        Input text with wait    ${Terminology title input}    ${title}
    END
    IF  '${description}' != '${NONE}'
        Input text with wait    ${Terminology description input}    ${description}
    END
    IF  '${organization}' != '${NONE}'
        Mouse over  ${Terminology select organization input}
        Click element with wait  ${Terminology select organization input}
        Click element with wait  //li[text()="${organization}"]
    END
    IF  '${domain}' != '${NONE}'
        Mouse over  ${Terminology select domain input}
        Click element with wait  ${Terminology select domain input}
        Click element with wait  //li[text()="${domain}"]
        Press Keys               None  TAB
    END
    IF  '${prefix}' != '${NONE}'
        Click element with wait  ${Select own prefix}
        Input text with wait  ${Prefix input}  ${prefix}
    END
    IF  '${email}' != '${NONE}'
        Input text with wait  ${Terminology create email input}  ${email}
    END
    IF  '${another vocabulary}' != '${NONE}'
        Click element with wait  ${Select different terminology}
    END
    Sleep  1
    #Mouse over  ${Create terminology button dialog}
    Click element with wait  ${Create terminology button dialog}  
    
Verify alert ${alert}
    Wait until page contains element  //*[contains(text(), "${alert}")]

Open create terminology dialog
    Click element with wait  ${Create terminology button}  

Cancel creating terminology dialog
    Click element with wait  ${Cancel creating terminology button}

Verify dialog is not open
    Wait until page does not contain element  ${Create terminology button dialog}  timeout=60
    






