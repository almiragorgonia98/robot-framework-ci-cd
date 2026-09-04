*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}          https://jsonplaceholder.typicode.com/users
${BROWSER}      chrome

*** Test Cases ***
Verify GET Request Returns 200 
        Create Session    api    https://jsonplaceholder.typicode.com   
        ${response}=        GET On Session    api  /users  
        Should Be Equal As Integers        ${response.status_code}    200    