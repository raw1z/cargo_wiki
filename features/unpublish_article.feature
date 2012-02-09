@admin
Feature: Unpublish article
  In order to remove information from the wiki
  As an adminisrator
  I want to unpublish an article

  Scenario:
    Given 2 articles exist
    And I visit the articles index page
    And I see the two articles
    When I unpublish one of them
    Then I should be redirected to the articles index page
    And I should see the unpublished article in the unpublished article list
    And I should see the other one in the published articles list
