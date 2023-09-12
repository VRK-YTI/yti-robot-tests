
*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${Datamodel documentation tab}                                //button[@id="drawer-button-documentation"]
${Datamodel documentation edit button}                        //button[@id="edit-button"]
${Datamodel documentation cancel button}                      //button[@id="cancel-button"]
${Datamodel documentation save button}                        //button[@id="submit-button"]
${Datamodel documentation editing textarea}                   //textarea[@id="documentation-textarea"]


*** Keywords ***
Verify page does not contain datamodel documentation tab
    Wait Until Page Does Not Contain Element     ${Datamodel documentation tab} 

Verify page does contain datamodel documentation tab
    Wait Until Page Contains Element             ${Datamodel documentation tab}  

Open documentation tab
    Click element with wait                      ${Datamodel documentation tab}  

Verify page does contain datamodel edit documentation button
    Wait Until Page Contains Element             ${Datamodel documentation edit button}

Click edit documentation button
    Click element with wait                      ${Datamodel documentation edit button}

Cancel editing documentation
    Click element with wait                      ${Datamodel documentation cancel button}

Save editing documentation
    Click element with wait                      ${Datamodel documentation save button}

Input documentation
    [Arguments]    ${text}
    Input text with wait                         ${Datamodel documentation editing textarea}   ${text} 

Verify preview text
    [Arguments]    ${text}
    Wait until page contains element                  //p[contains(text(), "${text}")] 

Verify documentation link
    [Arguments]    ${link}
    Wait Until Page Contains Element                   //a[@href="${link}"] 

Verify documentation link is not shown
    [Arguments]    ${link}
    Wait Until Page does not Contain Element                   //a[text()="${link}"] 

Verify preview text is not shown
    [Arguments]    ${text}
    Wait until page does not contain element                  //p[text()="${text}"]

Verify edited text
    ${date1} =    Get Current Date      result_format=%#d.%#m.%Y
    Wait Until Page Contains            Päivitetty:
    Wait Until Page Contains            ${date1}

Change documentation language tab
    [Arguments]    ${language}
    Click element with wait  //button[@id="language-selector-button" and text()="${language}"]
