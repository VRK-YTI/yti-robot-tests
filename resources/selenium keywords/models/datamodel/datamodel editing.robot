
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Datamodel options button}                           //button[text()="Toiminnot"]
${Datamodel options show datamodel file}              //button[text()="Näytä tiedostona"]
${Show datamodel button}                              //button[text()="Näytä"]
${Show as file content}                               //pre

*** Keywords ***
Open datamodel options select
    Click element with wait  ${Datamodel options button}

Open show datamodel as file dialog
    Click element with wait  ${Datamodel options show datamodel file}

Show datamodel file
    Click element with wait  ${Show datamodel button}

Get shown json from new tab
    ${tab1}=        Switch Window   NEW
    ${json_string}=  Get Text  ${Show as file content}
    ${json}=  evaluate       json.loads('''${json_string}''')    json
    log  ${json}
    Switch Window  ${tab1}
    [Return]  ${json}


