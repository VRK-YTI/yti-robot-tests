*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Documentation page link}    //a[text()=" Dokumentaatio"]
${Edit doc button}            //button/span[text()="Muokkaa"]
${Save edit doc button}       //button/span[text()="Tallenna"]
${Cancel edit doc button}     //button/span[text()="Peruuta"]
${Documentation header}       //h2[text()=" Dokumentaatio "]
${Editing textarea}           //div/textarea
${Confirm ongoing warning}    //button[@id="confirm_modal_template_button"]
${Cancel ongoing editing warning}    //button[@id="cancel_modal_template_button"]
${data language dropdown}    //button[@id="data_language_dropdown_button"]


*** Keywords ***
Open documentation page
    Click Element with wait   ${Documentation page link}
    Verify documentation page has opened

Verify documentation page has opened
    Wait until page contains element  ${Documentation header}

Verify edit documentation button is not shown
    Wait Until Page Does Not Contain element  ${Edit doc button}

Edit documentation
    Click Element with wait   ${Edit doc button}

Save edited documentation
    Click Element with wait   ${Save edit doc button}

Cancel editing documentation
    Click Element with wait   ${Cancel edit doc button}

Edit and save documentation
    [Arguments]  ${text}
    Edit documentation
    Write to editor           ${text}
    Save edited documentation

Write to editor
    [Arguments]  ${text}
    Wait Until Page Contains Element    ${Editing textarea}
    Wait For Condition                  return document.readyState=="complete"
    Input Text                          ${Editing textarea}    ${text}

Verify ongoing editing warning
    Wait until page contains  Muokkaaminen on kesken 

Cancel ongoing editing warning
    Click Element with wait   ${Cancel ongoing editing warning}
    
Confirm ongoing editing warning
    Click Element with wait   ${Confirm ongoing warning}

Click edited link
    [Arguments]  ${link}
    Wait Until Page Contains element  ${Edit doc button}
    Click element with wait           //div/p/a[@href="${link}"]

Verify documentation contains
    [Arguments]  ${text}
    Wait Until Page Contains element  ${Edit doc button}
    Wait Until Page Contains          ${text}

Change data language to ${lang}
    Click element with wait  ${data language dropdown}
    Click element with wait  //button[@id="${lang}_data_language_dropdown_button"]

Verify default documentation on changed language
    Wait until page contains element   //*[@id="modelDocumentation"]/div/div[contains(text(), "fi")]