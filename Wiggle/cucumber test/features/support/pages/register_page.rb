class RegisterPage
  include PageObject
  include DataMagic

  text_field(:register_email, :id => "RegisterModel_Email")
  select_list(:title, :id => "RegisterModel_Title")
  text_field(:first_name, :id => "RegisterModel_FirstName")
  text_field(:last_name, :id => "RegisterModel_Surname")
  text_field(:password, :id => "RegisterModel_Password")

#@browser.checkbox(:id=>'setShowPassword').set


  def enter_details(data = {})
    populate_page_with data_for(:registration_page, data) #This line of code is for data magic
  end

  def enter_existing_details
    @browser.radio(:id => 'RegisterOption').click
    @browser.text_field(:id => "RegisterModel_Email").set"sa1@sa.com"
    @browser.text_field(:id => "RegisterModel_FirstName").set"sanj"
    @browser.text_field(:id => "RegisterModel_Surname").set"sanj"
    @browser.text_field(:id => "RegisterModel_Password").set"Pasword123"
  end

  def registration_option
    @browser.radio(:id => 'RegisterOption').click
  end

  def create_account
    @browser.button(:value => "Create Account").click
  end

  def complete_incorrect_details(data = {})
    populate_page_with data_for(:registration_page, data)
  end

  def get_validation (message)
    @browser.span(:class => "field-validation-error").text.should== message
  end

#  def registration_error(error_text)
#    @browser.fieldset.divs.each do |rows|
#      if rows.span(:class => 'field-validation-error').exist?
#        rows.span(:class => 'field-validation-error').text.should include error_text
#      end
#    end
#  end
#
#  def assert_error_message(message)
#    error_message.should =~ /#{message}/
#  end
#
#  def your_detail_error_summary(feedback)
#    @browser.div(:class => 'area shadow').text.should == feedback
#  end
#
#  def fill_in_enquiry(email, name1, name2, password = "")
#    self.register_email = email
#    self.first_name = name1
#    self.last_name = name2
#    self.password = password
#  end
#
#  def get_email_validation
#    @browser.span(:class => "field-validation-error").text
#  end
#
#  def get_name1_validation
#    @browser.span(:class => "field-validation-error").text
#  end
#
#  def get_name2_validation
#    @browser.span(:class => "field-validation-error").text
#  end
#
#  def get_password_validation
#    @browser.span(:class => "field-validation-error").text
#  end
end