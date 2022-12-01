*** Settings ***
Library   String

*** Variables ***
${Datamodel search page header}   //h1[text()="Tietomallit"]

*** Keywords ***
Open datamodel search page
    Go to  ${DATAMODELS_URL}
    Verify page is datamodel search page

Verify page is datamodel search page
    Wait until page contains element  ${Datamodel search page header}
