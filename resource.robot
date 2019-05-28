*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library and String
Library   String
Library   Selenium2Library

*** Variables ***
${BROWSER}    chrome
${URL_BASE}   https://gist.github.com/
${USERNAME}
${PASSWORD}

*** Keywords ***
Open Browser To Home Page
	Open Browser   ${URL_BASE}   ${BROWSER}
	Home Page Should Be Open

Home Page Should Be Open
    Wait Until Page Contains Element   xpath=//a[contains(@aria-label,'Gist Homepage')]

Login Account
	[Arguments] 	${username}   ${password}
	Click Element   xpath=//div[contains(@class,'Header-item f4 mr-0')]/a
	Wait Until Page Contains Element   xpath=//*[@id='login_field']
	Click Element   xpath=//*[@id='login_field']
	Input Text   	xpath=//*[@id='login_field']   ${username}
	Click Element   xpath=//*[@id='password'] 
	Input Text   	xpath=//*[@id='password']   ${password}
	Click Element   xpath=//input[contains(@value,'Sign in')]
	Wait Until Page Contains Element   xpath=//img[contains(@class,'avatar')]