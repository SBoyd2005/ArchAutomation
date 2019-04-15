require 'watir'
require 'webdrivers'

browser = Watir::Browser.new

browser.goto 'www.linkedin.com'

browser.text_field(data_test: 'email').set
browser.text_field(data_test: 'password').set  
browser.button(name: 'sign in').click

