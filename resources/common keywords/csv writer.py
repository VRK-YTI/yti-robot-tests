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