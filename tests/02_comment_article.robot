*** Settings ***
Documentation   test case for creating editing and deleting comment in Kumparan web
Resource        ../resources/common.robot
Resource        ../data/inputdata.robot
Resource        ../resources/comment-article.robot
Default Tags    dev
Test Setup      open dev
Test Teardown   end test

*** Variables ***
${comment}              test comment
${attach}               ${EXECDIR}/attachment/attach.png
${link}                  https://kumparan.com

*** Test Cases ***
create a comment with user logging in with fb without any attachment and link should be created properly
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}
    click editor's pick article
    input comment text                          ${comment}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with fb with attachment should be created properly
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}
    click editor's pick article
    input comment text                          ${comment}
    attach image to comment                     ${attach}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with fb with a link should be created properly
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}
    click editor's pick article
    input comment text                          ${comment}
    add link into comment                       ${link}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with fb with attachment and link should be created properly
    [Tags]                                      ready
    login with valid facebook account           ${FACEBOOK_USER}
    click editor's pick article
    input comment text                          ${comment}
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with fb with attachment and link without comment
    [Tags]                                      ready  negative
    login with valid facebook account           ${FACEBOOK_USER}
    click editor's pick article
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    verify if comment posted

create a comment with user logging in with google without any attachment and link should be created properly
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    input comment text                          ${comment}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with google with attachment should be created properly
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    input comment text                          ${comment}
    attach image to comment                     ${attach}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with google with a link should be created properly
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    input comment text                          ${comment}
    add link into comment                       ${link}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with google with attachment and link should be created properly
    [Tags]                                      ready
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    input comment text                          ${comment}
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    verify if comment contain correct text      ${comment}

create a comment with user logging in with google with attachment and link without comment
    [Tags]                                      ready  negative
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    verify if comment posted

create a comment without user logging in should redirect to login page and try to post comment should be posted properly
    [Tags]                                      ready
    click editor's pick article
    input comment text                          ${comment}
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    click login with facebook
    login fb set username and password          ${FACEBOOK_USER.Email}  ${FACEBOOK_USER.Password}
    add link into comment                       ${link}
    attach image to comment                     ${attach}
    click post button
    verify if comment contain correct text      ${comment}

create a comment without any text, attachment nor link, post button should be disabled
    [Tags]                                      ready  negative
    login with valid google account             ${GOOGLE_USER}
    click editor's pick article
    verify post button disabled