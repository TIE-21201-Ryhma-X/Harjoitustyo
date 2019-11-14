*** Settings ***

Library 	Collections
Library 	DateTime
Library 	RequestsLibrary

*** Variables ***


*** Test Cases ***
CREATE and DELETE keywords
    [Documentation]                         Create and delete keywords
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${post_params}=     Create Dictionary   keyword=test    photo_id=0
    ${post_resp}=            Post Request         picture-app 	    /keywords   params=${post_params}
    Should Be Equal As Strings  	${post_resp.status_code} 	200  Failed to create keyword
    Should Be Equal As Strings  	${post_resp.json()["value"]}      test  Got unexpected keywords

    #${id}=  Convert To String  ${post_resp.json()["id"]}
    ${delete_params}=     Create Dictionary   keyword_id=${post_resp.json()["id"]}
    ${delete_resp}=            Delete Request         picture-app 	    /keywords  params=${delete_params}
    Should Be Equal As Strings  	${delete_resp.status_code} 	200  Failed to delete keyword

CREATE and GET keywords
    [Documentation]                         Create and fetch keywords
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${post_params}=     Create Dictionary   keyword=test    photo_id=0
    ${post_resp}=            Post Request         picture-app 	    /keywords   params=${post_params}
    Should Be Equal As Strings  	${post_resp.status_code} 	200  Failed to create keyword
    Should Be Equal As Strings  	${post_resp.json()["value"]}      test  Got unexpected keywords

    ${get_params}=     Create Dictionary   photo_id=0
    ${get_resp}=            Get Request         picture-app 	    /keywords  params=${get_params}
    Should Be Equal As Strings  	${get_resp.status_code} 	200  Failed to fetch keyword
    Should Be Equal As Strings  	${get_resp.json()[0]["value"]}  test  Got unexpected keywords

CREATE existing keywords
    [Documentation]                         Create and fetch keywords
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${post_params}=     Create Dictionary   keyword=test    photo_id=0
    ${post_resp}=            Post Request         picture-app 	    /keywords   params=${post_params}
    Should Be Equal As Strings  	${post_resp.status_code} 	200  Failed to create keyword
    Should Be Equal As Strings  	${post_resp.json()["value"]}      test  Got unexpected keywords

    ${post_resp}=            Post Request         picture-app 	    /keywords   params=${post_params}
    Should Be Equal As Strings  	${post_resp.status_code} 	200  Failed to create keyword
    Should Be Equal As Strings  	${post_resp.json()["value"]}      test  Got unexpected keywords

DELETE non existing keywords
    [Documentation]                         Create and delete keywords
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${delete_params}=     Create Dictionary   keyword_id=0
    ${delete_resp}=            Delete Request         picture-app 	    /keywords  params=${delete_params}
    Should Be Equal As Strings  	${delete_resp.status_code} 	200  Failed to delete keyword

    ${delete_resp}=            Delete Request         picture-app 	    /keywords  params=${delete_params}
    Should Be Equal As Strings  	${delete_resp.status_code} 	200  Failed to delete keyword twice

CREATE faulty keywords
    [Documentation]                         Create and fetch keywords
    ${auth}=  Create List   ${username}   ${password}
    ${headers}=    Create Dictionary    accept=application/json
    Create Session    picture-app    ${HOST}     headers=${headers}     auth=${auth}     debug=5

    ${post_resp}=            Post Request         picture-app 	    /keywords
    Should Be Equal As Strings  	${post_resp.status_code} 	400  Keyword creation didn't fail correctly
