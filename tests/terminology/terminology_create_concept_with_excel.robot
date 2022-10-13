*** Settings ***
Force Tags           T11  IGNORE
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T11C1. Verify creat concept with excel button permissions
    # Luo sanasto kaikilla tiedoilla
    # Avaa sanasto
    # Tarkista, että käsitteen tuomis painiketta ei näy
    # Kirjaudu sisään käyttäjällä ilman oikeuksia
    # Tarkista, että käsitteen tuomis painiketta ei näy
    # Kirjaudu sisään käyttäjällä, jolla on oikeudet
    # Varmista, että käsitteen tuomis painike näkyy
    # Paina sitä ja cancel käsitteen tuomis
    No operation

T11C2. Create valid concepts with excel file
    # Luo sanasto kaikilla tiedoilla (useammalla kielellä)
    # Kirjaudu sisään
    # Avaa sanasto
    # Tuo käsitteitä 1 kappale kaikilla tiedoilla useammalla rivillä
    # Tarkista käsitteiden tiedot
    # Tuo käsitteitä 100 käsitettä eri tiedoilla vain yksi rivi
    # Tarkista parin käsitteen tiedot
    # Tarkista käsitteiden haku näkymä (määrä jne.)
    # Poista sanasto
    No operation

T11C3. Verify invalid excel files
    # Luo sanasto kaikilla tiedoilla (useammalla kielellä)
    # Kirjaudu sisään
    # Avaa sanasto
    # Tuo käsite jossa ei ole preflabel ollenkaan
    # Tarkista virhe
    # Tuo käsite, jonka kieli puuttuu sanastosta
    # Tarkista virhe
    # Tuo käsite, jolla on väärä status
    # Tarkista virhe
    # Poista sanasto
    No operation
