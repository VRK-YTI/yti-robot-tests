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
Resource          api_resources${/}codelist_api_resouces.robot
Resource          api_resources${/}comment_api_resouces.robot