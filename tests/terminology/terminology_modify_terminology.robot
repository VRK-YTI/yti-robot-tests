*** Settings ***
Force Tags           T7  IGNORE
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T7C1. Verify modify terminology button permissions
    # Luo sanasto kaikilla tiedoilla
    # Avaa sanasto
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä ilman oikeuksia
    # Tarkista, että muokkaus painiketta ei näy
    #
    # Kirjaudu sisään käyttäjällä, jolla on oikeudet
    # Varmista, että muokkaus painike näkyy
    # Paina muokkausta
    # Lopeta muokkaus kesken
    # Poista sanasto
    No operation

T7C2. Modify terminology
    # Luo sanasto kaikilla tiedoilla
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
    # Muokkaa kaikki tiedot ja lisää kenttiin ja lisää useampia vaihtoehtoja (kieli, alue, tietoalue)
    # Tarkista tiedot
    #
    # Poista sanasto
    No operation

T7C3. Verify modify terminology errors
    # Luo sanasto kaikilla tiedoilla
    # Avaa sanasto
    # Aloita muokkaus
    #
    # Poista kieli
    # Tarkista virhe ilmoitus
    # Valitse kieli, mutta jätä se tyhjästi
    # Tarkista virhe ilmoitus 
    # Anna kieli uudestaan
    #
    # Poista status
    # Tarkista virhe ilmoitus
    # Anna status takaisin
    #
    # Poista tietoalue
    # Tarkista virhe ilmoitus
    # Anna tietoalue takaisin
    #
    # Poista Sisällöntuottajat
    # Tarkista virhe ilmoitus
    # Anna Sisällöntuottajat takaisin
    #
    # Poista sanasto
    No operation

