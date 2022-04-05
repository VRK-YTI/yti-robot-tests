*** Settings ***
Documentation     Resource file for User right management application
Library           SeleniumLibrary

*** Variables ***
${LANGUAGE_EN}                  id=en_available_language
${LANGUAGE_FI}                  id=fi_available_language

${ORGANIZATION_1}               Testiorganisaatio
#Buttons and links
${INFORMATION_LINK}             id=information_link
${NAVIGATION_MENU_DDL}          id=app_menu_dropdown
${LANGUAGE_DROPDOWN_BTN}        id=lang_selection_dropdown
${FRONTPAGE_SEARCH_BOX}         id=search_organization_input
${EDIT_ORGANIZATION_BTN}        id=edit_organization_button
${NAVIGATION_MENU_DDL}          id=app_menu_dropdown
${EUPL_LICENCE_LINK}            id=license_link

*** Keywords ***
Restore Finnish language
    Click Element with wait     ${LANGUAGE_DROPDOWN_BTN}
    Click Element with wait     ${LANGUAGE_FI}
    Wait Until Page Contains    ORGANISAATIOT                   timeout=20
    Wait Until Page Contains    KÄYTTÄJÄT                       timeout=20

Select navigation menu link
    [Arguments]    ${navigation_menu_link}
    Click Element with wait     ${NAVIGATION_MENU_DDL}
    Click Element with wait     //*[contains(text(), "${navigation_menu_link}")]
