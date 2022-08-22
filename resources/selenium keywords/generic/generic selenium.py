from robot.libraries.BuiltIn import BuiltIn
import time

def print_console_logs():
    try:
        selenium = BuiltIn().get_library_instance('SeleniumLibrary')
        logs = selenium.driver.get_log('browser')
        for log in logs:
            if (log["level"] == "SEVERE" and "fse.eduuni.fi" not in log["message"] and "login.microsoftonline.com" not in log["message"] 
                and "frontend/subscriptions" not in log["message"] and "login.live.com" not in log["message"]):
                BuiltIn().log(log, "WARN", formatter="repr")
            else:
                BuiltIn().log(log)
    except:
        pass

def highlight_element(element):
    driver = element._parent
    def apply_style(s):
        driver.execute_script("arguments[0].setAttribute('style', arguments[1]);",element, s)
    original_style = element.get_attribute('style')
    apply_style("background: yellow; border: 2px solid red;")
    time.sleep(2)
    apply_style(original_style)