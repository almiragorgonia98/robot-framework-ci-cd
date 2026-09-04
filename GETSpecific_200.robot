*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}          https://jsonplaceholder.typicode.com
${BROWSER}      chrome
${USER_ID}      1

*** Test Cases ***
Verify Single User GET Request Returns 200 
        ${response}=        GET    ${URL}/users/${USER_ID}

        #Verify Status code  
        Should Be Equal As Integers        ${response.status_code}    200 

        #Convert response to JSON
        ${data}=    Set Variable        ${response.json()}

        #Verify returned ID matches requested ID
        Should Be Equal As Integers        ${data}[id]    ${USER_ID}

        #Verify returned data fields 
        Should Be Equal        ${data}[name]    Leanne Graham
        Should Be Equal        ${data}[username]    Bret
        Should Be Equal        ${data}[email]    Sincere@april.biz 