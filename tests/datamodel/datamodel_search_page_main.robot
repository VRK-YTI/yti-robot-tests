*** Settings ***
Force Tags           Datamodel  T1
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T1C1. Verify main search pages organization filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}
    Verify filter chip ${DEFAULT DATAMODEL NAME}
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla

    Filter by organization Automaatiotestaus
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    Verify filter chip Automaatiotestaus

    Filter by organization Testiorganisaatio
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify filter chip Testiorganisaatio

    Filter by organization Yhteentoimivuusalustan ylläpito
    Verify search result count is Tietomalleja 0 kpl seuraavilla rajauksilla
    Verify filter chip Yhteentoimivuusalustan ylläpito

    Clear organization filter
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
        
    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api

T1C2. Verify main search pages language filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}
    Filter by language fi
    Verify search result count is Tietomalleja 2 kpl seuraavilla rajauksilla
    Verify filter chip fi

    Filter by language en
    Verify search result count is Tietomalleja 2 kpl seuraavilla rajauksilla
    Verify filter chip en

    Filter by language sv
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify filter chip sv

    Clear language filter
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    
    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api

T1C3. Verify main search pages status filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3
    ${invalid_number}=  set variable  4

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}
    Create invalid datamodel with api
    ...  number=${invalid_number}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}
    Filter with datamodel status Ei käytössä olevat tietomallit
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify filter chip Poistettu käytöstä
    Verify filter chip Korvattu
    Verify filter chip Virheellinen

    Filter with datamodel status Kaikki tietomallit
    Verify search result count is Tietomalleja 4 kpl seuraavilla rajauksilla
    Verify filter chip Poistettu käytöstä
    Verify filter chip Korvattu
    Verify filter chip Virheellinen
    Verify filter chip Voimassa oleva
    Verify filter chip Luonnos
    Clear text search filter

    Search datamodel ${DEFAULT DATAMODEL NAME}_${invalid_number}
    Filter with datamodel status Käytössä olevat tietomallit
    Verify search result count is Tietomalleja 0 kpl seuraavilla rajauksilla

    Filter with datamodel status Ei käytössä olevat tietomallit
    Remove filter chip Virheellinen
    Verify search result count is Tietomalleja 0 kpl seuraavilla rajauksilla
    Clear text search filter
    
    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${invalid_number} with api

T1C4. Verify main search pages datamodel type filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}
    Filter with datamodel type Ydintietomalli
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify filter chip Ydintietomalli
    Filter with datamodel type Ydintietomalli
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    
    Filter with datamodel type Soveltamisprofiilit
    Verify search result count is Tietomalleja 2 kpl seuraavilla rajauksilla
    Verify filter chip Soveltamisprofiili
    Filter with datamodel type Soveltamisprofiilit
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    
    Filter with datamodel type Ydintietomalli
    Filter with datamodel type Soveltamisprofiilit
    Verify filter chip Ydintietomalli
    Verify filter chip Soveltamisprofiili
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    Clear text search filter

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api

T1C5. Verify main search pages domain filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}
    Filter with datamodel domain Asuminen
    Verify filter chip Asuminen
    Verify search result count is Tietomalleja 2 kpl seuraavilla rajauksilla
    Filter with datamodel domain Asuminen
    
    Filter with datamodel domain Demokratia
    Verify filter chip Demokratia
    Verify search result count is Tietomalleja 2 kpl seuraavilla rajauksilla
    Filter with datamodel domain Demokratia

    Filter with datamodel domain Elinkeinot
    Verify filter chip Elinkeinot
    Verify search result count is Tietomalleja 0 kpl seuraavilla rajauksilla
    Filter with datamodel domain Elinkeinot
    
    Filter with datamodel domain Asuminen
    Filter with datamodel domain Demokratia
    Verify filter chip Asuminen
    Verify filter chip Demokratia
    Verify search result count is Tietomalleja 3 kpl seuraavilla rajauksilla
    Clear text search filter

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api

T1C6. Verify main search pages multiple filters
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3
    ${invalid_number}=  set variable  4

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}
    Create invalid datamodel with api
    ...  number=${invalid_number}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}

    Filter with datamodel status Ei käytössä olevat tietomallit
    Filter with datamodel domain Asuminen
    Filter with datamodel type Ydintietomalli
    Filter by language fi
    Filter by organization Testiorganisaatio
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla

    Filter with datamodel status Käytössä olevat tietomallit
    Filter with datamodel domain Demokratia
    Filter with datamodel type Soveltamisprofiilit
    Filter by language en
    Filter by organization Automaatiotestaus
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    
    Clear text search filter

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${invalid_number} with api

T1C7. Verify main search pages datamodel information
    ${multiple_options}=  set variable  1
    ${single_language_fi}=  set variable  2
    ${single_language_en}=  set variable  3
    ${invalid_number}=  set variable  4

    Create multiple options datamodel with api
    ...  number=${multiple_options}
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    Create single language en datamodel with api
    ...  number=${single_language_en}
    Create invalid datamodel with api
    ...  number=${invalid_number}

    Open datamodel search page

    Search datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options}
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify datamodel ${DEFAULT DATAMODEL NAME} has 2 sisällöntuottajaa contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Demokratia domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Asuminen domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has DESCRIPTION_FI description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Soveltamisprofiili on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Luonnos on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options} title
    Clear text search filter

    Change language to english
    Search datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options}_EN
    Verify search result count is 1 Data Vocabulary with following filters
    Verify datamodel ${DEFAULT DATAMODEL NAME} has 2 organizations contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Democracy domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Housing domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has DESCRIPTION_EN description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Profile on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Draft on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${multiple_options}_EN title
    Clear text search filter

    Change language to finnish
    Search datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Asuminen domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has DESCRIPTION_FI description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Ydintietomalli on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Voimassa oleva on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi} title
    Clear text search filter

    Change language to english
    Search datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Verify search result count is 1 Data Vocabulary with following filters
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus (fi) contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Housing domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has DESCRIPTION_FI description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Core Data Model on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Valid on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi} (fi) title
    Clear text search filter

    Change language to finnish
    Search datamodel ${DEFAULT DATAMODEL NAME}_${single_language_en}
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Demokratia domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Ei annettu kuvausta description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Soveltamisprofiili on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Luonnos on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${single_language_en} (en) title
    Clear text search filter

    Change language to english
    Search datamodel ${DEFAULT DATAMODEL NAME}_${single_language_en}
    Verify search result count is 1 Data Vocabulary with following filters
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus (fi) contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Democracy domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has No description description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Profile on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Draft on main page
    Clear text search filter

    Change language to finnish
    Search datamodel ${DEFAULT DATAMODEL NAME}_${invalid_number}
    Filter with datamodel status Ei käytössä olevat tietomallit
    Verify search result count is Tietomalleja 1 kpl seuraavilla rajauksilla
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Asuminen domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Ei annettu kuvausta description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Ydintietomalli on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Virheellinen on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME}_${invalid_number} title
    Clear text search filter

    Change language to english
    Search datamodel ${DEFAULT DATAMODEL NAME}_${invalid_number}
    Verify search result count is 1 Data Vocabulary with following filters
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Automaatiotestaus (fi) contributers on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has Housing domains on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} has No description description on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} type is Core Data Model on main page
    Verify datamodel ${DEFAULT DATAMODEL NAME} status is Invalid on main page
    Clear text search filter

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multiple_options}
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_fi} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${single_language_en} with api
    ...    Delete model ${DEFAULT DATAMODEL PREFIX}_${invalid_number} with api