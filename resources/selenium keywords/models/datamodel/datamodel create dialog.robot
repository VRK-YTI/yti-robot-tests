*** Settings ***
Library    SeleniumLibrary
Resource    ../../generic/generic selenium.robot

*** Variables ***
${Create new datamodel button}              //button[@id="new-model-button"]
${Datamodel Profile radio button}           //input[@id="profile-radio-button"]/..
${Datamodel Core model radio button}        //input[@id="library-radio-button"]/..
${Datamodel Prefix input}                   //input[@id="prefix-text-input"]
${Datamodel contact input}                  //input[@id="contact-input"]
${Create datamodel accept button}           //button[@id="submit-button"]
${Create datamodel cancel button}           //button[@id="cancel-button"]
${Create datamodel prefix error text}       //span[@id="prefix-text-input-statusText"]

${Datamodel domain select}                  //input[@id="information-domains-selector"]
${Datamodel contributor select}             //input[@id="contributors-selector"]
${Datamodel language select}                //input[@id="language-selector"]

${Remove all selections for domains}        //label[text()="Tietoalueet"]/../../../../button[text()="Poista kaikki valinnat"]
${Remove all selections for contributors}   //label[text()="Sisällöntuottajat"]/../../../../button[text()="Poista kaikki valinnat"]

*** Keywords ***
Verify page does not contain create datamodel button
    Wait until page does not contain element  ${Create new datamodel button} 

Verify page does contain create datamodel button
    Wait Until Page Contains Element  ${Create new datamodel button} 

Open create datamodel dialog
    Click element with wait  ${Create new datamodel button} 
    Find and hide element    (//div[@role="dialog"]/div/div)[3]

Accept creating datamodel
    Click element with wait  ${Create datamodel accept button}

Cancel creating datamodel
    Click element with wait  ${Create datamodel cancel button}

Verify create datamodel contains error ${error}
    Wait until page contains element  //div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]

Verify create datamodel does not contain error ${error}
    Wait until page does not contain element  //div[text()="Puuttuvia tietoja"]/../div/ul/li[text()="${error}"]

Input create datamodel prefix ${prefix}
    Input text with wait  ${Datamodel Prefix input}  ${prefix}
    Sleep  1

Input create datamodel contact ${contact}
    Input text with wait  ${Datamodel contact input}  ${contact}

Select create datamodel profile model type
    Click element with wait  ${Datamodel Profile radio button} 

Select create datamodel core model type
    Click element with wait  ${Datamodel Core model radio button}
    
Select create datamodel domain ${domain}
    Scroll create datamodel dialog down
    Click element with wait  ${Datamodel domain select}
    Click element with wait  //li[text()="${domain}"]

Select create datamodel contributor ${contributor}
    Scroll create datamodel dialog down
    Click element with wait  ${Datamodel contributor select}
    Click element with wait  //li[text()="${contributor}"]

Select create datamodel language ${language}
    Scroll create datamodel dialog down
    Click element with wait  ${Datamodel language select}
    Click element with wait  //li[text()="${language}"]

Input create datamodel language ${language} for name ${name}
    Input text with wait     //input[@id="name-input-${language}"]  ${name}

Input create datamodel language ${language} for description ${description}
    Input text with wait     //textarea[@id="description-input-${language}"]  ${description}

Verify create datamodel invalid prefix error
    Wait until page contains element  ${Create datamodel prefix error text}

Scroll create datamodel dialog down
    [Arguments]  ${tabs_count}=6
    # Quick fix, element is in way of the input, so dialog has to be scrolled
    Click element with wait  //h2[text()="Luo uusi tietomalli"]
    FOR    ${index}    IN RANGE    1    ${tabs_count}
        Press Keys               None  TAB
    END  

Verify datamodel is created with prefix ${prefix}
    Wait Until Location Contains  ${DATAMODELS_URL}model/${prefix}

Remove selected domain ${domain}
    Scroll create datamodel dialog down
    Click element with wait  //button/span[text()="${domain}"]

Remove selected contributor ${contributor}
    Scroll create datamodel dialog down
    Click element with wait  //button/span[text()="${contributor}"]

Remove selected language ${language}
    Scroll create datamodel dialog down
    Click element with wait  //button/span[text()="${language}"]

Remove all selected domains
    Scroll create datamodel dialog down  10
    Click element with wait  ${Remove all selections for domains}

Remove all selected contributors
    Scroll create datamodel dialog down  10
    Click element with wait  ${Remove all selections for contributors}