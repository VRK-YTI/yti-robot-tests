YTI robot automation tests
===============================
Test automation repository for all yti projects. Root contains tests for v2 of yti project UI and legacy older versions. Currently only terminology has v2. 


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
* run all tests on headless
    ```
    python -m robot.run -v BROWSER:headlesschrome -v EDUUNI_EMAIL_PASSWORD:salasana -v API_KEY:api_key -v ENVIRONMENT:dev -d test_reports tests
    ```
____________________________
* run all tests without headless, record video and highlight element
    ```
    python -m robot.run -v BROWSER:chrome -v RECORD:True -v ENVIRONMENT:dev -v EDUUNI_EMAIL_PASSWORD:salasana -v API_KEY:api_key -d test_reports tests
    ```
