*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}          https://jsonplaceholder.typicode.com
${BROWSER}      chrome

*** Test Cases ***
Verify Create New User POST Request Returns 201 
        ${body}=        Create Dictionary
        ...        name=Almira Gorgonia
        ...        username=almira_test
        ...        email=almira@example.com

        ${response}=        POST
        ...    ${URL}/users
        ...    json=${body}

        #Verify status code is 201 Created
        Should Be Equal As Integers        ${response.status_code}    201 

        #Get response body
        ${data}=        Set Variable        ${response.json()}

        #Verify the response contains the submitted data 
        Should Be Equal        ${data}[name]    Almira Gorgonia
        Should Be Equal        ${data}[username]    almira_test
        Should Be Equal        ${data}[email]    almira@example.com

        #Verify a new ID was created 
        Should Be True        ${data}[id] > 0