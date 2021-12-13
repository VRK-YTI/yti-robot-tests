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