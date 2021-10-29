*** Settings ***
Library           SeleniumLibrary
Library           String

Library           ImapLibrary
Library           Collections

Resource          common_keywords.robot
Resource          generic_keywords.robot
Resource          environment_variables.robot
Resource          api_resources${/}datamodel_api_resouces.robot
Resource          api_resources${/}terminology_api_resouces.robot
Resource          api_resources${/}common_api_resources.robot