*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Datamodel attribute tab}                              //button[@id="drawer-button-attributes"]
${Datamodel add attribute button}                       //button[@id="add-resource-button"]
${Datamodel search input in attribute dialog}           //input[@id="search-input"]
${Datamodel add attribute cancel button}                //button[@id="cancel-button"]
${Datamodel create new attribute button}                //button[@id="create-new-button"]
${Datamodel create new attribute with subattribute button}  //button[@id="use-selected-button"]
${Datamodel create attribute dialog scope}              //button[@id="data-model-picker_button"]
${Datamodel attribute list}                           //div[@id="modal-list"]        
${Datamodel attribute label input fi}                   //span/div/label[contains(text(), "Attribuutin nimi, fi")]/../../div/input
${Datamodel attribute label input en}                   //span/div/label[contains(text(), "Attribuutin nimi, en")]/../../div/input
${Datamodel attribute label input sv}                   //span/div/label[contains(text(), "Attribuutin nimi, sv")]/../../div/input
${Datamodel attribute prefix input}                     //input[@id="prefix-input"]
${Datamodel save attribute}                             //button[@id="submit-button"]
${Datamodel attribute back button}                      //button[@id="back-button"]
${Datamodel attribute options button}                   //button[text()="Toiminnot"]
${Datamodel attribute edit button}                      //button[@id="edit-button"]
${Datamodel attribute delete button}                    //button[@id="remove-button"]
${Datamodel attribute description input fi}                //textarea[@id="note-input-fi"]
${Datamodel attribute description input en}                //textarea[@id="note-input-en"]
${Datamodel attribute description input sv}                //textarea[@id="note-input-sv"]
${Datamodel attribute editor comment input}             //textarea[@id="editorial-note-input"]
${Datamodel attribute status dropdown}                  //button[@id="status-dropdown_button"]
${Datamodel attribute concept select dropdown}          //button[@id="select-concept-button"]
${Datamodel attribute add subattribute button}              //label[contains(text(), "Yläattribuutit")]/../../div/button
${Datamodel attribute add equivalent attribute button}      //label[contains(text(), "Vastaavat attribuutit")]/../../div/button
${Datamodel attribute disjoint attribute button}            //label[contains(text(), "Erilliset attribuutit")]/../../div/button
${Datamodel select linking subattribute button}                    //div[@role="dialog"]/div/div/button[@id="use-selected-button"]
${Datamodel select attribute button}                    //div[@role="dialog"]/div/div/button[@id="submit-button"]
${Datamodel select subattribute button}                 //div[@role="dialog"]/div/div/button[@id="use-selected-button"]

${Datamodel attribute add class button}                //button[@id="add-class-button"]
${Datamodel attribute add class submit}                //div[@role="dialog"]/div/div/button[@id="submit-button"]

${Remove upper attribute from attribute}                    //label[contains(text(), "Yläattribuutit")]/../../div/div/button[@id="remove-button"]
${Remove corresponding attribute from attribute}            //label[contains(text(), "Vastaavat attribuutit")]/../../div/div/button[@id="remove-button"]
${Remove disjoint attribute from attribute}                 //label[contains(text(), "Erilliset attribuutit")]/../../div/div/button[@id="remove-button"]

${Datamodel concept search input}                   //input[@id="concept-search-input"]
${Datamodel concept search radio button}            //*[@class="highlighted-content"]/../../../../div/input[contains(@id, "terminology")] 


# Errors
${attribute prefix not set error}              Attribuutin yksilöivää tunnusta ei ole määritelty
${attribute prefix starts with number error}   Attribuutin tunnus ei voi alkaa numerolla
${attribute prefix size error}                 Attribuutin tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
${attribute prefix valid character error}      Attribuutin tunnuksen sallitut merkit ovat a-z, 0-9, alaviiva ja väliviiva
${attribute name not set error}                Attribuutin nimeä ei ole määritelty

*** Keywords ***
Open attribute tab
    Click element with wait                     ${Datamodel attribute tab}
    Sleep                                       1

Create new attribute
    Click element with wait                    ${Datamodel add attribute button}

Search attribute in attribute dialog
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel search input in attribute dialog}   ${Text}

Input attribute prefix
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel attribute prefix input}   ${Text}
    Sleep  1

Input finnish attribute label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel attribute label input fi}   ${Text}
    Sleep  1

Input english attribute label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel attribute label input en}   ${Text}
    Sleep  1

Input swedish attribute label
    [Arguments]   ${Text}
    Input text with wait                        ${Datamodel attribute label input sv}   ${Text}
    Sleep  1

Cancel create datamodel attribute dialog
    Click element with wait                     ${Datamodel add attribute cancel button}

Create new attribute datamodel in dialog
    Click element with wait                     ${Datamodel create new attribute button}

Create new attribute datamodel with subattribute in dialog
    Click element with wait                     ${Datamodel create new attribute with subattribute button}

Verify page does not contain add datamodel attribute button
    Wait Until Page Does Not Contain Element    ${Datamodel add attribute button}

Verify page does contain add datamodel attribute button
    Wait Until Page Contains Element            ${Datamodel add attribute button} 

Verify page does not contain attribute options button
    Wait Until Page Does Not Contain Element    ${Datamodel attribute options button}

Verify page does contain attribute options button
    Wait Until Page Contains Element            ${Datamodel attribute options button}

Verify attribute page does contain editor message
    [Arguments]  ${text}
    Wait Until Page Contains Element          //div[text()="${text}"]               

Verify attribute page does not contain editor message
    [Arguments]  ${text}
    Wait Until Page Does Not Contain Element  //div[text()="${text}"]    

Select attribute
    [Arguments]  ${attribute}
    Click element with wait   ${Datamodel attribute list}/div/div[text()="${attribute}"]

Save attribute
    Click element with wait   ${Datamodel save attribute}

Return from attribute
    Click element with wait   ${Datamodel attribute back button}

Show attribute options
    Click element with wait   ${Datamodel attribute options button}
    Sleep  1

Edit attribute
    Show attribute options
    Click element with wait   ${Datamodel attribute edit button}

Delete attribute
    Show attribute options
    Click element with wait   ${Datamodel attribute delete button}

Verify create datamodel attribute contains error ${error}
    Wait until page contains element  //div/ul/li[text()="${error}"]  #//div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]


Verify create datamodel attribute does not contain error ${error}
    Wait until page does not contain element  //div/ul/li[text()="${error}"]  #//div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]

Cancel attribute creation
    Click element with wait  ${Datamodel add attribute cancel button}

Input finnish description into attribute
    [Arguments]   ${text}
    Input text with wait   ${Datamodel attribute description input fi}      ${text}


Input english description into attribute
    [Arguments]   ${text}
    Input text with wait   ${Datamodel attribute description input en}      ${text}


Input swedish description into attribute
    [Arguments]   ${text}
    Input text with wait   ${Datamodel attribute description input sv}      ${text}

Input editor comment into attribute
    [Arguments]   ${text}
    Input text with wait   ${Datamodel attribute editor comment input}   ${text}

Select status into attribute
    [Arguments]   ${status}
    Click element with wait  ${Datamodel attribute status dropdown} 
    Click element with wait  //li[@id="status-dropdown-${status}"]

Select attribute concept into attribute
    [Arguments]   ${text}
    Click element with wait    ${Datamodel attribute concept select dropdown}       
    Input text with wait       ${Datamodel concept search input}        ${text}
    Sleep                    5
    FOR    ${index}    IN RANGE    1    6
        Press Keys               None  TAB
    END 
    Sleep                    5
    Press Keys               None  SPACE 
    #Click element with wait    ${Datamodel concept search radio button}
    Click element with wait    ${Datamodel select attribute button}

Select subattribute into attribute
    Click element with wait  ${Datamodel attribute add subattribute button}

Select equivalent attribute into attribute
    Click element with wait  ${Datamodel attribute add equivalent attribute button}
    
Select disjoint attribute into attribute
    Click element with wait  ${Datamodel attribute disjoint attribute button}

Select class into attribute
    Click element with wait  ${Datamodel attribute add class button}

Select class on linking attribute dialog
    [Arguments]   ${text}  ${prefix}
    Sleep  2
    Input text with wait     ${Datamodel search input in attribute dialog}  ${text}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep  2
    Click element with wait  ${Datamodel attribute add class submit}

Select attribute on linking subattribute dialog
    [Arguments]   ${text}  ${prefix}
    Sleep  2
    Input text with wait     ${Datamodel search input in attribute dialog}  ${text}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep  2
    Click element with wait  ${Datamodel select linking subattribute button}

Select attribute on linking attribute dialog
    [Arguments]   ${text}  ${prefix}
    Sleep  2
    Input text with wait     ${Datamodel search input in attribute dialog}  ${text}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Sleep  2
    Click element with wait  ${Datamodel select linking subattribute button}
    
Select attribute on create attribute dialog
    [Arguments]   ${text}  ${prefix}
    Click element with wait  //a[contains(@href, "${prefix}")]/../../div[@id="select-single-radio-button"]
    Click element with wait  ${Datamodel select subattribute button}
    
Remove upper attribute from attribute
    Click element with wait  ${Remove upper attribute from attribute}
    
Remove corresponding attribute from attribute
    Click element with wait  ${Remove corresponding attribute from attribute}
    
Remove disjoint attribute from attribute
    Click element with wait  ${Remove disjoint attribute from attribute} 