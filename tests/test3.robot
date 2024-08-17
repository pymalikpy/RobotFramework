*** Settings ***
Documentation    To add a product to the cart
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the browser with url
Test Teardown    Close browser session
Resource    ../PageObjects/Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${Error_Message_Login}   css:.alert-danger


*** Test Cases ***
Add product to the cart
    [Tags]    Smoke
    [Documentation]
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is Located    ${Shop_page_load}    10s
#    Verify Card titles in the shop page
    Select the card    Blackberry

Select the form and navigate to Child window
    Fill the login details and select the user option



*** Keywords ***

Select the card
    [Arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath: (//*[@class='card-footer'])[${index}]/button

Wait Until Element Is Located
    [Arguments]    ${locator}    ${timeout}=5s
    Wait Until Element Is Visible    ${locator}    ${timeout}



Fill the login details and select the user option
    Input Text            id:username    rahulshettyacademy
    Input Password        id:password    learning
    Click Element         css:input[value=user]
    Wait Until Element Is Located    css:.modal-body
#    Click Button    id:okayBtn
    Click Element         okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms




