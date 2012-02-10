@admin
Feature: Edit account
  In order to modify an account information
  As an administrator
  I want edit the account

  Background:
    Given a user exists
    And I visit the accounts index page
    And I edit this user account

  Scenario: Changing the username
    Given I change the username to "john.doe"
    When I click on 'Update'
    Then I should be redirected to the accounts index page
    And I should see the new username

  Scenario: Setting an empty username
    Given I change the username to ""
    When I click on 'Update'
    Then I shoud stay on the account edit page
    And I should see the error message "can't be blank"

  Scenario: Changing the role
    Given I change the role to "admin"
    When I click on 'Update'
    Then I should be redirected to the accounts index page
    And I should see the new role

  Scenario: Changing the password
    Given I set the password to "pwd"
    And I set the password confirmation to "pwd"
    When I click on 'Update'
    Then I should be redirected to the accounts index page
    And The password of the user should have been changed

  Scenario: Changing the password with wrong confirmation
    Given I set the password to "pwd"
    And I set the password confirmation to "passwd"
    When I click on 'Update'
    Then I shoud stay on the account edit page
    And I should see the error message "doesn't match confirmation"
    And The password of the user should have not been changed
