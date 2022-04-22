*** Settings ***
Library  DateTime

*** Variables ***
${DRAFT}=                           DRAFT
${INCOMPLETE}=                      INCOMPLETE
${VALID}=                           VALID
${SUPERSEDED}=                      SUPERSEDED
${RETIRED}=                         RETIRED
${INVALID}=                         INVALID
${SUGGESTED}=                       SUGGESTED
${xxxxxxxx}=                        xxxxxxxx
${DEFAULT_ORGANIZATION_ID}          74a41211-8c99-4835-a519-7a61612b1098
${VERSION_1}                        1
${DEFAULT_INFORMATION_DOMAIN}       P1;P10;P11
${DEFAULT_INFORMATION_DOMAIN_2}     P1;P2
${INVALID_CLASIFICATION}            P1.2
${DEFAULT_DESCRIPTION_EN}           Description
${DEFAULT_DESCRIPTION_FI}           Kuvaus
${UPDATED_DESCRIPTION_FI}           Koodiston uusi kuvaus numero 2
${DEFAULT_DEFINITION_FI}            Määritelmä
${UPDATED_DEFINITION_FI}            Koodiston uusi määritelmä numero 2
${DEFAULT_DEFINITION_EN}            Definition

${CODE_LINKS}                       https://www.suomi.fi/etusivu/ | https://yle.fi/ | https://creativecommons.org/publicdomain/zero/1.0/ | https://www.suomi.fi/viestit
${UNARYOPERATOR_MINUS}              -
${UNARYOPERATOR_INVALID}            --
${COMPARISONOPERATOR}               <=

${CODELIST_URI}                     http://uri.suomi.fi/codelist

*** Keywords ***
Create missing CODEVALUE csv
    [Arguments]  ${preflabel}=${DEFAULT_PREFLABEL_SCHEME}
    
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=  
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  ID=  
    ...  INFORMATIONDOMAIN=${DEFAULT_INFORMATION_DOMAIN}
    ...  VERSION=${VERSION_1}  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel}  
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=
    ...  DEFINITION_FI=${DEFAULT_DEFINITION_FI}  
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=${DEFAULT_DEFINITION_EN}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  CHANGENOTE_FI=  
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  SOURCE=  
    ...  LEGALBASE=  
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create invalid CODEVALUE csv
    [Arguments]  ${preflabel}=${DEFAULT_PREFLABEL_SCHEME}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=Koodisto 1000  
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  ID=  
    ...  INFORMATIONDOMAIN=${DEFAULT_INFORMATION_DOMAIN}
    ...  VERSION=${VERSION_1}  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel}  
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=  
    ...  DEFINITION_FI=${DEFAULT_DEFINITION_FI}
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=${DEFAULT_DEFINITION_EN}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=  
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}
    ...  CHANGENOTE_FI=  
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  SOURCE=  
    ...  LEGALBASE=
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create missing CLASSIFICATION csv
    [Arguments]  ${codevalue}=${DEFAULT_CODELIST_SCHEME_ID}     
    ...          ${preflabel}=${DEFAULT_PREFLABEL_SCHEME}             

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue}  
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  ID=  
    ...  INFORMATIONDOMAIN=  
    ...  VERSION=${VERSION_1}
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel}  
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=  
    ...  DEFINITION_FI=${DEFAULT_DEFINITION_FI}
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=${DEFAULT_DEFINITION_EN}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  CHANGENOTE_FI=  
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=2018-04-04
    ...  ENDDATE=2030-09-09  
    ...  SOURCE=  
    ...  LEGALBASE=  
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create invalid CLASSIFICATION csv
    [Arguments]  ${codevalue}=${DEFAULT_CODELIST_SCHEME_ID} 
    ...          ${preflabel}=${DEFAULT_PREFLABEL_SCHEME}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue}  
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  ID=  
    ...  INFORMATIONDOMAIN=${INVALID_CLASIFICATION}
    ...  VERSION=${VERSION_1}  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel}  
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=  
    ...  DEFINITION_FI=${DEFAULT_DEFINITION_FI}
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=${DEFAULT_DEFINITION_EN}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=  
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}
    ...  CHANGENOTE_FI=  
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=2018-04-04  
    ...  ENDDATE=2030-09-09  
    ...  SOURCE=  
    ...  LEGALBASE=
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create invalid member csv
    [Arguments]     ${code}=testcode28  ${preflabel_fi}=Jäsen1  ${preflabel_en}=Member1
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  UNARYOPERATOR=${UNARYOPERATOR_INVALID}  
    ...  COMPARISONOPERATOR=${COMPARISONOPERATOR}  
    ...  CODE=${code}
    ...  PREFLABEL_FI=${preflabel_fi}  
    ...  PREFLABEL_EN=${preflabel_en}  
    ...  PREFLABEL_SV=  
    ...  RELATION=  
    ...  ORDER=
    ...  STARTDATE=2016-01-01  
    ...  ENDDATE=2020-01-01
    [Return]  ${csv_file_path}

Create Calc def hierarchy extensions csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

 	Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_scheme}  
    ...  STATUS=${DRAFT}  
    ...  PROPERTYTYPE=definitionHierarchy
    ...  CODESCHEMES=${CODELIST_URI}/eu/dcat  
    ...  PREFLABEL_FI=${preflabel_fi_scheme}  
    ...  PREFLABEL_EN=${preflabel_fi_scheme}_EN
    ...  STARTDATE=2016-12-31  
    ...  ENDDATE=2018-12-30

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_scheme}_2
    ...  STATUS=${DRAFT}  
    ...  PROPERTYTYPE=calculationHierarchy
    ...  CODESCHEMES=${CODELIST_URI}/eu/dcat  
    ...  PREFLABEL_FI=${preflabel_fi_scheme}_2  
    ...  PREFLABEL_EN=${preflabel_fi_scheme}_2_EN
    ...  STARTDATE=2016-12-31  
    ...  ENDDATE=2018-12-30
    [Return]  ${csv_file_path}

Create calculation hierarchy csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    FOR    ${index}    IN RANGE    1    15
        ${code_index}=      Evaluate    int(${index})
        ${preflabel_fi}=    Catenate    Jäsen${index}
        ${preflabel_en}=    Catenate    Member${index}
        ${codevalue}=       Catenate    ${codevalue_code}_${code_index}
        ${startdate}=       Convert Date  2016-01-${index} 	date_format=%Y-%m-%d  result_format=%Y-%m-%d
        ${enddate}=         Convert Date  2020-01-${index} 	date_format=%Y-%m-%d  result_format=%Y-%m-%d
        ${csv_file_path}=   Append to csv      ${TEST NAME}
        ...  UNARYOPERATOR=${UNARYOPERATOR_MINUS}  
        ...  COMPARISONOPERATOR=${COMPARISONOPERATOR}  
        ...  CODE=${codevalue}
        ...  PREFLABEL_FI=${preflabel_fi}  
        ...  PREFLABEL_EN=${preflabel_en}
        ...  PREFLABEL_SV=  
        ...  RELATION=  
        ...  ORDER=  
        ...  STARTDATE=${startdate}  
        ...  ENDDATE=${enddate}
    END
    [Return]  ${csv_file_path}

Create code status with space csv
    [Arguments]     ${registery}=test  
    ...             ${schemeCode}=600  
    ...             ${code_prefix}=testcode  
    ...             ${codecount}=31
    FOR    ${index}    IN RANGE    1    ${codecount}
        ${code_index}=      Evaluate    int(${index})
        ${preflabel}=    Catenate    ${code_prefix} ${code_index}
        ${codevalue}=       Catenate    ${code_prefix}${code_index}
        ${uri}=             Catenate    ${CODELIST_URI}/${registery}/${schemeCode}/code/${code_prefix}${code_index}
        ${status}=          catenate    ${EMPTY}  ${VALID}
        ${csv_file_path}=   Append to csv      ${TEST NAME}
        ...  CODEVALUE=${codevalue}  
        ...  URI=${uri}  
        ...  BROADER=  
        ...  STATUS=${status}  
        ...  PREFLABEL_FI=${preflabel}
        ...  SHORTNAME=  
        ...  CONCEPTURI=  
        ...  SUBCODESCHEME=  
        ...  HIERARCHYLEVEL=1  
        ...  ORDER=${index}
        ...  STARTDATE=  
        ...  ENDDATE=  
        ...  CREATED=  
        ...  MODIFIED=  
        ...  HREF=
    END
    [Return]  ${csv_file_path}

Create Code links with space csv
    [Arguments]     ${registery}=test  
    ...             ${schemeCode}=600  
    ...             ${code_prefix}=testcode  
    ...             ${codecount}=31
    FOR    ${index}    IN RANGE    1    ${codecount}
        ${code_index}=      Evaluate    int(${index})
        ${preflabel_fi}=    Catenate    ${code_prefix}_${code_index}
        ${preflabel_fi}=    Convert To Title Case   ${preflabel_fi}
        ${codevalue}=       Catenate    ${code_prefix}_${code_index}
        ${uri}=             Catenate    ${CODELIST_URI}/${registery}/${schemeCode}/code/${preflabel_fi}
        ${csv_file_path}=   Append to csv      ${TEST NAME}
        ...  CODEVALUE=${codevalue}  
        ...  URI=${uri}  
        ...  BROADER=  
        ...  STATUS=${VALID}  
        ...  PREFLABEL_FI=${preflabel_fi}
        ...  SHORTNAME=  
        ...  CONCEPTURI=  
        ...  SUBCODESCHEME=  
        ...  HIERARCHYLEVEL=1  
        ...  ORDER=${index}
        ...  STARTDATE=  
        ...  ENDDATE=  
        ...  CREATED=  
        ...  MODIFIED=  
        ...  HREF=${CODE_LINKS}
    END
    [Return]  ${csv_file_path}

Create import code missing CODEVALUE csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=   
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code missing STATUS csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code invalid STATUS csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${xxxxxxxx}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code invalid BROADER csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_1  
    ...  BROADER=${codevalue_code}_2  
    ...  ID=  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_1  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_2  
    ...  BROADER=${codevalue_code}_1  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_2  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_3  
    ...  BROADER=${codevalue_code}_1  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_3  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_4  
    ...  BROADER=${codevalue_code}_1  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_4  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE= 
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_5  
    ...  BROADER=${codevalue_code}_4
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=Koodi1004  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_6  
    ...  BROADER=${codevalue_code}_5  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_6  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_7  
    ...  BROADER=${codevalue_code}_100  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_7  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    [Return]  ${csv_file_path}

Create import code same BROADER csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=${codevalue_code}  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=2018-03-01  
    ...  ENDDATE=2025-03-01
    [Return]  ${csv_file_path}

Create import code with dublicate columns csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  STATUS2=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code with CODEVALUE column missing csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code with invalid start date csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME= 
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=xxxx  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code with invalid ID csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    
    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_1  
    ...  ID=93fdc667-9dbc-409f-ac38  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_1  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL= 
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_2  
    ...  ID=93fdc667-9dbc-409f-ac39  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_2  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_3  
    ...  ID=93fdc667-9dbc-409f-ac40  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_3  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_4  
    ...  ID=93fdc667-9dbc-409f-ac41  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_4  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_5  
    ...  ID=93fdc667-9dbc-409f-ac42  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_5  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_6  
    ...  ID=93fdc667-9dbc-409f-ac43  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_6  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_7  
    ...  ID=93fdc667-9dbc-409f-ac44  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_7  
    ...  SHORTNAME=
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code valid draft csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_8  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_8  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code with dublicate CODEVALUES csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER= 
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=
    ...  ENDDATE=

    ${csv_file_path}=    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create import code with invalid CODEVALUES csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code} 1 
    ...  BROADER=  
    ...  ID=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=2018-03-01  
    ...  ENDDATE=2025-03-01
    [Return]  ${csv_file_path}

Create import code with same ORDER csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    
    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_1  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_1 
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=1  
    ...  ORDER=1  
    ...  STARTDATE=2018-02-11  
    ...  ENDDATE=2018-09-18
    ...  CREATED=  
    ...  MODIFIED=

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_2  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_2 
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=1  
    ...  ORDER=1  
    ...  STARTDATE=2018-02-10  
    ...  ENDDATE=2018-09-17
    ...  CREATED=  
    ...  MODIFIED=
    [Return]  ${csv_file_path}

Create import code with invalid ORDER csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  SHORTNAME= 
    ...  HIERARCHYLEVEL=1  
    ...  ORDER=N  
    ...  STARTDATE=2018-02-11  
    ...  ENDDATE=2018-09-18
    ...  CREATED= 
    ...  MODIFIED=
    [Return]  ${csv_file_path}

Create import code with missing ORDER csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}  
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}  
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}  
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}  
    ...  DESCRIPTION_FI=${DEFAULT_DESCRIPTION_FI}
    ...  DESCRIPTION_EN=${DEFAULT_DESCRIPTION_EN}  
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=1  
    ...  ORDER=  
    ...  STARTDATE=2018-02-11  
    ...  ENDDATE=2018-09-18
    ...  CREATED=  
    ...  MODIFIED=
    [Return]  ${csv_file_path}

Create draft codes with BROADER csv
        [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}
        ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}
        ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}
        ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_1
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_1
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_2
    ...  BROADER=${codevalue_code}_1
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_2
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_3
    ...  BROADER=${codevalue_code}_1
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_3
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_4
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_4
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=
    ...  ENDDATE=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_5
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_5
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=  
    ...  STARTDATE=
    ...  ENDDATE=

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_code}_6
    ...  BROADER=${codevalue_code}_5
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_code}_6
    ...  SHORTNAME=  
    ...  HIERARCHYLEVEL=
    ...  STARTDATE=  
    ...  ENDDATE=
    [Return]  ${csv_file_path}

Create update sub codelist csv
    [Arguments]     ${registery}=test  ${codecheme}=200  ${code_prefix}=testcode  ${codecount}=31
    FOR    ${index}    IN RANGE    1    ${codecount}
        ${code_index}=      Evaluate    int(${index})
        ${preflabel_fi}=    Catenate    ${code_prefix}_${code_index}
        ${codevalue}=       Catenate    ${code_prefix}_${code_index}
        ${subcodecheme}=    Catenate    ${CODELIST_URI}/${registery}/${codecheme}
        ${csv_file_path}=   Append to csv      ${TEST NAME}
        ...  CODEVALUE=${codevalue}  
        ...  BROADER=  
        ...  STATUS=${DRAFT}  
        ...  PREFLABEL_FI=${preflabel_fi}  
        ...  SHORTNAME=  
        ...  CONCEPTURI=
        ...  SUBCODESCHEME=${subcodecheme}  
        ...  HIERARCHYLEVEL=1  
        ...  ORDER=${code_index}
        ...  STARTDATE=  
        ...  ENDDATE=  
        ...  CREATED=
        ...  MODIFIED=  
        ...  HREF=
    END
    [Return]  ${csv_file_path}

Create codes with special characters csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    Append to csv      ${TEST NAME}
    ...  CODEVALUE=+  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%2B
    ...  ORDER=1  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=++  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%2B%2B
    ...  ORDER=2  
    ...  BROADER=  
    ...  STATUS=${DRAFT}
    ...  SHORTNAME=  
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=*  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/*
    ...  ORDER=3  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=**  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/**
    ...  ORDER=4  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=##  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%23%23
    ...  ORDER=5  
    ...  BROADER=  
    ...  STATUS=${DRAFT}
    ...  SHORTNAME=  
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=&  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%26
    ...  ORDER=6  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI= 
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=&&  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%26%26
    ...  ORDER=7  
    ...  BROADER=  
    ...  STATUS=${DRAFT}
    ...  SHORTNAME=  
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=.  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/U%2B002E
    ...  ORDER=8  
    ...  BROADER=  
    ...  STATUS=${DRAFT}
    ...  SHORTNAME=  
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=..  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/U%2B002EU%2B002E
    ...  ORDER=9  
    ...  BROADER=  
    ...  STATUS=${DRAFT}
    ...  SHORTNAME=  
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    Append to csv      ${TEST NAME}
    ...  CODEVALUE=--  
    ...  URI=h${CODELIST_URI}/test/${codevalue_scheme}/code/--
    ...  ORDER=10  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE= 
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=

    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=#  
    ...  URI=${CODELIST_URI}/test/${codevalue_scheme}/code/%23
    ...  ORDER=11  
    ...  BROADER=  
    ...  STATUS=${DRAFT}  
    ...  SHORTNAME=
    ...  CONCEPTURI=  
    ...  SUBCODESCHEME=  
    ...  HIERARCHYLEVEL=1  
    ...  STARTDATE=  
    ...  ENDDATE=  
    ...  CREATED=2019-10-10 10:18:52
    ...  MODIFIED=2019-10-10 10:18:52  
    ...  HREF=
    [Return]  ${csv_file_path}

Create update codelist with 30 codes csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  CODEVALUE=${codevalue_scheme}
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  INFORMATIONDOMAIN=${DEFAULT_INFORMATION_DOMAIN_2}  
    ...  VERSION=${VERSION_1}
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_fi_scheme}
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=
    ...  DEFINITION_FI=${UPDATED_DEFINITION_FI}  
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=
    ...  DESCRIPTION_FI=${UPDATED_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=  
    ...  DESCRIPTION_EN=  
    ...  CHANGENOTE_FI=
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=2018-01-01  
    ...  ENDDATE=2019-01-01  
    ...  SOURCE=  
    ...  LEGALBASE=
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create invalid update codelist with 30 codes csv
    [Arguments]  ${codevalue_scheme}=${DEFAULT_CODELIST_SCHEME_ID}
    ...          ${codevalue_code}=${DEFAULT_CODELIST_CODE_ID}
    ...          ${preflabel_fi_scheme}=${DEFAULT_PREFLABEL_SCHEME}
    ...          ${preflabel_code}=${DEFAULT_PREFLABEL_CODE}
    ${csv_file_path}=   Append to csv      ${TEST NAME} 2
    ...  CODEVALUE=${codevalue_scheme}
    ...  ORGANIZATION=${DEFAULT_ORGANIZATION_ID}  
    ...  INFORMATIONDOMAIN=${DEFAULT_INFORMATION_DOMAIN_2}  
    ...  VERSION=${VERSION_1}
    ...  STATUS=${DRAFT}  
    ...  PREFLABEL_FI=${preflabel_fi_scheme}
    ...  PREFLABEL_SV=  
    ...  PREFLABEL_EN=
    ...  DEFINITION_FI=${UPDATED_DEFINITION_FI}  
    ...  DEFINITION_SV=  
    ...  DEFINITION_EN=
    ...  DESCRIPTION_FI=${UPDATED_DESCRIPTION_FI}  
    ...  DESCRIPTION_SV=  
    ...  DESCRIPTION_EN=  
    ...  CHANGENOTE_FI=
    ...  CHANGENOTE_SV=  
    ...  CHANGENOTE_EN=  
    ...  STARTDATE=2018-01-01  
    ...  ENDDATE=2019-01-01  
    ...  SOURCE=  
    ...  LEGALBASE=
    ...  GOVERNANCEPOLICY=  
    ...  LICENSE=
    [Return]  ${csv_file_path}

Create concepts from controlled vocabularies csv
    [Arguments]  ${file_name}=${TEST NAME}
    Append to csv      ${file_name}
    ...  prefLabel_fi=tutkimus  
    ...  broader_fi=tutkija  
    ...  related_fi=hutkija  
    ...  isPartOf_fi=hotkija
    ...  definition_fi=systemaattista ja luovaa toimintaa  
    ...  definition_en=  
    ...  note_fi=huomio
    ...  synonym_fi=tutkielma  
    ...  example_fi=esim  
    ...  prefLabel_en=research  
    ...  synonym_en=  
    ...  prefLabel_sv=  
    ...  status=${VALID}

    Append to csv      ${file_name}
    ...  prefLabel_fi=tutkija  
    ...  broader_fi=  
    ...  related_fi=hutkija  
    ...  isPartOf_fi=hotkija
    ...  definition_fi=henkilö joka ammattimaisesti tieteellisiä menetelmiä käyttäen tekee tutkimusta
    ...  definition_en=Person who does the research  
    ...  note_fi=Huomautus  
    ...  synonym_fi=tiedemies  
    ...  example_fi=esimerkki
    ...  prefLabel_en=researcher  
    ...  synonym_en=  
    ...  prefLabel_sv=  
    ...  status=${VALID}

    Append to csv      ${file_name}
    ...  prefLabel_fi=hutkija  
    ...  broader_fi= 
    ...  related_fi=  
    ...  isPartOf_fi=  
    ...  definition_fi=henkilö, joka hutkii ammatikseen
    ...  definition_en=  
    ...  note_fi=huomio  
    ...  synonym_fi=  
    ...  example_fi=Tämä on esimerkki  
    ...  prefLabel_en=  
    ...  synonym_en=
    ...  prefLabel_sv=  
    ...  status=${VALID}

    ${csv_file_path}=   Append to csv      ${file_name}
    ...  prefLabel_fi=hotkija  
    ...  broader_fi=  
    ...  related_fi=  
    ...  isPartOf_fi= 
    ...  definition_fi=henkilö, joka hotkii kaiken
    ...  definition_en=Person who eats everything  
    ...  note_fi=huom  
    ...  synonym_fi=ahne  
    ...  example_fi=esimerkiksi  
    ...  prefLabel_en=
    ...  synonym_en=  
    ...  prefLabel_sv=  
    ...  status=${VALID}
    [Return]  ${csv_file_path}