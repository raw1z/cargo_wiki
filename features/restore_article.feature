@admin
Feature: Restore article
  In order to publish again previously deleted information
  As an administrator
  I want to restore an unpublished article

  Scenario:
    Given 2 articles exist
    And I visit the articles index page
    And I unpublish one of them
    And I see the unpublished article in the unpublished article list
    When I restore it
    Then I should be redirected to the articles index page
    Then I should see the 2 articles in the published articles list
