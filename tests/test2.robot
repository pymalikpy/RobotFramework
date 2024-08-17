*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Test Setup       Open the browser with Kitomba url
Test Teardown    Close Browser Session
Resource         ../PageObjects/resource.robot

*** Test Cases ***
Validate Unsuccessful Login
    [Documentation]    This test case validates that an unsuccessful login attempt shows the correct error message.
    Fill the login form    ${user_name}    ${invalid_password}
    Wait Until Element Is Located    css:.loginErrs    10s
    Verify Error Message Is Correct

Validate Successful Login
    [Documentation]    This test case validates that a successful login attempt redirects to the home page.
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element Is Located    css:.text-center-xs.title.mTop0    10s
    Verify Top Nav Bar On The Home Page

*** Variables ***
${APPT_TAB}                    css:a#tab_appointments
${BRANCH_SELECTOR}             css:.sel-branchSelector
${BRANCH_SELECTOR_OPTIONS}     xpath://div[contains(@class,'kitombaDropdown__option')]
@{expectedList}                PrinceFeatureTest1    PrinceFeatureTest2    PrinceFeatureTest4


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:login    ${username}
    Input Password    id:password    ${password}
    Click Button    login_form_submit

Wait Until Element Is Located
    [Arguments]    ${locator}    ${timeout}=5s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Verify Error Message Is Correct
    Element Text Should Be    css:.loginErrs    ${error_msg}


Verify top nav bar on the home page
    Wait Until Element Is Visible    ${APPT_TAB}    10s
    Click Element    ${APPT_TAB}
    Wait Until Element Is Visible    ${BRANCH_SELECTOR}    10s
    sleep    5
    Click Element    ${BRANCH_SELECTOR}
    sleep    5
    Wait Until Element Is Visible       ${BRANCH_SELECTOR_OPTIONS}    10s

    ${elements}=    Get WebElements    ${BRANCH_SELECTOR_OPTIONS}
    ${num_elements}=    Get Length    ${elements}
    Log    Number of elements found: ${num_elements}
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    Element: ${element}
        ${text}=    Get Text    ${element}
        Log    Element text: ${text}
        Append To List    ${actualList}    ${text.strip()}
    END
    Log    Actual List: ${actualList}
    List Should Contain Sub List    ${actualList}    ${EXPECTED_LIST}


    

