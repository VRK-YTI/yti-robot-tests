*** Settings ***
Force Tags           T9  IGNORE
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T9C1. Verify collection modify button permissions
    # Luo sanasto ja siihen käsitekokoelma
    # Avaa sanasto ja käsite
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä ilman oikeuksia
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä, jolla on oikeudet
    # Varmista, että muokkaus painike näkyy
    # Poista sanasto
    No operation

T9C2. Modify collection
    # Luo sanasto, 3 käsitettä ja käsitekokoelma 2 käsitteellä
    # Avaa sanasto ja käsitekokoelma
    # Muokaa käsitekokelmaa
    # Lisää kolmas käsite ja muokaa nimi/kuvaus
    # Tarkista tiedot
    #
    # Muokaa käsitekokelmaa
    # Poista kaikki käsiteet
    # Tarkista tiedot
    # Poista sanasto
    No operation

T9C3. Verify collection errors
    # Luo sanasto, käsitekokoelma
    # Avaa sanasto ja käsitekokoelma
    # Muokaa käsitekokelmaa
    # Poista nimi
    # Tarkista virhe
    # Palauta nimi
    #
    # Poista kuvaus
    # Tarkista virhe
    # Palauta kuvaus
    # 
    # Poista nimi ja kuvaus
    # Tarkista virhe
    # Palauta nimi ja kuvaus
    # 
    # Poista sanasto
    No operation
