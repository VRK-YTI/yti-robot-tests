*** Settings ***
Library    SeleniumLibrary
Resource    ../../generic/generic selenium.robot

*** Variables ***
${Concept title}      //span[text()="Käsite"]  |  //span[text()="Concept"]
${Term info close}    //button[@aria-label="Sulje termin tiedot"]
${Term title}         //h2[text()="Termit"]  |  //span[text()="Terms"]

${bring concepts button on search}      //div[@id="search-results"]/div/button[text()="Tuo käsitteitä"]
${bring concepts button on expander}    //div[@id="info-expander"]/div/div/div/div/button[text()="Tuo käsitteitä"]
${bring concepts file select button}    //button[@id="add-file-button"]
${bring concepts file upload button}    //button[text()="Tuo käsitteitä sanastoon"]
${bring concepts file close after upload button}  //button[text()="Sulje"]

${Bring concept dialog cancel button}   //div[@role="dialog"]/div/div/button[text()="Peruuta"]

${concept name input}                  //input[@placeholder="Kirjoita termin nimi"]  |  //input[@placeholder="Give term name"]
${concept definition input}            //textarea[@placeholder="Kirjoita määritelmä"]  |  //textarea[@placeholder="Enter a definition"]

${concept create continue button}  //button[text()="Jatka"]  |  //button[text()="Continue"]

${Concept save button}            //button[@id="submit-button"]
${Concept cancel button}          //button[@id="cancel-button"]

${Create concept title}           //h2[text()="Lisää uusi käsite"]  |  //h2[text()="Add new concept"]
${Concept status label}           //label[text()="Käsitteen tila"]

${Search concept input from create dialog}      //input[@placeholder="Kirjoita hakusana"]  |  //input[@placeholder="Enter a name"]
${Search button from create dialog}             //button[text()="Hae"]  |  //button[text()="Search"]

${Create concept button}            //div[@id="search-results"]/div/button[@id="new-concept-button"]

${Copy terminology button}          //button[text()="Luo uusi versio sanastosta"] 
${Copy cancel terminology button}   //button[text()="Peruuta"] 
${Copy create terminology button}   //button[text()="Tallenna"] 
${Copy manual prefix select}        //label[@for="prefix-input-manual"]
${Copy manual prefix input}         //input[@id="prefix-text-input"]

${concept subject input}            //input[@id="subject-input"]

${concept new example button}              //div[text()="Huomautukset"]/../div/button[text()="Lisää uusi huomautus"]
${concept new example input}               (//div[text()="Huomautukset"]/../div/ul/li/div/div/textarea)[last()]
${concept new example delete button}       (//div[text()="Huomautukset"]/../div/ul/li/div/button)[last()]

${concept new usage example button}           //div[text()="Käyttöesimerkki"]/../div/button[text()="Lisää uusi käyttöesimerkki"]
${concept new usage example input}            (//div[text()="Käyttöesimerkki"]/../div/ul/li/div/div/textarea)[last()]
${concept new usage example delete button}    (//div[text()="Käyttöesimerkki"]/../div/ul/li/div/button)[last()]

${concept diagrams and sources box}        //span[text()="Käsitekaaviot ja lähteet"] 
${concept sources box}                     //div[@id="diagrams-and-sources-expander"]/div["diagrams-and-sources-expander_content"]
${concept sources add source button}       ${concept sources box}/div/div[text()="Lähteet"]/../div/button[text()="Lisää uusi lähde"]
${concept sources add source input}        (${concept sources box}/div/div[text()="Lähteet"]/../div/ul/li/div/div/div/textarea)[last()]
${concept sources delete source button}    (${concept sources box}/div/div[text()="Lähteet"]/../div/ul/li/div/div/button)[last()]

${concept sources add diagram button}       ${concept sources box}/div/div[text()="Käsitekaavio tai muu linkki"]/../div/button[text()="Lisää uusi lähde"]
${concept sources add diagram input}        (${concept sources box}/div/div[text()="Käsitekaavio tai muu linkki"]/../div/ul/li/div/div/div/textarea)[last()]
${concept sources delete diagram button}    (${concept sources box}/div/div[text()="Käsitekaavio tai muu linkki"]/../div/ul/li/div/div/button)[last()]

${concept organization box}                                //span[text()="Hallinnolliset tiedot"]
${concept organization history change input}               //textarea[@id="change-history-input"]
${concept organization etymology input}                    //textarea[@id="etymology-input"]
${concept organization note box}                           //div[@id="organization-information-expander"]/div[@id="organization-information-expander_content"]
${concept organization organization add note button}       ${concept organization note box}/div/div[text()="Ylläpitäjän muistiinpano"]/../div/button[text()="Lisää uusi muistiinpano"]
${concept organization organization note input}            (${concept organization note box}/div/div[text()="Ylläpitäjän muistiinpano"]/../div/ul/li/div/div/textarea)[last()]
${concept organization organization note delete button}    (${concept organization note box}/div/div[text()="Ylläpitäjän muistiinpano"]/../div/ul/li/div/button)[last()]

${concept organization concept class input}    //input[@id="concept-class-input"]

${concept terms other information box}         //span[text()="Käsitteen muut tiedot"]

${concept relational information box}                   //span[text()="Suhdetiedot"]
${concept relational broader button}                    //button[text()="Lisää uusi hierarkkinen yläkäsite"]
${concept relational narrower button}                   //button[text()="Lisää uusi hierarkkinen alakäsite"]
${concept relational related button}                    //button[text()="Lisää uusi liittyvä käsite"]
${concept relational is part of button}                 //button[text()="Lisää uusi koostumussuhteinen yläkäsite"]
${concept relational has part of button}                //button[text()="Lisää uusi koostumussuhteinen alakäsite"]
${concept relational related in other button}           //div[text()="Liittyvä käsite toisessa sanastossa"]/../div/button[text()="Lisää uusi liittyvä käsite"]
${concept relational matching in other button}          //div[text()="Vastaava käsite toisessa sanastossa"]/../div/button[text()="Lisää uusi vastaava käsite"]
${concept relational almost matching in other button}   //div[text()="Lähes vastaava käsite toisessa sanastossa"]/../div/button[text()="Lisää uusi lähes vastaava käsite"]

${concept name is empty error}             //*[text()="Suositettava termi tulee olla määritettynä vähintään yhdellä kielellä."]

${Concept relation search input}           //input[@id="keyword-input"]
${Concept relation search button}          //button[@id="search-button"]
${Close and add concept relation button}   //button[text()="Lisää käsite"]  |  //button[text()="Lisää käsitteet"]  |  //button[text()="Add concept"]  |  //button[text()="Add concepts"]

${Language extra info in term information panel}  //div/h4/button/span[text()="Kieliopilliset lisätiedot"]
${Organization info in term information panel}    //div/h4/button/span[text()="Hallinnolliset tiedot"]
${homograph in term information title}            //h3[text()="Homonyymin järjestysnumero"]
${Term extra info in term information title}      //h3[text()="Termin lisätieto"]
${Scope in term information title}                //h3[text()="Käyttöala"]
${Source in term information title}               //h3[text()="Lähde"]

${Term information close button}                //button[text()="Sulje"]

${Recommended term can't be changed error}      //div[text()="Suositettavan termin tyyppiä ei voi muuttaa, koska muita suositettavia termejä ei ole määritetty. Lisää uusi suositettava termi tai muuta olemassa oleva termi suositettavaksi termiksi."]

${Change term type button}              //button[text()="Muuta termin tyyppi"]
${Change term type dropdown}            //span[text()="Valitse tyyppi"]
${Change accept button}                 //button[text()="Hyväksy"]
${term cancel creation cancel button}   //div[@role="dialog"]/*/div/button[text()="Peruuta"]

${Organization info in concepts information}             //div/span/button/span[text()="Hallinnolliset tiedot"]
${Concept other information in concepts information}     //div/span/button/span[text()="Käsitteen muut tiedot"]
${sources in concepts information title}                 //div/span/button/span[text()="Käsitekaaviot ja lähteet"]
${Description in concepts information title}             //h2[text()="Määritelmä"]
${Example in concepts information title}                 //h2[text()="Huomautus"]
${broader concept in concepts information title}         //h3[text()="Hierarkkinen yläkäsite"]
${narrower concept in concepts information title}        //h3[text()="Hierarkkinen alakäsite"]
${Related concept in concepts information title}         //h3[text()="Liittyvä käsite"]
${Is part of concept in concepts information title}      //h3[text()="Koostumussuhteinen yläkäsite"]
${Has part concept in concepts information title}        //h3[text()="Koostumussuhteinen alakäsite"]

${new term add term button}        //button[text()="Lisää uusi termi"]
${new term accept button}          //button[text()="Hyväksy"]
${Delete term button}              (//button[text()="Poista termi"])[last()]

${new term homograph checkbox}     //div[@role="dialog"]//div/label[text()="Termi on homonyymi"]
${new term homograph input}        //div[@role="dialog"]//div/label[text()="Homonyymin järjestysnumero"]/../../div/input
${new term name input}             //div[@role="dialog"]/div/div/span/div/label[text()="Termin nimi"]/../../div/input
${new term langueage input}        //div[@role="dialog"]/div/div/div/div/div/label[text()="Kieli"]/../../../div/div/div/input
${new term term status input}      //div[@role="dialog"]//div/label[text()="Termin tila"]/../../div/span
${new term term extra info input}  //div[@role="dialog"]//div/label[text()="Termin lisätieto"]/../../div/textarea
${new term term domain input}      //div[@role="dialog"]//div/label[text()="Käyttöala"]/../../div/textarea
${new term term equalency input}   //div[@role="dialog"]//label[text()="Termin vastaavuus"]/../span/div
${new term term source button}     //div[@role="dialog"]//div[text()="Lähteet"]/../div/button
${new term term source input}      (//div[@role="dialog"]//div[text()="Lähteet"]/../div/ul/li/div/div/textarea)[last()]
${new term term Change note input}      //div[@role="dialog"]//label[text()="Muutoshistoria"]/../../div/textarea
${new term term etymology input}      //div[@role="dialog"]//label[contains(text(), "Käytön historiatieto")]/../../div/textarea
${new term term admin note button}      //div[@role="dialog"]//div[text()="Ylläpitäjän muistiinpano"]/../div/button
${new term term admin note textarea}      (//div[@role="dialog"]//div[text()="Ylläpitäjän muistiinpano"]/../div/ul/li/div/div/textarea)[last()]
${new term term style input}      //div[@role="dialog"]//label[text()="Termin tyyli"]/../../div/input

${new term term family input}    //div[@role="dialog"]//label[text()="Termin suku"]/../../div/div/input
${new term term conjugation input}    //div[@role="dialog"]//label[text()="Valitse termin luku"]/../../div/div/input
${new term term word class input}    //div[@role="dialog"]//label[text()="Termin sanaluokka"]/../../div/div/input

${Update recommended term button}                      //span[contains(text(), "- Luonnos")]
${Change recommended term homograph}                   //label[text()="Termi on homonyymi"]
${Change recommended term extra info}                  //textarea[@placeholder="Kirjoita termin lisätieto"]
${Change recommended term scope}                       //textarea[@placeholder="Kirjoita alan nimi"]
${Change recommended term sources}                     //textarea[@placeholder="Kirjoita kuvaus"]
${Change recommended term Change note}                 //textarea[contains(@id, "change-note-input")] 
${Change recommended term etymology}                   //textarea[@placeholder="Kirjoita termin käytön historia"]
${Change recommended term Admin note button}           //div[@id="recommended-terms-block"]/*/div/div/div/div/div[text()="Ylläpitäjän muistiinpano"]/../div/button
${Change recommended term Admin note input}            (//div[@id="recommended-terms-block"]/*/div/div/div/div/div[text()="Ylläpitäjän muistiinpano"]/../div/ul/li/div/div/textarea)[last()]
${Change recommended term Admin note delete button}    (//div[@id="recommended-terms-block"]/*/div/div/div/div/div[text()="Ylläpitäjän muistiinpano"]/../div/ul/li/div/button)[last()]
${Change recommended term Term style}                  //div/label[text()="Termin tyyli"]/../../div/input

${Change recommended term Term family}        //input[@placeholder="Valitse termin suku"]
${Change recommended term Term conjugation}   //input[@placeholder="Valitse termin luku"]
${Change recommended term Term word class}    //input[@placeholder="Valitse termin sanaluokka"]

${Copy terminology invalid prefix error}      Etuliitteen sallitut merkit ovat a-z, 0-9, alaviiva ja väliviiva
${Copy terminology empty prefix error}        Tunnusta ei ole määritelty
${Copy terminology in use prefix error}       Tunnus on käytössä

${Term language finnish}                suomi FI
${Term type synonym}                    Synonyymi
${Term type recommended}                Suositettava termi
${Term state draft}                     Luonnos
${Term style spoken}                    puhekieli
${Term family masculine}                maskuliini
${Term conjugation single}              yksikkö
${Term word class adjective}            adjektiivi

${Example missing error}                Vähintään yhdeltä käyttöesimerkiltä puuttuu selite
${Note missing error}                   Vähintään yhdeltä huomautukselta puuttuu selite
${Admin note missing error}             Vähintään yhdeltä ylläpitäjän muistiipanolta puuttuu selite
${Source missing error}                 Vähintään yhdeltä lähteeltä puuttuu arvo
${Url missing error}                    Vähintään yhdeltä käsitekaaviolta puuttuu nimi ja/tai verkko-osoite
${Status missing error}                 Käsitteen tilaa ei ole määritetty

${New term missing name error}          Termin nimeä ei ole määritetty
${New term missing type error}          Termin tyyppiä ei ole määritetty
${New term missing language error}      Termin kieltä ei ole määritetty

${Modify concept button}                //button[@id="edit-concept-button"]

*** Keywords ***
Verify page is concept page
    Wait until page contains element  ${Concept title}

Select term ${term}
    click element with wait  //button[text()="${term}"] 

Close term dialog
    Click element with wait  ${Term info close}

Verify concept is part of collection
    Wait until page contains    Kuuluu käsitekokoelmaan

Verify collection contains concepts
    Wait until element is visible    //*[text()="Valikoimaan kuuluvat käsitteet"]

Verify collection does not contain concepts
    Wait until element is not visible    //*[text()="Valikoimaan kuuluvat käsitteet"]

Verify concept error message ${error}
    Wait until page contains element  //li[text()="${error}"]

Verify term error message ${error}
    Wait until page contains element  //li[text()="${error}"]

Open create concept dialog
    Click element with wait             ${Create concept button} 
    Verify create concept dialog is open

Verify concept creation name is not empty error
    Wait until page contains element  ${concept name is empty error}

Verify page does not contain create concept button
    Open terminology information
    Wait until page does not contain element    ${Create concept button} 

Open bring concept dialog
    Click element with wait  ${bring concepts button on search}

Upload bring concepts File
    ${bring concepts file select button}

Cancel bring concept dialog
    Click element with wait  ${Bring concept dialog cancel button}

Verify page does not contain bring concepts button
    Wait until page does not contain element    ${bring concepts button on search}
    Open terminology information
    Wait until page does not contain element    ${bring concepts button on expander}

Open copy terminology dialog
    Open terminology information
    Click element with wait             ${Copy terminology button}

Cancel copy terminology dialog
    Click element with wait             ${Copy cancel terminology button}

Create copy terminology dialog
    [Arguments]     ${Valid}=${True}
    Sleep  1
    Click element with wait                     ${Copy create terminology button}
    IF  '${Valid}' == '${True}'
        Wait Until Page does not Contain element    ${Copy create terminology button}  timeout=60
    END

Input manual prefix ${prefix} on copy dialog
    Click element with wait    ${Copy manual prefix select}                     
    Input text with Wait       ${Copy manual prefix input}    ${prefix}       

Verify page does not contain copy terminology button
    Open terminology information
    Wait until page does not contain element    ${Copy terminology button}

Give new concept defition as ${concept definition}
    Input text with wait  ${concept name input}  ${concept definition}

Verify create concept dialog is open
    Wait until page contains element  ${Create concept title}

Verify create concept dialog is not open
    Wait until page does not contain element  ${Create concept title}

Input concept name as ${concept name}
    Input text with wait  ${concept name input}  ${concept name} 

Continue concept creation
    Click element with wait  ${concept create continue button}

Cancel concept creation
    Click element with wait  ${concept cancel button}
    Verify new concept page is not open

Save concept creation
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${concept save button}
    IF  '${Valid}' == '${True}'
        Verify new concept page is not open
    END
    IF  '${Valid}' == '${False}'
        Verify new concept page is open
    END

Verify error message ${message}
    Wait until page contains element  //li[contains(text(), "${message}")]

Search concept ${concept name} from add dialog
    Input text with wait  ${Search concept input from create dialog}  ${concept name}

Start concept creation for ${name}
    Open create concept dialog    

    Input concept name as ${name}
    Continue concept creation

Verify new concept page is open
    Wait Until Location Contains  new-concept

Verify new concept page is not open
    Wait Until Location Does Not Contain  new-concept  timeout=90

Add concept ${concept_name} as relation
    Input text with wait     ${Concept relation search input}  ${concept_name}
    Click element with wait  ${Concept relation search button}
    Click element with wait  //b[text()="${concept_name}"]
    Click element with wait  ${Close and add concept relation button} 

Create concept 
    [Arguments]     ${name}
    ...             ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${Sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    ...             ${valid}=${True}
    Start concept creation for ${name}

    Add information to concept
    ...             ${definition}
    ...             ${example}
    ...             ${subject}
    ...             ${Note}
    ...             ${Sources}
    ...             ${change history}
    ...             ${etymology}
    ...             ${concept class}
    ...             ${broader concept}
    ...             ${narrower concept}
    ...             ${Related concept}
    ...             ${Is part of concept}
    ...             ${Has part concept}
    ...             ${Related concept in other vocabulary}
    ...             ${Match in other vocabulary}
    
    Save concept creation

Add information to concept
    [Arguments]     ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${usage}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${diagram}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${status}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    ...             ${Almost match in other vocabulary}=${NONE}
    IF  '${status}' != '${NONE}'
        Input text with wait  ${concept definition input}  ${definition}
    END
    IF  '${definition}' != '${NONE}'
        Input text with wait  ${concept definition input}  ${definition}
    END
    IF  '${example}' != '${NONE}'
        IF  '${example}' == 'CLEAR'
            Click element with wait   ${concept new example delete button}
        ELSE
            Click element with wait   ${concept new example button}       
            Input text with wait      ${concept new example input}  ${example}
        END
    END
    IF  '${usage}' != '${NONE}'
        IF  '${usage}' == 'CLEAR'
            Click element with wait   ${concept new usage example delete button}  
        ELSE
            Click element with wait   ${concept new usage example button}       
            Input text with wait      ${concept new usage example input}  ${usage}
        END
    END
    IF  '${subject}' != '${NONE}'
        IF  '${subject}' == 'CLEAR'
            Click element with wait    ${concept subject input}
            Press Keys    None         CTRL+a+BACKSPACE
        ELSE
            Input text with wait  ${concept subject input}  ${subject}
        END
    END
    IF  '${change history}' != '${NONE}'
        Click element with wait   ${concept organization box}  
        IF  '${change history}' == 'CLEAR'
            Click element with wait    ${concept organization history change input}
            Press Keys    None         CTRL+a+BACKSPACE
        ELSE
            Input text with wait      ${concept organization history change input}  ${change history}
        END
        Click element with wait   ${concept organization box}  
    END
    IF  '${etymology}' != '${NONE}'
        Click element with wait   ${concept organization box}  
        IF  '${etymology}' == 'CLEAR'
            Click element with wait    ${concept organization etymology input}
            Press Keys    None         CTRL+a+BACKSPACE
        ELSE
            Input text with wait      ${concept organization etymology input}  ${etymology}
        END
        Click element with wait   ${concept organization box}  
    END
    IF  '${Note}' != '${NONE}'
        IF  '${Note}' == 'CLEAR'
            Click element with wait   ${concept organization box} 
            Click element with wait   ${concept organization organization note delete button}
            Click element with wait   ${concept organization box}  
        ELSE
            Click element with wait   ${concept organization box} 
            Click element with wait   ${concept organization organization add note button}
            Input text with wait      ${concept organization organization note input}    ${Note}
            Click element with wait   ${concept organization box}  
        END
    END
    IF  '${sources}' != '${NONE}'
        Click element with wait  ${concept diagrams and sources box}
        IF  '${sources}' == 'CLEAR'
            Click element with wait  ${concept sources delete source button}
        ELSE
            Click element with wait  ${concept sources add source button}
            Input text with wait     ${concept sources add source input}    ${sources}
        END
        Click element with wait  ${concept diagrams and sources box}
    END
    IF  '${diagram}' != '${NONE}'
        Click element with wait  ${concept diagrams and sources box}
        IF  '${sources}' == 'CLEAR'
            Click element with wait  ${concept sources delete diagram button}
        ELSE
            #Click element with wait  ${concept sources add diagram button}
            #Input text with wait     ${concept sources add diagram input}    ${sources}
            Press Keys    None      TAB
            Press Keys    None      ENTER
        END
        Click element with wait  ${concept diagrams and sources box}
    END
    IF  '${concept class}' != '${NONE}'
        Click element with wait  ${concept terms other information box}
        IF  '${concept class}' == 'CLEAR'
            Click element with wait    ${concept organization concept class input}
            Press Keys    None         CTRL+a+BACKSPACE
        ELSE
            Input text with wait     ${concept organization concept class input}    ${concept class}
        END
        Click element with wait  ${concept terms other information box}
    END
    
    IF  '${broader concept}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational broader button}
        Add concept ${broader concept} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${narrower concept}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational narrower button}
        Add concept ${narrower concept} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${Related concept}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational related button}
        Add concept ${Related concept} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${Is part of concept}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational is part of button}
        Add concept ${Is part of concept} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${Has part concept}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational has part of button}
        Add concept ${Has part concept} as relation
        Click element with wait  ${concept relational information box}
    END
    
    IF  '${Related concept in other vocabulary}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational related in other button}
        Add concept ${Related concept in other vocabulary} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${Match in other vocabulary}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational matching in other button}
        Add concept ${Match in other vocabulary} as relation
        Click element with wait  ${concept relational information box}
    END
    IF  '${Almost match in other vocabulary}' != '${NONE}'
        Click element with wait  ${concept relational information box}
        Click element with wait  ${concept relational almost matching in other button}
        Add concept ${Almost match in other vocabulary} as relation
        Click element with wait  ${concept relational information box}
    END
    
Add new term to new concept
    [Arguments]     ${name}=${NONE}
    ...             ${homograph}=${NONE}
    ...             ${Term type}=${NONE}
    ...             ${Term language}=${NONE}
    ...             ${Term status}=${NONE}
    ...             ${extra info}=${NONE}
    ...             ${scope}=${NONE}
    ...             ${term equivalency}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${Change note}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${Admin note}=${NONE}
    ...             ${Term style}=${NONE}
    ...             ${Term family}=${NONE}
    ...             ${Term conjugation}=${NONE}
    ...             ${Term word class}=${NONE}
    
    Click element with wait  ${new term add term button}

    Input text with wait    ${new term name input}    ${name}

    IF  '${homograph}' != '${NONE}'
        Click element with wait  ${new term homograph checkbox}
        Input text with wait     ${new term homograph input}   ${homograph} 
    END

    IF  '${Term language}' != '${NONE}'
        Click element with wait  ${new term langueage input}
        Click element with wait  //li[text()="${Term language}"]
    END
    IF  '${Term type}' != '${NONE}'
        Click element with wait  //label[text()="${Term type}"]
    END
    IF  '${Term status}' != '${NONE}'
        #Press Keys               NONE        TAB+TAB+TAB
        #Click element with wait  ${new term term status input}
        #Click element with wait  //li[text()="${Term status}"]
        No operation
    END

    IF  '${extra info}' != '${NONE}'
        input text with wait  ${new term term extra info input}  ${extra info}
    END
    IF  '${scope}' != '${NONE}'
        input text with wait  ${new term term domain input}    ${scope}
    END
    IF  '${term equivalency}' != '${NONE}'
        Click element with wait  ${new term term equalency input}
        Sleep  0.5
        Press Keys    None       ARROW_DOWN
        Sleep  0.5
        Press Keys    None       ENTER
    END
    IF  '${sources}' != '${NONE}'
        Press Keys               NONE        TAB+TAB+TAB
        Click element with wait  ${new term term source button}
        Input text with wait     ${new term term source input}  ${sources}
    END
    IF  '${Change note}' != '${NONE}'
        Input text with wait     ${new term term Change note input}    ${Change note}
    END
    IF  '${etymology}' != '${NONE}'
        Input text with wait  ${new term term etymology input}  ${etymology}
    END
    IF  '${Admin note}' != '${NONE}'
        Click element with wait  ${new term term admin note button}
        Input text with wait    ${new term term admin note textarea}    ${Admin note}
    END

    IF  '${Term style}' != '${NONE}'
        Input text with wait  ${new term term style input}  ${Term style}
    END
    IF  '${Term family}' != '${NONE}'
        Click element with wait  ${new term term family input}
        Click element with wait  //li[text()="${Term family}"]
    END
    IF  '${Term conjugation}' != '${NONE}'
        Click element with wait  ${new term term conjugation input}
        Click element with wait  //li[text()="${Term conjugation}"]
    END
    IF  '${Term word class}' != '${NONE}'
        Press Keys               NONE        TAB+TAB+TAB
        Click element with wait  ${new term term word class input}
        Click element with wait  //li[text()="${Term word class}"]
    END
    
    Click element with wait                   ${new term accept button}
    Wait until page does not contain element  ${new term accept button}

Delete term
    Click element with wait  (//div/h3[text()="Muut termit"]/../../div/div)[last()]
    Click element with wait  ${Delete term button}

Modify to prefered term information
    [Arguments]     ${name}=${NONE}
    ...             ${homograph}=${NONE}
    ...             ${Term type}=${NONE}
    ...             ${extra info}=${NONE}
    ...             ${scope}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${Change note}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${Admin note}=${NONE}
    ...             ${Term style}=${NONE}
    ...             ${Term family}=${NONE}
    ...             ${Term conjugation}=${NONE}
    ...             ${Term word class}=${NONE}
    
    Click element with wait  ${Update recommended term button}
    IF  '${name}' != '${NONE}'
        Press Keys    None      TAB
        Press Keys    None      ${name}
    END
    IF  '${homograph}' != '${NONE}'
        Click element with wait  ${Change recommended term homograph}
        IF  '${homograph}' != 'CLEAR'
            Press Keys    None       TAB
            Press Keys    None       ${homograph}
        END
    END
    IF  '${Term type}' != '${NONE}'
        Click element with wait  ${Change term type button}
        Click element with wait  ${Change term type dropdown}
        Click element with wait  //li[text()="${Term type}"]
        Click element with wait  ${Change accept button}
    END
    IF  '${extra info}' != '${NONE}'
        Input text with wait  ${Change recommended term extra info}  ${extra info}
    END
    IF  '${scope}' != '${NONE}'
        Input text with wait  ${Change recommended term scope}  ${scope}
    END
    IF  '${sources}' != '${NONE}'
        Input text with wait  ${Change recommended term sources}  ${sources}
    END
    IF  '${Change note}' != '${NONE}'
        Input text with wait  ${Change recommended term Change note}  ${Change note}
    END
    IF  '${etymology}' != '${NONE}'
        Input text with wait  ${Change recommended term etymology}  ${etymology}
    END
    IF  '${Admin note}' != '${NONE}'
        IF  '${Admin note}' == 'CLEAR'
            Click element with wait    ${Change recommended term Admin note delete button}
        ELSE
            Click element with wait    ${Change recommended term Admin note button}
            Input text with wait       ${Change recommended term Admin note input}  ${Admin note}
        END
    END
    IF  '${Term style}' != '${NONE}'
        Input text with wait  ${Change recommended term Term style}  ${Term style}
    END
    IF  '${Term family}' != '${NONE}'
        IF  '${Term family}' == 'CLEAR'
            Click element with wait  (//label[text()="Termin suku"]/../../div/div/div/button)[1]
        ELSE
            Click element with wait  ${Change recommended term Term family}
            Click element with wait  //li[text()="${Term family}"]
        END
    END
    IF  '${Term conjugation}' != '${NONE}'
        IF  '${Term conjugation}' == 'CLEAR'
            Click element with wait  (//label[text()="Termin luku"]/../../div/div/div/button)[1]
        ELSE
            Click element with wait  ${Change recommended term Term conjugation}
            Click element with wait  //li[text()="${Term conjugation}"]
        END
    END
    IF  '${Term word class}' != '${NONE}'
        IF  '${Term word class}' == 'CLEAR'
            #Click element with wait  (//label[text()="Termin sanaluokka"]/../../div/div/div/button)[1]
            No Operation
        ELSE
            Click element with wait  ${Change recommended term Term word class}
            Click element with wait  //li[text()="${Term word class}"]
        END
    END
    
    Click element with wait  ${Update recommended term button}

Verify concept page contains all information
    [Arguments]     ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${usage}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    ...             ${Almost match in other vocabulary}=${NONE}
    IF  '${definition}' != '${NONE}'
        Wait until page contains element  //li[@lang="fi"]/span[text()="${definition}"]
    END
    IF  '${example}' != '${NONE}'
        Wait until page contains element  //li[@lang="fi"]/span[text()="${example}"]
    END
    IF  '${usage}' != '${NONE}'
        Wait until page contains element  //li[@lang="fi"]/span[text()="${usage}"]
    END
    IF  '${subject}' != '${NONE}'
        Wait until page contains element  //div[text()="${subject}"]/div[text()="Aihealue"]
    END
    IF  '${change history}' != '${NONE}'
        Wait until page contains element  //div[text()="${change history}"]/div[text()="Muutoshistoriatiedot"]
    END
    IF  '${etymology}' != '${NONE}'
        Wait until page contains element  //div[text()="${etymology}"]/div[text()="Käytön historiatieto (etymologia)"]
    END
    IF  '${Note}' != '${NONE}'
        Wait until page contains element  //div/ul/li[text()="${Note}"]/../../div[text()="Ylläpitäjän muistiinpano"]
    END
    IF  '${sources}' != '${NONE}'
        Wait until page contains element  //div/ul/li[text()="${sources}"]/../../div[text()="Lähteet"]
    END
    IF  '${concept class}' != '${NONE}'
        Wait until page contains element  //div[text()="${concept class}"]/div[text()="Käsitteen luokka"]
    END
    IF  '${broader concept}' != '${NONE}'
        Wait until page contains element  //a[text()="${broader concept}"]
    END
    IF  '${narrower concept}' != '${NONE}'
        Wait until page contains element  //a[text()="${narrower concept}"]
    END
    IF  '${Related concept}' != '${NONE}'
        Wait until page contains element  //a[text()="${Related concept}"]
    END
    IF  '${Is part of concept}' != '${NONE}'
        Wait until page contains element  //a[text()="${Is part of concept}"]
    END
    IF  '${Has part concept}' != '${NONE}'
        Wait until page contains element  //a[text()="${Has part concept}"]
    END
    IF  '${Related concept in other vocabulary}' != '${NONE}'
        Wait until page contains element  //a[text()="${Related concept in other vocabulary}"]
    END
    IF  '${Match in other vocabulary}' != '${NONE}'
        Wait until page contains element  //a[text()="${Match in other vocabulary}"]
    END
    IF  '${Almost match in other vocabulary}' != '${NONE}'
        Wait until page contains element  //a[text()="${Almost match in other vocabulary}"]
    END

Verify concept page does not contain all information
    [Arguments]     ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${usage}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    ...             ${Almost match in other vocabulary}=${NONE}

    IF  '${definition}' != '${NONE}'
        Wait until page does not contain element  //div/h2[text()="Määritelmä"]/../../../div/ul/li[@lang="fi"]/span[text()="${definition}"]
    END
    IF  '${example}' != '${NONE}'
        Wait until page does not contain element  //div/h2[text()="Huomautus"]/../../../div/ul/li[@lang="fi"]/span[text()="${example}"]
    END
    IF  '${usage}' != '${NONE}'
        Wait until page does not contain element  //div/h2[text()="Käyttöesimerkki"]/../../../div/ul/li[@lang="fi"]/span[text()="${usage}"]
    END
    IF  '${subject}' != '${NONE}'
        Wait until page does not contain element  //div[text()="${subject}"]/div[text()="Aihealue"]
    END
    IF  '${change history}' != '${NONE}'
        Wait until page does not contain element  //div[text()="${change history}"]/div[text()="Muutoshistoriatiedot"]
    END
    IF  '${etymology}' != '${NONE}'
        Wait until page does not contain element  //div[text()="${etymology}"]/div[text()="Käytön historiatieto (etymologia)"]
    END
    IF  '${Note}' != '${NONE}'
        Wait until page does not contain element  //div/ul/li[text()="${Note}"]/../../div[text()="Ylläpitäjän muistiinpano"]
    END
    IF  '${sources}' != '${NONE}'
        Wait until page does not contain element  //div/ul/li[text()="${sources}"]/../../div[text()="Lähteet"]
    END
    IF  '${concept class}' != '${NONE}'
        Wait until page does not contain element  //div[text()="${concept class}"]/div[text()="Käsitteen luokka"]
    END
    IF  '${broader concept}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${broader concept}"]
    END
    IF  '${narrower concept}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${narrower concept}"]
    END
    IF  '${Related concept}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Related concept}"]
    END
    IF  '${Is part of concept}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Is part of concept}"]
    END
    IF  '${Has part concept}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Has part concept}"]
    END
    IF  '${Related concept in other vocabulary}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Related concept in other vocabulary}"]
    END
    IF  '${Match in other vocabulary}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Match in other vocabulary}"]
    END
    IF  '${Almost match in other vocabulary}' != '${NONE}'
        Wait until page does not contain element  //a[text()="${Almost match in other vocabulary}"]
    END

Verify term page contains all information
    [Arguments]     ${name}=${NONE}
    ...             ${homograph}=${NONE}
    ...             ${Term type}=${NONE}
    ...             ${Term language}=${NONE}
    ...             ${Term status}=${NONE}
    ...             ${extra info}=${NONE}
    ...             ${scope}=${NONE}
    ...             ${term equivalency}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${Change note}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${Admin note}=${NONE}
    ...             ${Term style}=${NONE}
    ...             ${Term family}=${NONE}
    ...             ${Term conjugation}=${NONE}
    ...             ${Term word class}=${NONE}
    Click element with wait           //span/span/button[text()="${name}"]
    Wait until page contains element  //h2[text()="${name}"]

    IF  '${homograph}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Homonyymin järjestysnumero"]/../span[text()="${homograph}"]
    END
    IF  '${Term type}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Tyyppi"]/../span[text()="${Term type}"]
    END
    IF  '${Term language}' != '${NONE}'
        Wait until page contains  ${Term language}
    END
    IF  '${Term status}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Tila"]/../span[text()="${Term status}"]
    END
    IF  '${extra info}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Termin lisätieto"]/../span[text()="${extra info}"]
    END
    IF  '${scope}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Käyttöala"]/../span[text()="${scope}"]
    END
    IF  '${term equivalency}' != '${NONE}'
        Wait until page contains element  //div[@role="dialog"]/*/h3[text()="Käyttöala"]/../span[text()="${scope}"]
        Wait until page contains  ${term equivalency}
    END
    #IF  '${sources}' != '${NONE}'
    #    Wait until page contains  ${sources}
    #END
    IF  '${Change note}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${Change note}"]
        Click element with wait   ${Organization info in term information panel}
    END
    IF  '${etymology}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${etymology}"]
        Click element with wait  ${Organization info in term information panel}
    END
    IF  '${Admin note}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${etymology}"]
        Click element with wait   ${Organization info in term information panel}
    END
    IF  '${Term style}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${Term style}"]
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term family}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${Term family}"]
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term conjugation}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${Term conjugation}"]
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term word class}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains element   //div[@role="dialog"]/*//span[text()="${Term word class}"]
        Click element with wait   ${Language extra info in term information panel}
    END
    Click element with wait  ${Term information close button}

Verify term page does not contain all information
    [Arguments]     ${name}=${NONE}
    ...             ${homograph}=${NONE}
    ...             ${Term type}=${NONE}
    ...             ${Term language}=${NONE}
    ...             ${Term status}=${NONE}
    ...             ${extra info}=${NONE}
    ...             ${scope}=${NONE}
    ...             ${term equivalency}=${NONE}
    ...             ${sources}=${NONE}
    ...             ${Change note}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${Admin note}=${NONE}
    ...             ${Term style}=${NONE}
    ...             ${Term family}=${NONE}
    ...             ${Term conjugation}=${NONE}
    ...             ${Term word class}=${NONE}
    Click element with wait           //span/span/button[text()="${name}"]
    Wait until page contains element  //h2[text()="${name}"] | //h2/span[text()="${name}"]

    IF  '${homograph}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Homonyymin järjestysnumero"]/../span[text()="${homograph}"]
    END
    IF  '${Term type}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Tyyppi"]/../span[text()="${Term type}"]
    END
    IF  '${Term language}' != '${NONE}'
        Wait until page contains  ${Term language}
    END
    IF  '${Term status}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Tila"]/../span[text()="${Term status}"]
    END
    IF  '${extra info}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Termin lisätieto"]/../span[text()="${extra info}"]
    END
    IF  '${scope}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Käyttöala"]/../span[text()="${scope}"]
    END
    IF  '${term equivalency}' != '${NONE}'
        Wait until page does not contain element  //div[@role="dialog"]/*/h3[text()="Käyttöala"]/../span[text()="${scope}"]
    END
    #IF  '${sources}' != '${NONE}'
    #    Wait until page contains  ${sources}
    #END
    ${information panel exists}=  Run Keyword And Return Status    page contains element    ${Organization info in term information panel}
    IF  '${Change note}' != '${NONE}'
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
        Wait until page does not contain element         //div[@role="dialog"]/*//span[text()="${Change note}"]
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
    END
    IF  '${etymology}' != '${NONE}'
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
        Wait until page does not contain element         //div[@role="dialog"]/*//span[text()="${etymology}"]
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
    END
    IF  '${Admin note}' != '${NONE}'
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
        Wait until page does not contain element         //div[@role="dialog"]/*//span[text()="${Admin note}"]
        Run Keyword If    ${information panel exists}    Click element with wait   ${Organization info in term information panel}
    END
    ${language panel exists}=  Run Keyword And Return Status    page contains element    ${Language extra info in term information panel}
    IF  '${Term style}' != '${NONE}'
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
        Wait until page does not contain element   //div[@role="dialog"]/*//span[text()="${Term style}"]
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term family}' != '${NONE}'
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
        Wait until page does not contain element   //div[@role="dialog"]/*//span[text()="${Term family}"]
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term conjugation}' != '${NONE}'
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
        Wait until page does not contain element   //div[@role="dialog"]/*//span[text()="${Term conjugation}"]
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term word class}' != '${NONE}'
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
        Wait until page does not contain element   //div[@role="dialog"]/*//span[text()="${Term word class}"]
        Run Keyword If    ${language panel exists}    Click element with wait   ${Language extra info in term information panel}
    END
    Click element with wait  ${Term information close button}

Verify recommended term can't be changed when its only one
    wait until page contains element  ${Recommended term can't be changed error}

Try to change term type
    Click element with wait  ${Update recommended term button}
    Click element with wait  ${Change term type button}

Clear concept status input
    Click element with wait  ${Concept status label}
    Press Keys    None      TAB
    Press Keys    None      TAB
    Press Keys    None      ENTER

Modify concept
    Click element with wait    ${Modify concept button}

Cancel concept modify
    Click element with wait    ${Concept cancel button}
    Verify modify concept page is not open

Save concept modify
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${concept save button}
    IF  '${Valid}' == '${True}'
        Verify modify concept page is not open
    END
    IF  '${Valid}' == '${False}'
        Verify modify concept page is open
    END

Verify concept modify button is not shown
    Wait Until Page Does Not Contain Element    ${Modify concept button}

Verify modify concept page is open
    Wait Until Location Contains  edit

Verify modify concept page is not open
    Wait Until Location Does Not Contain  edit  timeout=90

Cancel term creation
    Click element with wait  ${term cancel creation cancel button}