Feature: Logging into the Wiggle website
  As a Wiggle customer
  I want to be able to log in to the Wiggle website
  So I can access the checkout sections of the site

Background:
  Given I am on the wiggle login page

  @readytotest
  Scenario: Valid credentials
    When I sign in with valid credentials
    Then I should be logged in

  @readytotest
  Scenario Outline: l ogin invalid credentials
    When I sign in with the email <username>
    When I sign in with the password <password>
    And I click on login button
    Then I should see the message '<message>'
  Examples:
    | username                        | password    | message                                                                        |
    | unregistered_user@wiggle.co.uk  | 123Password | Sorry we could not log you in. Please try entering your account details again. |
    | cucumber_ruby_test@wiggle.co.uk |             | Please enter your password                                                     |
    |                                 | 123Password | Please ensure you have entered the correct email address                       |
    | nonemail format                 | 123Password | Please use a valid email address in the format: name@site.domain               |

  @readytotest
  Scenario: Forgotten password
    When I click the forgot my password function
    Then I should be prompted "Enter the e-mail address associated with your wiggle.co.uk account" on password recovery page

  @work-in-progress
  Scenario: Unregistered user
    When I sign in with the email "unregistered_user@wiggle.co.uk" and password "123Password"
    Then I should see the message "Sorry we could not log you in. Please try entering your account details again."

  @work-in-progress
  Scenario: Empty password
    When I sign in with the email "cucumber_login_test@wiggle.co.uk" and password ""
    Then I should see the message "Please enter your password"

  @work-in-progress
  Scenario: Empty e-mail
    When I sign in with the email " " and password "not_my_password"
    Then I should see the message "Please ensure you have entered the correct email address"

  @work-in-progress
  Scenario: Invalid e-mail format
    When I enter the email address "nonemail format" and password "123Password"
    Then I should see the message "Please use a valid email address in the format: name@site.domain"



