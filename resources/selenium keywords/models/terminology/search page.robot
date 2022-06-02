*** Settings ***
Library   String

*** Variables ***
${search box terminology}           //*[@placeholder="Esim päivähoito, opiskelu..."]
${Terminology search page header}   //h1[text()="Sanastot"]  |  //h1[text()="Terminologies"]
${Terminology search list}          //div[@id="search-results"]
${First terminology on searchlist}  //div[@id="search-results"]/ul/li/div
${Organization dropdown}            //input[@placeholder="Valitse organisaatio"]

${Remove all filters}               //button[text()="Poista kaikki rajaukset"]  |  //button[text()="Clear all"]  |  //button[text()="Poista kaikki rajaukset"]

*** Keywords ***
Open terminology search page
    Go to  ${TERMINOLOGIES_URL}
    Verify page is terminology search page

Verify page is terminology search page
    Wait until page contains element  ${Terminology search page header}

Select first terminology on list
    Click element with wait           ${First terminology on searchlist}
    Verify page is terminology page

Remove filter ${filter} with button
    Click element with wait           //button/span[text()="${filter}"] 

Set filter ${filter} checkbox
    Click element with wait           //label[contains(text(),'${filter}')]

Verify filter ${filter} checkbox is not checked
    Wait until page does not contain element    //label[contains(text(),'${filter}')]/ancestor::div[contains(@class, 'checkbox--checked')]

Verify filter ${filter} checkbox is checked
    Wait until page contains element            //label[contains(text(),'${filter}')]/ancestor::div[contains(@class, 'checkbox--checked')]

Verify page does not contain filter button ${filter}
    Wait until page does not contain element    //button/span[text()="${filter}"] 

Verify page contains filter button ${filter}
    Wait until page contains element            //button/span[text()="${filter}"]    

Verify page does not contain terminologies with status ${type}
    Wait until page does not contain element        //div/span/span[text()="${type}"]

Verify page contains terminologies with status ${type}
    Wait until page contains element                //div/span/span[text()="${type}"]

Verify page contains remove all filters
    Wait until page contains element            ${Remove all filters}

Verify page does not contain remove all filters
    Wait until page does not contain element    ${Remove all filters}

Remove all filters
    Click element with wait                     ${Remove all filters}

Select organization ${organization}
    Click element with wait           ${Organization dropdown}
    Click element with wait           //li[text()="${organization}"]
    
Search terminology ${Terminology}
    Input text with wait              ${search box terminology}  ${Terminology}
    Press Keys                        None      ENTER

Clear terminology search
    Double click element            ${search box terminology}
    press keys                      ${search box terminology}           CTRL+a+BACKSPACE
    
Search and select terminology ${Terminology}
    Search terminology ${Terminology}
    Click element with wait           //h2[contains(text(), "${Terminology}")]
    Verify page is terminology page

Get status count from ${filter} filter
    Wait until page contains element            //label[contains(text(),'${filter}')]
    Wait For Condition                          return document.readyState=="complete"
    ${element_txt}=     Get text                //label[contains(text(),'${filter}')]
    ${right_fetch}=     Fetch from right        ${element_txt}      (
    ${left fetch}=      Fetch from left         ${right_fetch}      kpl)
    ${status count}=    Convert To Integer      ${left fetch}
    [Return]            ${status count}


Verify search page contains ${hits} items with filters
    Reload page
    Wait until page contains element            //span[text()="Sanastoja ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Terminologies ${hits} items with following filters"] | //span[text()="Sanastoja ${hits} kpl seuraavilla rajauksilla"]

Verify search page does not contain ${hits} items with filters
    Reload page
    Wait until page does not contain element    //span[text()="Sanastoja ${hits} kpl seuraavilla rajauksilla"] | //span[text()="Terminologies ${hits} items with following filters"] | //span[text()="Sanastoja ${hits} kpl seuraavilla rajauksilla"]

Verify page contains ${hits} terminologies with ${status}
    Reload page
    Wait until page contains    ${status} (${hits} kpl)    

Verify search page language is finnish
    Wait until page Contains           Sanastot-työkalulla kerätään ja ylläpidetään julkishallinnon yhteisiä terminologisia sanastoja ja käsitteitä.

Verify search page language is english
    Wait until page Contains           Terminologies tool is used to collect, maintain and publish common terminologies of public administration.    

Verify search page language is swedish
    Wait until page Contains           Sanastot-työkalulla kerätään ja ylläpidetään julkishallinnon yhteisiä terminologisia sanastoja ja käsitteitä.

Verify filters are defaults
    Verify status filter Voimassa oleva is not set
    Verify status filter Luonnos is not set
    Verify status filter Korvattu is not set
    Verify status filter Poistettu käytöstä is not set
    Verify page does not contain remove all filters

Verify status filter ${filter} is not set
    Verify page does not contain filter button ${filter}
    Verify filter ${filter} checkbox is not checked

Verify status filter ${filter} is set
    Verify page contains filter button ${filter}
    Verify filter ${filter} checkbox is checked

Verify domain filter ${filter} is set
    Verify page contains remove all filters
    Verify page contains filter button ${filter}
    Verify filter ${filter} checkbox is checked
 
Verify domain filter ${filter} is not set
    Verify page does not contain filter button ${filter}
    Verify filter ${filter} checkbox is not checked

Verify organization filter ${filter} is set
    Verify page contains remove all filters
    Verify page contains filter button ${filter}
 
Verify organization filter ${filter} is not set
    Verify page does not contain filter button ${filter}