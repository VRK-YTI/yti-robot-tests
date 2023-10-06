
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Datamodel options button}                           //button[@id="actions-button"]
${Edit datamodel button}                              //button[@id="edit-button"]
${Save datamodel edit button}                         //button[text()="Tallenna"]
${Cancel datamodel edit button}                       //button[text()="Peruuta"]
${Add terminology datamodel edit button}              //button[@id="add-terminology-button"]
${Add terminology dialog search input}                //input[@id="search-input"]
${Add codelist dialog search input}                   //input[@id="search-text-input"]
${Add terminology dialog submit button}               //button[@id="submit-button"]
${Datamodel options show datamodel file}              //button[@id="show-as-file-button"]
${Show datamodel button}                              //button[@id="show-button"]
${Delete datamodel button}                            //button[@id="delete-modal-button"]
${Delete datamodel dialog button}                     //button[@id="delete-button"]
${Delete datamodel return to main}                    //button[@id="close-button"]
${Datamodel options show datamodel file cancel}       //button[@id="cancel-button"]

${Datamodel info tab}                                 //button[@id="drawer-button-info"]
${Datamodel links tab}                                //button[@id="drawer-button-links"]
${Datamodel links options button}                     //button[text()="Toiminnot"]
${Edit links button}                                  //button[@id="edit-linked-data-button"]
${Datamodel links terminology links submit button}    //div[@role="dialog"]/div/div/button[@id="submit-button"]
${Datamodel links edit submit button}                 //button[@id="submit-button"]

${Edit links button}                                  //button[@id="edit-linked-data-button"]
${Add datamodel link button}                          //button[@id="add-data-model-button"]
${Remove link button}                                 //button[@id="remove-linked-item-button"]

${Add codelist link button}                          //button[@id="add-reference-data-button"]

${Show as file content}                               //pre

*** Keywords ***
Open datamodel options select
    Click element with wait  ${Datamodel options button}

Delete datamodel from ui
    Click element with wait  ${Delete datamodel button}
    Click element with wait  ${Delete datamodel dialog button}

Verify datamodel has been deleted
    Wait until page contains element  //span[contains(text(), "poistettu")]
    Click element with wait           ${Delete datamodel return to main}

Open show datamodel as file dialog
    Click element with wait  ${Datamodel options show datamodel file}

Show datamodel file
    Click element with wait  ${Show datamodel button}

Cancel show datamodel file dialog
    Click element with wait  ${Datamodel options show datamodel file cancel}

Start editing datamodel
    Click element with wait  ${Edit datamodel button}

Cancel editing datamodel
    Click element with wait  ${Cancel datamodel edit button}

Save editing
    Click element with wait  ${Save datamodel edit button}

On edit remove ${language}
    Scroll create datamodel edit down  
    Click element with wait  //span[text()="${language}"]

On edit select create datamodel language ${language}
    Click element with wait  ${Datamodel language select}
    Click element with wait  //li[text()="${language}"]

On edit input ${language} name ${name}
    Input text with wait     //input[@id="name-input-${language}"]  ${name}

On edit input ${language} description ${description}
    Input text with wait     //textarea[@id="description-input-${language}"]  ${description}

On edit input contact ${contact}
    Input text with wait  ${Datamodel contact input}  ${contact}

Verify page does not contain edit datamodel button
    Wait Until Page Does Not Contain Element    ${Edit datamodel button} 

Verify page does contain edit datamodel button
    Wait Until Page Contains Element            ${Edit datamodel button} 

Get shown json from new tab
    ${tab1}=        Switch Window   NEW
    ${json_string}=  Get Text  ${Show as file content}
    ${json}=  evaluate       json.loads('''${json_string}''')    json
    log  ${json}
    Switch Window  ${tab1}
    [Return]  ${json}

Remove all selected domains from edit
    Scroll create datamodel edit down
    Click element with wait  ${Remove all selections for domains}
    Press Keys    None      TAB

Remove all selected contributors from edit
    Click element with wait  ${Remove all selections for contributors}
    Press Keys    None      TAB

Select edit datamodel domain ${domain}
    Scroll create datamodel edit down
    Click element with wait  ${Datamodel domain select}
    Click element with wait  //li[text()="${domain}"]
    Press Keys    None      TAB

Select edit datamodel contributor ${contributor}
    Click element with wait  ${Datamodel contributor select}
    Click element with wait  //li[text()="${contributor}"]
    Press Keys    None      TAB

Verify edit datamodel contains error ${error}
    Wait until page contains element  //div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]

Verify edit datamodel does not contain error ${error}
    Wait until page does not contain element  //div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]

Scroll create datamodel edit down
    [Arguments]  ${tabs_count}=6
    # Quick fix, element is in way of the input, so dialog has to be scrolled
    Click element with wait  //span[text()="Tiedot"]
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  

Add terminology link to datamodel
    [Arguments]  ${terminology}  ${tabs_count}=7
    Click element with wait  ${Add terminology datamodel edit button}
    Input text with wait     ${Add terminology dialog search input}  ${terminology}
    Press Keys               None  TAB
    Click element with wait  //span[text()="1 sanasto"]
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  
    Press Keys               None  SPACE
    Click element with wait  ${Add terminology dialog submit button}

Add terminology link to datamodel in links tab
    [Arguments]  ${terminology}  ${tabs_count}=7
    Click element with wait  ${Add terminology datamodel edit button}
    Input text with wait     ${Add terminology dialog search input}  ${terminology}
    Press Keys               None  TAB
    Sleep                    1
    Click element with wait  //span[text()="1 sanasto"]
    Sleep                    1
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  
    Press Keys               None  SPACE
    Click element with wait  ${Datamodel links terminology links submit button}
    
Add datamodel link to datamodel in links tab
    [Arguments]  ${datamodel}  ${tabs_count}=4
    Click element with wait  ${Add datamodel link button}
    Input text with wait     ${Add terminology dialog search input}  ${datamodel}
    Press Keys               None  TAB
    Sleep  1
    Click element with wait  //span[text()="1 tietomalli"]
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  
    Press Keys               None  SPACE
    Click element with wait  ${Datamodel links terminology links submit button}
    
Add codelist link to datamodel in links tab
    [Arguments]  ${codelist}  ${tabs_count}=4
    Click element with wait  ${Add codelist link button}
    Input text with wait     ${Add codelist dialog search input}  ${codelist}
    Press Keys               None  TAB
    Click element with wait  //span[text()="1 koodisto"]
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  
    Press Keys               None  SPACE
    Click element with wait  ${Datamodel links terminology links submit button}

Remove link from link editing
    Click element with wait  ${Remove link button}

Select info tab
    Click element with wait  ${Datamodel info tab}

Select links tab
    Click element with wait  ${Datamodel links tab}

Edit links from links tab
    Click element with wait  ${Edit links button}

Save editing links 
    Click element with wait  ${Datamodel links edit submit button}
    Sleep                    20
