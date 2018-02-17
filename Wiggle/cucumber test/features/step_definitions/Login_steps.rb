
Given /^I am on the wiggle login page$/ do
  url = BASE_URL + "/secure/myaccount/logon?returnurl=%2F&forceLogIn=True"
  @browser.goto(url)
end

Then /^I should be logged in$/ do
  @browser.link(:text=>"Sign out").exist?
end

#When /^I sign in with the email "(.*)" and password "(.*)"$/ do |email, password|
#  @browser.text_field(:id, "LogOnModel_UserName").set email
#  @browser.text_field(:id, "LogOnModel_Password").set password
#  @browser.button(:value, "Login").click
#end

#Then(/^I should be logged in with message "([^"]*)"$/) do |expected|
#  @current_page.text.should include expected
#end

Then(/^I should see the message "([^"]*)"$/) do |error_message|
  @current_page.text.should include error_message
end

When(/^I enter the email address "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  @browser.text_field(:id, "LogOnModel_UserName").set arg1
  @browser.text_field(:id, "LogOnModel_Password").set arg2
  @browser.button(:value, "Login").click
end

When(/^I click the forgot my password function$/) do
  @browser.link(:id=>'forgotten-password').click
end

Then(/^I should be prompted "([^"]*)" on password recovery page$/) do |page|
  @browser.text.should include page
end

When(/^I sign in with valid credentials$/) do
  on_page(LoginPage).enter_login_details
  @browser.button(:value, "Login").click
end

When(/^I sign in with the email (.*)$/) do |username|
 on_page(LoginPage).username=username
end

When(/^I sign in with the password (.*)$/) do |password|
  on_page(LoginPage).password=password
end
#
#Then(/^I should see the message (.*)$/) do |message|
#  #on_page(LoginPage).message=message
#  #@browser.text.should include message
#
#end

And(/^I click on login button$/) do
  @browser.button(:value, "Login").click
end

Then(/^I get the error message '(.*)'$/) do |message|
  @browser.assert_error_message(message)
end


Then(/^I should see the message '(.*)'$/) do |message|
  pending
end