*** Settings ***
Force Tags           Terminology  T10  IGNORE
Resource             ../../tests/setup_and_teardowns.robot
Library              ../../resources/common keywords/helpers.py
Test Setup           Setup test Case
Test Teardown        Teardown test Case


*** Test Cases ***
T10C1. Verify copy button permissions
    # Luo sanasto kaikilla tiedoilla
    # Avaa sanasto
    # Tarkista, että kopiointi painiketta ei näy
    # Kirjaudu sisään käyttäjällä ilman oikeuksia
    # Tarkista, että kopiointi painiketta ei näy
    # Kirjaudu sisään käyttäjällä, jolla on oikeudet
    # Varmista, että kopiointi painike näkyy
    # Paina sitä ja cancel kopiointi
    # Poista kopio ja sanasto
    No operation

T10C2. Create valid copy with automatically generated prefix
    # Luo sanasto kaikilla tiedoilla
    # Kirjaudu sisään
    # Avaa sanasto
    # Luo kopio
    # Tarkista kopion tiedot
    # Poista kopio ja sanasto
    No operation

T10C3. Create valid copy with own prefix
    # Luo sanasto kaikilla tiedoilla
    # Kirjaudu sisään
    # Avaa sanasto
    # Luo kopio omalla tunnuksella
    # Tarkista kopion tiedot
    # Poista kopio ja sanasto
    No operation

T10C4. Verify copy dialog errors
    # Luo sanasto kaikilla tiedoilla
    # Kirjaudu sisään
    # Avaa sanasto
    # Avaa kopiointi dialog
    # Jätä oma tunnus tyhjäksi
    # Varmista virhe
    # Anna virheellinen tunnus
    # Varmista virhe
    # Anna valid tunnus
    # Luo kopio
    # Poista kopio ja sanasto
    No operation