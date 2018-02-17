And(/^I click on sign in link$/) do
  @browser.link(:class=>"login").click
  on_page(RegisterPage).registration_option
end

And(/^I select No$/) do
  on_page(RegisterPage).registration_option
end

And /^I fill in the registration form$/ do
  on_page(RegisterPage).enter_details
end

#And(/^I fill in the registration form$/) do
#  @browser.radio(:id=>'RegisterOption').click
#  @browser.text_field(:id=>"RegisterModel_Email").set"sa1@sa.com"
#  @browser.select_list(:id=>"RegisterModel_Title").select"Ms."
#  @browser.text_field(:id=>"RegisterModel_FirstName").set"sanj"
#  @browser.text_field(:id=>"RegisterModel_Surname").set"Sanj"
#  @browser.text_field(:id=>"RegisterModel_Password").set"pass123"
##@browser.checkbox(:id=>'setShowPassword').set
#  @browser.button(:value=>"Create Account").click
#end

And(/^I submit the registration form without user details$/) do
  on_page(RegisterPage).create_account
end

Then(/^I am registered as a new user and I see "([^"]*)"$/) do |registered|
  @current_page.text.should include registered
end

And(/^I click on Register link$/) do
  @browser.link(:class=>"register").click
  on_page(RegisterPage).registration_option
end

And(/^I click on My Accounts link$/) do
  @current_page.link(:rel=>"nofollow").click
end


And(/^I click on create account button$/) do
  on_page(RegisterPage).create_account
end

And(/^I submit Registration details with the following details$/) do |details|
  @current_page.complete_incorrect_details(details.hashes.first)
  on_page(RegisterPage).create_account
end

And(/^I click on create account button without entering email address$/) do
  #on_page(RegisterPage).enter_details('register_email' => ' ')
  on_page(RegisterPage).create_account
end

And(/^I fill in the registration form with the existing email address$/) do
  on_page(RegisterPage).enter_existing_details
end

Then(/^I should see the following error message for the the blank fields$/) do |registration_page_errors|
  # table is a table.hashes.keys # => [:Email, :Please enter your email address]
  registration_page_errors = registration_page_errors.rows_hash
  on RegisterPage do |register_page|
    register_page.get_email_validation.should =~ /#{registration_page_errors["Email"]}/
    register_page.get_name1_validation.should =~ /#{registration_page_errors["FirstName"]}/
    register_page.get_name2_validation.should =~ /#{registration_page_errors["Surname"]}/
    register_page.get_password_validation.should =~ /#{registration_page_errors["Password"]}/
  end
end

And(/^I have not filled in the Email, FirstName, SurName and Password field$/) do
  on RegisterPage do |register_page|
    register_page.fill_in_enquiry("", "", "", "")
    #contact_us_page.fill_in_enquiry("", "", "", "")
  end
end

And(/^I submit the registration form with incorrect password$/) do
  pending
end


Then(/^I should see the error panel (.*)$/) do |message|
  @current_page.get_validation(message)
end