*** Settings ***
Library    Collections
Library    RequestsLibrary


*** Variables ***
${base_url}    https://rahushettyacademy.com

*** Test Cases ***
Play around with dictionary
    &{data}=    Create Dictionary    name=bookworm    course=robot    website=bookworm.com
    Log    ${data}
    Dictionary Should Contain Key    ${data}        name
    Log    ${data}[name]
    Get From Dictionary    ${data}    website


Add book into library database
    ${req_body}=    Create Dictionary    name=Crime&Punishment    isbn=acd    aisle=229    author=Fyodor
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200

    # Log the status code to verify if the request was successful
    Log    Status Code: ${response.status_code}

    # Log the raw content to understand what is returned
    Log    Response Content: ${response.content}
    
    Log    Response: ${response.json()}

    # Check if the content type is JSON before attempting to decode it
    ${content_type}=    Get From Dictionary    ${response.headers}    content-type
    Run Keyword If    '${content_type}' == 'application/json'    Log    ${response.json()}
    Run Keyword If    '${content_type}' != 'application/json'    Log    Non-JSON response received: ${response.content}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}


Get the book details which got added
    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}
    Log    ${get_response.json()}


Delete the book from the database
    POST    ${base_url}/Library/DeleteBook.php    ID=${book_id}
    ${delete_resp}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_resp}    expected_status=200
    Log    ${delete_resp.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_resp.json()}[msg]










    

        