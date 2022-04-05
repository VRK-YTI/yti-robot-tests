# Legacy tests
Folder contains tests for old yti terminology, datamodel, codelist, groupmanagement and comments UI. These are being replaced with new ui, but old ones will still be in use for sometime.

Will contain some duplicate code with new ui, but in long run all the old tests and code should be removed when UI is not in use anymore.

# Environment URLS
* Dev
    * Groupmanagement:  https://rhp.dev.yti.cloud.vrk.fi/
    * Comments:         https://kommentit.dev.yti.cloud.vrk.fi/
    * datamodels:       https://tietomallit.dev.yti.cloud.vrk.fi/
    * Codelists:        https://koodistot.dev.yti.cloud.vrk.fi/
* test
    * Groupmanagement:  https://rhp.test.yti.cloud.vrk.fi/
    * Comments:         https://kommentit.test.yti.cloud.vrk.fi/
    * datamodels:       https://tietomallit.test.yti.cloud.vrk.fi/
    * Codelists:        https://koodistot.test.yti.cloud.vrk.fi/

# Example run command
    ```
    python -m robot.run --variable BROWSER:chrome-local --variable EDUUNI_EMAIL_PASSWORD:salasana --variable CHROME_DRIVER_PATH:chromedriver.exe --variable HEADLESS:True -d test_reports --include "regression" tests
    ```