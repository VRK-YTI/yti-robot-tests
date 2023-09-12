*** Settings ***

Force Tags           Datamodel  T3
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Variables ***
${link}=     https://dvv.fi/documents/16079645/16452557/section-info-fi.png/9c02b3ea-4377-c2f4-c166-5c2285cb44a4?t=1574845075000


*** Test Cases ***
T3C1. Verify create class permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open class tab
    Verify page does not contain add datamodel class button

    Login with no group
    Open class tab
    Verify page does not contain add datamodel class button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings        
    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open class tab
    Verify page does contain add datamodel class button

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C2. Create valid class
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open class tab
    Create new class
    Cancel create datamodel class dialog

    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}
    Save class

    Return from class

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}
    Delete class

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C3. Create valid class with subclass
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open class tab
    Create new class
    Cancel create datamodel class dialog

    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_1
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_1
    Save class
    Return from class

    Open class tab
    Create new class
    Cancel create datamodel class dialog

    Create new class
    Select class on create class dialog    ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2
    Save class

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:subClassOf"]}     value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}_1
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}_2
    Delete class

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C4. Create valid class with all options
    ${multi_language}=  set variable  1

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open class tab
    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_1
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_1
    Save class
    Return from class

    Reload Page
    
    Open class tab

    Create new class
    Create new class datamodel in dialog

    Select class concept into class         ${DEFAULT CONCEPT NAME}

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Input english class label     ${DEFAULT DATAMODEL CLASS NAME}_2_en
    Input swedish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_sv

    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2

    Select subclass into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    Select equivalent class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select disjoint class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select status into class                    ${INCOMPLETE}

    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en

    Input editor comment into class             editor input
    Save class

    Return from class

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][0]}       value=${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][1]}       value=${DEFAULT DATAMODEL CLASS NAME}_2_en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][2]}       value=${DEFAULT DATAMODEL CLASS NAME}_2_sv
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][1]}     value=description fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][2]}     value=description en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][0]}     value=description sv
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Delete class

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T3C5. Verify invalid class errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open class tab
    Create new class
    Cancel create datamodel class dialog

    Create new class
    Create new class datamodel in dialog
    
    Save Class
    Verify create datamodel class contains error ${Class name not set error}
    Verify create datamodel class contains error ${Class prefix not set error}

    Input finnish class label    ${DEFAULT DATAMODEL CLASS NAME}
    Save Class

    Verify create datamodel class does not contain error ${Class name not set error}
    Verify create datamodel class contains error ${Class prefix not set error}
    
    Input class prefix    1
    Save Class            
    Verify create datamodel class does not contain error ${Class name not set error}
    Verify create datamodel class does not contain error ${Class prefix not set error}
    Verify create datamodel class contains error ${Class prefix starts with number error}
    Verify create datamodel class contains error ${Class prefix size error}
    Verify create datamodel class does not contain error ${Class prefix valid character error}

    Input class prefix    a
    Save Class            
    Verify create datamodel class does not contain error ${Class name not set error}
    Verify create datamodel class does not contain error ${Class prefix not set error}
    Verify create datamodel class does not contain error ${Class prefix starts with number error}
    Verify create datamodel class contains error ${Class prefix size error}
    Verify create datamodel class does not contain error ${Class prefix valid character error}

    Input class prefix    class%
    Save Class            
    Verify create datamodel class does not contain error ${Class name not set error}
    Verify create datamodel class does not contain error ${Class prefix not set error}
    Verify create datamodel class does not contain error ${Class prefix starts with number error}
    Verify create datamodel class does not contain error ${Class prefix size error}
    Verify create datamodel class contains error ${Class prefix valid character error}

    input class prefix    ${DEFAULT DATAMODEL CLASS PREFIX}
    Verify create datamodel class does not contain error ${Class name not set error}
    Verify create datamodel class does not contain error ${Class prefix not set error}
    Verify create datamodel class does not contain error ${Class prefix starts with number error}
    Verify create datamodel class does not contain error ${Class prefix size error}
    Verify create datamodel class does not contain error ${Class prefix valid character error}
    
    Save Class

    Return from class
    Reload page
    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}
    Delete class

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    
T3C6. Verify modify class permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin

    Open class tab
    Create new class
    Create new class datamodel in dialog

    Input finnish class label                   ${DEFAULT DATAMODEL CLASS NAME}
    Input class prefix                          ${DEFAULT DATAMODEL CLASS PREFIX}
    Input editor comment into class             editor input
    Save class
    Verify page does contain class options button
    Verify class page does contain editor message     editor input

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings        
    Open datamodel search page

    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}
    Verify page does not contain class options button
    Verify class page does not contain editor message     editor input

    Login with no group
    Verify page does not contain class options button
    Verify class page does not contain editor message     editor input

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C7. Verify invalid class modify errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin

    Open class tab
    Create new class
    Create new class datamodel in dialog
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}
    Save class
    Verify page does contain class options button
    Edit class
    
    Input finnish class label    ${SPACE}
    Save Class
    Verify create datamodel class contains error ${Class name not set error}

    Input finnish class label    ${DEFAULT DATAMODEL CLASS NAME}
    Save Class

    Return from class
    Reload page
    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}
    Delete class

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C8. Modify class
    ${multi_language}=  set variable  1

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open class tab
    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_1
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_1
    Save class
    Return from class

    Reload Page
    
    Open class tab

    Create new class
    Create new class datamodel in dialog
    Select class concept into class         ${DEFAULT CONCEPT NAME}
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2
    Save class

    Edit class
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_3_fi
    Input english class label     ${DEFAULT DATAMODEL CLASS NAME}_2_en
    Input swedish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_sv

    Select subclass into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    Select equivalent class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select disjoint class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select status into class                    ${INCOMPLETE}
    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en
    Input editor comment into class             editor input
    Save class

    Sleep  20
    Return from class
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][1]}       value=${DEFAULT DATAMODEL CLASS NAME}_3_fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][0]}       value=${DEFAULT DATAMODEL CLASS NAME}_2_en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][2]}       value=${DEFAULT DATAMODEL CLASS NAME}_2_sv
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][2]}     value=description fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][1]}     value=description en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][0]}     value=description sv
    ${json_dict}=  Get shown json from new tab

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T3C9. Modify class remove unnesecary
    
    ${multi_language}=  set variable  1

    Create terminology with api     ${DEFAULT TERMINOLOGY NAME}
    ...                             ${DRAFT}
    ...                             ${DOMAIN HOUSING}
    ...                             ${ORGANIZATION AUTOMATION}
    ...                             ${DEFAULT TERMINOLOGY PREFIX}

    Create terminology concept with api  ${DEFAULT TERMINOLOGY NAME}
    ...                                  ${DEFAULT CONCEPT NAME}
    ...                                  04bb2206-ba9e-4007-920d-f57ed0d4bce1
    ...                                  ${DRAFT}
    ...                                  bf5f88cb-3a33-498e-b8eb-1c9807973e81
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open class tab
    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_1
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_1
    Save class
    Return from class

    Reload Page
    
    Open class tab

    Create new class
    Create new class datamodel in dialog

    Select class concept into class         ${DEFAULT CONCEPT NAME}

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Input english class label     ${DEFAULT DATAMODEL CLASS NAME}_2_en
    Input swedish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_sv

    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2

    Select subclass into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    Select equivalent class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select disjoint class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select status into class                    ${INCOMPLETE}

    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en

    Input editor comment into class             editor input
    Save class
    
    Edit class

    Remove upper class from class
    Remove corresponding class from class
    Remove disjoint class from class
    Click element with wait                     ${Datamodel class label input en}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE
    Click element with wait                     ${Datamodel class label input sv}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE

    Input finnish description into class        ${SPACE}
    Input swedish description into class        ${SPACE}
    Input english description into class        ${SPACE}
    Input editor comment into class             ${SPACE}

    Save Class
    
    Return from class

    Sleep  20
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:label"]}          value=${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][1]}     value=description fi
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][2]}     value=description en
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][0]}     value=description sv
    ${json_dict}=  Get shown json from new tab

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api