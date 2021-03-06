*** Settings ***
Documentation     A test suite with some test cases for managing gist functionality
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Suite Setup 	  Initialize Browser
Suite Teardown	  Close Browser

*** Test Cases ***
Create Gist
	${description}   Set Variable   My Gist Description
	${filename}      Set Variable   mygist.txt
	${code}          Set Variable   This is my gist
	Open Create Gist Page
	Create New Gist   ${description}   ${filename}   ${code}

Edit Gist
	${filename}     			Set Variable   mygist.txt
	${description}  			Set Variable   My Updated Gist Description
	Select A Gist   			${filename}
	Edit Description Gist       ${description}

Delete Gist
	${filename}     Set Variable   mygist.txt
	Select A Gist   ${filename}
	Delete Gist

Show My Gists
	Show My Gists List

*** Keyword ***
Initialize Browser
	Open Browser To Home Page
	Login Account   ${USERNAME}   ${PASSWORD}
