*** Settings ***
Documentation        All the page objects and keywords of shopping page
Library              SeleniumLibrary
Library              ../customLibraries/Shop.py
Library               Collections
Library               String

*** Variables ***
${Shop_page_load}        css:.nav-link
@{expectedList}        iphone X    Samsung Note 8    Nokia Edge    Blackberry

*** Keywords ***
Fill the login form
    [Arguments]        ${username}    ${password}
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}
    Click Element      id:signInBtn
    
Wait Until Element Is Located
    Wait Until Element Is Visible    ${Shop_page_load}    5s
    Hello World

Verify Card Titles In Shop Page
    ${elements}=    Get WebElements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log    ${text}
        Append To List    ${actualList}    ${text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}


Select the card
    [Arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath: (//*[@class='card-footer'])[${index}]/button
