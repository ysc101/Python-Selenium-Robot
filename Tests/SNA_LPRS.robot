*** Settings ***
Library          SeleniumLibrary
Library          WebDriverManager


*** Variables ***
${Browser}             chrome
${URL}                 https://uatsna.mhlprs.com/
${Username}    xpath://*[@id="txtUser"]
${Username_Text}           RDDCHECKER1
${Password}    xpath://*[@id="txtPass"]
${Password_Text}           Pass@123
${Login}       xpath://*[@id="btnLogin"]

*** Keywords ***
Open URL
    [Documentation]    Opens the browser and maximizes the window
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
Login to System
    input text         ${Username}         ${Username_Text}
     input text         ${Password}         ${Password_Text}
     Click Element      ${Login}


*** Test Cases ***
Test URL opens
  Open URL
Login
  Login to System