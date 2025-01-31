*** Settings ***
Library  SeleniumLibrary
Library  WebDriverManager

*** Variables ***
${Browser}    chrome
${URL}        https://www.saucedemo.com/
${Username}    xpath://*[@id='user-name']
${Username_Text}    visual_user
${Password}      xpath://*[@id='password']
${Password_Text}    secret_sauce
${Login}         xpath://*[@class='submit-button btn_action']
${Open Menu}     xpath://button[@id='react-burger-menu-btn']
${Logout}        xpath://a[@id='logout_sidebar_link']
${Sort_Dropdown}  xpath ://select[@class='product_sort_container']
${LowtoHigh}      xpath://option[@value='lohi']

*** Keywords ***
Login Functionality
    [Documentation]    Opens the browser and maximizes the window
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    input text       ${Username}        ${Username_Text}
    input text       ${Password}        ${Password_Text}
    Click Element    ${Login}
Product Sorting
Wait Until Element Is Visible    ${Sort_Dropdown}    timeout=10s
    Mouse Over      ${Sort_Dropdown}
Wait Until Element Is Visible    ${Sort_Dropdown}    timeout=10s
    Click Element   ${Sort_Dropdown}
Execute JavaScript    arguments[0].scrollIntoView();  ${Sort_Dropdown}
    Mouse Down      ${LowtoHigh}
    Select From List By Label   ${LowtoHigh}      Price: Low to High
#Logout
#    Click Element    ${Open Menu}
#    Wait until element is visible   ${Logout}   timeout=10
#    Click Element    ${Logout}
*** Test Cases ***
Test Login Functionality
    [Documentation]    Verify the site opens successfully
    Login Functionality
Test Product Sorting
    [Documentation]    Verify the product sorting done successfully
     Product Sorting
#Test Logout Functionality
#    [Documentation]    Verify the User Logout successfully
#    Logout