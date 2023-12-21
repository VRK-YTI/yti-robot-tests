*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Create terminology dialog}      //div[@role="dialog"]
${Select fill information}        ${Create terminology dialog}//label[text()="Täytän tiedot itse"]
${Select import file}             ${Create terminology dialog}//label[text()="Tuon tiedostolla"]
${Select different terminology}   ${Create terminology dialog}//label[text()="Muu sanasto"]
${Create terminology button dialog}           ${Create terminology dialog}//button[@id="submit-button"]
${Cancel creating terminology button}         ${Create terminology dialog}//button[@id="cancel-button"]
${Terminology select language input}          ${Create terminology dialog}//input[@placeholder="Valitse sanaston kielet"]
${Terminology title input}                    ${Create terminology dialog}//input[@placeholder="Kirjoita otsikko"]
${Terminology description input}              ${Create terminology dialog}//textarea[@placeholder="Kirjoita kuvaus"]
${Terminology select organization input}      ${Create terminology dialog}//input[@id="organizations-selector"]
${Terminology select domain input}      ${Create terminology dialog}//input[@placeholder="Valitse sanaston tietoalueet"]
${Alert on create terminology}          ${Create terminology dialog}//section[@role="alert"]//div[text()="Puuttuvia tietoja"]
${Terminology create email input}      ${Create terminology dialog}//input[@placeholder="Esim. yllapito@example.org"]
${Select own prefix}                   ${Create terminology dialog}//label[text()="Valitse oma tunnus"]
${Prefix input}                        ${Create terminology dialog}//input[@id="prefix-text-input"]

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
    Find and hide element    //div[contains(@class, "fi-modal_footer_content-gradient")] 

    IF  '${language}' != '${NONE}'
        Click element with wait  ${Terminology select language input}
        Click element with wait  //li[text()="${language}"]
        Press Keys               None  TAB
    END
    IF  '${title}' != '${NONE}'
        Input create terminology language ${language} for name ${title}
    END
    IF  '${description}' != '${NONE}'
        Input create terminology language ${language} for description ${description}
    END
    IF  '${organization}' != '${NONE}'
        Click element with wait  ${Terminology select organization input}
        Click element with wait  //li[text()="${organization}"]
        Press Keys               None  TAB
    END
    IF  '${domain}' != '${NONE}'
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

    Click element with wait  ${Create terminology button dialog}  

Input create terminology language ${language} for description ${description}
    Input text with wait  
    ...  //span[text()="${language}"]/../../div/div/label[text()="Kuvaus"]/../../div/textarea  
    ...  ${description}

Input create terminology language ${language} for name ${title}
        Input text with wait  
        ...  //span[text()="${language}"]/../../div/span/div/label[text()="Sanaston nimi"]/../../div/input  
        ...  ${title}

Verify alert ${alert}
    Wait until page contains element  //*[contains(text(), "${alert}")]

Cancel creating terminology dialog
    Click element with wait  ${Cancel creating terminology button}

Verify dialog is not open
    Wait until page does not contain element  ${Create terminology button dialog}  timeout=60
    






