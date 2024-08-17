*** Settings ***
Documentation    Validate the login functionality
Library    SeleniumLibrary
Library    Collections
Library    DataDriver        file=resources/data.csv        encoding=utf_8        dialect=unix
Test Setup           Open the browser with url
Test Teardown        Close Browser Session
Test Template        Validate unsuccessful login
Resource    ../PageObjects/Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${Error_Message_Login}   css:.alert-danger


*** Test Cases ***
Try to Login with user ${username} and pass ${password}        fgdfhj        vhgfjhgj
    
*** Keywords ***

Validate unsuccessful login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    Wait Until Element Is Located    ${Error_Message_Login}    10s




#Validate successful login
#    Fill the login form    ${username}    ${password}
#    Wait Until Element Is Located    ${Shop_page_load}    10s

Wait Until Element Is Located
    [Arguments]    ${locator}    ${timeout}=5s
    Wait Until Element Is Visible    ${locator}    ${timeout}







