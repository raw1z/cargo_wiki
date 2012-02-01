@editor
Feature: Create article
  In order to publish information
  As an editor
  I want create an article

  Background:
    Given I visit the articles index page
    And I click on 'New Article'

  Scenario: Valid form informations
    And I fill the new article form with valid data
    When I click on 'Create'
    Then I should be redirected to the new article show page
    And I should see the newly created article

  Scenario: Missing Title
    Given I fill the new article form with valid data except the title
    When I click on 'Create'
    Then I should stay on the new article page
    And I should see the error message "can't be blank"

  Scenario: Missing Body
    Given I fill the new article form with valid data except the body
    When I click on 'Create'
    Then I should be redirected to the new article show page
    And I should see only the title of newly created article

  Scenario: Missing Commit message
    Given I fill the new article form with valid data except the commit message
    When I click on 'Create'
    Then I should stay on the new article page
    And I should see the error message "can't be blank"
