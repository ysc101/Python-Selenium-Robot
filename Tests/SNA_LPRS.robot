*** Settings ***
Library          SeleniumLibrary
Library          WebDriverManager


*** Variables ***
${Browser}             chrome
${URL}                 https://uatsna.mhlprs.com/
${Username}            xpath://*[@id="txtUser"]
${Username_Text}           AUDITWORK2
${Password}            xpath://*[@id="txtPass"]
${Password_Text}           Pass@123
${Login}               xpath://*[@id="btnLogin"]
${AA}              xpath://*[@id="myLinks"]/div/ul/li[2]/a
${AA_Creation}     xpath://*[@id="myLinks"]/div/ul/li[2]/ul/li[1]/a
*** Keywords ***
Open URL
    [Documentation]    Opens the browser and maximizes the window
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
Login to System
    input text          ${Username}         ${Username_Text}
     input text         ${Password}         ${Password_Text}
     Click Element      ${Login}
Create Administrative Approval
     Click Element      ${AA}
     Mouse Over         ${AA_Creation}
     Click Element      ${AA_Creation}



*** Test Cases ***
Test URL opens
  Open URL
Login
  Login to System
Create AA
  Create Administrative Approval


