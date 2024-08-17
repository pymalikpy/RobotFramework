*** Settings ***
Documentation    To add a product to the cart
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open the browser with url
Test Teardown    Close browser session
Resource    ../PageObjects/Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${Error_Message_Login}   css:.alert-danger


*** Test Cases ***
Validate child window functionality
    Select the link of the child window
    Verify the user is switched to child window
    Grap the email id in the child window
    Switch to parent window and enter the email


*** Keywords ***

Select the link of the child window
    Click Element    css:.blinkingText
    Sleep         5



Verify the user is switched to child window
    Switch Window     new
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


Grap the email id in the child window
    ${text}=         Get Text         css:.red
    @{words}=        Split String     ${text}    at
    ${text_split}=   Get From List    ${words}    1
    Log                               ${text_split}
    @{words2}=       Split String     ${text_split}
    ${email}=        Get From List    ${words2}    0
    Set Global Variable    ${email}
    
        
Switch to parent window and enter the email
    Switch Window      Main
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text         id:username    ${email}
    
        

