*** Variables ***
${article_text}                     xpath=//div[contains(@class,'is_stuck')]//div[contains(@class,'media')]//h5
${newcomment_textarea}              css=textarea#newCommentTextArea
${submit_button}                    css=button.btn-primary
${addlink_button}                   css=div.btn-icon[type="button"]
${uploadimage_button}               xpath=//div[contains(@class,'padd-left-none')]//input
${editorspick_article}              xpath=//div[contains(@class,"is_stuck")]//h5
${url_field}                        css=input.input-material
${post_button}                      css=button.btn-primary
${insert_button}                    xpath=//div[@class='modal-footer']//button[@class='btn btn-primary']
${modal_body}                       css=div.modal-body
${postdisable_button}               css=button.btn-primary[disabled=""]
${first_article}                    css=//div[@class='custom-col-xs-6']/div[1]/div[1]/div[contains(@class,'panel card')]//div[@class='panel-body card-content']/a[1]