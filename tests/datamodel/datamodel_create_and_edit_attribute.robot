*** Settings ***

Force Tags           Datamodel  T4
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Test Cases ***
T4C1. Verify create attribute permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
      
    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open attribute tab
    Verify page does contain add datamodel attribute button

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C2. Create valid attribute
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open attribute tab
    Create new attribute
    Cancel create datamodel attribute dialog
    Sleep  2

    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}
    Save attribute
    Wait until attribute is saved 

    Return from attribute

    Reload page
    # TODO Add new checks that attribute has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
   # Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:label"]}          value=${DEFAULT DATAMODEL ATTRIBUTE NAME}

    #Cancel show datamodel file dialog

    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Delete attribute

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C3. Create valid attribute with subattribute
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
  
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL ATTRIBUTE NAME}

    Create datamodel attribute with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    ...  status=${SUGGESTED}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open attribute tab
    Create new attribute
    Select attribute on create attribute dialog    ${DEFAULT DATAMODEL ATTRIBUTE NAME}  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Save attribute

    Wait until attribute is saved 
    Verify create datamodel attribute does not contain error ${attribute name not set error}
    
    Reload page
    # TODO Add new checks that attribute has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #${ids}=  Evaluate  [x["@id"] for x in ${json_dict["@graph"]} if "@id" in x.keys()]
    #${isDefinedBy}=  Evaluate  [x["rdfs:isDefinedBy"]["@id"] for x in ${json_dict["@graph"]} if "rdfs:isDefinedBy" in x.keys() and "@id" in x["rdfs:isDefinedBy"].keys()]
    #List Should Contain Value    ${ids}            ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    #List Should Contain Value    ${isDefinedBy}    http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

    #Cancel show datamodel file dialog

    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2
    Delete attribute

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C4. Create valid attribute with all options
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
    ...  ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1

    Create datamodel attribute with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    ...  status=${SUGGESTED}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open attribute tab

    Create new attribute
    Create new attribute datamodel in dialog

    Select attribute concept into attribute         ${DEFAULT CONCEPT NAME}

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Input english attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Input swedish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv

    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2

    Select subattribute into attribute
    Select attribute on linking subattribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    
    Select equivalent attribute into attribute
    Select attribute on linking attribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en

    Input editor comment into attribute             editor input
    Save attribute
    Wait until attribute is saved 
    
    Return from attribute

    Reload page
    # TODO Add new checks that attribute has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}

    #${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:label"]}]]
    #log  ${labels}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv

    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should Contain Value    @{comment}    description fi
    #List Should Contain Value    @{comment}    description en
    #List Should Contain Value    @{comment}    description sv
    #Cancel show datamodel file dialog

    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Delete attribute

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T4C5. Verify invalid attribute errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open attribute tab
    Create new attribute
    Cancel create datamodel attribute dialog

    Create new attribute
    Create new attribute datamodel in dialog
    
    Save attribute
    Verify create datamodel attribute contains error ${attribute name not set error}
    Verify create datamodel attribute contains error ${attribute prefix not set error}

    Input finnish attribute label    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Save attribute

    Verify create datamodel attribute does not contain error ${attribute name not set error}
    Verify create datamodel attribute contains error ${attribute prefix not set error}
    
    Input attribute prefix    1
    Save attribute            
    Verify create datamodel attribute does not contain error ${attribute name not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix not set error}
    Verify create datamodel attribute contains error ${attribute prefix starts with number error}
    Verify create datamodel attribute contains error ${attribute prefix size error}
    Verify create datamodel attribute does not contain error ${attribute prefix valid character error}

    Input attribute prefix    a
    Save attribute            
    Verify create datamodel attribute does not contain error ${attribute name not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix starts with number error}
    Verify create datamodel attribute contains error ${attribute prefix size error}
    Verify create datamodel attribute does not contain error ${attribute prefix valid character error}

    Input attribute prefix    attribute%
    Save attribute            
    Verify create datamodel attribute does not contain error ${attribute name not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix starts with number error}
    Verify create datamodel attribute does not contain error ${attribute prefix size error}
    Verify create datamodel attribute contains error ${attribute prefix valid character error}

    input attribute prefix    ${DEFAULT DATAMODEL attribute PREFIX}
    Verify create datamodel attribute does not contain error ${attribute name not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix not set error}
    Verify create datamodel attribute does not contain error ${attribute prefix starts with number error}
    Verify create datamodel attribute does not contain error ${attribute prefix size error}
    Verify create datamodel attribute does not contain error ${attribute prefix valid character error}
    
    Save attribute
    Wait until attribute is saved 

    Return from attribute
    Reload page
    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL attribute NAME}
    Delete attribute

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    
T4C6. Verify modify attribute permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label                   ${DEFAULT DATAMODEL attribute NAME}
    Input attribute prefix                          ${DEFAULT DATAMODEL attribute PREFIX}
    Input editor comment into attribute             editor input
    Save attribute
    Wait until attribute is saved 
    Verify page does contain attribute options button
    Verify attribute page does contain editor message     editor input

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C7. Verify invalid attribute modify errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog
    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}
    Save attribute
    Verify page does contain attribute options button
    Edit attribute
    
    Click element with wait          ${Datamodel attribute label input fi}
    Press Keys                       None  CTRL+A
    Press Keys                       None  BACKSPACE
    Save attribute
    Verify create datamodel attribute contains error ${attribute name not set error}

    Input finnish attribute label    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Save attribute
    Wait until attribute is saved 

    Return from attribute
    Reload page
    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Delete attribute

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C8. Modify attribute
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
    ...  ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1

    Create datamodel attribute with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    ...  status=${SUGGESTED}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open attribute tab

    Create new attribute
    Create new attribute datamodel in dialog
    Select attribute concept into attribute         ${DEFAULT CONCEPT NAME}
    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Save attribute
    Wait until attribute is saved 

    Edit attribute
    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Input english attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Input swedish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv

    Select subattribute into attribute
    Select attribute on linking subattribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    
    Select equivalent attribute into attribute
    Select attribute on linking attribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en
    Input editor comment into attribute             editor input
    
    Save attribute
    Wait until attribute is saved 
    
    Return from attribute
    Reload page
    # TODO Add new checks that attribute has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}

    #${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:label"]}]]
    #log  ${labels}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv
    
    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should Contain Value    @{comment}    description fi
    #List Should Contain Value    @{comment}    description en
    #List Should Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T4C9. Modify attribute remove unnesecary
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
    ...  ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1

    Create datamodel attribute with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    ...  status=${SUGGESTED}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
    Open attribute tab

    Create new attribute
    Create new attribute datamodel in dialog

    Select attribute concept into attribute         ${DEFAULT CONCEPT NAME}

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Input english attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Input swedish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv

    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2

    Select subattribute into attribute
    Select attribute on linking subattribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    
    Select equivalent attribute into attribute
    Select attribute on linking attribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en

    Input editor comment into attribute             editor input
    Save attribute
    Wait until attribute is saved 
    
    Edit attribute
    Input finnish attribute label               ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Click element with wait                     ${Datamodel attribute label input sv}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE
    Click element with wait                     ${Datamodel attribute label input en}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE

    Remove upper attribute from attribute
    Remove corresponding attribute from attribute

    Input finnish description into attribute        ${SPACE}
    Input swedish description into attribute        ${SPACE}
    Input english description into attribute        ${SPACE}
    Input editor comment into attribute             ${SPACE}
    Save attribute
    Wait until attribute is saved 
    
    Return from attribute

    Reload page
    # TODO Add new checks that attribute has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:label"]}          value=${DEFAULT DATAMODEL ATTRIBUTE NAME}
    
    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should not Contain Value    @{comment}    description fi
    #List Should not Contain Value    @{comment}    description en
    #List Should not Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api
