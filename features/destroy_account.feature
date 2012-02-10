@admin
Feature: Destroy account
  In order to delete a user
  As a administrator
  I want to destroy its account

  Scenario:
    Given 2 users exist
    And I visit the accounts index page
    And I see the two accounts
    When I delete one of them
    Then I should be redirected to the accounts index page
    And I should see the remaining account
    And the deleted account should not exist anymore
