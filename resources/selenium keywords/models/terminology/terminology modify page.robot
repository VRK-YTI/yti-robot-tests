*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${terminology modify save button}              //button[@id="submit-button"]
${terminology modify cancel button}            //button[@id="cancel-button"]


${Terminology modify language input}            //input[@id="language-selector"]
${Terminology modify finish name input}         //div/p/span[text()="suomi FI"]/../../div/span/div/input
${Terminology modify finish definition input}   //div/p/span[text()="suomi FI"]/../../div/div/textarea
${Terminology modify english name input}        //div/p/span[text()="englanti EN"]/../../div/span/div/input
${Terminology modify english definition input}  //div/p/span[text()="englanti EN"]/../../div/div/textarea
${Terminology modify swedish name input}        //div/p/span[text()="ruotsi SV"]/../../div/span/div/input
${Terminology modify swedish definition input}  //div/p/span[text()="ruotsi SV"]/../../div/div/textarea

${Terminology modify status input}              //div/div/label[text()="Sanaston tila"]/../../div/div/input
${Terminology remove status button}             //div/div/label[text()="Sanaston tila"]/../../div/div/div

${Terminology modify organization input}        //input[@id="organizations-selector"]

${Terminology modify type input terminology}    //label[@for="type-terminological"]
${Terminology modify type input other}          //label[@for="type-other"]

${Terminology modify domain input}              //input[@id="information-domain-selector"]

${Terminology modify prefix input automatic}    //label[@for="prefix-input-automatic"]
${Terminology modify prefix input manual}       //label[@for="prefix-input-manual"]
${Terminology modify prefix input}              //input[@id="prefix-text-input"]

${Terminology modify contact input}             //input[@id="contact-input"]

${Terminology modify languages are not set error}     Sanaston kieliä ei ole määritelty
${Terminology modify name missing from finish error}        Sanaston nimi puuttuu kieleltä suomi
${Terminology modify name missing from english error}       Sanaston nimi puuttuu kieleltä englanti
${Terminology modify name missing from swedish error}       Sanaston nimi puuttuu kieleltä ruotsi

${Terminology modify status missing error}        Sanaston tilaa ei ole määritetty
${Terminology modify contributors missing error}  Sisällöntuottajia ei ole määritelty
${Terminology modify domain missing error}        Tietoaluetta ei ole määritelty
${Terminology modify prefix missing error}        Tunnusta ei ole määritelty

*** Keywords ***
Save terminolgy modify
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${terminology modify save button} 
    IF  '${Valid}' == '${True}'
        Verify modify terminology page is not open
    END
    IF  '${Valid}' == '${False}'
        Verify modify terminology page is open
    END

Cancel modify terminology
    Click element with wait             ${terminology modify cancel button}

Verify modify terminology page is not open
    Wait Until Location Does Not Contain  edit  timeout=90

Verify modify terminology page is open
    Wait Until Location Contains  edit

Select language ${language} on modify terminology
    Input text with wait    ${Terminology modify language input}   ${language}
    Press Keys              None      ARROW_DOWN
    Press Keys              None      ENTER
    Press Keys              None      TAB

Input english definition ${definition} on modify terminology
    Input text with wait    ${Terminology modify english definition input}  ${definition}

Input english name ${name} on modify terminology
    Input text with wait    ${Terminology modify english name input}  ${name}

Input swedish definition ${definition} on modify terminology
    Input text with wait    ${Terminology modify swedish definition input}  ${definition}

Input swedish name ${name} on modify terminology
    Input text with wait    ${Terminology modify swedish name input}  ${name}

Input finish definition ${definition} on modify terminology
    Input text with wait    ${Terminology modify finish definition input}  ${definition}

Input finish name ${name} on modify terminology
    Input text with wait    ${Terminology modify finish name input}  ${name}

Select status ${status} on modify terminology
    Input text with wait    ${Terminology modify status input}   ${status}
    Press Keys              None      ARROW_DOWN
    Press Keys              None      ENTER
    Press Keys              None      TAB

Remove selected status on modify terminology
    Click element with wait  ${Terminology remove status button}

On modify terminology select organization ${organization}
    Input text with wait    ${Terminology modify organization input}   ${organization}
    Press Keys              None      ARROW_DOWN
    Press Keys              None      ENTER
    Press Keys              None      TAB

Select type terminology on modify terminology
    Click element with wait  ${Terminology modify type input terminology}

Select type other on modify terminology
    Click element with wait  ${Terminology modify type input other}

Select domain ${domain} on modify terminology
    Input text with wait    ${Terminology modify domain input}   ${domain}
    Press Keys              None      ARROW_DOWN
    Press Keys              None      ENTER
    Press Keys              None      TAB

Select prefix automatic on modify terminology
    Click element with wait  ${Terminology modify prefix input automatic} 

Select prefix manual on modify terminology
    Click element with wait  ${Terminology modify prefix input manual}

Input prefix ${prefix} on modify terminology
    Input text with wait    ${Terminology modify prefix input}   ${prefix}

Input contact ${contact} on modify terminology
    Input text with wait    ${Terminology modify contact input}   ${contact}

Verify modify terminology error message ${message}
    Wait until page contains element  //li[text()="${message}"]