from robot.libraries.BuiltIn import BuiltIn
import os
import csv
import shutil


def create_csv_append(file_name):
    with open(file_name, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',')
        fields = []
        for y, row in enumerate(spamreader):
            if y == 0:
                for item in row:
                    fields.append(item)
            else:
                items = []
                for x, item in enumerate(row):
                    items.append(f'{fields[x]}={item}')
                print("    ${csv_file_path}=   Append to csv      ${TEST NAME}")
                print("    ...  " + "  ".join(items))


def delete_csv_folder():
    output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")
    suite_name = BuiltIn().get_variable_value("${SUITE NAME}")
    csv_dir = os.path.join(output_dir, suite_name)
    if os.path.isdir(csv_dir):
        shutil.rmtree(csv_dir, ignore_errors=True)


def append_to_csv(file_name, **kwargs):
    file_name = file_name.replace("/", "_")
    file_name = file_name.replace("\\", "_")
    output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")
    suite_name = BuiltIn().get_variable_value("${SUITE NAME}")
    csv_dir = os.path.join(output_dir, suite_name)
    file_path = os.path.join(csv_dir, file_name+".csv")

    if not os.path.isdir(csv_dir):
        os.makedirs(csv_dir)
    if not os.path.isfile(file_path):
        with open(file_path, 'a', newline='') as f:
            writer = csv.writer(f)
            fields = [key if not key[-1].isdigit() else key[:-1]
                      for key in kwargs.keys()]
            writer.writerow(fields)

    data_to_add = []
    for field in kwargs:
        data_to_add.append(kwargs[field])

    with open(file_path, 'a', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(data_to_add)

    return file_path


def Append_to_csv_with_semicolon(file_name, **kwargs):
    output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")
    suite_name = BuiltIn().get_variable_value("${SUITE NAME}")
    csv_dir = os.path.join(output_dir, suite_name)
    file_path = os.path.join(csv_dir, file_name+".csv")

    if not os.path.isdir(csv_dir):
        os.makedirs(csv_dir)
    if not os.path.isfile(file_path):
        with open(file_path, 'a', newline='') as f:
            writer = csv.writer(f, delimiter=';')
            fields = [key if not key[-1].isdigit() else key[:-1]
                      for key in kwargs.keys()]
            writer.writerow(fields)

    data_to_add = []
    for field in kwargs:
        data_to_add.append(kwargs[field])

    with open(file_path, 'a', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(data_to_add)

    return file_path


def get_browser_logs():
    try:
        selenium = BuiltIn().get_library_instance('SeleniumLibrary')
        logs = selenium.driver.get_log('browser')
        for log in logs:
            if (log["level"] == "SEVERE" and "fse.eduuni.fi" not in log["message"] and "login.microsoftonline.com" not in log["message"] 
                and "login.live.com" not in log["message"]):
                BuiltIn().log(log, "WARN", formatter="repr")
            else:
                BuiltIn().log(log)
    except:
        pass

def log_element_texts(elements_to_find):
    import time
    time.sleep(5)
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    elements = selenium.get_webelements(elements_to_find)
    for element in elements:
        BuiltIn().log(element.text)

def parse_comment_round_urls_with_label(json, label):
    comment_rounds = [x["commentRounds"] for x in json["results"]]
    comment_round_urls = [[y["url"] for y in x if label == y["label"]] for x in comment_rounds]
    comment_round_urls = sum(comment_round_urls, [])
    return comment_round_urls


def parse_terminology_urls_with_value(json, value):
    terminology_ids = [x["id"] for x in json if x["properties"]["prefLabel"][0]["value"] == value]
    return terminology_ids


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