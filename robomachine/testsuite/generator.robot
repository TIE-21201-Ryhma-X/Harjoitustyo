*** Settings ***
Suite Setup       Open Browser  ${LOGIN_PAGE_URL}   Chrome
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