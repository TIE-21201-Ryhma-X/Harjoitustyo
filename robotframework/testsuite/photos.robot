*** Settings ***

Library 	Collections
Library 	DateTime
Library 	RequestsLibrary

*** Variables ***

*** Test Cases ***
GET All photos
    [Documentation]                         Fetch json with all photos
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5
    ${resp}=            Get Request         picture-app 	    /photos
    Should Be Equal As Strings  	${resp.status_code} 	200

GET future photos
    [Documentation]                         Check trying to fetch photos from future returns nothing
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    # TODO: Create timestamp dynamically in correct format
    #${date}=  Get Current Date  increment=1 hours
    ${date}=  Convert To String  2020-09-09T06:33:09+00:00

    ${params}=  Create Dictionary  from=${date}

    ${resp}=            Get Request         picture-app 	    /photos  params=${params}
    Should Be Equal As Strings  	${resp.status_code} 	200
    Should Be Equal As Strings  	${resp.json()} 	[]

GET faulty photos
    [Documentation]                         Check trying to fetch photos with invalid arguments fails
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${params}=  Create Dictionary  from=asdf

    ${resp}=            Get Request         picture-app 	    /photos  params=${params}
    Should Be Equal As Strings  	${resp.status_code} 	400

DELETE photo
    [Documentation]                         Delete a existing photo
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${resp}=            Get Request         picture-app 	    /photos
    Should Be Equal As Strings  	${resp.status_code} 	200

    ${params}=  Create Dictionary  photo_id=${resp.json()[0]["id"]}
    ${resp}=            Delete Request         picture-app 	    /photos  params=${params}
    Should Be Equal As Strings  	${resp.status_code} 	200

DELETE non existing photo
    [Documentation]                         Delete a photo twice
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${params}=  Create Dictionary  photo_id=0

    ${resp}=            Delete Request         picture-app 	    /photos  params=${params}
    Should Be Equal As Strings  	${resp.status_code} 	200

    ${resp}=            Delete Request         picture-app 	    /photos  params=${params}
    Should Be Equal As Strings  	${resp.status_code} 	200

