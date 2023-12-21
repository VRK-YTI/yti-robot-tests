*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Resource              common_api_resources.robot

*** Variables ***
${STATUS_MODEL_API_POINT}=   ${DATAMODELS_URL}datamodel-api/v2/model
${DELETE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/model
${CREATE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/model
${UPDATE_MODEL_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/model/library
${CREATE_CLASS_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/class/library
${CREATE_ATTRIBUTE_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/resource/library

${CREATE_ASSOCIATION_API_POINT}=      ${DATAMODELS_URL}datamodel-api/v2/resource/library



${LANGUAGE_FI}=                 fi
${LANGUAGE_SV}=                 sv
${LANGUAGE_EN}=                 en

${AUTOMATION_ORGANIZATION}=     918448ba-3fc1-4908-aae7-096c8773ca8b
${TESTING_ORGANIZATION}=        9a7362ab-0938-462c-a645-abae08525715
${HOUSING_SERVICE}=             P1
${DEMOCRACY_SERVICE}=           P8

${DRAFT}=                    DRAFT
${VALID}=                    VALID
${SUPERSEDED}=               SUPERSEDED
${RETIRED}=                  RETIRED
${INCOMPLETE}=               INCOMPLETE
${INVALID}=                  INVALID
${SUGGESTED}=                SUGGESTED

${PROFILE}=                  PROFILE
${LIBRARY}=                  LIBRARY

${DEFAULT_STATUS}=           ${SUGGESTED}
${DEFAULT_TYPE}=             ${PROFILE}
&{DEFAULT_DESCRIPTION}=      &{EMPTY}
@{DEFAULT_LANGUAGES}=        ${LANGUAGE_FI}
@{DEFAULT_ORGANIZATIONS}=    ${AUTOMATION_ORGANIZATION}
@{DEFAULT_SERVICES}=         ${HOUSING_SERVICE}


*** Keywords ***
Create datamodel api payload from file
    [Arguments]     
    ...  ${file}
    ...  &{kwargs}
    ${json_string}=      Get File       ${file}
    ${json}=             evaluate       json.loads('''${json_string}''')    json
    FOR    ${kwarg}    IN    &{kwargs}
        set to dictionary  ${json}       ${kwarg[0]}=${kwarg[1]}
    END
    ${json_string}=      evaluate        json.dumps(${json})                 json
    [Return]        ${json_string}

Delete model ${model} with api
    ${headers}=     Create authentication header
    ${response}=    Delete      ${DELETE_MODEL_API_POINT}/${model}  headers=${headers}
    [Return]        ${response}

Change model ${model} to ${status} with api
    ${headers}=     Create authentication header
    ${response}=    Post      url=${STATUS_MODEL_API_POINT}/${model}/release?status=${status}&version=1.0.0  headers=${headers}
    [Return]        ${response}

Create datamodel with api
    [Arguments]
    ...  ${prefix}
    ...  ${labels}
    ...  ${descriptions}=&{DEFAULT_DESCRIPTION}
    ...  ${services}=${DEFAULT_SERVICES}
    ...  ${organizations}=${DEFAULT_ORGANIZATIONs}
    ...  ${languages}=${DEFAULT_LANGUAGES}
    ...  ${type}=${DEFAULT_TYPE}
    ${headers}=     Create authentication header
    ${json}=        Create datamodel api payload from file  #Create datamodel json from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_profile_create.json
    ...             label=${labels}
    ...             prefix=${prefix}
    ...             description=${descriptions}
    ...             groups=${services}
    ...             organizations=${organizations}
    ...             languages=${languages}
    ...             type=${type}
   
    ${response}=    Post         ${CREATE_MODEL_API_POINT}/${type.lower()}     headers=${headers}  data=${json}
    [Return]        ${response}

Update datamodel with api
    [Arguments]
    ...  ${prefix}
    ...  ${labels}
    ...  ${descriptions}=&{DEFAULT_DESCRIPTION}
    ...  ${services}=${DEFAULT_SERVICES}
    ...  ${organizations}=${DEFAULT_ORGANIZATIONs}
    ...  ${languages}=${DEFAULT_LANGUAGES}
    ...  ${status}=${DEFAULT_STATUS}
    ...  &{kwargs}
    ${headers}=     Create authentication header
    ${json}=        Create datamodel api payload from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_profile_update.json
    ...             label=${labels}
    ...             description=${descriptions}
    ...             groups=${services}
    ...             organizations=${organizations}
    ...             languages=${languages}
    ...             status=${status}
    ...             &{kwargs}
    ${response}=    Put         ${UPDATE_MODEL_API_POINT}/${prefix}     headers=${headers}  data=${json}
    [Return]        ${response}

Create datamodel class with api
    [Arguments]
    ...  ${prefix}
    ...  &{kwargs}
    
    ${headers}=     Create authentication header
    ${json}=        Create datamodel api payload from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_class_create.json
    ...             &{kwargs}
    log  ${json}
    ${response}=    Post         ${CREATE_CLASS_API_POINT}/${prefix}     headers=${headers}  data=${json}
    [Return]        ${response}


Create datamodel attribute with api
    [Arguments]
    ...  ${prefix}
    ...  &{kwargs}
    
    ${headers}=     Create authentication header
    ${json}=        Create datamodel api payload from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_attribute_create.json
    ...             &{kwargs}
    log  ${json}
    ${response}=    Post         ${CREATE_ATTRIBUTE_API_POINT}/${prefix}/attribute     headers=${headers}  data=${json}
    [Return]        ${response}

Create datamodel association with api
    [Arguments]
    ...  ${prefix}
    ...  &{kwargs}
    
    ${headers}=     Create authentication header
    ${json}=        Create datamodel api payload from file
    ...             ${JSON_FILE_FOLDER}${/}datamodel_association_create.json
    ...             &{kwargs}
    log  ${json}
    ${response}=    Post         ${CREATE_ASSOCIATION_API_POINT}/${prefix}/association     headers=${headers}  data=${json}
    [Return]        ${response}

Create multiple options datamodel with api
    [Arguments]  
    ...  ${number}
    ...  &{kwargs}
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    ...  ${LANGUAGE_SV}    
    ...  ${DEFAULT DATAMODEL NAME}_${number}_SV
    ...  ${LANGUAGE_EN}  
    ...  ${DEFAULT DATAMODEL NAME}_${number}_EN
    &{descriptions}=  Create dictionary  
    ...  ${LANGUAGE_FI}  
    ...  DESCRIPTION_FI
    ...  ${LANGUAGE_SV}   
    ...  DESCRIPTION_SV
    ...  ${LANGUAGE_EN} 
    ...  DESCRIPTION_EN
    @{languages}=  Create List  
    ...  ${LANGUAGE_FI}   
    ...  ${LANGUAGE_SV}    
    ...  ${LANGUAGE_EN} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    ...  ${TESTING_ORGANIZATION}
    @{services}=  Create List  
    ...  ${HOUSING_SERVICE}
    ...  ${DEMOCRACY_SERVICE}

    Create datamodel with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${number}
    ...  type=${PROFILE}
    ...  labels=&{labels}
    ...  descriptions=&{descriptions}
    ...  organizations=@{organizations}
    ...  languages=@{languages}
    ...  services=@{services}


Create multiple options datamodel library with api
    [Arguments]    
    ...  ${number}
    ...  &{kwargs}
    
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    ...  ${LANGUAGE_SV}    
    ...  ${DEFAULT DATAMODEL NAME}_${number}_SV
    ...  ${LANGUAGE_EN}  
    ...  ${DEFAULT DATAMODEL NAME}_${number}_EN
    &{descriptions}=  Create dictionary  
    ...  ${LANGUAGE_FI}  
    ...  DESCRIPTION_FI
    ...  ${LANGUAGE_SV}   
    ...  DESCRIPTION_SV
    ...  ${LANGUAGE_EN} 
    ...  DESCRIPTION_EN
    @{languages}=  Create List  
    ...  ${LANGUAGE_FI}   
    ...  ${LANGUAGE_SV}    
    ...  ${LANGUAGE_EN} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    ...  ${TESTING_ORGANIZATION}
    @{services}=  Create List  
    ...  ${HOUSING_SERVICE}
    ...  ${DEMOCRACY_SERVICE}

    Create datamodel with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${number}
    ...  type=${LIBRARY}
    ...  labels=&{labels}
    ...  descriptions=&{descriptions}
    ...  organizations=@{organizations}
    ...  languages=@{languages}
    ...  services=@{services}

Create single language fi datamodel with api
    [Arguments]    
    ...  ${number}
    ...  &{kwargs}
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    &{descriptions}=  Create dictionary  
    ...  ${LANGUAGE_FI}  
    ...  DESCRIPTION_FI    
    @{languages}=  Create List  
    ...  ${LANGUAGE_FI} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    @{services}=  Create List  
    ...  ${HOUSING_SERVICE}

    Create datamodel with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${number}
    ...  type=${LIBRARY}
    ...  labels=&{labels}
    ...  descriptions=&{descriptions}
    ...  organizations=@{organizations}
    ...  languages=@{languages}
    ...  services=@{services}
    
Update single language fi datamodel with api
    [Arguments]    
    ...  ${number}
    ...  &{kwargs}
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    &{descriptions}=  Create dictionary  
    ...  ${LANGUAGE_FI}  
    ...  DESCRIPTION_FI    
    @{languages}=  Create List  
    ...  ${LANGUAGE_FI} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    @{services}=  Create List  
    ...  ${HOUSING_SERVICE}

Create single language en datamodel with api
    [Arguments]    
    ...  ${number}
    ...  &{kwargs}
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_EN}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    @{languages}=  Create List   
    ...  ${LANGUAGE_EN} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    @{services}=  Create List  
    ...  ${DEMOCRACY_SERVICE}

    Create datamodel with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${number}
    ...  type=${PROFILE}
    ...  labels=&{labels}
    ...  descriptions=&{EMPTY}
    ...  organizations=@{organizations}
    ...  languages=@{languages}
    ...  services=@{services} 

Create invalid datamodel with api
    [Arguments]    
    ...  ${number}
    ...  &{kwargs}
    &{labels}=  Create dictionary  
    ...  ${LANGUAGE_FI}   
    ...  ${DEFAULT DATAMODEL NAME}_${number}
    @{languages}=  Create List  
    ...  ${LANGUAGE_FI} 
    @{organizations}=  Create List  
    ...  ${AUTOMATION_ORGANIZATION}
    @{services}=  Create List  
    ...  ${HOUSING_SERVICE}

    Create datamodel with api
    ...  prefix=${DEFAULT DATAMODEL PREFIX}_${number}
    ...  type=${LIBRARY}
    ...  labels=&{labels}
    ...  organizations=@{organizations}
    ...  languages=@{languages}
    ...  services=@{services}
