*** Settings ***

Library 	Collections 	  	  	 
Library 	RequestsLibrary

*** Variables ***

*** Test Cases ***
GET All photos
    [Documentation]                         Fetch json with all photos
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}
    #Create Digest Session    picture-app    ${HOST}     ${auth}     headers=${headers}
    ${resp}=            Get Request         picture-app 	    /photos
    Should Be Equal As Strings  	${resp.status_code} 	200