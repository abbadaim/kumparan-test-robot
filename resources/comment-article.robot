*** Settings ***
Documentation   Keywords for comment function in kumparan web
Resource        ../elements/comment-article-element.robot
Resource        common.robot

*** Keywords ***
click editor's pick article
    wait until main page is loaded
    click element               ${article_text}

input comment text
    [Arguments]                 ${comment}
    input text                  ${newcomment_textarea}  ${comment}
    set suite variable          ${comment}

attach image to comment
    [Arguments]                 ${imagepath}
    choose file                 ${uploadimage_button}  ${imagepath}

verify if comment is created
    [Arguments]                 ${username}
    page should contain element  xpath=//div[@class="list-group-comment margbot"]//h6[contains(text(), "${username}")]

verify if comment contain correct text
    [Arguments]                 ${comment}
    page should contain element  xpath=//div[@class="list-group-comment margbot"]//p[contains(text(), "${comment}")]

add link into comment
    [Arguments]                 ${url}
    click element               ${addlink_button}
    input text                  ${url_field}    ${url}
    click insert link button
    wait for modal to disappear

click post button
    click element               ${post_button}

click insert link button
    click element               ${insert_button}

wait for modal to disappear
    wait until page does not contain element  ${modal_body}

verify post button disabled
    page should contain element  ${postdisable_button}

click first article
    wait until main page is loaded
    click element               ${first_article}