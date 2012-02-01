Feature: Articles index
  Describes the articles index page

  Background:
    Given 10 articles exist
    When I visit the articles index page
    Then I should see the articles list
    And I should be able to display the history for each article

  @anonymous_visitor
  Scenario: Visit articles index page as anonymous visitor
    But I should not be able to add/edit/destroy an article

  @editor
  Scenario: Visit articles index page as editor
    And I should be able to add/edit an article
    But I should not be able to destroy an article

  @admin
  Scenario: Visit articles index page as administrator
    And I should be able to add/edit/destroy an article


