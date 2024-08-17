*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    OperatingSystem
Test Teardown    Close Browser Session
Resource    ../PageObjects/Generic.robot

#Settings is mostly used for documentation

*** Test Cases ***
Validate UnSuccessful Login
    [Tags]    Smoke
    Open the browser with Kitomba url
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***
Open the browser with Kitomba url
    Open Browser    https://yak.www.test.kitomba.com/k1/    chrome
    Maximize Browser Window

Fill the login form
    Input Text    id:login    prince.malik@kitomba.com
    Input Password    id:password    yakfeatureee
    Click Button    login_form_submit

Wait until it checks and display error message
    Wait Until Element Is Visible    css:.loginErrs


Verify error message is correct
    Element Text Should Be    css:.loginErrs    Incorrect email or password







#*** Settings ***
#Library    SeleniumLibrary
#
#*** Variables ***
#${LOGIN_URL}    http://example.com/login
#${INVALID_USER}    invalid_user@example.com
#${INVALID_PASS}    invalid_password
#${ERROR_MSG}    Incorrect email or password
#
#*** Test Cases ***
#Test1 :: To validate the Login form
#    [Documentation]    Verify that an error message is displayed for invalid login credentials
#    Open Browser    ${LOGIN_URL}    chrome
#    Input Text    id=username    ${INVALID_USER}
#    Input Text    id=password    ${INVALID_PASS}
#    Click Button    id=login_button
#    Wait Until Element Is Visible    css:.loginErrs
#    ${result}    Get Text    css:.loginErrs
#    Should Be Equal As Strings    ${result}    ${ERROR_MSG}
#    Close Browser
#













