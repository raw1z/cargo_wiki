@admin
Feature: Destroy article
  In order to remove information from the wiki
  As an editor
  I want to destroy an article

  Scenario:
    Given 2 articles exist
    And I visit the articles index page
    And I see the two articles
    When I delete one of them
    Then I should be redirected to the articles index page
    And I should see the article remaining in the database
    But I should not see the one deleted
