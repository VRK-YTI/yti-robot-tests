*** Settings ***
Library           SeleniumLibrary
Library           String

Library           ImapLibrary
Library           Collections

Resource          common_keywords.robot
Resource          generic_keywords.robot
Resource          environment_variables.robot

Test Timeout      3 minutes