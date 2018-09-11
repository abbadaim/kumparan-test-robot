*** Variables ***
#config
${browser}               headlesschrome
${environment}           dev
${setSeleniumSpeed}      0.5
&{url}                   dev=https://kumparan.com/

#data
&{FACEBOOK_USER}       Email=testqualityass@gmail.com      Password=test#123    Name=Quality Assurance
&{GOOGLE_USER}         Email=testqualityass@gmail.com      Password=test#123    Name=test qa
&{UNREGISTERED_USER}   Email=test@gmail.com                Password=test123456