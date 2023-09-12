*** Settings ***

Force Tags           Datamodel  T4
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case

*** Variables ***
${link}=     https://dvv.fi/documents/16079645/16452557/section-info-fi.png/9c02b3ea-4377-c2f4-c166-5c2285cb44a4?t=1574845075000


*** Test Cases ***
T4C1. Verify create attribute permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open attribute tab
    Verify page does not contain add datamodel attribute button

    Login with no group
    Open attribute tab
    Verify page does not contain add datamodel attribute button

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings        
    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open attribute tab
    Verify page does contain add datamodel attribute button

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C2. Create valid attribute
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open attribute tab
    Create new attribute
    Cancel create datamodel attribute dialog

    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}
    Save attribute

    Return from attribute

    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Delete attribute

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C3. Create valid attribute with subattribute
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
    Open attribute tab
    Create new attribute
    Cancel create datamodel attribute dialog

    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    Save attribute
    Return from attribute

    Open attribute tab
    Create new attribute
    Cancel create datamodel attribute dialog

    Create new attribute
    Select attribute on create attribute dialog    ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Save attribute
    
    Sleep  30
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:subPropertyOf"]}     value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

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
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    Save attribute
    Return from attribute

    Reload Page
    
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

    Select status into attribute                    ${INCOMPLETE}

    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en

    Input editor comment into attribute             editor input
    Save attribute

    Return from attribute

    Sleep  20
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    log  ${json_dict["@graph"][0]}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][2]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][0]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:label"][1]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][2]}     value=description fi
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][0]}     value=description en
    Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:comment"][1]}     value=description sv
    ${json_dict}=  Get shown json from new tab
    
    Cancel show datamodel file dialog

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
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin
    
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
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label                   ${DEFAULT DATAMODEL attribute NAME}
    Input attribute prefix                          ${DEFAULT DATAMODEL attribute PREFIX}
    Input editor comment into attribute             editor input
    Save attribute
    Verify page does contain attribute options button
    Verify attribute page does contain editor message     editor input

    # Close browser and open it again, because of eduuni cache
    Close Browser
    Open Browser with Settings        
    Open datamodel search page

    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Open attribute tab
    Select attribute    ${DEFAULT DATAMODEL ATTRIBUTE NAME}
    Verify page does not contain attribute options button
    Verify attribute page does not contain editor message     editor input

    Login with no group
    Verify page does not contain attribute options button
    Verify attribute page does not contain editor message     editor input

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T4C7. Verify invalid attribute modify errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    Login with Admin

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
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    Save attribute
    Return from attribute

    Reload Page
    
    Open attribute tab

    Create new attribute
    Create new attribute datamodel in dialog
    Select attribute concept into attribute         ${DEFAULT CONCEPT NAME}
    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Save attribute

    Edit attribute
    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_3_fi
    Input english attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Input swedish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv

    Select subattribute into attribute
    Select attribute on linking subattribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    
    Select equivalent attribute into attribute
    Select attribute on linking attribute dialog        ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1  ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1

    Select status into attribute                    ${INCOMPLETE}
    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en
    Input editor comment into attribute             editor input
    Save attribute

    Sleep  20
    Return from attribute
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:label"][1]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_3_fi
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:label"][0]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_en
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:label"][2]}       value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_sv
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:comment"][2]}     value=description fi
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:comment"][1]}     value=description en
    Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:comment"][0]}     value=description sv
    ${json_dict}=  Get shown json from new tab

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
    
    Create multiple options datamodel library with api
    ...  number=${multi_language}

    Open datamodel search page
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    Login with Admin

    Select links tab
    Edit links from links tab
    Add terminology link to datamodel in links tab  ${DEFAULT TERMINOLOGY NAME}  5
    Save editing links 

    Open attribute tab
    Create new attribute
    Create new attribute datamodel in dialog

    Input finnish attribute label     ${DEFAULT DATAMODEL ATTRIBUTE NAME}_1
    Input attribute prefix            ${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_1
    Save attribute
    Return from attribute

    Reload Page
    
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

    Select status into attribute                    ${INCOMPLETE}

    Input finnish description into attribute        description fi
    Input swedish description into attribute        description sv
    Input english description into attribute        description en

    Input editor comment into attribute             editor input
    Save attribute
    
    Edit attribute

    Remove upper attribute from attribute
    Remove corresponding attribute from attribute
    Click element with wait                     ${Datamodel attribute label input sv}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE
    Click element with wait                     ${Datamodel attribute label input en}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE

    Input finnish description into attribute        ${SPACE}
    Input swedish description into attribute        ${SPACE}
    Input english description into attribute        ${SPACE}
    Input editor comment into attribute             ${SPACE}

    Save attribute
    
    Return from attribute

    Sleep  20
    Reload page
    Select info tab
    Open datamodel options select
    Open show datamodel as file dialog
    Show datamodel file
    
    ${json_dict}=  Get shown json from new tab
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL ATTRIBUTE PREFIX}_2
    Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${INCOMPLETE}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:label"]}          value=${DEFAULT DATAMODEL ATTRIBUTE NAME}_2_fi
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][1]}     value=description fi
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][2]}     value=description en
    Dictionary Should not Contain Value    ${json_dict["@graph"][2]["rdfs:comment"][0]}     value=description sv
    ${json_dict}=  Get shown json from new tab

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api
