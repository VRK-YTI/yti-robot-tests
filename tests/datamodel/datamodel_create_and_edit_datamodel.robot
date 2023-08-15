*** Settings ***
Force Tags           Datamodel  T2
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T2C1. Verify create datamodel permissions
    Open datamodel search page
    
    Verify page does not contain create datamodel button

    Login with no group
    Verify page does not contain create datamodel button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings    
    Open datamodel search page
    Login with Admin
    Verify page does contain create datamodel button
    Open create datamodel dialog
    Cancel creating datamodel

T2C2. Verify edit datamodel permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Open datamodel options select
    Verify page does not contain edit datamodel button

    Login with no group
    Open datamodel options select
    Verify page does not contain edit datamodel button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings        
    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open datamodel options select
    Verify page does contain edit datamodel button

    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    
T2C3. Verify create datamodel errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    
    Login with Admin
    Open create datamodel dialog
    Accept creating datamodel

    Verify create datamodel contains error Tietomallin kieliä ei ole määritelty
    Verify create datamodel contains error Tietomallin tunnusta ei ole määritelty
    Verify create datamodel contains error Tietomallin tietoaluetta ei ole määritelty
    Verify create datamodel contains error Tietomallin sisällöntuottajia ei ole määritelty

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Verify create datamodel does not contain error Tietomallin tunnusta ei ole määritelty

    Select create datamodel domain Asuminen
    Select create datamodel contributor Automaatiotestaus
    Verify create datamodel does not contain error tietoaluetta ei ole määritelty
    Verify create datamodel does not contain error sisällöntuottajia ei ole määritelty

    Remove all selected contributors
    Remove all selected domains
    Verify create datamodel contains error Tietomallin tietoaluetta ei ole määritelty
    Verify create datamodel contains error Tietomallin sisällöntuottajia ei ole määritelty

    Select create datamodel domain Asuminen
    Select create datamodel contributor Automaatiotestaus
    Verify create datamodel does not contain error tietoaluetta ei ole määritelty
    Verify create datamodel does not contain error sisällöntuottajia ei ole määritelty

    Select create datamodel language suomi FI
    Select create datamodel language ruotsi SV
    Select create datamodel language englanti EN
    Verify create datamodel does not contain error kieliä ei ole määritelty

    Accept creating datamodel
    Verify create datamodel contains error Tietomallin nimi puuttuu kieleltä suomi
    Verify create datamodel contains error Tietomallin nimi puuttuu kieleltä englanti
    Verify create datamodel contains error Tietomallin nimi puuttuu kieleltä ruotsi
    
    Input create datamodel contact asd
    Accept creating datamodel
    Verify create datamodel contains error Palautteen sähköposti ei ole oikeassa muodossa
    Input create datamodel contact ${ADMIN_EDUUNI_EMAIL}
    Accept creating datamodel
    Verify create datamodel does not contain error Palautteen sähköposti ei ole oikeassa muodossa

    Input create datamodel prefix *
    Verify create datamodel contains error Tietomallin yksilöivän tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
    Verify create datamodel invalid prefix error

    Input create datamodel prefix **
    Verify create datamodel does not contain error Tietomallin yksilöivän tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
    Accept creating datamodel
    Verify create datamodel invalid prefix error

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Accept creating datamodel
    Verify create datamodel invalid prefix error

    Input create datamodel language fi for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä suomi

    Input create datamodel language sv for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä ruotsi

    Input create datamodel language en for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä englanti

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Accept creating datamodel
    Verify datamodel is created with prefix ${DEFAULT DATAMODEL PREFIX}

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api

T2C4. Verify edit datamodel errors
    ${multiple_options_and_languages}=  set variable  1
    Create multiple options datamodel with api
    ...  number=${multiple_options_and_languages}
     
    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}
    Login with Admin
    
    Open datamodel options select
    Start editing datamodel

    Remove all selected domains from edit
    Remove all selected contributors from edit
    On edit input contact invalid contact
    
    Save editing
    
    Verify edit datamodel contains error Tietomallin tietoaluetta ei ole määritelty
    Verify edit datamodel contains error Tietomallin sisällöntuottajia ei ole määritelty
    Verify edit datamodel contains error Palautteen sähköposti ei ole oikeassa muodossa

    On edit input fi name ${EMPTY}
    On edit input en name ${EMPTY}
    On edit input sv name ${EMPTY}

    On edit input fi description ${EMPTY}
    On edit input en description ${EMPTY}
    On edit input sv description ${EMPTY}

    Save editing

    Verify edit datamodel contains error Tietomallin nimi puuttuu kieleltä suomi
    Verify edit datamodel contains error Tietomallin nimi puuttuu kieleltä ruotsi
    Verify edit datamodel contains error Tietomallin nimi puuttuu kieleltä englanti
    #Verify edit datamodel contains error Tietomallin kieliä ei ole määritelty
    
    On edit input fi name ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}
    On edit input en name ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}_SV
    On edit input sv name ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}_EN

    Select edit datamodel domain Asuminen
    Select edit datamodel contributor Automaatiotestaus
    On edit input contact ${EMPTY}

    Verify edit datamodel does not contain error Tietomallin Tietomallin nimi puuttuu kieleltä suomi
    Verify edit datamodel does not contain error Tietomallin Tietomallin nimi puuttuu kieleltä ruotsi
    Verify edit datamodel does not contain error Tietomallin Tietomallin nimi puuttuu kieleltä englanti
    Verify edit datamodel does not contain error Tietomallin kieliä ei ole määritelty
    Verify edit datamodel does not contain error Tietomallin tietoaluetta ei ole määritelty
    Verify edit datamodel does not contain error Tietomallin sisällöntuottajia ei ole määritelty
    Verify edit datamodel does not contain error Palautteen sähköposti ei ole oikeassa muodossa

    Save editing

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options_and_languages}


T2C5. Create valid datamodel with only nessecary information and edit
    Open datamodel search page
    
    Login with Admin
    Open create datamodel dialog

    Select create datamodel domain Asuminen
    Select create datamodel contributor Automaatiotestaus

    Select create datamodel language suomi FI
    Input create datamodel language fi for name ${DEFAULT DATAMODEL NAME} fi

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}

    Accept creating datamodel
    Verify datamodel is created with prefix ${DEFAULT DATAMODEL PREFIX}
    Take Screenshot

    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file

    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict}  yhteentoimivuus@dvv.fi
    Dictionary Should Contain Value    ${json_dict}  ${DEFAULT DATAMODEL PREFIX}
    Dictionary Should Contain Value    ${json_dict}  fi
    Dictionary Should Contain Value    ${json_dict["dcterms:contributor"]}  urn:uuid:${AUTOMATION_ORGANIZATION}
    Dictionary Should Contain Value    ${json_dict["dcterms:isPartOf"]}     http://urn.fi/URN:NBN:fi:au:ptvl:v1001
    Dictionary Should Contain Value    ${json_dict["rdfs:label"]}           ${DEFAULT DATAMODEL NAME} fi
    Dictionary Should not Contain Key  ${json_dict}  rdfs:comment
    Cancel show datamodel file dialog

    Open datamodel options select
    Start editing datamodel

    On edit remove FI
    On edit select create datamodel language englanti EN
    On edit input en name ${DEFAULT DATAMODEL NAME}_EN
    On edit input contact ${ADMIN_EDUUNI_EMAIL}

    Select edit datamodel contributor Automaatiotestaus
    Select edit datamodel contributor Testiorganisaatio
    
    Remove all selected domains from edit
    Select edit datamodel domain Demokratia

    Save editing

    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file

    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict}  ${ADMIN_EDUUNI_EMAIL}
    Dictionary Should Contain Value    ${json_dict}  ${DEFAULT DATAMODEL PREFIX}
    Dictionary Should Contain Value    ${json_dict}  en
    Dictionary Should Contain Value    ${json_dict["dcterms:contributor"]}  urn:uuid:${TESTING_ORGANIZATION}
    Dictionary Should Contain Value    ${json_dict["dcterms:isPartOf"]}     http://urn.fi/URN:NBN:fi:au:ptvl:v1090
    Dictionary Should Contain Value    ${json_dict["rdfs:label"]}           ${DEFAULT DATAMODEL NAME}_EN
    Dictionary Should not Contain Key  ${json_dict}  rdfs:comment
    Cancel show datamodel file dialog

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}

T2C6. Create valid datamodel with all information and edit those information
    Open datamodel search page
    
    Login with Admin
    Open create datamodel dialog

    Select create datamodel core model type

    Select create datamodel domain Asuminen
    Select create datamodel domain Demokratia

    Select create datamodel contributor Automaatiotestaus
    Select create datamodel contributor Testiorganisaatio

    Select create datamodel language suomi FI
    Select create datamodel language ruotsi SV
    Select create datamodel language englanti EN

    Input create datamodel language fi for name ${DEFAULT DATAMODEL NAME} fi
    Input create datamodel language sv for name ${DEFAULT DATAMODEL NAME} sv
    Input create datamodel language en for name ${DEFAULT DATAMODEL NAME} en

    Input create datamodel language fi for description de fi
    Input create datamodel language sv for description de sv
    Input create datamodel language en for description de en

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Input create datamodel contact ${ADMIN_EDUUNI_EMAIL}

    Accept creating datamodel
    Verify datamodel is created with prefix ${DEFAULT DATAMODEL PREFIX}
    
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value  ${json_dict}  ${ADMIN_EDUUNI_EMAIL}
    Dictionary Should not Contain Value  ${json_dict}  yhteentoimivuus@dvv.fi
    Dictionary Should Contain Value  ${json_dict}  ${DEFAULT DATAMODEL PREFIX}

    List Should Contain Value  ${json_dict["dcterms:language"]}  fi
    List Should Contain Value  ${json_dict["dcterms:language"]}  en
    List Should Contain Value  ${json_dict["dcterms:language"]}  sv
    
    Verify list contains key and value  ${json_dict["dcterms:contributor"]}   key=@id   value=urn:uuid:${TESTING_ORGANIZATION}
    Verify list contains key and value  ${json_dict["dcterms:contributor"]}   key=@id   value=urn:uuid:${AUTOMATION_ORGANIZATION}

    Verify list contains key and value  ${json_dict["dcterms:isPartOf"]}   key=@id  value=http://urn.fi/URN:NBN:fi:au:ptvl:v1001
    Verify list contains key and value  ${json_dict["dcterms:isPartOf"]}   key=@id  value=http://urn.fi/URN:NBN:fi:au:ptvl:v1090

    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de en
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de sv
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de fi    
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=en
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=sv
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=fi
    
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} en
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} fi
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} sv
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=en
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=sv
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=fi
    Cancel show datamodel file dialog
    
    Open datamodel options select
    Start editing datamodel

    On edit input fi name ${DEFAULT DATAMODEL NAME} 2 fi
    On edit input fi description de 2 fi

    On edit input en name ${DEFAULT DATAMODEL NAME} 2 en
    On edit input en description de 2 en

    On edit input sv name ${DEFAULT DATAMODEL NAME} 2 sv
    On edit input sv description de 2 sv

    On edit input contact ${EMPTY}

    Remove all selected domains from edit
    Remove all selected contributors from edit

    Select edit datamodel contributor Testiorganisaatio
    Select edit datamodel contributor Automaatiotestaus
    
    Select edit datamodel domain Järjestys
    Select edit datamodel domain Eläkkeet

    Save editing

    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value  ${json_dict}      yhteentoimivuus@dvv.fi
    Dictionary Should not Contain Value  ${json_dict}  ${ADMIN_EDUUNI_EMAIL}
    Dictionary Should Contain Value  ${json_dict}  ${DEFAULT DATAMODEL PREFIX}

    List Should Contain Value  ${json_dict["dcterms:language"]}  fi
    List Should Contain Value  ${json_dict["dcterms:language"]}  en
    List Should Contain Value  ${json_dict["dcterms:language"]}  sv
    
    Verify list contains key and value  ${json_dict["dcterms:contributor"]}   key=@id   value=urn:uuid:${TESTING_ORGANIZATION}
    Verify list contains key and value  ${json_dict["dcterms:contributor"]}   key=@id   value=urn:uuid:${AUTOMATION_ORGANIZATION}

    Verify list contains key and value  ${json_dict["dcterms:isPartOf"]}   key=@id  value=http://urn.fi/URN:NBN:fi:au:ptvl:v1120
    Verify list contains key and value  ${json_dict["dcterms:isPartOf"]}   key=@id  value=http://urn.fi/URN:NBN:fi:au:ptvl:v1167

    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de 2 en
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de 2 sv
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@value      value=de 2 fi    
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=en
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=sv
    Verify list contains key and value  ${json_dict["rdfs:comment"]}  key=@language   value=fi
    
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} 2 en
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} 2 fi
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@value      value=${DEFAULT DATAMODEL NAME} 2 sv
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=en
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=sv
    Verify list contains key and value  ${json_dict["rdfs:label"]}  key=@language   value=fi
    Cancel show datamodel file dialog

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}   

T2C7. Create valid datamodel with all information and remove unnesecary
    Open datamodel search page
    
    Login with Admin
    Open create datamodel dialog

    Select create datamodel core model type

    Select create datamodel domain Asuminen
    Select create datamodel domain Demokratia

    Remove selected domain Demokratia

    Select create datamodel contributor Automaatiotestaus
    Select create datamodel contributor Testiorganisaatio

    Remove selected contributor Testiorganisaatio

    Select create datamodel language suomi FI
    Select create datamodel language ruotsi SV
    Select create datamodel language englanti EN

    Input create datamodel language fi for name ${DEFAULT DATAMODEL NAME}
    Input create datamodel language sv for name ${DEFAULT DATAMODEL NAME}
    Input create datamodel language en for name ${DEFAULT DATAMODEL NAME}

    Input create datamodel language fi for description de fi
    Input create datamodel language sv for description de sv
    Input create datamodel language en for description de en

    Remove selected language ruotsi SV
    Remove selected language englanti EN

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Input create datamodel contact ${ADMIN_EDUUNI_EMAIL}
    
    Input create datamodel contact ${EMPTY}
    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}_1
    Input create datamodel language fi for name ${DEFAULT DATAMODEL NAME} fi
    Input create datamodel language fi for description ${EMPTY}

    Accept creating datamodel
    Verify datamodel is created with prefix ${DEFAULT DATAMODEL PREFIX}

    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file

    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value        ${json_dict}  yhteentoimivuus@dvv.fi
    Dictionary Should Contain Value        ${json_dict}  ${DEFAULT DATAMODEL PREFIX}_1
    Dictionary Should not Contain Value    ${json_dict}  ${DEFAULT DATAMODEL PREFIX}
    Dictionary Should Contain Value        ${json_dict}  fi
    Dictionary Should Contain Value        ${json_dict["dcterms:contributor"]}  urn:uuid:${AUTOMATION_ORGANIZATION}
    Dictionary Should Contain Value        ${json_dict["dcterms:isPartOf"]}     http://urn.fi/URN:NBN:fi:au:ptvl:v1001
    Should Contain                         ${json_dict["rdfs:label"]["@value"]}           ${DEFAULT DATAMODEL NAME} fi
    Dictionary Should not Contain Key      ${json_dict}  rdfs:comment
    Cancel show datamodel file dialog
    
    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}_1

T2C8. Add terminology link to datamodel
    ${multiple_options_and_languages}=  set variable  1
    ${single_language_1}=  set variable  2
    ${single_language_2}=  set variable  3

    Create multiple options datamodel with api
    ...  number=${multiple_options_and_languages}

    Create single language fi datamodel with api
    ...  number=${single_language_1}

    Create single language fi datamodel with api
    ...  number=${single_language_2}

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}_1
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}_1

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}_2
    ...                             ${VALID}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}_2


    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_1  7
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_2  8
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_1}  4
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_2}  5
    Save editing links 

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    ${json_dict}=  Get shown json from new tab
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}_1
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}_2
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_1}
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_2}
    
    Cancel show datamodel file dialog
    
    Reload page
    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_1  9
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_2  8
    Remove link from link editing
    Remove link from link editing
    Save editing links 

    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_1  7
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}_2  8
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_1}  4
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_2}  5
    Save editing links 

    Edit links from links tab
    Remove link from link editing
    Remove link from link editing
    Remove link from link editing
    Remove link from link editing
    Save editing links 

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    ${json_dict}=  Get shown json from new tab
    Dictionary Should not Contain Key    ${json_dict}  dcterms:requires
    Cancel show datamodel file dialog

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options_and_languages}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME}_1 with api
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME}_2 with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_1} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_2} with api

T2C9. Add datamodel link to datamodel
    ${multiple_options_and_languages}=  set variable  1
    Create multiple options datamodel with api
    ...  number=${multiple_options_and_languages}
    
    ${single_language_1}=  set variable  2
    Create single language fi datamodel with api
    ...  number=${single_language_1}

    ${single_language_2}=  set variable  3
    Create single language fi datamodel with api
    ...  number=${single_language_2}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options_and_languages}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_1}  4
    Add datamodel link to datamodel in links tab    ${DEFAULT DATAMODEL NAME}_${single_language_2}  5
    Save editing links 

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    ${json_dict}=  Get shown json from new tab
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/datamodel/ns/pr_t2c9_2
    Verify list contains key and value  ${json_dict["dcterms:requires"]}  key=@id  value=http://uri.suomi.fi/datamodel/ns/pr_t2c9_3
    Cancel show datamodel file dialog

    Open datamodel options select
    Delete datamodel from ui
    Verify datamodel has been deleted

    [Teardown]  Run keywords
    ...    Teardown test Case on failure delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options_and_languages}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_1} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_2} with api
