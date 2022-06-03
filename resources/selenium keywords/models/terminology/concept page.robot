*** Variables ***
${Concept title}  //span[text()="Käsite"]  |  //span[text()="Concept"]
${Term info close}  //button[@aria-label="Sulje termin tiedot"]

*** Keywords ***
Verify page is concept page
    Wait until page contains element  ${Concept title}

Select term ${term}
    click element with wait  //button[text()="${term}"] 

Verify term is dialog is open
    Wait until page contains  //h2[text()="${term}"] 

Close term dialog
    Click element with wait  ${Term info close}

Verify concept is part of collection
    Wait until page contains    Kuuluu käsitekokoelmaan

Verify collection contains concepts
    Wait until element is visible    //*[text()="Valikoimaan kuuluvat käsitteet"]

Verify collection does not contain concepts
    Wait until element is not visible    //*[text()="Valikoimaan kuuluvat käsitteet"]
