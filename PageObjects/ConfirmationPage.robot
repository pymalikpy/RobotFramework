*** Settings ***
Documentation        All the page objects and keywords of confirmation page
Library              SeleniumLibrary
Library              ../customLibraries/Shop.py
Library               Collections
Library               String
Resource              ../PageObjects/Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${country_location}    //a[text()='India']

*** Keywords ***

Enter the country
    [Arguments]    ${country_name}
    Input Text    id:country    ${country_name}
    Wait Until Element Is Located on the page    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label


Purchase the product and confirm the purchase
    Click Element    css:.btn-success
    Page Should Contain    Success!


    
    
    

