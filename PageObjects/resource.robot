*** Settings ***
Documentation    A resource file with usable keywords and variables.
...              The system specific keywords created here form our own domain-specific language.                
...              They utilize keywords provided by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}         prince.malik+feature1@kitomba.com
${invalid_password}  featuree
${valid_password}    feature1
${error_msg}         Incorrect email or password

*** Keywords ***
Open the browser with Kitomba url
    Open Browser    https://yak.www.test.kitomba.com/k1/    chrome
    Maximize Browser Window

Fill the login form
    [Arguments]        ${username}    ${password}
    Input Text         id:login    ${username}
    Input Password     id:password ${password}
    Click Button       login_form_submit

Close Browser Session
    Close Browser
