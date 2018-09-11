*** Variables ***
${kumparan_topheader}               css=a[href="/"]
${login_link}                       css=a[href="/login"]
${loginfb_button}                   css=button.metro
${logingoogle_button}               css=button.btn-gplus
${fbemail_field}                    css=input#email
${fbpass_field}                     css=input#pass
${submitfb_button}                  css=label#loginbutton
${confirmfb_button}                 css=button[name="__CONFIRM__"]
${googleuser_field}                 id=identifierId
${googlepass_field}                 css=input[name="password"]
${signin_window}                    class=CwaK9
${googleuser_next}                  id=identifierNext
${googlepass_next}                  id=passwordNext
${profile_button}                   css=a#dropdown-profile
${myprofile_button}                 xpath=//ul[@class='dropdown-menu dropdown-menu-right']//li[1]//a[1]
${logout_button}                    xpath=//ul[@class='dropdown-menu dropdown-menu-right']//li[5]//a[1]
${profilename_text}                 xpath=//div[@class="panel-body"]//h1
${fblogin_form}                     css=form#login_form
${fbloginerror_text}                css=div.login_error_box
${googerror_text}                   css=div.dEOOab.RxsGPe
${submitinmodal_button}             xpath=//div[@class='modal-footer']//button[@class='btn btn-primary']
${closemodal_button}                css=button.close
${searchinhome_element}             css=div.input-search-addon
${popup_notif}                      xpath=//div[contains(@class,'popover')]
${dontallownotif_button}            css=button#onesignal-popover-cancel-button