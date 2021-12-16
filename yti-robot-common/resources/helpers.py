from robot.libraries.BuiltIn import BuiltIn


def get_browser_logs():
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    logs = selenium.driver.get_log('browser')
    return logs


def parse_comment_round_urls_with_label(json, label):
    comment_rounds = [x["commentRounds"] for x in json["results"]]
    comment_round_urls = [[y["url"] for y in x if label == y["label"]] for x in comment_rounds]
    comment_round_urls = sum(comment_round_urls, [])
    return comment_round_urls


def debug_ask_for_keyword(debug_screenshot_path="debug screenshot"):
    """
    Debug helper that can be added anywhere in robot code to test different keywords for test

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