*** Variables ***
${Terminology title}                //span[text()="Sanaston tiedot ja toiminnot"]  |  //span[text()="Terminology"]
${Terminology download button}      //button[@id="export-terminology-button"]
${Terminology modify button}        //button[@id="edit-terminology-button"]
${Create terminology button}        //button[text()="Lisää uusi sanasto"]  |  //button[text()="Add new terminology"]

${Displayed terminology name fi}    //div[@id="preferred-label"]/ul/li[@lang="fi"]/span
${Displayed terminology name en}    //div[@id="preferred-label"]/ul/li[@lang="en"]/span
${Displayed terminology name sv}    //div[@id="preferred-label"]/ul/li[@lang="sv"]/span

${Displayed terminology description fi}    //div[@id="description"]/ul/li[@lang="fi"]/span
${Displayed terminology description en}    //div[@id="description"]/ul/li[@lang="en"]/span
${Displayed terminology description sv}    //div[@id="description"]/ul/li[@lang="sv"]/span

${Displayed terminology status}          //span[@id="status-chip"]/span
${Displayed terminology domains}         //div[@id="information-domains"]
${Displayed terminology languages}       //div[@id="languages"]
${Displayed terminology type}            //div[@id="type"]
${Displayed terminology contact}         //div[@id="basic-block"]/a
${Displayed terminology organization}    //div[@id="organization"]
${Displayed terminology url}             //div[@id="uri"]

${terminology modify save button}              //button[@id="submit-button"]
${terminology modify cancel button}            //button[@id="cancel-button"]

${Terminology modify language input}            //input[@placeholder="Valitse sanaston kielet"]
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
Verify page is terminology page
    Wait until page contains element    ${Terminology title}

Open terminology information
    Click element with wait             ${Terminology title}
    Wait until page contains element    ${Terminology download button}

Close terminology information
    Click element with wait                     ${Terminology title}
    
Verify concept ${concept} on terminology ${terminology}
    Select concept ${concept}
    Select term ${concept}
    Close term dialog
    Select terminology ${terminology} from breadcrumps

Select concept ${concept}
    click element with wait  //h2/span[text()="${concept}"] 

Select terminology ${terminology} from breadcrumps
    Click element with wait     //a[text()="${terminology}"]

Select terminology ${terminology} from side
    Click element with wait     //a[text()="${terminology}"]

Download terminology
    Open terminology information
    Click element with wait            ${Terminology download button}

Open modify terminology dialog
    Open terminology information
    Click element with wait            ${Terminology modify button}
    Sleep   3

Open create terminology dialog
    Click element with wait  ${Create terminology button}  

Verify create terminology button is not shown
    Wait Until Page Does Not Contain Element    ${Create terminology button}

Verify modify terminology button is not shown
    Wait Until Page Does Not Contain Element    ${Terminology modify button}

Verify terminology search page language is finnish
    Wait until page Contains           Sanaston tiedot ja toiminnot

Verify terminology search page language is english
    Wait until page Contains           Terminology   

Verify terminology search page language is swedish
    Wait until page Contains           Sanaston tiedot ja toiminnot

Verify concepts search page contains ${hits} items with filters
    Reload page
    Wait until page contains element            //span[text()="Käsitteitä ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Concepts ${hits} items with following filters"] | //span[text()="Käsitteitä ${hits} kpl seuraavilla rajauksilla"]

Verify concepts search page does not contain ${hits} items with filters
    Reload page
    Wait until page does not contain element    //span[text()="Käsitteitä ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Concept ${hits} items with following filters"] | //span[text()="Käsitteitä ${hits} kpl seuraavilla rajauksilla"]

Verify collections search page contains ${hits} items with filters
    Reload page
    Wait until page contains element            //span[text()="Käsitekokoelmia ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Collections ${hits} items with following filters"] | //span[text()="Käsitekokoelmia ${hits} kpl seuraavilla rajauksilla"]

Verify collections search page does not contain ${hits} items with filters
    Reload page
    Wait until page does not contain element    //span[text()="Käsitekokoelmia ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Collections ${hits} items with following filters"] | //span[text()="Käsitekokoelmia ${hits} kpl seuraavilla rajauksilla"]

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

Verify displayed finish name is ${name}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology name fi}  ${name}
    Close terminology information

Verify displayed english name is ${name}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology name en}  ${name}
    Close terminology information

Verify displayed swedish name is ${name}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology name sv}  ${name}
    Close terminology information

Verify displayed finish description is ${description}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology description fi}  ${description}
    Close terminology information

Verify displayed english description is ${description}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology description en}  ${description}
    Close terminology information

Verify displayed swedish description is ${description}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology description sv}  ${description}
    Close terminology information

Verify displayed status is ${status}
    Open terminology information
    Wait until page contains element  //span[@id="status-chip"]/span[text()="${status}"]
    Close terminology information

Verify displayed domains are ${domains}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology domains}   ${domains}
    Close terminology information

Verify displayed languages are ${languages}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology languages}    ${languages}
    Close terminology information
    
Verify displayed type is ${type}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology type}     ${type}
    Close terminology information
    
Verify displayed contact is ${contact}
    Open terminology information
    Wait until page contains element  //div[@id="basic-block"]/a[contains(@href, "${contact}")]
    Close terminology information
    
Verify displayed organizations are ${organizations}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology organization}    ${organizations}
    Close terminology information

Verify displayed url contains ${url}
    Open terminology information
    Wait Until Element Contains  ${Displayed terminology url}     ${url}
    Close terminology information