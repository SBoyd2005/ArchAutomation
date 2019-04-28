require 'watir'
require 'json'
json = File.read('login.json')
login = JSON.parse(json)
login.keys

#requesting a new browser and navigating to the sign-in button on Linkedin in Chrome and IE
browser = Watir::Browser.start("https://www.linkedin.com")
browser.text_field(id: 'username').set login["username"]
browser.text_field(id: 'password').set login["password"]
browser.button(value => 'Sign In').click

#From the Initial Home Page with News Feed navigates to Messaging Element, selects it, and sends a message.
Watir::Wait.until { browser.title == "LinkedIn" }
browser.span(:id => "messaging-tab-icon").click
browser.div(:class => " presence-entity_image EntityPhoto-circle-4 ember-view").click
browser.div(:class => "msg-form_contenditable t-14 t-black--light t-normal flex-grow-1").click
browser.div(:class => "msg-form_contenditable t-14 t-black--light t-normal flex-grow-1"){:p}.send_keys("This is a test message.")
browser.button(:class => "msg-form__send-button artdeco-button artdeco-button--1").click



