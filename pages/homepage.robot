*** Settings ***
Resource    ${EXECDIR}/locators/homepage.robot

*** Keywords ***
Click To Here Link
    Click To Element    ${dicHomepage}[lnk_here]

Enter Text To Email Textbox
    [Arguments]    ${text}
    Enter Text To Element    ${dicHomepage}[txt_email]    ${text}

Enter Text To User Textbox
    [Arguments]    ${text}
    Enter Text To Element    ${dicHomepage}[txt_username]    ${text}

Enter Text To Password Textbox
    [Arguments]    ${text}
    Enter Text To Element    ${dicHomepage}[txt_password]    ${text}

Click To Submit Button
    Click To Element    ${dicHomepage}[btn_submit]

Get List Element
    ${text}=    Get Value From Element    ${dicHomepage}[username]    onkeyup

Get Text UserID
    ${user}=    Get Text Element    ${dicHomepage}[lbl_user_id]
    Set Test Variable    ${user_id_value}    ${user}

Get Text Password
    ${password}=    Get Text Element    ${dicHomepage}[lbl_password]
    Set Test Variable    ${password_value}    ${password}

Get List Menu
    ${locator}=    Get Raw locator    ${dicHomepage}[menu_text]
    ${texts}=    SeleniumLibrary.Execute Javascript    var elems = document.querySelectorAll("${locator}"); texts = []; for (elem of elems) {texts.push(elem.innerText)}; return texts;