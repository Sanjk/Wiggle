class LoginPage
  include PageObject
  include DataMagic

#def home_pg
#  url = BASE_URL + "/secure/myaccount/logon?returnurl=%2F"
#  @browser.goto(url)
#end

  DEFAULT_DATA = {
      'username'=>'cucumber_ruby_test@wiggle.co.uk',
      'password'=>'123Password'
        }
  text_field(:username, :id => "LogOnModel_UserName")
  text_field(:password, :id => "LogOnModel_Password")


  def enter_login_details(data={})
    data=DEFAULT_DATA.merge(data)
    self.username=data["username"]
    self.password=data["password"]
  end
end

def login_button
  @browser.button(:value, "Login").click
end
