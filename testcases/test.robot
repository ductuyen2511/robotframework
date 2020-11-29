*** Settings ***
Resource    ${EXECDIR}/keywords/web_import.robot
Test Setup    Initial Browser
# Test Teardown    Close Browser

*** Variables ***
${string}    Your range price for your product is from $0- 400

*** Test Cases ***
Run Test
    [Tags]    test
    ${email}=    FakerLibrary.Email
    homepage.Click To Here Link
    homepage.Enter Text To Email Textbox    ${email}
    homepage.Click To Submit Button
    homepage.Get Text UserID
    homepage.Get Text Password
    CommonKeywords.Go To Specific Page
    homepage.Enter Text To User Textbox    ${user_id_value}
    homepage.Enter Text To Password Textbox    ${password_value}
    homepage.Click To Submit Button
    homepage.Get List Menu

Test
    [Tags]    testt
    ${locator}=    Get Raw locator    ${dicHomepage}[lnk_here]
    ${texts}=    SeleniumLibrary.Execute Javascript    var elems = document.querySelectorAll("${locator}"); var text = []; for(elem in elems) {text.push(elem.innerText)}; return text;