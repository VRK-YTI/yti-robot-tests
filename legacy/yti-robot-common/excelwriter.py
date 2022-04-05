from robot.libraries.BuiltIn import BuiltIn
from datetime import datetime

import os
import sys
import ntpath
import xlsxwriter

class excelwriter:
    def __init__(self):
        self.excel_information = {} 

    def append_to_excel(self, sheet, **kwargs):
        if sheet not in self.excel_information.keys():
            self.excel_information[sheet] = {}
        fields = kwargs.keys()
        for field in fields:
            for kwarg in kwargs:
                if kwarg == field:
                    if field in self.excel_information[sheet]:
                        self.excel_information[sheet][field].append(kwargs[kwarg])
                    else:
                        self.excel_information[sheet][field] = [kwargs[kwarg]]
    
    def rename_file(self, file_path):
        file_path_new = file_path
        for x in range(sys.maxsize):
            if os.path.isfile(file_path_new):
                file_path_new = file_path.replace(".xlsx", f" {x+2}.xlsx")
            else:
                return file_path_new

    def write_excel(self, file_name):
        output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")
        suite_name = BuiltIn().get_variable_value("${SUITE NAME}")
        excel_dir = os.path.join(output_dir, suite_name)
        file_path = os.path.join(excel_dir, file_name+".xlsx")

        if not os.path.isdir(excel_dir):
            os.makedirs(excel_dir)
        file_path = self.rename_file(file_path)

        workbook = xlsxwriter.Workbook(file_path)
        sheets = self.excel_information.keys()
        for sheet in sheets:
            worksheet = workbook.add_worksheet(sheet)
            fields = [key if not key[-1].isdigit() else key[:-1]
                        for key in self.excel_information[sheet].keys()]
            for number, field in enumerate(fields):
                worksheet.write(0, number, field)
                for row_number, row in enumerate(self.excel_information[sheet][field]):
                    worksheet.write(row_number+1, number, row)
        workbook.close()
        self.excel_information = {} 
        return file_path

    def create_empty_file(self, file_name):
        output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")  
        suite_name = BuiltIn().get_variable_value("${SUITE NAME}")
        excel_dir = os.path.join(output_dir, suite_name)
        file_path = os.path.join(excel_dir, file_name+".xlsx")
        if not os.path.isdir(excel_dir):
            os.makedirs(excel_dir)
        file_path = self.rename_file(file_path)
        open(file_path, 'a').close()
        #workbook = xlsxwriter.Workbook(file_path)
        #workbook.close()
        return file_path

    def read_excel_file(self, _file):
        import xlrd
    
        # Give the location of the file
        loc = (_file)

        append_strings = []
        
        # To open Workbook
        wb = xlrd.open_workbook(loc)
        for n in range(wb.nsheets):
            sheet = wb.sheet_by_index(n)
            items = {}
            for i in range(sheet.ncols):
                field = sheet.cell_value(0, i)
                for x in range(sheet.nrows):
                    if x != 0:
                        value = sheet.cell_value(x, i)
                        if field in ["STARTDATE", "ENDDATE"] and type(value) != str:
                            value = datetime(*xlrd.xldate_as_tuple(value, 0)).date()
                        elif type(value) == float:
                            value = str(int(value))
                        item = f'{field}={value}'
                        if x in items:
                            items[x].append(item)
                        else:
                            items[x] = [item]
            for item in items:
                append_string = "        Append to excel      " + wb.sheet_names()[n]
                for i in items[item]:
                    append_string += f"\n        ...  {i}"
                append_strings.append(append_string + "\n\n")
        
        head, tail = ntpath.split(_file)
        file_name = tail.replace(".xlsx", "").replace("_", " ")
        keyword_name = f"Create excel {file_name}"
        function = keyword_name + """
        [Arguments]  ${codevalue}=T100
""" + "".join(append_strings) + """        ${excel_file_path}=   Write excel    ${TEST NAME}  
        [Return]  ${excel_file_path}
        """ 
        print(function)
        print("")
        print("${excel_file_path}=", f"   {keyword_name}")

