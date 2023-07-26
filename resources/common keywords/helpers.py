from robot.libraries.BuiltIn import BuiltIn
import os


def verify_list_contains_key_and_value(_list, key, value):
    print(_list, key, value)
    for item in _list:
        if key in item.keys() and item[key] == value:
            return True
    raise ValueError('Key and value pair not found from list')


def debug_ask_for_keyword(debug_screenshot_path="debug screenshot"):
    """
    Debug helper that can be added anywhere in robot code to test different keywords

    :param debug_screenshot_path: Path for debug screenshots
    :return:
    """
    counter = 1
    BuiltIn().log_to_console('\n')
    while True:
        BuiltIn().log_to_console('Enter keyword to run (type "end" to stop): ')
        keyword = input()
        if keyword == "end":
            break
        keyword_name = keyword.split("  ")[0]
        keyword_variables = keyword.split("  ")[1:]
        try:
            value = BuiltIn().run_keyword(keyword_name, *keyword_variables)
            value_name = "${" + "debug value {}" + "}".format(str(counter))
            BuiltIn().set_suite_variable(value_name, value)
            BuiltIn().log_to_console("{} saved as variable {}".format(str(value), str(value_name)))
        except Exception as e:
            BuiltIn().log_to_console(str(e))
        BuiltIn().run_keyword('Capture Page Screenshot', '{} {}.png'.format(debug_screenshot_path, str(counter)))
        counter += 1