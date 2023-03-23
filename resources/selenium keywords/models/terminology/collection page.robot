*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${collection delete button}                   //button[@id="open-remove-collection-modal"]

${collection save button}                       //button[@id="submit-button"]
${collection cancel button}                     //button[@id="cancel-button"]

${Edit collection button}                       //button[@id="edit-collection-button"]
${Collection create save button}                //button[text()="Tallenna"]  |  //button[text()="Save"]

${Collection name input}                        //input[@placeholder="Kirjoita nimi"]  |  //input[@placeholder="Enter a name"]
${Collection definition input}                  //textarea[@placeholder="Kirjoita kuvaus"]

${Create collection button}                     //button[text()="Lisää uusi käsitekokoelma"]  |  //button[text()="Add new collection"]
${Add concept to collection button}             //button[text()="Lisää käsite käsitekokoelmaan"]  |  //button[text()="Add concept to collection"]
${Close and add concept to collection button}   //button[text()="Lisää käsite"]  |  //button[text()="Lisää käsitteet"]  |  //button[text()="Add concept"]  |  //button[text()="Add concepts"]

${Collection empty name error}          Käsitekokoelman nimi tulee olla määritettynä vähintään yhdellä kielellä.

*** Keywords ***
Delete collection
    Click element with wait  ${collection delete button}

Save collection modify
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${collection save button}
    IF  '${Valid}' == '${True}'
        Verify modify collection page is not open
    END
    IF  '${Valid}' == '${False}'
        Verify modify collection page is open
    END

Cancel collection modify
    Click element with wait             ${collection cancel button}
    Verify modify collection page is not open

Verify modify collection page is not open
    Wait Until Location Does Not Contain  edit  timeout=90

Verify modify collection page is open
    Wait Until Location Contains  edit

Cancel collection create
    Click element with wait             ${collection cancel button}
    Verify new collection page is not open

Verify modify collection error message ${message}
    Wait until page contains element  //li[text()="${message}"]

Open create collection dialog
    Open terminology information
    Click element with wait             ${Create collection button}

Verify page does not contain create collection button
    Open terminology information
    Wait until page does not contain element    ${Create collection button}

Name new collection as ${concept name}
    Input text with wait  ${collection name input}  ${concept name} 

Give new collection definition as ${definition}
    Input text with wait  ${Collection definition input}  ${definition} 

Save collect creation
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${collection save button}
    IF  '${Valid}' == '${True}'
        Verify new collection page is not open
    END
    IF  '${Valid}' == '${False}'
        Run keyword and ignore error  Verify new concept page is not open
        Verify new collection page is open
    END

Remove concept ${concept name} from collection creation
    Click element with wait  //span[text()="${concept name}"]

Add concept ${concept name} to collection
    Click element with wait  ${Add concept to collection button}
    Search concept ${concept_name} from add dialog
    Click element with wait  ${Search button from create dialog}
    Click element with wait  //span/b[text()="${concept_name}"]
    Click element with wait  ${Close and add concept to collection button}

Verify new collection page is not open
    Wait Until Location Does Not Contain  new-collection

Verify new collection page is open
    Wait Until Location Contains  new-collection

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

Select collection concept ${concept} 
    click element with wait  //a[text()="${concept}"] 

Edit collection
    Click element with wait  ${Edit collection button}

Verify modify collection button is not shown
    Wait until page does not contain element  ${Edit collection button}


    