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
${URL_BASE}   https://shopee.co.id/
${USERNAME}
${PASSWORD}

*** Keywords ***
Open Browser To Home Page
	Open Browser   ${URL_BASE}   ${BROWSER}
	Home Page Should Be Open

Home Page Should Be Open
    Title Should Be    Shopee Indonesia | Jual Beli di Ponsel dan Online

Login Account
	[Arguments] 	${username}   ${password}
	Click Element   xpath=//div[contains(@class,'shopee-popup__close-btn')]//*[contains(@class,'shopee-svg-icon')]
	Sleep   1s
	Click Element   xpath=//li[contains(text(),'Login')]
	Wait Until Page Contains Element   xpath=//div[contains(@class,'shopee-authen__form')]
	Click Element   xpath=//div[contains(@class,'shopee-authen__form')]/div[2]/div/input
	Input Text   	xpath=//div[contains(@class,'shopee-authen__form')]/div[2]/div/input   ${username}
	Click Element   xpath=//div[contains(@class,'shopee-authen__form')]/div[3]/div/input 
	Input Text   	xpath=//div[contains(@class,'shopee-authen__form')]/div[3]/div/input   ${password}

Item Title Should Be Visible
	Element Should Be Visible   //*[contains(concat(' ', @class, ' '), 'item-title')]

Item Price Should Be Visible
	Element Should Be Visible   //*[contains(concat(' ', @class, ' '), 'item-price')]

Item Location Should Be Visible
	Element Should Be Visible   //*[contains(concat(' ', @class, ' '), 'catalog-listing-item-location')]

Item Agent Should Be Visible
	Element Should Be Visible   //*[contains(concat(' ', @class, ' '), 'catalog-listing-item-agent')]

Item Description Should Be Visible
	Element Should Be Visible   //*[contains(concat(' ', @class, ' '), 'description')]

