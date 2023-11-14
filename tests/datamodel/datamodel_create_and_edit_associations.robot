*** Settings ***

Force Tags           Datamodel  T5
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T5C1. Verify create associations permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
    
    #Open datamodel search page
    #Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    #Open association tab
    #Verify page does not contain add datamodel association button

    #Login with no group
    #Open association tab
    #Verify page does not contain add datamodel association button

    # Close browser and open it again, because of eduuni cache
    #Close Browser
    #Open Browser with Settings        
    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open association tab
    Verify page does contain add datamodel association button

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T5C2. Create valid association
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Open association tab
    Create new association
    Cancel create datamodel association dialog

    Create new association
    Create new association datamodel in dialog

    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}
    Save association
    Wait until association is saved

    Return from association

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ASSOCIATION PREFIX}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Cancel show datamodel file dialog

    Open association tab
    Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Delete association

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T5C3. Create valid association with subassociation
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
 
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL ASSOCIATION NAME}

    Create datamodel association with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open association tab
    Create new association
    Cancel create datamodel association dialog

    Create new association
    Select association on create association dialog    ${DEFAULT DATAMODEL ASSOCIATION NAME}  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1

    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2
    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Save association
    Verify create datamodel association does not contain error ${association name not set error}
    Wait until association is saved

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Cancel show datamodel file dialog

    Open association tab
    Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2
    Delete association

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T5C4. Create valid association with all options
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
    
    @{terminologies}=  Create list  
    ...  http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}
  
    Create multiple options datamodel library with api
    ...  number=${multi_language}
    ...  terminologies=@{terminologies}
 
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL ASSOCIATION NAME}_1

    Create datamodel association with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open association tab

    Create new association
    Create new association datamodel in dialog

    Select association concept into ASSOCIATION         ${DEFAULT CONCEPT NAME}

    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_fi
    Input english association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_en
    Input swedish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_sv

    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2

    Select subassociation into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    
    Select equivalent association into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1

    Select status into association                    ${DRAFT}

    Input finnish description into association        description fi
    Input swedish description into association        description sv
    Input english description into association        description en

    Input editor comment into association             editor input
    Save association
    Wait until association is saved

    Return from association

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}

    ${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:label"]}]]
    log  ${labels}
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_fi
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_en
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_sv
    
    ${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:comment"]}]]
    log  ${comment}
    List Should Contain Value    @{comment}    description fi
    List Should Contain Value    @{comment}    description en
    List Should Contain Value    @{comment}    description sv
    Cancel show datamodel file dialog

    Open association tab
    Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_fi
    Delete association

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T5C5. Verify invalid association errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open association tab
    Create new association
    Cancel create datamodel association dialog

    Create new association
    Create new association datamodel in dialog
    
    Save association
    Verify create datamodel association contains error ${association name not set error}
    Verify create datamodel association contains error ${association prefix not set error}

    Input finnish association label    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Save association

    Verify create datamodel association does not contain error ${association name not set error}
    Verify create datamodel association contains error ${association prefix not set error}
    
    Input association prefix    1
    Save association            
    Verify create datamodel association does not contain error ${association name not set error}
    Verify create datamodel association does not contain error ${association prefix not set error}
    Verify create datamodel association contains error ${association prefix starts with number error}
    Verify create datamodel association contains error ${association prefix size error}
    Verify create datamodel association does not contain error ${association prefix valid character error}

    Input association prefix    a
    Save association            
    Verify create datamodel association does not contain error ${association name not set error}
    Verify create datamodel association does not contain error ${association prefix not set error}
    Verify create datamodel association does not contain error ${association prefix starts with number error}
    Verify create datamodel association contains error ${association prefix size error}
    Verify create datamodel association does not contain error ${association prefix valid character error}

    Input association prefix    association%
    Save association            
    Verify create datamodel association does not contain error ${association name not set error}
    Verify create datamodel association does not contain error ${association prefix not set error}
    Verify create datamodel association does not contain error ${association prefix starts with number error}
    Verify create datamodel association does not contain error ${association prefix size error}
    Verify create datamodel association contains error ${association prefix valid character error}

    input association prefix    ${DEFAULT DATAMODEL ASSOCIATION PREFIX}
    Verify create datamodel association does not contain error ${association name not set error}
    Verify create datamodel association does not contain error ${association prefix not set error}
    Verify create datamodel association does not contain error ${association prefix starts with number error}
    Verify create datamodel association does not contain error ${association prefix size error}
    Verify create datamodel association does not contain error ${association prefix valid character error}
    
    Save association

    Return from association
    Reload page
    Open association tab
    Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Delete association

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    
T5C6. Verify modify association permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open association tab
    Create new association
    Create new association datamodel in dialog

    Input finnish association label                   ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Input association prefix                          ${DEFAULT DATAMODEL ASSOCIATION PREFIX}
    Input editor comment into association             editor input
    Save association
    Verify page does contain association options button
    Verify association page does contain editor message     editor input

    # Close browser and open it again, because of eduuni cache
    #Close Browser
    #Open Browser with Settings        
    #Open datamodel search page

    #Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    #Open association tab
    #Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    #Verify page does not contain association options button
    #Verify association page does not contain editor message     editor input

    #Login with no group
    #Verify page does not contain association options button
    #Verify association page does not contain editor message     editor input

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T5C7. Verify invalid association modify errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open association tab
    Create new association
    Create new association datamodel in dialog
    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}
    Save association
    Verify page does contain association options button
    Edit association
    
    Click element with wait          ${Datamodel ASSOCIATION label input fi}
    Press Keys                       None  CTRL+A
    Press Keys                       None  BACKSPACE
    Save association
    Verify create datamodel association contains error ${ASSOCIATION name not set error}

    Input finnish association label    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Save association
    Wait until association is saved

    Return from association
    Reload page
    Open association tab
    Select association    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Delete association

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T5C8. Modify association
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
    
    @{terminologies}=  Create list  
    ...  http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}
  
    Create multiple options datamodel library with api
    ...  number=${multi_language}
    ...  terminologies=@{terminologies}
 
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL ASSOCIATION NAME}_1

    Create datamodel association with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open association tab

    Create new association
    Create new association datamodel in dialog
    Select association concept into association         ${DEFAULT CONCEPT NAME}
    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_fi
    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Save association
    Wait until association is saved

    Edit association
    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Input english association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_en
    Input swedish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_sv

    Select subassociation into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    
    Select equivalent association into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1

    Select status into association                    ${DRAFT}
    Input finnish description into association        description fi
    Input swedish description into association        description sv
    Input english description into association        description en
    Input editor comment into association             editor input
    Save association
    Wait until association is saved

    Return from association
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}

    ${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:label"]}]]
    log  ${labels}
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_en
    List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_sv
    
    ${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:comment"]}]]
    log  ${comment}
    List Should Contain Value    @{comment}    description fi
    List Should Contain Value    @{comment}    description en
    List Should Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T5C9. Modify association remove unnesecary
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
    
    @{terminologies}=  Create list  
    ...  http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}

    Create multiple options datamodel library with api
    ...  number=${multi_language}
    ...  terminologies=@{terminologies}
 
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL ASSOCIATION NAME}_1

    Create datamodel association with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open association tab

    Create new association
    Create new association datamodel in dialog

    Select association concept into association         ${DEFAULT CONCEPT NAME}

    Input finnish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_fi
    Input english association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_en
    Input swedish association label     ${DEFAULT DATAMODEL ASSOCIATION NAME}_2_sv

    Input association prefix            ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2

    Select subassociation into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1
    
    Select equivalent association into association
    Select association on linking subassociation dialog        ${DEFAULT DATAMODEL ASSOCIATION NAME}_1  ${DEFAULT DATAMODEL ASSOCIATION PREFIX}_1

    Select status into association                    ${DRAFT}

    Input finnish description into association        description fi
    Input swedish description into association        description sv
    Input english description into association        description en

    Input editor comment into association             editor input
    Save association
    Wait until association is saved
    
    Edit association
    Input finnish association label             ${DEFAULT DATAMODEL ASSOCIATION NAME}
    Click element with wait                     ${Datamodel association label input sv}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE
    Click element with wait                     ${Datamodel association label input en}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE

    Remove upper association from association
    Remove corresponding association from association
    
    Input finnish description into association        ${SPACE}
    Input swedish description into association        ${SPACE}
    Input english description into association        ${SPACE}
    Input editor comment into association             ${SPACE}

    Save association
    Wait until association is saved
    
    Return from association

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ASSOCIATION PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"]}          value=${DEFAULT DATAMODEL ASSOCIATION NAME}

    ${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:comment"]}]]
    log  ${comment}
    List Should not Contain Value    @{comment}    description fi
    List Should not Contain Value    @{comment}    description en
    List Should not Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api