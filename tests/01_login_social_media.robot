*** Settings ***
Documentation   test case for login by social media to Kumparan web
Resource        ../resources/common.robot
Resource        ../data/inputdata.robot
Default Tags    dev
Test Setup      open dev
Test Teardown   end test

*** Variables ***

*** Test Cases ***
Login with valid facebook account should resulted in successful login
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}

Login with invalid facebook account should resulted in failed login
    [Tags]                                      ready  negative
    login with invalid facebook account         ${UNREGISTERED_USER}

login with valid google account should resulted in successful login
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}

Login with invalid google account should resulted in failed login
    [Tags]                                      read  negative
    login with invalid gooogle account          ${UNREGISTERED_USER}

Login with FB then logout then login once more should auto login
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}
    click logout
    click login with facebook
    wait until main page is loaded
    verify login account

Login with google then logout then login once more should auto login
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}
    click logout
    click login with google
    wait until main page is loaded
    verify login account