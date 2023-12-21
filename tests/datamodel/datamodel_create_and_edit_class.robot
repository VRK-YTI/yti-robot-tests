*** Settings ***

Force Tags           Datamodel  T3
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Library              Collections

Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T3C1. Verify create class permissions
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}
        
    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open class tab
    Verify page does contain add datamodel class button

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C2. Create valid class
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open class tab
    Create new class
    Cancel create datamodel class dialog

    Create new class
    Create new class datamodel in dialog

    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}
    Save class
    Wait until class is saved

    Return from class

    Reload page
    # TODO Add new checks that class has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][1]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    
    #Cancel show datamodel file dialog

    Open class tab
    Select class    ${DEFAULT DATAMODEL CLASS NAME}
    Delete class

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C3. Create valid class with subclass
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL CLASS NAME}_1
    
    Create datamodel class with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL CLASS PREFIX}_1
    ...  status=${VALID}
    
    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open class tab
    Create new class
    Select class on create class dialog    ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2
    Save class
    Verify create datamodel class does not contain error ${Class name not set error}
    Wait until class is saved

    Reload page
    # TODO Add new checks that class has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${single_language_fi}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:subClassOf"]}     value=${DEFAULT DATAMODEL PREFIX}_${single_language_fi}:${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    #Cancel show datamodel file dialog

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
    
    @{terminologies}=  Create list  
    ...  http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}
  
    Create multiple options datamodel library with api
    ...  number=${multi_language}
    ...  terminologies=@{terminologies}
    
    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL CLASS NAME}_1
    
    Create datamodel class with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL CLASS PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
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

    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en

    Input editor comment into class             editor input
    Save class
    Wait until class is saved

    Return from class

    Reload page
    # TODO Add new checks that class has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    
    #${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:label"]}]]
    #log  ${labels}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}_2_en
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}_2_sv
    
    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should Contain Value    @{comment}    description fi
    #List Should Contain Value    @{comment}    description en
    #List Should Contain Value    @{comment}    description sv
    
    #Cancel show datamodel file dialog

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
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}
    
    Open class tab
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
    Wait until class is saved

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
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

    Open class tab
    Create new class
    Create new class datamodel in dialog

    Input finnish class label                   ${DEFAULT DATAMODEL CLASS NAME}
    Input class prefix                          ${DEFAULT DATAMODEL CLASS PREFIX}
    Input editor comment into class             editor input
    Save class
    Wait until class is saved
    Verify page does contain class options button
    Verify class page does contain editor message     editor input

    [Teardown]  Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${single_language_fi}

T3C7. Verify invalid class modify errors
    ${single_language_fi}=  set variable  1
    Create single language fi datamodel with api
    ...  number=${single_language_fi}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${single_language_fi}

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
    Wait until class is saved

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
    
    @{terminologies}=  Create list  
    ...  http://uri.suomi.fi/terminology/${DEFAULT TERMINOLOGY PREFIX}
  
    Create multiple options datamodel library with api
    ...  number=${multi_language}
    ...  terminologies=@{terminologies}  

    &{label}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL CLASS NAME}_1
    
    Create datamodel class with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL CLASS PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}

    Reload Page
    
    Open class tab

    Create new class
    Create new class datamodel in dialog
    Select class concept into class         ${DEFAULT CONCEPT NAME}
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_fi
    Input class prefix            ${DEFAULT DATAMODEL CLASS PREFIX}_2
    Save class
    Wait until class is saved

    Edit class
    Input finnish class label     ${DEFAULT DATAMODEL CLASS NAME}
    Input english class label     ${DEFAULT DATAMODEL CLASS NAME}_2_en
    Input swedish class label     ${DEFAULT DATAMODEL CLASS NAME}_2_sv

    Select subclass into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1
    
    Select equivalent class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Select disjoint class into class
    Select class on linking class dialog        ${DEFAULT DATAMODEL CLASS NAME}_1  ${DEFAULT DATAMODEL CLASS PREFIX}_1

    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en
    Input editor comment into class             editor input
    Save class
    Wait until class is saved

    Return from class
    Reload page
    # TODO Add new checks that class has all valid data (YTI-3762)
    # Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][0]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}

    #${labels}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:label"]}]]
    #log  ${labels}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}_2_en
    #List Should Contain Value    @{labels}    ${DEFAULT DATAMODEL CLASS NAME}_2_sv

    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][0]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should Contain Value    @{comment}    description fi
    #List Should Contain Value    @{comment}    description en
    #List Should Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api

T3C9. Modify class remove unnesecary
    # TODO Remove skip after fixing bug or test case (YTI-3758)
    Skip
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
    ...  ${DEFAULT DATAMODEL CLASS NAME}_1
    
    Create datamodel class with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...  label=&{label}
    ...  identifier=${DEFAULT DATAMODEL CLASS PREFIX}_1
    ...  status=${VALID}

    Open datamodel search page
    Login with Admin
    Search and select datamodel ${DEFAULT DATAMODEL NAME}_${multi_language}
    
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

    Input finnish description into class        description fi
    Input swedish description into class        description sv
    Input english description into class        description en

    Input editor comment into class             editor input
    Save class
    Wait until class is saved
    
    Edit class

    Remove upper class from class
    Remove corresponding class from class
    Remove disjoint class from class
    Input finnish class label                   ${DEFAULT DATAMODEL CLASS NAME}
    Click element with wait                     ${Datamodel class label input sv}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE
    Click element with wait                     ${Datamodel class label input en}
    Press Keys                                  None  CTRL+A
    Press Keys                                  None  BACKSPACE

    Input finnish description into class        ${SPACE}
    Input swedish description into class        ${SPACE}
    Input english description into class        ${SPACE}
    Input editor comment into class             ${SPACE}

    Save Class
    Wait until class is saved
    
    Return from class

    Reload page
    # TODO Add new checks that class has all valid data (YTI-3762)
    #Select info tab
    #Open datamodel options select
    #Open show datamodel as file dialog
    #Show datamodel file
    
    #${json_dict}=  Get shown json from new tab
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}  value=${DEFAULT DATAMODEL PREFIX}_${multi_language}:${DEFAULT DATAMODEL CLASS PREFIX}_2
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]}                        value=${DRAFT}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:isDefinedBy"]}    value=http://uri.suomi.fi/datamodel/ns/${DEFAULT DATAMODEL PREFIX}_${multi_language}
    #Dictionary Should Contain Value    ${json_dict["@graph"][2]["rdfs:label"]}          value=${DEFAULT DATAMODEL CLASS NAME}
    
    #${comment}=  Evaluate  [[x["@value"] for x in ${json_dict["@graph"][2]["rdfs:comment"]}]]
    #log  ${comment}
    #List Should not Contain Value    @{comment}    description fi
    #List Should not Contain Value    @{comment}    description en
    #List Should not Contain Value    @{comment}    description sv

    [Teardown]  Run keywords
    ...    Teardown test Case delete datamodel ${DEFAULT DATAMODEL PREFIX}_${multi_language}
    ...    Delete terminology ${DEFAULT TERMINOLOGY NAME} with api
