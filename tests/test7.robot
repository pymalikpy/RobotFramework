*** Settings ***
Documentation    To add a product to the cart
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup    Open the browser with url
Test Teardown    Close browser session
Resource    ../PageObjects/Generic.robot
Resource    ../PageObjects/LandingPage.robot
Resource    ../PageObjects/ShopPage.robot
Resource    ../PageObjects/CheckoutPage.robot
Resource    ../PageObjects/ConfirmationPage.robot


*** Variables ***
${Error_Message_Login}   css:.alert-danger
@{listOfProducts}        Blackberry        Nokia Edge
${countryName}           India


*** Test Cases ***
Add product to the cart
    [Documentation]
    LandingPage.Fill the login form                ${user_name}    ${valid_password}
    ShopPage.Wait Until Element Is Located
    ShopPage.Verify Card Titles In Shop Page
    add_items_to_cart_and_checkout                 ${listOfProducts}
    CheckoutPage.Verify items in checkout page and proceed
    Enter The Country           ${countryName}
    Purchase the product and confirm the purchase


Select the form and navigate to Child window
    LandingPage.Fill the login details and select the user option
















