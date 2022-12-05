*** Variables ***
${Terminology title}                //span[text()="Sanaston tiedot ja toiminnot"]  |  //span[text()="Terminology"]
${Terminology download button}      //button[@id="export-terminology-button"]

*** Keywords ***
Verify page is terminology page
    Wait until page contains element    ${Terminology title}

Open terminology information page
    Click element with wait             ${Terminology title}
    Wait until page contains element    ${Terminology download button}

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
    click element with wait  //h2[text()="${concept}"] 

Select collection concept ${concept} 
    click element with wait  //a[text()="${concept}"] 

Select terminology ${terminology} from breadcrumps
    Click element with wait     //a[text()="${terminology}"]

Select terminology ${terminology} from side
    Click element with wait     //a[text()="${terminology}"]

Download terminology
    Open terminology information page
    Click element with wait            ${Terminology download button}

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

Verify terminology is not vocabulary ${vocabulary}
    Open terminology information page
    Wait until page does not contain element  //div[text()="${vocabulary}"]