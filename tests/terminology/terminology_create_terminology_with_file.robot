*** Settings ***
Force Tags           T6  #Terminology  T6
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T6C1. Create and edit terminology with excel import
    # Kirjaudu sisään
    # Uusi sanasto excel (kaikki tiedot täytettynä)
    # Tarkista tiedot
    # Export luotu sanasto
    # Import juuri export sanasto
    # Poista sanasto
    # Tarkista tiedot
    # Muokkaa sanasto status, useampi kieli (nimi, kuvaus), useampi tietoalue, useampi organizaatio, Sanastotyyppi
    # Tarkista tiedot
    # Export luotu sanasto
    # Import juuri export sanasto
    # Poista sanasto
    # Tarkista tiedot
    # Muokkaa sanasto poista vaihtoehtoiset tiedot
    # Tarkista tiedot
    # Export luotu sanasto
    # Import juuri export sanasto
    # Poista sanasto
    # Tarkista tiedot
    # Poista sanasto
    No operation

T6C2. Create and edit concept with excel import
    # Kirjaudu sisään
    # Uusi sanasto excel käsitteellä ja termillä (kaikki tiedot täytettynä)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitettä (kaikki tiedot muokattuna)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitettä poista vaihtoehtoiset tiedot
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitteet kokonaan pois
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Poista sanasto
    No operation

T6C3. Create and edit term with excel import
    # Kirjaudu sisään
    # Uusi sanasto excel käsitteellä ja termillä (kaikki tiedot täytettynä)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston termiä (kaikki tiedot muokattuna)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston termiä poista vaihtoehtoiset tiedot
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Poista sanasto
    No operation

T6C4. Create and edit collection with excel import
    # Kirjaudu sisään
    # Uusi sanasto excel käsitekokoelmalla (kaikki tiedot täytettynä)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitekokoelmalla (kaikki tiedot muokattuna)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitekokoelmalla poista vaihtoehtoiset tiedot
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Poista sanasto
    # Muokkaa sanaston kokoelmat kokonaan pois
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    No operation

T6C5. Create and edit concept links with excel import
    # Kirjaudu sisään
    # Uusi sanasto excel käsitekokoelmalla (kaikki tiedot täytettynä)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston käsitekokoelmalla (kaikki tiedot muokattuna)
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Muokkaa sanaston concept links kokonaan pois
    # Tarkista tiedot käyttöliittymällä
    # Export luotu sanasto
    # Poista sanasto (vaihoehtoinen)
    # Import luotu export sanasto
    # Tarkista tiedot käyttöliittymällä
    # Poista sanasto
    No operation

T6C6. Add excel import file and remove it
    # Kirjaudu sisään
    # Lisää excel tiedosto
    # Poista excel tiedosto
    # Varmista, että käyttäjä ei pysty luomaan ennen uutta tiedostoa
    # Poistu sanaston luomis dialog
    No operation

T6C6. Import file without having needed permissions
    # Kirjaudu sisään
    # Import excel file jossa on tietoja joiden muokaamiseen ei ole oikeuksia
    # Tarkista virheilmoitus
    # Poistu luomis näkymästä
    No operation

T6C7. Add invalid file type to import
    # Kirjaudu sisään
    # Lisää tiedosto tyyppi, joka ei ole tuottu (png)
    # Tarkista virheilmoitus
    # Poistu luomis näkymästä
    No operation

T6C8. Refresh page while importing file
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla
    # Yritä päivittää sivu kesken excel luomista
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    No operation

T6C9. Refresh page while importing file
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla
    # Yritä päivittää sivu kesken excel luomista
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    No operation

T6C10. Refresh page while importing file
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla
    # Yritä päivittää sivu kesken excel luomista
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    No operation

T6C11. Test missing excel tabs
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla josta puuttuu välilehtiä
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Testaa kaikki 4 tab
    No operation

T6C12. Test missing excel headers
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla josta puuttuu otsikoita
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata
    No operation
    
T6C13. Test missing mandatory information on terminology
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla josta puuttuu pakollisia tietoja sanastosta
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation
    
T6C14. Test invalid information on terminology
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla jossa on väärässä muodossa tietoa
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation

T6C15. Test missing mandatory information on concept
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla josta puuttuu pakollisia tietoja käsiteestä
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation

T6C16. Test invalid information on concept
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla jossa on väärässä muodossa tietoa käsitteestä
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation

T6C17. Test missing mandatory information on concept
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla josta puuttuu pakollisia tietoja termistä
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation

T6C18. Test invalid information on term
    # Kirjaudu sisään
    # Import sanasto excel tiedostolla jossa on väärässä muodossa tietoa termistä
    # Varmista, että käyttäjä saa varoituksen
    # Hyväksy varoitus ja poistu luomisesta
    # Päätä lopulta kuinka montako testata (yksi vai useampi?)
    No operation