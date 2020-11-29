*** Settings ***
Resource    ${CURDIR}/web_import.robot

*** Keywords ***
Add New Collection
    [Arguments]    ${client_id}    ${client_secret}    ${redirect_uri}    ${code}    ${grant_type}
    ${body}=    Load JSON From File    ${EXECDIR}/unsplash_api/collection.json
    ${body}=    Update Value To Json    ${body}    $..title   ${title}
    ${body}=    Update Value To Json    ${body}    $..description    ${description}
    ${response}=    REST.Post    endpoint=${api_url}/collections/   body=${body}    headers=${header}
    REST.Integer    response status    201
    [Return]    ${response}

Add Photo To Collection
    [Arguments]    ${collection_id}    ${photo_id}
    ${body}=    Set Variable    {"collection_id" : "${collection_id}", "photo_id" : "${photo_id}"}
    ${body}=    Convert String to JSON    ${body}
    ${body}=    Update Value To Json    ${body}    $..collection_id   ${collection_id}
    ${body}=    Update Value To Json    ${body}    $..photo_id    ${photo_id}
    ${response}=    REST.Post    endpoint=${api_url}/collections/${collection_id}/add    body=${body}    headers=${header}
    REST.Integer    response status    201
    [Return]    ${response}