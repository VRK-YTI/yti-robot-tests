from robot.libraries.BuiltIn import BuiltIn
import time

def get_browser_logs():
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    logs = selenium.driver.get_log('browser')
    return logs

def highlight_element(element):
    driver = element._parent
    def apply_style(s):
        driver.execute_script("arguments[0].setAttribute('style', arguments[1]);",element, s)
    original_style = element.get_attribute('style')
    apply_style("background: yellow; border: 2px solid red;")
    time.sleep(2)
    apply_style(original_style)