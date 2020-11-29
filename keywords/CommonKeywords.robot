*** Settings ***
Resource    ${CURDIR}/web_import.robot

*** Keywords ***
Initial Browser
    Open chrome browser to page    ${base_url}

Open chrome browser to page
    [Arguments]    ${url}    ${speed}=0.3 
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    SeleniumLibrary.Create Webdriver    Chrome    chrome_options=${chrome_options}
    SeleniumLibrary.Open Browser    ${url}
    SeleniumLibrary.Set Selenium Speed    ${speed}

Click To Element
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    SeleniumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Arguments]    ${locator}
    FOR    ${elem}    IN    ${locator}
        SeleniumLibrary.Wait Until Element Is Visible    ${elem}
    END

Enter Text To Element
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${text}

Get List Items
    [Arguments]    ${locator}
    SeleniumLibrary.Get List Items    ${locator}

Get Value From Element
    [Arguments]    ${locator}    ${value}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    ${text}=    SeleniumLibrary.Get Element Attribute   ${locator}    ${value}
    [Return]    ${text}

Verify Element Text Should Be
    [Arguments]    ${locator}    ${expected}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    SeleniumLibrary.Element Text Should Be    ${locator}    ${expected}

Get Text Element
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    [Return]    ${text}

Close Browser
    SeleniumLibrary.Close Browser

Get Element Text
    ${elem}=    SeleniumLibrary.Get Web Elements    ${dicHomepage}[banner]
    ${len}=    SeleniumLibrary.Get Element Count    ${dicHomepage}[banner]
    ${list}=    Create List
    FOR    ${idx}    IN RANGE    ${len}
        ${text}=    Get Text    ${elem}[${idx}]
        Append To List    ${list}   ${text}
    END
    [Return]    ${list}

Get Raw locator
    [Arguments]    ${locator}
    ${seperator}=    Run Keyword If    "css" in "${locator}"    Set Variable    css=
    ...    ELSE    Set Variable    xpath=
    ${locator}=    Split String From Right    ${locator}    separator=${seperator}    
    [Return]    ${locator}[-1]   

Go To Specific Page
    [Arguments]    ${page}=${EMPTY}
    SeleniumLibrary.Go To    ${base_url}${page}
    
   
    