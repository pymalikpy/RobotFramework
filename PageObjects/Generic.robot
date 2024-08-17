*** Settings ***
Documentation    A resource file with usable keywords and variables.
...              The system specific keywords created here form our own domain-specific language.
...              They utilize keywords provided by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}         rahulshettyacademy
${invalid_password}  kfgdbsn
${valid_password}    learning
${error_msg}         Incorrect email or password
${url}               https://rahulshettyacademy.com/loginpagePractise/
${browser}           chrome

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text         id:username        ${username}
    Input Password     id:password        ${password}
    Click Button       id:signInBtn

Close Browser Session
    sleep    5
    Close Browser
    
Wait Until Element Is Located on the page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}    5s

