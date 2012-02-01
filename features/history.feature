@editor
Feature: History
  In order to see the modifications done on the site
  As a user
  I want to consult the history of modifications

  Scenario: Entire appliction's history
    Given 2 articles exist
    And I changed the title of one of them
    When I visit the history page
    Then I should see two changes on the last modified article
    And I should see one change on the other one

  Scenario: Article's history
    Given an article exists
    And I changed its title
    When I visit the article history page
    Then I should see my changes on that article

  Scenario: Back to article from article's history
    Given an article exists
    When I visit the article history page
    Then I should be able to return to the article show page
