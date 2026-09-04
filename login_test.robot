*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          http://the-internet.herokuapp.com/login
${BROWSER}      chrome
${USERNAME}     tomsmith
${PASSWORD}     SuperSecretPassword!

*** Test Cases ***
Valid Login
        Open Browser    ${URL}  ${BROWSER}
        Maximize Browser Window
        Input Text    id=username  ${USERNAME}
        Input Text    id=password  ${PASSWORD}
        Click Button    xpath=//button[@type='submit']
        Title Should Be    The Internet
        Close Browser