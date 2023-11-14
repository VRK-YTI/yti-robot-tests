*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Datamodel association tab}                              //button[@id="drawer-button-associations"]
${Datamodel add association button}                       //button[@id="add-resource-button"]
${Datamodel search input in association dialog}           //div[@role="dialog"]/div/div/div/div/span/div/div/input[@id="search-input"]
${Datamodel add association cancel button}                //button[@id="cancel-button"]
${Datamodel create new association button}                //button[@id="create-new-button"]
${Datamodel create new association with subassociation button}  //button[@id="use-selected-button"]
${Datamodel create association dialog scope}              //button[@id="data-model-picker_button"]
${Datamodel associations list}                           //div[@id="modal-list"]        
${Datamodel association label input fi}                   //span/div/label[contains(text(), "Assosiaation nimi, fi")]/../../div/input
${Datamodel association label input en}                   //span/div/label[contains(text(), "Assosiaation nimi, en")]/../../div/input
${Datamodel association label input sv}                   //span/div/label[contains(text(), "Assosiaation nimi, sv")]/../../div/input
${Datamodel association prefix input}                     //input[@id="prefix-input"]
${Datamodel save association}                             //button[@id="submit-button"]
${Datamodel association back button}                      //button[@id="back-button"]
${Datamodel association options button}                   //button[text()="Toiminnot"]
${Datamodel association edit button}                      //button[@id="edit-button"]
${Datamodel association delete button}                    //button[@id="remove-button"]
${Datamodel association editor comment input}             //textarea[@id="editorial-note-input"]
${Datamodel association status dropdown}                  //button[@id="status-dropdown_button"]
${Datamodel association concept select dropdown}          //button[@id="select-concept-button"]
${Datamodel association add subassociation button}              //label[contains(text(), "Yläassosiaatiot")]/../../button
${Datamodel association add equivalent association button}      //label[contains(text(), "Vastaavat assosiaatiot")]/../../button
${Datamodel select concept button}                    //div[@role="dialog"]/div/div/button[@id="submit-button"]
${Datamodel select association button}                    //div[@role="dialog"]/div/div/button[@id="use-selected-button"]
${Datamodel select subassociation button}                 //div[@role="dialog"]/div/div/button[@id="use-selected-button"]

${Remove upper association from association}                    //label[contains(text(), "Yläassosiaatiot")]/../../div/div/button[@id="remove-button"]
${Remove corresponding association from association}            //label[contains(text(), "Vastaavat assosiaatiot")]/../../div/div/button[@id="remove-button"]

${Datamodel concept search input}                   //input[@id="concept-search-input"]
${Datamodel concept search radio button}            //*[@class="highlighted-content"]/../../../../div/input[contains(@id, "terminology")] 

${Datamodel association search status}                    //span[@id="status-picker-displayValue"]
${Datamodel association search status all}                //li[@id="status-picker--1"]
${Datamodel association search model}                    //span[@id="data-model-picker-displayValue"]
${Datamodel association search model all}                //li[@id="data-model-picker-all"]
${Datamodel association search terminology}                    //input[@id="terminology-select"]
${Datamodel association search terminology all}                //li[@id="terminology-select-all"]


# Errors
${association prefix not set error}              Assosiaation yksilöivää tunnusta ei ole määritelty
${association prefix starts with number error}   Assosiaation tunnus ei voi alkaa numerolla
${association prefix size error}                 Assosiaation tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
${association prefix valid character error}      Assosiaation tunnuksen sallitut merkit ovat a-z, 0-9, alaviiva ja väliviiva
${association name not set error}                Assosiaation nimeä ei ole määritelty

*** Keywords ***
Open association tab
    Click element with wait                     ${Datamodel association tab}
    Sleep                                       1

Create new association
    Click element with wait                    ${Datamodel add association button}

Search association in association dialog
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel search input in association dialog}   ${Text}

Input association prefix
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel association prefix input}   ${Text}
    Sleep  1

Input finnish association label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel association label input fi}   ${Text}
    Sleep  1

Input english association label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel association label input en}   ${Text}
    Sleep  1

Input swedish association label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel association label input sv}   ${Text}
    Sleep  1

Cancel create datamodel association dialog
    Click element with wait                     ${Datamodel add association cancel button}

Create new association datamodel in dialog
    Click element with wait                     ${Datamodel create new association button}

Create new association datamodel with subassociation in dialog
    Click element with wait                     ${Datamodel create new association with subassociation button}

Verify page does not contain add datamodel association button
    Wait Until Page Does Not Contain Element    ${Datamodel add association button}

Verify page does contain add datamodel association button
    Wait Until Page Contains Element            ${Datamodel add association button} 

Verify page does not contain association options button
    Wait Until Page Does Not Contain Element    ${Datamodel association options button}

Verify page does contain association options button
    Wait Until Page Contains Element            ${Datamodel association options button}

Verify association page does contain editor message
    [Arguments]  ${text}
    Wait Until Page Contains Element          //div[text()="${text}"]               

Verify association page does not contain editor message
    [Arguments]  ${text}
    Wait Until Page Does Not Contain Element  //div[text()="${text}"]    

Select association
    [Arguments]  ${association}
    Click element with wait   ${Datamodel associations list}/div/div[text()="${association}"]

Save association
    Click element with wait   ${Datamodel save association}

Wait until association is saved
    Wait until page does not contain element  ${Datamodel save association}  timeout=120
    Sleep  15

Return from association
    Click element with wait   ${Datamodel association back button}

Show association options
    Click element with wait   ${Datamodel association options button}
    Sleep  1

Edit association
    Show association options
    Click element with wait   ${Datamodel association edit button}

Delete association
    Show association options
    Click element with wait   ${Datamodel association delete button}

Verify create datamodel association contains error ${error}
    Wait until page contains element  //div/ul/li[text()="${error}"]


Verify create datamodel association does not contain error ${error}
    Wait until page does not contain element  //li[text()="${error}"]
    

Cancel association creation
    Click element with wait  ${Datamodel add association cancel button}

Input finnish description into association
    [Arguments]   ${text}
    Input text with wait   //textarea[@id="note-input-fi"]      ${text}


Input english description into association
    [Arguments]   ${text}
    Input text with wait   //textarea[@id="note-input-en"]      ${text}


Input swedish description into association
    [Arguments]   ${text}
    Input text with wait   //textarea[@id="note-input-sv"]      ${text}

Input editor comment into association
    [Arguments]   ${text}
    Input text with wait   ${Datamodel association editor comment input}   ${text}

Select status into association
    [Arguments]   ${status}
    Click element with wait  ${Datamodel association status dropdown} 
    Click element with wait  //li[@id="status-dropdown-${status}"]

Select association concept into association
    [Arguments]   ${text}
    Click element with wait    ${Datamodel association concept select dropdown} 

    Click element with wait  ${Datamodel association search terminology}
    Click element with wait  ${Datamodel association search terminology all} 

    Input text with wait       ${Datamodel concept search input}        ${text}
    Click element with wait    (//div[@role="dialog"]/div/div/div[@class="item-wrapper"]/div/label)[1]
    Click element with wait    ${Datamodel select concept button}

Select subassociation into association
    Click element with wait  ${Datamodel association add subassociation button}

Select equivalent association into association
    Click element with wait  ${Datamodel association add equivalent association button}

Select association on linking subassociation dialog
    [Arguments]   ${text}  ${prefix}
    Sleep  2
    Click element with wait  ${Datamodel association search status}
    Click element with wait  ${Datamodel association search status all}


    Input text with wait     ${Datamodel search input in association dialog}  ${text}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep  2
    Click element with wait  ${Datamodel select association button}
    
Select association on create association dialog
    [Arguments]   ${text}  ${prefix}
    Click element with wait  ${Datamodel association search status}
    Click element with wait  ${Datamodel association search status all}
    
    Input text with wait     ${Datamodel search input in association dialog}  ${text}
    Sleep                    2

    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep                    2
    Click element with wait  ${Datamodel select subassociation button}
    
Remove upper association from association
    Click element with wait  ${Remove upper association from association}
    
Remove corresponding association from association
    Click element with wait  ${Remove corresponding association from association}
