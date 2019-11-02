*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://picture.app:8080/ps/v1/index.html
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Capture Page Screenshot
    Input Username    user
    Input Password    password
    Submit Credentials
    Album Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}     options=add_argument("--headless");add_argument("--no-sandbox")

Input Username
    [Arguments]    ${username}
    Input Text    id: input-username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id: input-password    ${password}

Submit Credentials
    Click Button    id: album-login

Album Page Should Be Open
    Element Should Be Visible   id = view-list     
# options=add_argument("--headless");add_argument("--no-sandbox")