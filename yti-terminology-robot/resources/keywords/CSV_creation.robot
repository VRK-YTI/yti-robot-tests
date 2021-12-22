*** Variables ***
${DRAFT}=            DRAFT
${INCOMPLETE}=       INCOMPLETE
${VALID}=            VALID
${SUPERSEDED}=       SUPERSEDED
${RETIRED}=          RETIRED
${INVALID}=          INVALID
${SUGGESTED}=        SUGGESTED
${xxxxx}=            xxxxx

*** Keywords ***
Create terminology test concepts csv
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=tutkija  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=systemaattista ja luovaa toimintaa  note_fi=huomio  synonym_fi=tutkielma  synonym_fi=tutkielma1
    ...  example_fi=TÃ¤mÃ¤ on esimerkki  prefLabel_en=research  synonym_en=  prefLabel_sv=  status=
     Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkija  broader_fi=  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta
    ...  note_fi=Huomautus  synonym_fi=tiedemies  synonym_fi=tiedemies1  example_fi=TÃ¤mÃ¤ on esimerkki
    ...  prefLabel_en=researcher  synonym_en=  prefLabel_sv=  status=
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hutkija  broader_fi=  related_fi=hotkija  isPartOf_fi=hotkija
    ...  definition_fi=henkilÃ¶, joka hutkii ammatikseen  note_fi=huomio  synonym_fi=  synonym_fi=
    ...  example_fi=TÃ¤mÃ¤ on esimerkki  prefLabel_en=  synonym_en=  prefLabel_sv=  status=
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hotkija  broader_fi=hutkija  related_fi=hutkija  isPartOf_fi=hutkija
    ...  definition_fi=henkilÃ¶, joka hotkii kaiken  note_fi=huom  synonym_fi=ahne  synonym_fi=ahne1
    ...  example_fi=TÃ¤mÃ¤ on esimerkki  prefLabel_en=  synonym_en=  prefLabel_sv=  status=
    [Return]  ${csv_file_path}

Create terminology invalid related concepts csv
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=tutkija  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=systemaattista ja luovaa toimintaa  note_fi=huomio  synonym_fi=tutkielma  example_fi=esim
    ...  prefLabel_en=research  synonym_en=  prefLabel_sv=  status=${DRAFT}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkija  broader_fi=hutkija  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta
    ...  note_fi=Huomautus  synonym_fi=tiedemies  example_fi=esimerkki  prefLabel_en=researcher  synonym_en=
    ...  prefLabel_sv=  status=${DRAFT}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hutkija  broader_fi=joku  related_fi=joku  isPartOf_fi=joku
    ...  definition_fi=henkilÃ¶, joka hutkii ammatikseen  note_fi=huomio  synonym_fi=  example_fi=TÃ¤mÃ¤ on esimerkki
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${DRAFT}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hotkija  broader_fi=joku  related_fi=joku  isPartOf_fi=joku
    ...  definition_fi=henkilÃ¶, joka hotkii kaiken  note_fi=huom  synonym_fi=ahne  example_fi=esimerkiksi
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${DRAFT}
    [Return]  ${csv_file_path}

Create terminology empty related concepts csv
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=  related_fi=  isPartOf_fi=
    ...  definition_fi=systemaattista ja luovaa toimintaa  note_fi=huomio  synonym_fi=tutkielma  example_fi=esim
    ...  prefLabel_en=research  synonym_en=  prefLabel_sv=  status=${VALID}
    [Return]  ${csv_file_path}

Create terminology concepts with empty status csv
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=systemaattista ja luovaa toimintaa
    ...  note_fi=huomio  synonym_fi=tutkielma  synonym_fi=tutkielma1  example_fi=esim  prefLabel_en=research
    ...  synonym_en=  prefLabel_sv=  status=
    [Return]  ${csv_file_path}

Create terminology concepts with missing status csv
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=systemaattista ja luovaa toimintaa
    ...  note_fi=huomio  synonym_fi=tutkielma  example_fi=esimerkki  prefLabel_en=research  synonym_en=study
    ...  prefLabel_sv=
    [Return]  ${csv_file_path}

Create terminology concepts with invalid column csv
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=tutkija  related_fi=hutkija  isPartOf_fi=hotkija  definition=
    ...  definition_fi=systemaattista ja luovaa toimintaa  note_fi=huomio  synonym_fi=tutkielma  example_fi=esim
    ...  prefLabel_en=research  synonym_en=  prefLabel_sv=  status=${DRAFT}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkija  broader_fi=hutkija  related_fi=hutkija  isPartOf_fi=hotkija  definition=
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta
    ...  note_fi=Huomautus  synonym_fi=tiedemies  example_fi=esimerkki  prefLabel_en=researcher  synonym_en=
    ...  prefLabel_sv=  status=${DRAFT}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hutkija  broader_fi=  related_fi=  isPartOf_fi=  definition=
    ...  definition_fi=henkilÃ¶, joka hutkii ammatikseen  note_fi=huomio  synonym_fi=  example_fi=TÃ¤mÃ¤ on esimerkki
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${DRAFT}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hotkija  broader_fi=  related_fi=  isPartOf_fi=  definition=
    ...  definition_fi=henkilÃ¶, joka hotkii kaiken  note_fi=huom  synonym_fi=ahne  example_fi=esimerkiksi
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${DRAFT}
    [Return]  ${csv_file_path}

Create terminology concepts with invalid status value csv
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=tutkija  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=systemaattista ja luovaa toimintaa  note_fi=huomio  synonym_fi=tutkielma  example_fi=esim
    ...  prefLabel_en=research  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkija  broader_fi=  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta
    ...  note_fi=Huomautus  synonym_fi=tiedemies  example_fi=esimerkki  prefLabel_en=researcher  synonym_en=
    ...  prefLabel_sv=  status=${xxxxx}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hutkija  broader_fi=  related_fi=  isPartOf_fi=
    ...  definition_fi=henkilÃ¶, joka hutkii ammatikseen  note_fi=huomio  synonym_fi=  example_fi=TÃ¤mÃ¤ on esimerkki
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${VALID}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hotkija  broader_fi=  related_fi=  isPartOf_fi=
    ...  definition_fi=henkilÃ¶, joka hotkii kaiken  note_fi=huom  synonym_fi=ahne  example_fi=esimerkiksi
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${VALID}
    [Return]  ${csv_file_path}

Create terminology concepts with duplicate definition columns csv
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkimus  broader_fi=tutkija  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=systemaattista ja luovaa toimintaa  definition_fi=systemaattista ja luovaa toimintaa2
    ...  note_fi=huomio  synonym_fi=tutkielma  example_fi=esim  prefLabel_en=research  synonym_en=  prefLabel_sv=
    ...  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=tutkija  broader_fi=  related_fi=hutkija  isPartOf_fi=hotkija
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta
    ...  definition_fi=henkilÃ¶ joka ammattimaisesti tieteellisiÃ¤ menetelmiÃ¤ kÃ¤yttÃ¤en tekee tutkimusta2
    ...  note_fi=Huomautus  synonym_fi=tiedemies  example_fi=esimerkki  prefLabel_en=researcher  synonym_en=
    ...  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hutkija  broader_fi=  related_fi=  isPartOf_fi=
    ...  definition_fi=henkilÃ¶, joka hutkii ammatikseen  definition_fi=henkilÃ¶, joka hutkii ammatikseen2
    ...  note_fi=huomio  synonym_fi=  example_fi=TÃ¤mÃ¤ on esimerkki  prefLabel_en=  synonym_en=  prefLabel_sv=
    ...  status=${VALID}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=hotkija  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=henkilÃ¶, joka hotkii kaiken
    ...  definition_fi=henkilÃ¶, joka hotkii kaiken2  note_fi=huom  synonym_fi=ahne  example_fi=esimerkiksi
    ...  prefLabel_en=  synonym_en=  prefLabel_sv=  status=${VALID}
    [Return]  ${csv_file_path}

Create terminology test concepts for status filter csv
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Merkurius  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=Merkuriuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mercury  synonym_en=  prefLabel_sv=  status=${DRAFT}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Venus  broader_fi=Merkurius  related_fi=  isPartOf_fi=  definition_fi=Venuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Venus  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Maa  broader_fi=Venus  related_fi=  isPartOf_fi=  definition_fi=Maan mÃ¤Ã¤ritelmÃ¤  note_fi=
    ...  synonym_fi=  example_fi=  prefLabel_en=Earth  synonym_en=  prefLabel_sv=  status=${SUGGESTED}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Mars  broader_fi=Maa  related_fi=Maa  isPartOf_fi=  definition_fi=Marsin mÃ¤Ã¤ritelmÃ¤  note_fi=
    ...  synonym_fi=  example_fi=  prefLabel_en=Mars  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Jupiter  broader_fi=Mars  related_fi=  isPartOf_fi=  definition_fi=Jupiterin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Jupiter  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Saturnus  broader_fi=Jupiter  related_fi=  isPartOf_fi=  definition_fi=Saturnuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Saturn  synonym_en=  prefLabel_sv=  status=${SUPERSEDED}
    Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Uranus  broader_fi=Saturnus  related_fi=  isPartOf_fi=  definition_fi=Uranuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Uranus  synonym_en=  prefLabel_sv=  status=${RETIRED}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  prefLabel_fi=Neptunus  broader_fi=Uranus  related_fi=  isPartOf_fi=Saturnus
    ...  definition_fi=Neptunuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Neptune
    ...  synonym_en=  prefLabel_sv=  status=${INVALID}
    [Return]  ${csv_file_path}

Create terminology test concepts for status filter 2 csv
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Merkurius  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=Merkuriuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mercury  synonym_en=  prefLabel_sv=  status=${DRAFT}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Venus  broader_fi=Merkurius  related_fi=  isPartOf_fi=  definition_fi=Venuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Venus  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Maa  broader_fi=Venus  related_fi=  isPartOf_fi=  definition_fi=Maan mÃ¤Ã¤ritelmÃ¤  note_fi=
    ...  synonym_fi=  example_fi=  prefLabel_en=Earth  synonym_en=  prefLabel_sv=  status=${SUGGESTED}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Mars  broader_fi=Maa  related_fi=Maa  isPartOf_fi=  definition_fi=Marsin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mars  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Jupiter  broader_fi=Mars  related_fi=  isPartOf_fi=  definition_fi=Jupiterin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Jupiter  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Saturnus  broader_fi=Jupiter  related_fi=  isPartOf_fi=
    ...  definition_fi=Saturnuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Saturn
    ...  synonym_en=  prefLabel_sv=  status=${SUPERSEDED}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Uranus  broader_fi=Saturnus  related_fi=  isPartOf_fi=
    ...  definition_fi=Uranuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Uranus  synonym_en=
    ...  prefLabel_sv=  status=${RETIRED}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Neptunus  broader_fi=Uranus  related_fi=  isPartOf_fi=Saturnus
    ...  definition_fi=Neptunuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Neptune
    ...  synonym_en=  prefLabel_sv=  status=${INVALID}
    [Return]  ${csv_file_path}

Create terminology concept reference csv
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Merkurius  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=Merkuriuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mercury  synonym_en=  prefLabel_sv=  status=${DRAFT}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Venus  broader_fi=Merkurius  related_fi=  isPartOf_fi=  definition_fi=Venuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Venus  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Maa  broader_fi=Venus  related_fi=  isPartOf_fi=  definition_fi=Maan mÃ¤Ã¤ritelmÃ¤  note_fi=
    ...  synonym_fi=  example_fi=  prefLabel_en=Earth  synonym_en=  prefLabel_sv=  status=${SUGGESTED}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Mars  broader_fi=Maa  related_fi=Maa  isPartOf_fi=  definition_fi=Marsin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mars  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Jupiter  broader_fi=Mars  related_fi=  isPartOf_fi=  definition_fi=Jupiterin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Jupiter  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Saturnus  broader_fi=Jupiter  related_fi=  isPartOf_fi=
    ...  definition_fi=Saturnuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Saturn  synonym_en=
    ...  prefLabel_sv=  status=${SUPERSEDED}
    Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Uranus  broader_fi=Saturnus  related_fi=  isPartOf_fi=  definition_fi=Uranuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Uranus  synonym_en=  prefLabel_sv=  status=${RETIRED}
    ${csv_file_path}=   Append to csv      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Neptunus  broader_fi=Uranus  related_fi=  isPartOf_fi=Saturnus
    ...  definition_fi=Neptunuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Neptune  synonym_en=
    ...  prefLabel_sv=  status=${INVALID}
    [Return]  ${csv_file_path}

Create terminology Concepts with semicolon delimiter csv
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Merkurius  broader_fi=  related_fi=  isPartOf_fi=  definition_fi=Merkuriuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mercury  synonym_en=  prefLabel_sv=  status=${DRAFT}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Venus  broader_fi=Merkurius  related_fi=  isPartOf_fi=  definition_fi=Venuksen mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Venus  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Maa  broader_fi=Venus  related_fi=  isPartOf_fi=  definition_fi=Maan mÃ¤Ã¤ritelmÃ¤  note_fi=
    ...  synonym_fi=  example_fi=  prefLabel_en=Earth  synonym_en=  prefLabel_sv=  status=${SUGGESTED}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Mars  broader_fi=Maa  related_fi=Maa  isPartOf_fi=  definition_fi=Marsin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Mars  synonym_en=  prefLabel_sv=  status=${INCOMPLETE}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Jupiter  broader_fi=Mars  related_fi=  isPartOf_fi=  definition_fi=Jupiterin mÃ¤Ã¤ritelmÃ¤
    ...  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Jupiter  synonym_en=  prefLabel_sv=  status=${VALID}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Saturnus  broader_fi=Jupiter  related_fi=  isPartOf_fi=
    ...  definition_fi=Saturnuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=
    ...  prefLabel_en=Saturn  synonym_en=  prefLabel_sv=  status=${SUPERSEDED}
    Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Uranus  broader_fi=Saturnus  related_fi=  isPartOf_fi=
    ...  definition_fi=Uranuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Uranus  synonym_en=
    ...  prefLabel_sv=  status=${RETIRED}
    ${csv_file_path}=   Append to csv with semicolon      ${TEST NAME}
    ...  ï»¿prefLabel_fi=Neptunus  broader_fi=Uranus  related_fi=  isPartOf_fi=Saturnus
    ...  definition_fi=Neptunuksen mÃ¤Ã¤ritelmÃ¤  note_fi=  synonym_fi=  example_fi=  prefLabel_en=Neptune  synonym_en=
    ...  prefLabel_sv=  status=${INVALID}
    [Return]  ${csv_file_path}

