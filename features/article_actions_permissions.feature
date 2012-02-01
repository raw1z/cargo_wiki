Feature: Article actions permissions
  Describe the permissions for articles by role

  @anonymous_visitor
  Scenario: Forbid article creation by anonymous visitors
    Given I visit the articles index page
    When I try to create a new article
    Then I should be redirected to the login page
    And I should see the flash error message "You must be logged in to access this page"

  Scenario: Forbid article edition by anonymous visitors
    Given an article exists
    Given I visit the articles index page
    When I try to edit this article
    Then I should be redirected to the login page
    And I should see the flash error message "You must be logged in to access this page"
