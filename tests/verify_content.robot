*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          http://the-internet.herokuapp.com/dynamic_content
${BROWSER}      chrome

*** Test Cases ***
Verify Content Changes After Refresh
        Open Browser    ${URL}  ${BROWSER}
        Maximize Browser Window
        
        # Get the content before refresh
        ${before}=    Get Text    xpath=//div[contains(@class, 'large-10')]

        #Refresh the browser
        Reload Page

        #Wait for the page to load 
        Wait Until Element is Visible    xpath=//h3[text()='Dynamic Content']    10s    
        
        #Get the content after refresh 
        ${after}=    Get Text    xpath=//div[contains(@class, 'large-10')]

        #Verify that the content changed
        Should Not Be Equal    ${before}    ${after}
        Close Browser