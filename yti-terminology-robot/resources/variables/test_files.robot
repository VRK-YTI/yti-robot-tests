*** Variables ***
${test_concepts}    ${DATAFOLDER}${/}test_concepts_csv.csv
${invalid_related_concepts}    ${DATAFOLDER}${/}test_concepts_invalid_related_concepts_csv.csv
${empty_related_concepts}    ${DATAFOLDER}${/}empty_related_concepts_csv.csv
${concepts_with_empty_status}    ${DATAFOLDER}${/}test_concept_with_empty_status_csv.csv
${concepts_with_missing_status}    ${DATAFOLDER}${/}test_concept_with_missing_status_column_csv.csv
${concepts_with_invalid_column}    ${DATAFOLDER}${/}test_concepts_invalid_column_csv.csv
${concepts_with_invalid_status_value}    ${DATAFOLDER}${/}test_concepts_invalid_status_value_csv.csv
${concepts_with_duplicate_definition_columns}    ${DATAFOLDER}${/}test_concepts_duplicate_definition_columns_csv.csv
${concepts_with_isPartOf_and_status}    ${DATAFOLDER}${/}test_concepts_to_thesaurus_with_isPartOf_status_csv.csv
${test_concepts_to_thesaurus}    ${DATAFOLDER}${/}test_concept_import_to_thesaurus_csv.csv
${test_concepts_to_thesaurus_invalid_column}    ${DATAFOLDER}${/}test_concepts_thesaurus_invalid_column_name_csv.csv
${test_concepts_to_thesaurus_incorrect_column}    ${DATAFOLDER}${/}test_concepts_thesaurus_incorrect_column_name_csv.csv
${test_concepts_for_status_filter}    ${DATAFOLDER}${/}test_concepts_filter_csv.csv
${test_concepts_for_status_filter_2}    ${DATAFOLDER}${/}test_concepts_filter_2_csv.csv
${concept_reference}    ${DATAFOLDER}${/}Concept_reference_csv.csv

#xml paths
${tax}            ${DATAFOLDER}${/}Verotussanasto_xml.xml
${Concepts_with_dropped_items}    ${DATAFOLDER}${/}Concepts_with_dropped_items_xml.xml
${Concepts_with_semicolon_delimiter}    ${DATAFOLDER}${/}test_concepts_semicolon_delimiter_csv.csv