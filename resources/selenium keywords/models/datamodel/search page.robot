*** Settings ***
Library   String
Library   SeleniumLibrary

*** Variables ***
${Datamodel search page header}                   //h1[text()="Tietomallit"]
${Search box datamodel}                           //input[@id="filter-keyword-input"]
${Reset all filters button}                       //button[@id="filter-reset-button"]

${Organization filter}                            //input[@id="filter-organization-selector"]
${Organization filter item}                       //ul[@id="filter-organization-selector-popover"]/div/div
${Clear organization filter}                      ${Organization filter}/../../div/div/button
${Language filter}                                //input[@id="filter-language-selector"]
${Language filter item}                           //ul[@id="filter-language-selector-popover"]/div/div
${Clear language filter}                          ${Language filter}/../../div/div/button

${Filter chips}                                   //*[@id="result-counts-chips"]/button


*** Keywords ***
Open datamodel search page
    Go to  ${DATAMODELS_URL}
    Verify page is datamodel search page

Verify page is datamodel search page
    Wait until page contains element  ${Datamodel search page header}

Search and select datamodel ${Datamodel}
    Search datamodel ${Datamodel}
    Select datamodel ${datamodel}

Select datamodel ${datamodel}
    Click element with wait           //h2[@id="card-title-link"]/span[text()="${Datamodel}"]

Search datamodel ${Datamodel}
    Input text with wait              ${Search box datamodel}  ${Datamodel}
    Press Keys                        None      ENTER

Clear text search filter
    Click element with wait           ${Search box datamodel}/../*[2]

Reset all filters
    Click element with wait           ${Reset all filters button}

Filter by organization ${organization}
    Click element with wait  ${Organization filter} 
    Click element with wait  ${Organization filter item}/li[text()="${organization}"]

Clear organization filter
    Click element with wait  ${Clear organization filter}

Filter by language ${language}
    Click element with wait  ${Language filter}
    Click element with wait  ${Language filter item}/li[text()="${language}"]

Filter with datamodel type ${type}
    Click element with wait  //label[contains(text(), "${type}")]

Filter with datamodel status ${status}
    Click element with wait  //label[text()="${status}"]

Filter with datamodel domain ${domain}
    Click element with wait  //label[contains(text(), "${domain}")]

Clear language filter
    Click element with wait  ${Clear language filter}

Verify filter chip ${chip}
    Wait until page contains element  ${Filter chips}/span[text()="${chip}"]

Remove filter chip ${chip}
    Click element with wait  ${Filter chips}/span[text()="${chip}"]

Verify datamodel ${datamodel} title
    Wait until page contains element  //h2[@id="card-title-link"]/span[text()="${Datamodel}"]

Verify search result count is ${count}
    Wait Until Page Contains Element   //span[@id="result-counts-text"]/span[text()="${count}"]

Verify search result count is not ${count}
    Wait Until Page does not Contain Element   //span[@id="result-counts-text"]/span[text()="${count}"]

Verify datamodel ${datamodel} has ${contributers} contributers on main page
    Wait until page contains element   //*[@id="card-contributor" and text()="${contributers}"]

Verify datamodel ${datamodel} has ${domains} domains on main page
    Wait until page contains element   //*[@id="card-partof" and contains(text(), "${domains}")]

Verify datamodel ${datamodel} has ${decription} description on main page
    Wait until page contains element   //*[@id="card-description"]/span[text()="${decription}"]

Verify datamodel ${datamodel} status is ${status} on main page
    Wait until page contains element   //*[@id="card-status"]/span[text()="${status}"]

Verify datamodel ${datamodel} type is ${type} on main page
    Wait until page contains element   //*[@id="card-subtitle"]/span[text()="${type}"]