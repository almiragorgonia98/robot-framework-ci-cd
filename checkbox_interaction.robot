*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          http://the-internet.herokuapp.com/checkboxes
${BROWSER}      chrome

*** Test Cases ***
Verify Content Changes After Refresh
        Open Browser    ${URL}  ${BROWSER}
        Maximize Browser Window
        
        Select Checkbox    xpath=//form[@id='checkboxes']/input[@type='checkbox'][1]
        Close Browser
