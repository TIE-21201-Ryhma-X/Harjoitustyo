*** Settings ***
Library 	Collections 	  	  	 
Library 	RequestsLibrary

*** Variables ***
# These should be moved to resoursce file so they can be used in all files
${HOST}        http://picture.app:8080/ps
${username}    username
${password}    password

*** Test Cases ***
GET swagger ui
    [Documentation]                         Test if we can get swagger Ui
    ${auth}=  Create List  ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}
    ${resp}=            Get Request         picture-app 	    /swagger-ui.html
    Should Be Equal As Strings  	${resp.status_code} 	200
Set Global Variables
    Set global variable    ${HOST}    ${HOST}
    Set global variable    ${username}    ${username}
    Set global variable    ${password}    ${password}