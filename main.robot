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

#Edit Gist

#Delete Gist

#Show My Gists


*** Keyword ***
Initialize Browser
	Open Browser To Home Page
	Login Account   ${USERNAME}   ${PASSWORD}
