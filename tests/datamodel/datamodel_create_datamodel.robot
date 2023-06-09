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

T2C2. Verify create datamodel errors
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

    #TODO invalid error, bugged currently
    Input create datamodel prefix *
    Verify create datamodel contains error Tietomallin yksilöivän tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
    Verify create datamodel invalid prefix error

    Input create datamodel prefix **
    Verify create datamodel does not contain error Tietomallin yksilöivän tunnuksen pituus ei täytä vaatimuksia (2-32 merkkiä)
    Accept creating datamodel
    Verify create datamodel contains error BAD_REQUEST: Object validation failed

    #TODO invalid error, bugged currently
    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Accept creating datamodel
    Verify create datamodel contains error BAD_REQUEST: Object validation failed

    Input create datamodel language suomi FI for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä suomi

    Input create datamodel language ruotsi SV for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä ruotsi

    Input create datamodel language englanti EN for name ${DEFAULT DATAMODEL NAME}
    Accept creating datamodel
    Verify create datamodel does not contain error Tietomallin nimi puuttuu kieleltä englanti

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Accept creating datamodel
    Verify datamodel is created with prefix ${DEFAULT DATAMODEL PREFIX}

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api

T2C3. Create valid datamodel with only nessecary information
    Open datamodel search page
    
    Login with Admin
    Open create datamodel dialog

    Select create datamodel domain Asuminen
    Select create datamodel contributor Automaatiotestaus

    Select create datamodel language suomi FI
    Input create datamodel language suomi FI for name ${DEFAULT DATAMODEL NAME} fi

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

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}

T2C4. Create valid datamodel with all information
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

    Input create datamodel language suomi FI for name ${DEFAULT DATAMODEL NAME} fi
    Input create datamodel language ruotsi SV for name ${DEFAULT DATAMODEL NAME} sv
    Input create datamodel language englanti EN for name ${DEFAULT DATAMODEL NAME} en

    Input create datamodel language suomi FI for description de fi
    Input create datamodel language ruotsi SV for description de sv
    Input create datamodel language englanti EN for description de en

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

    Dictionary Should Contain Value  ${json_dict["dcterms:contributor"][0]}  urn:uuid:${TESTING_ORGANIZATION}
    Dictionary Should Contain Value  ${json_dict["dcterms:contributor"][1]}  urn:uuid:${AUTOMATION_ORGANIZATION}

    Dictionary Should Contain Value  ${json_dict["dcterms:isPartOf"][0]}  http://urn.fi/URN:NBN:fi:au:ptvl:v1001
    Dictionary Should Contain Value  ${json_dict["dcterms:isPartOf"][1]}  http://urn.fi/URN:NBN:fi:au:ptvl:v1090

    Dictionary Should Contain Value  ${json_dict["rdfs:comment"][0]}  de en
    Dictionary Should Contain Value  ${json_dict["rdfs:comment"][1]}  de sv
    Dictionary Should Contain Value  ${json_dict["rdfs:comment"][2]}  de fi
    
    Dictionary Should Contain Value  ${json_dict["rdfs:label"][0]}  ${DEFAULT DATAMODEL NAME} en
    Dictionary Should Contain Value  ${json_dict["rdfs:label"][1]}  ${DEFAULT DATAMODEL NAME} fi
    Dictionary Should Contain Value  ${json_dict["rdfs:label"][2]}  ${DEFAULT DATAMODEL NAME} sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}   

T2C5. Create valid datamodel with all information and remove unnesecary
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

    Input create datamodel language suomi FI for name ${DEFAULT DATAMODEL NAME}
    Input create datamodel language ruotsi SV for name ${DEFAULT DATAMODEL NAME}
    Input create datamodel language englanti EN for name ${DEFAULT DATAMODEL NAME}

    Input create datamodel language suomi FI for description de fi
    Input create datamodel language ruotsi SV for description de sv
    Input create datamodel language englanti EN for description de en

    Remove selected language ruotsi SV
    Remove selected language englanti EN

    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}
    Input create datamodel contact ${ADMIN_EDUUNI_EMAIL}
    
    Input create datamodel contact ${EMPTY}
    Input create datamodel prefix ${DEFAULT DATAMODEL PREFIX}_1
    Input create datamodel language suomi FI for name ${DEFAULT DATAMODEL NAME}_1
    Input create datamodel language suomi FI for description ${EMPTY}

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
    Dictionary Should Contain Value        ${json_dict["rdfs:label"]}           ${DEFAULT DATAMODEL NAME} fi
    Dictionary Should not Contain Key      ${json_dict}  rdfs:comment

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_1