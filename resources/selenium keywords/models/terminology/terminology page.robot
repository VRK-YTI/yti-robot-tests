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

Verify collection ${collection} containing concept ${concept} on terminology ${terminology}
    Set filter Käsitekokoelmat checkbox
    Select concept ${collection}
    Verify collection contains concepts

    Select collection concept ${concept}
    Verify concept is part of collection
    Select term ${concept}
    Close term dialog

    Select terminology ${collection} from side
    Select terminology ${terminology} from breadcrumps

Verify collection ${collection} on terminology ${terminology} does not contain concepts
    Set filter Käsitekokoelmat checkbox
    Select concept ${collection}
    
    Sleep  1
    Verify collection does not contain concepts
    Select terminology ${terminology} from breadcrumps

Select concept ${concept}
    click element with wait  //h2/span[text()="${concept}"] 

Select collection concept ${concept} 
    click element with wait  //a[text()="${concept}"] 

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


    