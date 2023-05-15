*** Variables ***
${search box top bar}               //*[@role="searchbox"]
${Language dropdown}                //button[text()="Suomeksi (FI)"] | //button[text()="In English (EN)"] | //button[text()="På svenska (SV)"]
${Language finnish from dropdown}   //div[text()="Suomeksi (FI)"]  
${Language english from dropdown}   //div[text()="In English (EN)"]  
${Language swedish from dropdown}   //div[text()="På svenska (SV)"]  
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
