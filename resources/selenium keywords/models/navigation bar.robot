*** Variables ***
${search box top bar}               //*[@role="searchbox"]
${Language dropdown}                //button[text()="Suomeksi (FI)"] | //button[text()="In English (EN)"] | //button[text()="På svenska (SV)"]
${Language finnish from dropdown}   //div[text()="Suomeksi (FI)"]  
${Language english from dropdown}   //div[text()="In English (EN)"]  
${Language swedish from dropdown}   //div[text()="På svenska (SV)"]  
${Language dropdown on datamodel}                //span[contains(text(), "Sisältö kielellä")][1]
${Language finnish from dropdown on datamodel}   //li[contains(text(), "Sisältö kielellä")][1]
${Language swedish from dropdown on datamodel}   //li[contains(text(), "Sisältö kielellä")][2]
${Language english from dropdown on datamodel}   //li[contains(text(), "Sisältö kielellä")][3]
${Log out}                          //a[text()="Kirjaudu ulos"]  

*** Keywords ***
Log out user
    Click element with wait                     ${Log out} 
    Verify user is logged out

Verify user is logged out
    Wait until page does not contain element    ${Log out} 

Search from top bar
    [Arguments]           ${search text}
    Input text with wait  ${search box top bar}  ${search text}

Change language to finnish
    Select language dropdown    ${Language finnish from dropdown}

Change language to english
    Select language dropdown    ${Language english from dropdown}

Change language to swedish
    Select language dropdown    ${Language swedish from dropdown}

Select language dropdown
    [Arguments]              ${dropdown_element}  
    Sleep                    1
    Click element with wait  ${Language dropdown}
    Sleep                    2
    Click element with wait  ${dropdown_element}
    Sleep                    2


Select language dropdown on datamodel
    [Arguments]              ${dropdown_element}  
    Sleep                    1
    Click element with wait  ${Language dropdown on datamodel}
    Sleep                    2
    Click element with wait  ${dropdown_element}
    Sleep                    2

Change language to finnish on datamodel
    Select language dropdown on datamodel    ${Language finnish from dropdown on datamodel}

Change language to english on datamodel
    Select language dropdown on datamodel    ${Language english from dropdown on datamodel}

Change language to swedish on datamodel
    Select language dropdown on datamodel    ${Language swedish from dropdown on datamodel}
