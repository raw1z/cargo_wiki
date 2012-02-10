@admin
Feature: Accounts index
  In order to know the people allowed to create content
  As an administrator
  I want to see the list of account

  Scenario:
    Given 10 users exist
    When I visit the accounts index page
    Then I should see the accounts list
    And I should be able edit/destroy the existing accounts
    And I should be able to create a new account
