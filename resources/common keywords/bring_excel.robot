*** Settings ***
Library   excelwriter.py


*** Keywords ***
Create valid status concept excel
    Append to excel  Sheet1
    ...  prefLabel_fi=${DEFAULT CONCEPT NAME}
    ...  altLabel_fi= altLabel_fi
    ...  notRecommendedSynonym_fi=notRecommendedSynonym_fi
    ...  status=DRAFT
    ...  definition_fi=definition_fi
    ...  note_fi=note_fi
    ...  example_fi=example_fi
    ...  related=  	
      
    ${excel_file_path}=   Write excel    ${TEST NAME}  
    [Return]  ${excel_file_path}

Create valid status concept excel with 100 concepts
    FOR    ${counter}    IN RANGE    0    100
        Append to excel  Sheet1
        ...  prefLabel_fi=${DEFAULT CONCEPT NAME}_${counter}
        ...  altLabel_fi= altLabel_fi
        ...  notRecommendedSynonym_fi=notRecommendedSynonym_fi
        ...  status=DRAFT
        ...  definition_fi=definition_fi
        ...  note_fi=note_fi
        ...  example_fi=example_fi
        ...  related= 
    END
 	
    ${excel_file_path}=   Write excel    ${TEST NAME}  
    [Return]  ${excel_file_path}

Create missing status concept excel
    Append to excel  Sheet1
    ...  prefLabel_fi=preflable_fi
    ...  altLabel_fi=altLabel_fi
    ...  notRecommendedSynonym_fi=notRecommendedSynonym_fi
    ...  status=
    ...  definition_fi= definition_fi
    ...  note_fi=note_fi
    ...  example_fi=example_fi 
    ...  related=  	
      
    ${excel_file_path}=   Write excel    ${TEST NAME}  
    [Return]  ${excel_file_path}

Create missing preflable_fi concept excel
    Append to excel  Sheet1
    ...  prefLabel_fi=
    ...  altLabel_fi=
    ...  notRecommendedSynonym_fi=
    ...  status=DRAFT
    ...  definition_fi=
    ...  note_fi=
    ...  example_fi= 
    ...  related=  	
      
    ${excel_file_path}=   Write excel    ${TEST NAME}  
    [Return]  ${excel_file_path}

Create missing language concept excel
    Append to excel  Sheet1
    ...  prefLabel_fi=
    ...  prefLabel_sv=  
    ...  prefLabel_en=  
    ...  altLabel_fi= 
    ...  altLabel_sv= 
    ...  altLabel_en=
    ...  notRecommendedSynonym_fi=  
    ...  notRecommendedSynonym_sv=  
    ...  notRecommendedSynonym_en=
    ...  status=  
    ...  definition_fi=  
    ...  definition_sv=
    ...  definition_en=  
    ...  note_fi=  
    ...  note_sv=  
    ...  note_en=  
    ...  example_fi=  
    ...  example_sv=
    ...  example_en= 
    ...  related=  	
      
    ${excel_file_path}=   Write excel    ${TEST NAME}  
    [Return]  ${excel_file_path}