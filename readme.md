YTI robot automation tests
===============================
Test automation repository for all yti projects. Root contains tests for v2 of yti project UI and legacy older versions. Currently only terminology has v2. 

Setup virtual environment
=========================

To setup virtual environment run the following commands.

```
python -m venv env
. ./env/bin/activate
```


Install dependencies
====================

Install required libraries for running tests
```
pip install -r requirements.txt
```

Download and install [chromedriver](https://chromedriver.chromium.org/downloads). Or on Linux, you can just install it from your package manager.

```
sudo apt-get install chromium-chromedriver
```

Configure environment variables
===============================

Copy `.env.dist` to `.env` and set values to secrets.

Folder structure
================
[Tests folder](tests)
____________________________
  * [setup_and_teardowns.robot](tests//setup_and_teardowns.robot)
    * File containing all setups and teardowns for robot tests
  * [Terminology](tests//Terminology)
    * Tests for new terminology ui

[Tests resouce folder](resouces)
________________________________
  * [Api keywords](resouces//api&#32;keywords)
    * Robot and python code for api usage in tests
  * [Common keywords](resouces//common&#32;keywords)
    * Robot and python code commonly used in tests
  * [Selenium keywrods](resouces//selenium&#32;keywords)
    * Robot and python selenium codes and test data
  * [Variables](resouces//variables)
    * Robot variables for tests, has folders for different environments

[Legacy test folder](legacy)  
____________________________
  * [yti-codelist-robot](legacy//yti-codelist-robot)
    * Codelist tests and resouces for old codelist UI
  * [yti-comments-robot](legacy//yti-comments-robot)
    * Comments tests and resouces for old comments UI
  * [yti-datamodel-robot](legacy//yti-datamodel-robot)
    * Datamodel tests and resouces for old datamodel UI
  * [yti-groupmanagement-robot](legacy//yti-groupmanagement-robot)
    * Groupmanagement tests and resouces for old groupmanagement UI
  * [yti-terminology-robot](legacy//yti-terminology-robot)
    * Terminology tests and resouces for old terminology UI
  * [yti-robot-robot](legacy//yti-robot-common)
    * Resouces that are used by all the old ui tests

Environment URLS for V2
================
* Dev
    * Terminology: https://sanastot.dev.yti.cloud.vrk.fi/

Robot framework run command
===========================
* Build docker with dockerfile
    ```
    docker build -t yti-robot-tests:latest .
    ```
____________________________
* run all tests on headless
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values.
    python -m robot.run -v BROWSER:headlesschrome -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -v ENVIRONMENT:dev -d test_reports tests
    ```

    or

    ```
    ./run_tests.sh headless
    ```
    or
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values. %CD%, . or absolute path on -v.
    docker run -it --rm -v "%CD%:/robot_tests/" yti-robot-tests:latest /bin/bash -c "/usr/bin/Xvfb :0 -screen 0 1920x1080x24& python3 -m robot.run -v BROWSER:headlesschrome -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -v ENVIRONMENT:dev -d test_reports tests"
    ```
____________________________
* run all tests without headless, record video and highlight element
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values.
    python -m robot.run -v BROWSER:chrome -v RECORD:True -v HIGHLIGHT_ELEMENT:True -v ENVIRONMENT:dev -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -d test_reports tests
    ```

    or

    ```
    ./run_tests.sh record
    ```
    or

    ```
    ./run_tests.sh headless
    ```
    or
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values. %CD%, . or absolute path on -v.
    docker run -it --rm -v "%CD%:/robot_tests/" yti-robot-tests:latest /bin/bash -c "/usr/bin/Xvfb :0 -screen 0 1920x1080x24& python3 -m robot.run -v BROWSER:chrome -v RECORD:True -v HIGHLIGHT_ELEMENT:True -v ENVIRONMENT:dev -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -d test_reports tests"  
    ```
____________________________
* run single test in the suite
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values.
    python -m robot.run -v BROWSER:chrome -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -v ENVIRONMENT:dev -d test_reports -t "T1C2. Select first terminology on search page" tests
    ```

    or

    ```
    ./run_tests.sh single <testname>
    ```
    or
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values. %CD%, . or absolute path on -v.
    docker run -it --rm -v "%CD%:/robot_tests/" yti-robot-tests:latest /bin/bash -c "/usr/bin/Xvfb :0 -screen 0 1920x1080x24& python3 -m robot.run -v BROWSER:chrome -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-KEY% -v ENVIRONMENT:dev -d test_reports -t 'T1C2. Select first terminology on search page' tests"
    ```

____________________________
* run legacy tests 
    ```
    # Replace %YTI-API-KEY%, %YTI-EDUUNI-PASSWORD% with wanted values. %CD%, . or absolute path on -v.
    docker run -it --rm -v "%CD%:/robot_tests/" yti-robot-tests:latest /bin/bash -c "/usr/bin/Xvfb :0 -screen 0 1920x1080x24& cd legacy/yti-groupmanagement-robot && python3 -m robot.run -v EDUUNI_EMAIL_PASSWORD:%YTI-EDUUNI-PASSWORD% -v API_KEY:%YTI-API-key% -v BROWSER:chrome-local -v CHROME_DRIVER_PATH:chromedriver -v SELENIUM_SPEED:0.2 -d test_reports --include regression tests"  
    ```