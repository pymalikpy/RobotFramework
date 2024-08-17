*** Settings ***
Documentation        All the page objects and keywords of landing page
Library              SeleniumLibrary
Library              ../customLibraries/Shop.py
Library               Collections
Library               String

*** Variables ***
${Shop_page_load}        css:.nav-link
@{expectedList}        iphone X    Samsung Note 8    Nokia Edge    Blackberry

*** Keywords ***

Verify items in checkout page and proceed
    Click Element    css=.btn-success

