# yti-robot-tests
# Example run command
python -m robot.run --variable BROWSER:chrome-local --variable CHROME_DRIVER_PATH:driver\chromedriver.exe --variable HEADLESS:False -d test_reports --include "regression AND 200" tests