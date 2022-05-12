*** Variables ***
${Terminology title}                //span[text()="Sanaston tiedot ja toiminnot"]  |  //span[text()="Terminology"]
${Terminology download button}      //button[contains(text(), "Lataa sanasto")]

*** Keywords ***
Verify page is terminology page
    Wait until page contains element    ${Terminology title}

Open terminology information page
    Click element with wait             ${Terminology title}

Select concept ${concept}
    click element with wait  //a[text()="${concept}"] 

Select terminology ${terminology} from breadcrumps
    Click element with wait     //a[text()="${terminology}"]

Download terminology
    Open terminology information page
    Click element with wait             ${Terminology download button}

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
