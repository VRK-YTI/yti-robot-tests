from robot.libraries.BuiltIn import BuiltIn

def get_browser_logs():
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    logs = selenium.driver.get_log('browser')
    return logs