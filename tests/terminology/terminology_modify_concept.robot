*** Settings ***
Force Tags           T8  IGNORE
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T8C1. Verify concept modify button permissions
    # Luo sanasto ja siihen käsite kaikilla tiedoilla
    # Avaa sanasto ja käsite
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä ilman oikeuksia
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä, jolla on oikeudet
    # Varmista, että muokkaus painike näkyy
    # Aloita muokkaus ja lopeta se
    # Poista sanasto
    No operation

T8C2. Modify concept
    # Luo sanasto ja käsite kaikkilla tiedoilla
    # Avaa sanasto
    #
    # Aloita muokkaus
    # Muokkaa kaikkia tietoja
    # Tarkista tiedot
    #
    # Aloita muokkaus
    # Poista kaikki valinnaiset tiedot
    # Tarkista tiedot
    #
    # Aloita muokkaus
    # Muokkaa kaikki tiedot ja lisää kenttiin ja lisää useampia vaihtoehtoja
    # Tarkista tiedot
    #
    # Poista sanasto
    No operation

T8C2. Modify terms
    # Luo sanasto ja käsite kaikkilla tiedoilla ja useammalla termillä
    # Avaa sanasto
    #
    # Aloita muokkaus
    # Muokkaa kaikkien termien tietoja
    # Tarkista tiedot
    #
    # Aloita muokkaus
    # Poista kaikki valinnaiset termien tiedot
    # Tarkista tiedot
    # 
    # Aloita muokkaus
    # Poista kaikki termit
    # Tarkista tiedot
    #
    # Aloita muokkaus
    # Muokkaa kaikki termien tiedot ja lisää useampia termejä
    # Tarkista tiedot
    #
    # Poista sanasto
    No operation

T8C3. Verify modify concept errors
    # Luo sanasto ja termi kaikilla tiedoilla
    # Avaa sanasto
    # Aloita muokkaus
    #
    # Poista kaikki pakolliset tiedot
    # Tarkista virheet
    # Palauta pakolliset tiedot
    #
    # Lisää kenttiä jotka vaativat tekstiä lisäämisen jälkeen (muistiinpano jne.)
    # Jätä kentät tyhjiksi
    # Tarkista virheet
    # Poista kentät
    #
    # Muokkaa käsite
    #
    # Poista sanasto
    No operation

T8C4. Verify modify term errors
    # Luo sanasto kaikilla tiedoilla
    # Avaa sanasto
    # Aloita muokkaus
    #
    # Tarkista, että yksitäistä suositeltavaa termiä ei pysty vaihtamaan
    # 
    # Poista kaikki pakolliset tiedot
    # Tarkista virheet
    # Lisää kenttiä jotka vaativat tekstiä lisäämisen jälkeen (muistiinpano jne.)
    # Jätä kentät tyhjiksi
    # Tarkista virheet
    # Poista kentät
    #
    # Muokkaa käsite
    #
    # Poista sanasto
    No operation
