@admin
Feature: Create account
  In order to add a new editor
  As an administrator
  I want to create a new account

  Background:
    Given I am on the accounts index page
    And I click on 'New Account'

  Scenario: Valid form
    Given I fill the new account form with valid data
    When I click on 'Create'
    Then I should be redirected to the accounts index page
    And I should see the newly created account

  Scenario Outline: Invalid form
    Given I fill the new account form with valid data except <field>
    When I click on 'Create'
    Then I should stay on the new account page
    And I should see the error message "<error_message>"

    Scenarios:
      | field                 | error_message              |
      | username              | can't be blank             |
      | role                  | can't be blank             |
      | password              | doesn't match confirmation |
      | password confirmation | doesn't match confirmation |
