*** Settings ***
Documentation   Utility for kumparan web
Library         SeleniumLibrary  timeout=10
Library         String
Resource        ../data/inputdata.robot
Resource        ../elements/common-element.robot

*** Keywords ***
input credential email
    [Arguments]  ${credentialemail}
    run keyword unless  '${credentialemail}' == '#BLANK'  Input Text  ${googleuser_field}  ${credentialemail}

input credential password
    [Arguments]  ${credentialpassword}
    run keyword unless  '${credentialpassword}' == '#BLANK'  Input Text  ${googlepass_field}  ${credentialpassword}

input fb credential email
    [Arguments]  ${fbemail}
    run keyword unless  '${fbemail}' == '#BLANK'  Input Text  ${fbemail_field}  ${fbemail}

input fb credential password
    [Arguments]  ${fbpassword}
    run keyword unless  '${fbpassword}' == '#BLANK'  Input Text  ${fbpass_field}  ${fbpassword}

open dev
    open browser                   ${url.${environment}}  ${browser}
    Set Selenium Speed             ${setSeleniumSpeed}
    set window size                2560  1440
    maximize browser window
    sleep                          0.5
    close popover notification if appear

click login with google
    click element                  ${login_link}
    click button                   ${logingoogle_button}

login google set email address
    [Arguments]                    ${email}
    sleep                          1s
    click login with google
    select window                  new
    wait until element is visible  ${signin_window}
    input credential email         ${email}
    click element                  ${googleuser_next}
    sleep                          1s

login google set password
    [Arguments]                    ${password}
    wait until element is visible  ${googlepass_field}
    input credential password      ${password}
    click element                  ${googlepass_next}
    select window                  main

click login with facebook
    click element                  ${login_link}
    click element                  ${loginfb_button}

login fb set username and password
    [Arguments]                    ${fbemail}  ${fbpass}
    click login with facebook
    select window                  new
    wait until element is visible  ${fblogin_form}
    input fb credential email      ${fbemail}
    input fb credential password   ${fbpass}
    click element                  ${submitfb_button}
    select window                  main

verify login account
    [Arguments]                    ${accountname}
    wait until main page is loaded
    click element                  ${profile_button}
    click element                  ${myprofile_button}
    wait until element is visible  ${profilename_text}
    ${loggedin}=     get text      ${profilename_text}
    should be equal as strings     ${loggedin}    ${accountname}
    click element                  ${kumparan_topheader}

verify if comment posted
    [Arguments]                    ${username}
    page should not contain element  xpath=//div[@class="list-group-comment margbot"]//h6[contains(text(), "${username}")]

login with valid facebook account
    [Arguments]                    ${FACEBOOK_USER}
    login fb set username and password  ${FACEBOOK_USER.Email}  ${FACEBOOK_USER.Password}
    verify login account           ${FACEBOOK_USER.Name}

login with invalid facebook account
    [Arguments]                    ${UNREGISTERED_USER}
    click login with facebook
    select window                  new
    wait until element is visible  ${fblogin_form}
    input fb credential email      ${UNREGISTERED_USER.Email}
    input fb credential password   ${UNREGISTERED_USER.Password}
    click element                  ${submitfb_button}
    page should contain element    ${fbloginerror_text}

login with valid google account
    [Arguments]                    ${GOOGLE_USER}
    login google set email address  ${GOOGLE_USER.Email}
    login google set password      ${GOOGLE_USER.Password}
    verify login account           ${GOOGLE_USER.Name}

login with invalid gooogle account
    [Arguments]                    ${UNREGISTERED_USER}
    login google set email address  ${UNREGISTERED_USER.Email}
    page should contain element    ${googerror_text}

click logout
    click element                  ${myprofile_button}
    click element                  ${logout_button}

click submit in modal
    click element                  ${submitinmodal_button}

click close modal
    click element                  ${closemodal_button}

wait until main page is loaded
    wait until element is visible  ${searchinhome_element}

end test
    close browser

close popover notification
    click element                  ${dontallownotif_button}

close popover notification if appear
    ${POPOVER}=  run keyword and return status  element should be visible  ${popup_notif}
    run keyword if  ${POPOVER}  close popover notification

