*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${concept name input}                  //input[@placeholder="Kirjoita termin nimi"]  |  //input[@placeholder="Give term name"]
${concept definition input}            //textarea[@placeholder="Kirjoita määritelmä"]  |  //textarea[@placeholder="Enter a definition"]
${Collection name input}               //input[@placeholder="Kirjoita nimi"]  |  //input[@placeholder="Enter a name"]
${Collection definition input}         //textarea[@placeholder="Kirjoita kuvaus"]
${concept create continue button}  //button[text()="Jatka"]  |  //button[text()="Continue"]
${concept create cancel button}    //button[text()="Peruuta"]  |  //button[text()="Cancel"]
${concept create save button}    //button[text()="Tallenna"]  |  //button[text()="Save"]
${Collection create save button}    //button[text()="Tallenna"]  |  //button[text()="Save"]
${Create concept title}  //h2[text()="Lisää uusi käsite"]  |  //h2[text()="Add new concept"]
${Concept status label}    //label[text()="Käsitteen tila"]

${Add concept to collection button}            //button[text()="Lisää käsite käsitekokoelmaan"]  |  //button[text()="Add concept to collection"]
${Close and add concept to collection button}  //button[text()="Lisää käsite"]  |  //button[text()="Lisää käsitteet"]  |  //button[text()="Add concept"]  |  //button[text()="Add concepts"]

${Search concept input from create dialog}     //input[@placeholder="Kirjoita hakusana"]  |  //input[@placeholder="Enter a name"]
${Search button from create dialog}         //button[text()="Hae"]  |  //button[text()="Search"]

${Create concept button}            //div[@id="search-results"]/div/button[@id="new-concept-button"]
${Create collection button}         //button[text()="Lisää uusi käsitekokoelma"]  |  //button[text()="Add new collection"]
${Copy terminology button}          //button[text()="Luo uusi versio sanastosta"] 
${Copy cancel terminology button}          //button[text()="Peruuta"] 
${Copy create terminology button}          //button[text()="Tallenna"] 
${Copy manual prefix select}               //label[@for="prefix-input-manual"]
${Copy manual prefix input}                //input[@id="prefix-text-input"]

${concept subject input}            //input[@placeholder="Kirjoita aihealueen nimi"]  |  //input[@placeholder="Kirjoita aihealueen nimi"]

${concept new example button}       //button[text()="Lisää uusi huomautus"]  |  //button[text()="Lisää uusi huomautus"]
${concept new example input}        //textarea[@placeholder="Kirjoita huomautus"]  |  //textarea[@placeholder="Kirjoita huomautus"]
${concept new usage example button}       //button[text()="Lisää uusi käyttöesimerkki"]
${concept new usage example input}        //textarea[@placeholder="Kirjoita esimerkki"]

${concept diagrams and sources box}    //span[text()="Käsitekaaviot ja lähteet"] 
${concept diagrams decriptions input}  //textarea[@placeholder="Kirjoita kuvaus"]

${concept organization box}  //span[text()="Hallinnolliset tiedot"]
${concept organization history change input}  //textarea[@id="change-history-input"]
${concept organization etymology input}  //textarea[@placeholder="Kirjoita termin käytön historia"]
${concept organization add note button}  //button[text()="Lisää uusi muistiinpano"]
${concept organization add note input}  //textarea[@placeholder="Kirjoita muistiinpano tai kommentti"]

${concept terms other information box}  //span[text()="Käsitteen muut tiedot"]

${concept relational information box}  //span[text()="Suhdetiedot"]
${concept relational broader button}  //button[text()="Lisää uusi hierarkkinen yläkäsite"]
${concept relational narrower button}  //button[text()="Lisää uusi hierarkkinen alakäsite"]
${concept relational related button}  //button[text()="Lisää uusi liittyvä käsite"]
${concept relational is part of button}  //button[text()="Lisää uusi koostumussuhteinen yläkäsite"]
${concept relational has part of button}  //button[text()="Lisää uusi koostumussuhteinen alakäsite"]
${concept relational related in other button}  //button[text()="Lisää uusi liittyvä käsite"]
${concept relational matching in other button}  //button[text()="Lisää uusi vastaava käsite]

${concept name is empty error}      //*[text()="Suositettava termi tulee olla määritettynä vähintään yhdellä kielellä."]

${Close and add concept relation button}  //button[text()="Lisää käsite"]  |  //button[text()="Lisää käsitteet"]  |  //button[text()="Add concept"]  |  //button[text()="Add concepts"]

${Language extra info in term information panel}    //div/h4/button/span[text()="Kieliopilliset lisätiedot"]
${Organization info in term information panel}    //div/h4/button/span[text()="Hallinnolliset tiedot"]
${homograph in term information title}            //h3[text()="Homonyymin järjestysnumero"]
${Term extra info in term information title}     //h3[text()="Termin lisätieto"]
${Scope in term information title}               //h3[text()="Käyttöala"]
${Source in term information title}              //h3[text()="Lähde"]

${Term information close button}                //button[text()="Sulje"]

${Recommended term can't be changed error}    //div[text()="Suositettavan termin tyyppiä ei voi muuttaa, koska muita suositettavia termejä ei ole määritetty. Lisää uusi suositettava termi tai muuta olemassa oleva termi suositettavaksi termiksi."]

${Change term type button}      //button[text()="Muuta termin tyyppi"]
${Change term type dropdown}    //span[text()="Valitse tyyppi"]
${Change accept button}         //button[text()="Hyväksy"]

${Organization info in concepts information}    //div/span/button/span[text()="Hallinnolliset tiedot"]
${Concept other information in concepts information}    //div/span/button/span[text()="Käsitteen muut tiedot"]
${sources in concepts information title}    //div/span/button/span[text()="Käsitekaaviot ja lähteet"]
${Description in concepts information title}    //h2[text()="Määritelmä"]
${Example in concepts information title}            //h2[text()="Huomautus"]
${broader concept in concepts information title}    //h3[text()="Hierarkkinen yläkäsite"]
${narrower concept in concepts information title}    //h3[text()="Hierarkkinen alakäsite"]
${Related concept in concepts information title}    //h3[text()="Liittyvä käsite"]
${Is part of concept in concepts information title}    //h3[text()="Koostumussuhteinen yläkäsite"]
${Has part concept in concepts information title}    //h3[text()="Koostumussuhteinen alakäsite"]

${new term add term button}        //button[text()="Lisää uusi termi"]
${new term accept button}          //button[text()="Hyväksy"]
${new term cancel button}          //*[text()="Peruuta"]

${Update recommended term button}  //span[contains(text(), "- Luonnos")]
${Change recommended term homograph}    //label[text()="Termi on homonyymi"]
${Change recommended term extra info}    //textarea[@placeholder="Kirjoita termin lisätieto"]
${Change recommended term scope}    //textarea[@placeholder="Kirjoita alan nimi"]
${Change recommended term sources}    //textarea[@placeholder="Kirjoita kuvaus"]
${Change recommended term Change note}    //textarea[contains(@id, "change-note-input")] 
${Change recommended term etymology}    //textarea[@placeholder="Kirjoita termin käytön historia"]
${Change recommended term Admin note button}    //button[text()="Lisää uusi muistiinpano"]
${Change recommended term Admin note input}    //textarea[@placeholder="Kirjoita muistiinpano tai kommentti"]
${Change recommended term Term style}        //div/label[text()="Termin tyyli"]/../../div/input

${Change recommended term Term family}    //input[@placeholder="Valitse termin suku"]
${Change recommended term Term conjugation}    //input[@placeholder="Valitse termin luku"]
${Change recommended term Term word class}    //input[@placeholder="Valitse termin sanaluokka"]

${Cancel change term type button}            //*[text()="Peruuta"]

${Collection empty form error}          Tyhjän lomakkeen lähettäminen ei ole sallittua
${Collection empty name error}          Nimi tai kuvaus puuttuu kieleltä
${Collection empty definition error}    Nimi tai kuvaus puuttuu kieleltä

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

${New term missing name error}                 Termin nimeä ei ole määritetty
${New term missing type error}                 Termin tyyppiä ei ole määritetty
${SNew term missing language error}            Termin kieltä ei ole määritetty

*** Keywords ***
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
    Open terminology information page
    Wait until page does not contain element    ${Create concept button} 

Open create collection dialog
    Open terminology information page
    Click element with wait             ${Create collection button}

Open copy terminology dialog
    Open terminology information page
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

Verify page does not contain create collection button
    Open terminology information page
    Wait until page does not contain element    ${Create collection button}

Verify page does not contain copy terminology button
    Open terminology information page
    Wait until page does not contain element    ${Copy terminology button}

Give new concept defition as ${concept definition}
    Input text with wait  ${concept name input}  ${concept definition}

Name new collection as ${concept name}
    Input text with wait  ${collection name input}  ${concept name} 

Give new collection definition as ${definition}
    Input text with wait  ${Collection definition input}  ${definition} 

Verify create concept dialog is open
    Wait until page contains element  ${Create concept title}

Verify create concept dialog is not open
    Wait until page does not contain element  ${Create concept title}

Input concept name as ${concept name}
    Input text with wait  ${concept name input}  ${concept name} 

Continue concept creation
    Click element with wait  ${concept create continue button}

Cancel concept creation
    Click element with wait  ${concept create cancel button}

Save concept creation
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${concept create save button}
    IF  '${Valid}' == '${True}'
        Verify new concept page is not open
    END
    IF  '${Valid}' == '${False}'
        Verify new concept page is open
    END

Save collect creation
    [Arguments]     ${Valid}=${True}
    Click element with wait  ${Collection create save button} 
    IF  '${Valid}' == '${True}'
        Verify new collection page is not open
    END
    IF  '${Valid}' == '${False}'
        Run keyword and ignore error  Verify new concept page is not open
        Verify new collection page is open
    END

Verify error message ${message}
    Wait until page contains element  //li[contains(text(), "${message}")]

Remove concept ${concept name} from collection creation
    Click element with wait  //span[text()="${concept name}"]

Add concept ${concept name} to collection
    Click element with wait  ${Add concept to collection button}
    Search concept ${concept_name} from add dialog
    Click element with wait  ${Search button from create dialog}
    Click element with wait  //span/b[text()="${concept_name}"]
    Click element with wait  ${Close and add concept to collection button}

Search concept ${concept name} from add dialog
    Input text with wait  ${Search concept input from create dialog}  ${concept name}

Start concept creation for ${name}
    Open create concept dialog    

    Input concept name as ${name}
    Continue concept creation

Verify new concept page is open
    Wait Until Location Contains  new-concept

Verify new collection page is not open
    Wait Until Location Does Not Contain  new-collection

Verify new collection page is open
    Wait Until Location Contains  new-collection

Verify new concept page is not open
    Wait Until Location Does Not Contain  new-concept  timeout=90

Add concept ${concept_name} as relation
    Click element with wait  //label/span[text()="${concept_name}"]
    Click element with wait  ${Close and add concept relation button} 

Create concept 
    [Arguments]     ${name}
    ...             ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${diagram}=${NONE}
    ...             ${Sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${word class}=${NONE}
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
    ...             ${diagram}
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
    ...             ${diagram}=${NONE}
    ...             ${Sources}=${NONE}
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
    IF  '${status}' != '${NONE}'
        Input text with wait  ${concept definition input}  ${definition}
    END
    IF  '${definition}' != '${NONE}'
        Input text with wait  ${concept definition input}  ${definition}
    END
    IF  '${example}' != '${NONE}'
        Click element with wait  ${concept new example button}       
        Input text with wait  ${concept new example input}  ${example}
    END
    IF  '${usage}' != '${NONE}'
        Click element with wait  ${concept new usage example button}       
        Input text with wait  ${concept new usage example input}  ${usage}
    END
    IF  '${subject}' != '${NONE}'
        Input text with wait  ${concept subject input}  ${subject}
    END
    IF  '${change history}' != '${NONE}'
        Click element with wait   ${concept organization box}  
        Input text with wait      ${concept organization history change input}  ${change history}
        Click element with wait   ${concept organization box}  
    END
    IF  '${etymology}' != '${NONE}'
        Click element with wait   ${concept organization box}  
        Press Keys    None      TAB
        Press Keys    None      TAB
        Press Keys    None      ${etymology}
        Click element with wait   ${concept organization box}  
    END
    IF  '${Note}' != '${NONE}'
        Click element with wait   ${concept organization box}  
        Press Keys    None      TAB
        Press Keys    None      TAB
        Press Keys    None      TAB
        Press Keys    None      ENTER
        Sleep  0.2
        Press Keys    None      SHIFT+TAB
        Press Keys    None      SHIFT+TAB
        Sleep  0.2
        Press Keys    None      ${Note}
        Click element with wait   ${concept organization box}  
    END
    IF  '${Sources}' != '${NONE}'
        Click element with wait  ${concept diagrams and sources box}
        Press Keys    None      TAB
        Press Keys    None      TAB
        Press Keys    None      ENTER
        Press Keys    None      ${Sources}
        Click element with wait  ${concept diagrams and sources box}
    END
    IF  '${diagram}' != '${NONE}'
        Click element with wait  ${concept diagrams and sources box}
        Press Keys    None      TAB
        Press Keys    None      ENTER
        Click element with wait  ${concept diagrams and sources box}
    END
    IF  '${concept class}' != '${NONE}'
        Click element with wait  ${concept terms other information box}
        Press Keys    None      TAB
        Press Keys    None      ${concept class}
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
    
Add new term to new concept
    # TODO fix when id's are added, not working right with the locators
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

    Sleep  1
    Press Keys    None      TAB
    Sleep  0.5
    Press Keys    None      ${name}

    IF  '${homograph}' != '${NONE}'
        Sleep  0.5
        Press Keys    None      TAB
        Sleep  0.5
        Press Keys    None      SPACE
        Sleep  0.5
        Press Keys    None       TAB
        Press Keys    None       ${homograph}
    ELSE
        Sleep  0.5
        Press Keys    None       TAB
    END

    IF  '${Term language}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Click element with wait  //li[text()="${Term language}"]
    END
    IF  '${Term type}' != '${NONE}'
        Click element with wait  //label[text()="${Term type}"]
    END
    IF  '${Term status}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       SPACE
        Sleep  0.5
        Press Keys    None       ENTER
    ELSE
        Sleep  0.5
        Press Keys    None       TAB
    END

    IF  '${extra info}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${extra info}
    END
    IF  '${scope}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${scope}
    END
    IF  '${term equivalency}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       SPACE
        Sleep  0.5
        Press Keys    None       ARROW_DOWN
        Sleep  0.5
        Press Keys    None       ENTER
    ELSE
        Sleep  0.5
        Press Keys    None       TAB
    END
    IF  '${sources}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${sources}
    END
    IF  '${Change note}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${Change note}
    END
    IF  '${etymology}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${etymology}
    END
    IF  '${Admin note}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
    END

    IF  '${Term style}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Press Keys    None       ${Term style}
    END
    IF  '${Term family}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Sleep  0.5
        Click element with wait  //li[text()="${Term family}"]
    END
    IF  '${Term conjugation}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Press Keys    None       TAB
        Sleep  0.5
        Click element with wait  //li[text()="${Term conjugation}"]
    END
    IF  '${Term word class}' != '${NONE}'
        Sleep  0.5
        Press Keys    None       TAB
        Press Keys    None       TAB
        Sleep  0.5
        Click element with wait  //li[text()="${Term word class}"]
    END
    
    Click element with wait                   ${new term accept button}
    Wait until page does not contain element  ${new term accept button}

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
        Press Keys    None       TAB
        Press Keys    None       ${homograph}
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
        Click element with wait  ${Change recommended term Admin note button}
        Input text with wait  ${Change recommended term Admin note input}  ${Admin note}
    END
    IF  '${Term style}' != '${NONE}'
        Input text with wait  ${Change recommended term Term style}  ${Term style}
    END
    IF  '${Term family}' != '${NONE}'
        Click element with wait  ${Change recommended term Term family}
        Click element with wait  //li[text()="${Term family}"]
    END
    IF  '${Term conjugation}' != '${NONE}'
        Click element with wait  ${Change recommended term Term conjugation}
        Click element with wait  //li[text()="${Term conjugation}"]
    END
    IF  '${Term word class}' != '${NONE}'
        Click element with wait  ${Change recommended term Term word class}
        Click element with wait  //li[text()="${Term word class}"]
    END
    
    Click element with wait  ${Update recommended term button}

Verify concept page contains all information
    [Arguments]     ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${diagram}=${NONE}
    ...             ${Sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${word class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    IF  '${definition}' != '${NONE}'
        Wait until page contains  ${definition}
    END
    IF  '${example}' != '${NONE}'
        Wait until page contains  ${example}
    END
    IF  '${subject}' != '${NONE}'
        Wait until page contains  ${subject}
    END
    IF  '${change history}' != '${NONE}'
        Wait until page contains  ${change history}
    END
    IF  '${etymology}' != '${NONE}'
        Wait until page contains  ${etymology}
    END
    IF  '${Note}' != '${NONE}'
        Wait until page contains  ${Note}
    END
    IF  '${diagram}' != '${NONE}'
        Wait until page contains  ${diagram}
    END
    IF  '${Sources}' != '${NONE}'
        Wait until page contains  ${Sources}
    END
    IF  '${concept class}' != '${NONE}'
        Wait until page contains  ${concept class}
    END
    IF  '${word class}' != '${NONE}'
        Wait until page contains  ${word class}
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

Verify concept page does not contain all information
    [Arguments]     ${definition}=${NONE}
    ...             ${example}=${NONE}
    ...             ${subject}=${NONE}
    ...             ${Note}=${NONE}
    ...             ${diagram}=${NONE}
    ...             ${Sources}=${NONE}
    ...             ${change history}=${NONE}
    ...             ${etymology}=${NONE}
    ...             ${concept class}=${NONE}
    ...             ${word class}=${NONE}
    ...             ${broader concept}=${NONE}
    ...             ${narrower concept}=${NONE}
    ...             ${Related concept}=${NONE}
    ...             ${Is part of concept}=${NONE}
    ...             ${Has part concept}=${NONE}
    ...             ${Related concept in other vocabulary}=${NONE}
    ...             ${Match in other vocabulary}=${NONE}
    IF  '${definition}' != '${NONE}'
        Wait until page does not contain element  ${Description in concepts information title}
    END
    IF  '${example}' != '${NONE}'
        Wait until page does not contain element  ${example in concepts information title}
    END
    IF  '${Sources}' != '${NONE}'
        Wait until page does not contain element  ${sources in concepts information title}
    IF  '${change history}' != '${NONE}'
        Wait until page does not contain element  ${Organization info in concepts information}
    END
    IF  '${etymology}' != '${NONE}'
        Wait until page does not contain element  ${Organization info in concepts information}
    END
    END
    IF  '${concept class}' != '${NONE}'
        Wait until page does not contain element  ${Concept other information in concepts information}
    END
    IF  '${word class}' != '${NONE}'
        Wait until page does not contain element  ${Concept other information in concepts information}
    END
    IF  '${broader concept}' != '${NONE}'
        Wait until page does not contain element  ${broader concept in concepts information title}
    END
    IF  '${narrower concept}' != '${NONE}'
        Wait until page does not contain element  ${narrower concept in concepts information title}
    END
    IF  '${Related concept}' != '${NONE}'
        Wait until page does not contain element  ${Related concept in concepts information title}
    END
    IF  '${Is part of concept}' != '${NONE}'
        Wait until page does not contain element  ${Is part of concept in concepts information title}
    END
    IF  '${Has part concept}' != '${NONE}'
        Wait until page does not contain element  ${Has part concept in concepts information title}
    END
    IF  '${Related concept in other vocabulary}' != '${NONE}'
        No operation
    END
    IF  '${Match in other vocabulary}' != '${NONE}'
        No operation
    END
    IF  '${subject}' != '${NONE}'
        No operation
    END
    IF  '${Note}' != '${NONE}'
        No operation
    END
    IF  '${diagram}' != '${NONE}'
        No operation
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
        Wait until page contains  ${homograph}
    END
    IF  '${Term type}' != '${NONE}'
        Wait until page contains  ${Term type}
    END
    IF  '${Term language}' != '${NONE}'
        Wait until page contains  ${Term language}
    END
    IF  '${Term status}' != '${NONE}'
        Wait until page contains  ${Term status}
    END
    IF  '${extra info}' != '${NONE}'
        Wait until page contains  ${extra info}
    END
    IF  '${scope}' != '${NONE}'
        Wait until page contains  ${scope}
    END
    IF  '${term equivalency}' != '${NONE}'
        Wait until page contains  ${term equivalency}
    END
    IF  '${sources}' != '${NONE}'
        Wait until page contains  ${sources}
    END
    IF  '${Change note}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains  ${Change note}
        Click element with wait   ${Organization info in term information panel}
    END
    IF  '${etymology}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains  ${etymology}
        Click element with wait  ${Organization info in term information panel}
    END
    IF  '${Admin note}' != '${NONE}'
        Click element with wait   ${Organization info in term information panel}
        Wait until page contains  ${Admin note}
        Click element with wait   ${Organization info in term information panel}
    END
    IF  '${Term style}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains  ${Term style}
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term family}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains  ${Term family}
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term conjugation}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains  ${Term conjugation}
        Click element with wait   ${Language extra info in term information panel}
    END
    IF  '${Term word class}' != '${NONE}'
        Click element with wait   ${Language extra info in term information panel}
        Wait until page contains  ${Term word class}
        Click element with wait   ${Language extra info in term information panel}
    END
    Click element with wait  ${Term information close button}

Verify term page does not contain all information
    [Arguments]     ${name}=${NONE}
    ...             ${homograph}=${NONE}
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
        Wait until page does not contain element  ${homograph in term information title}
    END
    IF  '${extra info}' != '${NONE}'
        Wait until page does not contain element  ${Term extra info in term information title}
    END
    IF  '${scope}' != '${NONE}'
        Wait until page does not contain element  ${Scope in term information title}
    END
    IF  '${sources}' != '${NONE}'
        Wait until page does not contain element  ${Source in term information title}
    END
    IF  '${term equivalency}' != '${NONE}'
        No operation
    END
    IF  '${Change note}' != '${NONE}'
        Wait until page does not contain element  ${Organization info in term information panel}
    END
    IF  '${etymology}' != '${NONE}'
        Wait until page does not contain element  ${Organization info in term information panel}
    END
    IF  '${Admin note}' != '${NONE}'
        Wait until page does not contain element  ${Organization info in term information panel}
    END
    IF  '${Term style}' != '${NONE}'
        Wait until page does not contain element  ${Language extra info in term information panel}
    END
    IF  '${Term family}' != '${NONE}'
        Wait until page does not contain element  ${Language extra info in term information panel}
    END
    IF  '${Term conjugation}' != '${NONE}'
        Wait until page does not contain element  ${Language extra info in term information panel}
    END
    IF  '${Term word class}' != '${NONE}'
        Wait until page does not contain element  ${Language extra info in term information panel}
    END

    Click element with wait  ${Term information close button}

Verify recommended term can't be changed when its only one
    wait until page contains element  ${Recommended term can't be changed error}

Try to change term type
    Click element with wait  ${Update recommended term button}
    Click element with wait  ${Change term type button}

Cancel changing term type
    Press Keys    None      TAB
    Press Keys    None      TAB
    Press Keys    None      ENTER

Clear concept status input
    Click element with wait  ${Concept status label}
    Press Keys    None      TAB
    Press Keys    None      TAB
    Press Keys    None      ENTER


    
    
