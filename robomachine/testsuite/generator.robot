*** Settings ***
Suite Setup       Open Browser  ${LOGIN_PAGE_URL}   Chrome      options=add_argument("--headless");add_argument("--no-sandbox")
Suite Teardown    Close Browser
Test Setup        Go to  ${LOGIN_PAGE_URL}
Library           SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    input-username
${PASSWORD_FIELD}    input-password
${LOGIN_BUTTON}      album-login
${VALID_USERNAME}    user
${VALID_PASSWORD}    password
${LOGIN_PAGE_URL}    http://picture.app:8080/ps/v1/index.html

*** Test Cases ***
Test 1
  Set Machine Variables  ${EMPTY}  ${VALID_PASSWORD}
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

Test 2
  Set Machine Variables  ${EMPTY}  ${EMPTY}
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

Test 3
  Set Machine Variables  ${VALID_USERNAME}  ${VALID_PASSWORD}
  Login Page
  Submit Credentials
  Album Page

Test 4
  Set Machine Variables  ${VALID_PASSWORD}  ${VALID_USERNAME}
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

Test 5
  Set Machine Variables  ${VALID_USERNAME}  ${EMPTY}
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

Test 6
  Set Machine Variables  invalid123  ${EMPTY}
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

Test 7
  Set Machine Variables  ${VALID_USERNAME}  password123
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page
  Submit Credentials
  Login Page

*** Keywords ***

Submit Credentials
  Input Text    id: input-username    ${username}
  Input Text    id: input-password    ${password}
  Click Button    id: album-login
Set Machine Variables
  [Arguments]  ${USERNAME}  ${PASSWORD}
  Set Test Variable  \${USERNAME}
  Set Test Variable  \${PASSWORD}
Login Page
  Element Should Be Visible   id = login-window
Album Page
  Element Should Be Visible   id = view-list
