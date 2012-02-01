Feature: Article show page
  Describes the article show page

  Background:
    Given an article exists
    And I visit the articles index page
    When I select this article
    Then I should be redirected to the article show page
    And I should see the title of the article
    And I should see the body of the article
    And I should be able to display the history of the article
    And I should be able to go back to the articles index page

  @anonymous_visitor
  Scenario: Anonymous visitor
    But I should not be able to edit the article

  @editor
  Scenario: Editor
    And I should be able to edit the article
    But I should not be able to destroy the article

  @admin
  Scenario: Admin
    And I should be able to edit the article
    And I should be able to destroy the article
