*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Datamodel class tab}                              //button[@id="drawer-button-classes"]
${Datamodel add class button}                       //button[@id="add-class-button"]
${Datamodel search input in class dialog}           //input[@id="search-input"]
${Datamodel add class cancel button}                //button[@id="cancel-button"]
${Datamodel create new class button}                //button[@id="create-class-button"]
${Datamodel create new class with subclass button}  //button[@id="create-subclass-button"]
${Datamodel create class dialog scope}              //button[@id="data-model-picker_button"]
${Datamodel classes list}                           //div[@id="modal-list"]        
${Datamodel class label input fi}                   //span/div/label[contains(text(), "Luokan nimi, fi")]/../../div/input
${Datamodel class label input en}                   //span/div/label[contains(text(), "Luokan nimi, en")]/../../div/input
${Datamodel class label input sv}                   //span/div/label[contains(text(), "Luokan nimi, sv")]/../../div/input
${Datamodel class prefix input}                     //input[@id="prefix-input"]
${Datamodel save class}                             //button[@id="submit-button"]
${Datamodel class back button}                      //button[text()="Takaisin"]
${Datamodel class options button}                   //button[text()="Toiminnot"]
${Datamodel class edit button}                      //button[@id="edit-class-button"]
${Datamodel class delete button}                    //button[@id="delete-class-button"]
${Datamodel class description input}                //textarea[@id="comment-input"]
${Datamodel class editor comment input}             //textarea[@id="editor-comment-input"]
${Datamodel class status dropdown}                  //button[@id="status-dropdown_button"]
${Datamodel class concept select dropdown}          //button[@id="select-concept-button"]
${Datamodel class add subclass button}              //label[contains(text(), "Yläluokat")]/../../button
${Datamodel class add equivalent class button}      //label[contains(text(), "Vastaavat luokat")]/../../button
${Datamodel class disjoint class button}            //label[contains(text(), "Erilliset luokat")]/../../button
${Datamodel select class button}                    //div[@role="dialog"]/div/div/button[@id="submit-button"]
${Datamodel select subclass button}                 //div[@role="dialog"]/div/div/button[@id="create-subclass-button"]

${Remove upper class from class}                    //label[contains(text(), "Yläluokat")]/../../div/div/button[@id="remove-button"]
${Remove corresponding class from class}            //label[contains(text(), "Vastaavat luokat")]/../../div/div/button[@id="remove-button"]
${Remove disjoint class from class}                 //label[contains(text(), "Erilliset luokat")]/../../div/div/button[@id="remove-button"]

${Datamodel concept search input}                   //input[@id="concept-search-input"]
${Datamodel concept search radio button}            //*[@class="highlighted-content"]/../../../../div/input[contains(@id, "terminology")] 

${Datamodel class search status}                    //span[@id="status-picker-displayValue"]
${Datamodel class search status all}                //li[@id="status-picker--1"]
${Datamodel class search model}                    //span[@id="data-model-picker-displayValue"]
${Datamodel class search model all}                //li[@id="data-model-picker-all"]
${Datamodel class search terminology}                    //input[@id="terminology-select"]
${Datamodel class search terminology all}                //li[@id="terminology-select-all"]


# Errors
${Class prefix not set error}              Luokan tunnusta ei ole määritetty
${Class prefix starts with number error}   Luokan tunnus ei voi alkaa numerolla
${Class prefix size error}                 Luokan tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
${Class prefix valid character error}      Luokan tunnuksen sallitut merkit ovat a-z, 0-9, alaviiva ja väliviiva
${Class name not set error}                Luokan nimeä ei ole määritelty

*** Keywords ***
Open class tab
    Click element with wait                     ${Datamodel class tab}
    Sleep                                       1

Create new class
    Click element with wait                    ${Datamodel add class button}

Search class in class dialog
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel search input in class dialog}   ${Text}

Input class prefix
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel class prefix input}   ${Text}
    Sleep  1

Input finnish class label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel class label input fi}   ${Text}
    Sleep  1

Input english class label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel class label input en}   ${Text}
    Sleep  1

Input swedish class label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel class label input sv}   ${Text}
    Sleep  1

Cancel create datamodel class dialog
    Click element with wait                     ${Datamodel add class cancel button}

Create new class datamodel in dialog
    Click element with wait                     ${Datamodel create new class button}

Create new class datamodel with subclass in dialog
    Click element with wait                     ${Datamodel create new class with subclass button}

Verify page does not contain add datamodel class button
    Wait Until Page Does Not Contain Element    ${Datamodel add class button}

Verify page does contain add datamodel class button
    Wait Until Page Contains Element            ${Datamodel add class button} 

Verify page does not contain class options button
    Wait Until Page Does Not Contain Element    ${Datamodel class options button}

Verify page does contain class options button
    Wait Until Page Contains Element            ${Datamodel class options button}

Verify class page does contain editor message
    [Arguments]  ${text}
    Wait Until Page Contains Element          //div[text()="${text}"]               

Verify class page does not contain editor message
    [Arguments]  ${text}
    Wait Until Page Does Not Contain Element  //div[text()="${text}"]    

Select class
    [Arguments]  ${Class}
    Click element with wait   ${Datamodel classes list}/div/div[text()="${Class}"]

Save class
    Click element with wait   ${Datamodel save class}


Wait until class is saved 
    Wait until page does not contain element  ${Datamodel save class}  timeout=120
    Sleep  15

Return from class
    Click element with wait   ${Datamodel class back button}

Show class options
    Click element with wait   ${Datamodel class options button}
    Sleep  1

Edit class
    Show class options
    Click element with wait   ${Datamodel class edit button}

Delete class
    Show class options
    Click element with wait   ${Datamodel class delete button}

Verify create datamodel class contains error ${error}
    Wait until page contains element  //div/ul/li[text()="${error}"]


Verify create datamodel class does not contain error ${error}
    Wait until page does not contain element  //div/ul/li[text()="${error}"]

Cancel class creation
    Click element with wait  ${Datamodel add class cancel button}

Input finnish description into class
    [Arguments]   ${text}
    Input text with wait   (${Datamodel class description input})[1]      ${text}


Input english description into class
    [Arguments]   ${text}
    Input text with wait   (${Datamodel class description input})[3]      ${text}


Input swedish description into class
    [Arguments]   ${text}
    Input text with wait   (${Datamodel class description input})[2]      ${text}

Input editor comment into class
    [Arguments]   ${text}
    Input text with wait   ${Datamodel class editor comment input}   ${text}

Select status into class
    [Arguments]   ${status}
    Click element with wait  ${Datamodel class status dropdown} 
    Click element with wait  //li[@id="status-dropdown-${status}"]

Select class concept into class
    [Arguments]   ${text}
    Click element with wait    ${Datamodel class concept select dropdown}    
    
    Click element with wait      ${Datamodel class search terminology}
    Click element with wait      ${Datamodel class search terminology all}   

    Input text with wait       ${Datamodel concept search input}        ${text}
    Click element with wait    (//div[@role="dialog"]/div/div/div[@class="item-wrapper"]/div/label)[1]
    Click element with wait    ${Datamodel select class button}

Select subclass into class
    Click element with wait  ${Datamodel class add subclass button}

Select equivalent class into class
    Click element with wait  ${Datamodel class add equivalent class button}
    
Select disjoint class into class
    Click element with wait  ${Datamodel class disjoint class button}

Select class on linking class dialog
    [Arguments]   ${text}  ${prefix}
    Sleep  2
    Click element with wait  ${Datamodel class search status}
    Click element with wait  ${Datamodel class search status all}
    

    Input text with wait     ${Datamodel search input in class dialog}  ${text}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep  2
    Click element with wait  ${Datamodel select class button}
    
Select class on create class dialog
    [Arguments]   ${text}  ${prefix}
    Click element with wait  ${Datamodel class search status}
    Click element with wait  ${Datamodel class search status all}
    

    Input text with wait     ${Datamodel search input in class dialog}  ${text}
    Sleep                    2
    
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Click element with wait  ${Datamodel select subclass button}
    
Remove upper class from class
    Click element with wait  ${Remove upper class from class}
    
Remove corresponding class from class
    Click element with wait  ${Remove corresponding class from class}
    
Remove disjoint class from class
    Click element with wait  ${Remove disjoint class from class} 