Feature: Register new user

  As a new user
  I want to register to wiggle website
  So that I want to purchase the products online

  Background:
    Given I am on the wiggle login page
  @new
  Scenario:Register as a new user via sign in link
    And I click on sign in link
    And I fill in the registration form
    And I click on create account button
    Then I am registered as a new user and I see "Welcome"
  @readytotest
  Scenario: Register as a new user via Register link
    And I click on Register link
    And I fill in the registration form
    And I click on create account button
    Then I am registered as a new user and I see "Welcome"
  @readytotest
  Scenario: Register as a new user via My Accounts link
    And I click on My Accounts link
    And I fill in the registration form
    And I click on create account button
    Then I am registered as a new user and I see "Welcome"
  @readytotest
  Scenario: Already Existing user
    And I fill in the registration form with the existing email address
    And I click on create account button
    Then I should see the message "An account already exists for the email address sa1@sa.com"
  @readytotest
  Scenario Outline: Field Validation Submit registration form with blank fields
    And I click on Register link
    And I submit Registration details with the following details
      | <field> |
      | <value> |
    Then I should see the error panel <message>
  Examples:
    | field          | value | message                                                                             |
    | register_email |       | Please enter your email address                                                     |
    | first_name     |       | Please enter your first name                                                        |
#    | surname        |       | Please enter your surname                                                           |
    | password       |       | Your password should be at least 6 digits long and contain both letters and numbers |

    #Above scenario could have also been done in one single test.
    @wip
  Scenario: Field Validation Submit registration form with blank fields
    And I click on Register link
    And I have not filled in the Email, FirstName, SurName and Password field
    And I click on create account button
    Then I should see the following error message for the the blank fields
      | Email     | Please enter your email address                                                     |
      | FirstName | Please enter your first name                                                        |
      | SurName   | Please enter your surname                                                           |
      | password  | Your password should be at least 6 digits long and contain both letters and numbers |
  @wip
  Scenario: Submit registration form with invalid password
    And I submit the registration form with incorrect password
    Then I see error message for invalid password
  @wip
  Scenario: Submit registration form with mismatch passwords
    Given I am on the wiggle website
    And I submit the registration form with password mismatch
    Then I see error message for password mismatch
