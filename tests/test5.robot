*** Settings ***
Documentation    Validating login functionality
Library        SeleniumLibrary
Library        Collections
Test Setup    Open the browser with url
Test Teardown    Close browser session
Test Template    Validate unsuccessful login
Resource    ../PageObjects/Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${Error_Message_Login}   css:.alert-danger


*** Test Cases ***        username        password
Invalid username          ghbjh           learning
Invalid password          rahulshetty     ghfgjfdgf
Special characters        @!@             learning


*** Keywords ***

Validate unsuccessful login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${user_name}    ${invalid_password}
    Wait Until Element Is Located    ${Error_Message_Login}    10s

Validate successful login
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is Located    ${Shop_page_load}    10s

Wait Until Element Is Located
    [Arguments]    ${locator}    ${timeout}=5s
    Wait Until Element Is Visible    ${locator}    ${timeout}







