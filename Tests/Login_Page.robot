*** Settings ***
Library  SeleniumLibrary
Library  WebDriverManager

*** Variables ***
${Browser}       chrome
${URL}         https://ps.demofms.com/Login.aspx
${Username}    xpath://*[@id="txtUser"]
${Username_Text}           Dbchavan
${Password}    xpath://*[@id="txtPass"]
${Password_Text}           Pass@123
${Login}       xpath://*[@id="btnLogin"]
${Administrative Work}               xpath://*[@id="ctl01"]/div[5]/div[3]/div/div[1]/ul/li[1]/a
${Administrative Creation}           xpath://*[@id="ctl01"]/div[5]/div[3]/div/div[1]/ul/li[1]/ul/li[1]/ul/li[1]/a
${AATracking}                        xpath://a[text()="HQ-File Tracking Prama And Work Details  "]
*** Keywords ***
Login Functionality
     Open Browser       ${URL}   ${Browser}
     Maximize Browser Window
     input text         ${Username}         ${Username_Text}
     input text         ${Password}         ${Password_Text}
     Click Element      ${Login}
AA Tracking
     Click Element      ${Administrative Work}
     Wait Until Element Is Visible  ${AATracking}       timeout=10
     Mouse Over         ${AATracking}
     Wait Until Element Is Visible  ${AATracking}       timeout=10
     Click Element      ${AATracking}

#

#     Click Element      ${Administrative Creation}
*** Test Cases ***
Run Keyword         Login Functionality
Run Keyword         AA Tracking