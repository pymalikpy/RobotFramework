*** Settings ***
Documentation        All the page objects and keywords of landing page
Library              SeleniumLibrary

*** Variables ***
${modal}    css:.modal-body


*** Keywords ***
Fill the login form
    [Arguments]        ${username}    ${password}
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}
    Click Element      id:signInBtn

Fill the login details and select the user option

    Input Text            id:username    rahulshettyacademy
    Input Password        id:password    learning
    Click Element         css:input[value=user]
    Wait Until Element Is Located
    Click Button           okayBtn
    Wait Until Element Is Not Visible    ${modal}
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Click Element    css:.blinkingText
    Switch Window    New
    Wait Until Element Is Visible        xpath://h1

    

Wait Until Element Is Located
    Wait Until Element Is Visible    ${modal}    5s