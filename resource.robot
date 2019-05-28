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

Open Create Gist Page
	Click Element   xpath=//a[contains(@aria-label,'Create new gist')]
	Wait Until Page Contains Element   xpath=//div[@id='gists']
	
Create New Gist
	[Arguments] 	${description}   ${filename}   ${code}
	Click Element   xpath=//input[contains(@name,'gist[description]')]
	Input Text      xpath=//input[contains(@name,'gist[description]')]   ${description}
	Click Element   xpath=//input[contains(@aria-label,'Filename including extension…')]
	Input Text      xpath=//input[contains(@aria-label,'Filename including extension…')]  ${filename}
	Click Element   xpath=//div[contains(@class,'CodeMirror-code')]
	Input Text      xpath=//div[contains(@class,'CodeMirror-code')]   ${code}
	Click Element   xpath=//button[contains(text(),'Create public gist')]
	Wait Until Page Contains Element   xpath=//div[contains(text(),$description)]

Show My Gists List
	Click Element   xpath=//img[contains(@class,'avatar')]
	Click Element   xpath=//a[contains(text(),'Your gists')]
	Wait Until Page Contains Element   xpath=//a[contains(@aria-label,'All gists')]

Select A Gist
	[Arguments] 	${filename}
	Show My Gists List
	Click Element   xpath=//*[contains(text(),'${filename}')]
	Wait Until Page Contains Element   xpath=//*[@id='gist-pjax-container']

