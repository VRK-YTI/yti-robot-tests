*** Settings ***
Library   String

*** Variables ***
${Datamodel search page header}   //h1[text()="Tietomallit"]
${Search box datamodel}           //input[@id="filter-keyword-input"]

*** Keywords ***
Open datamodel search page
    Go to  ${DATAMODELS_URL}
    Verify page is datamodel search page

Verify page is datamodel search page
    Wait until page contains element  ${Datamodel search page header}

Search and select datamodel ${Datamodel}
    Search datamodel ${Datamodel}
    Click element with wait           //h2[contains(text(), "${Datamodel}")]

Search datamodel ${Datamodel}
    Input text with wait              ${Search box datamodel}  ${Datamodel}
    Press Keys                        None      ENTER


