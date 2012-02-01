@editor
Feature: Edit article
  In order to complete/change the information previously added
  As an editor
  I want to edit an article

  Background:
    Given an article exists
    And I visit its show page
    And I click on 'Edit'

  Scenario: Changing the title
    And I change the title to 'New Title'
    And I write a valid commit message
    When I click on 'Update'
    Then I should be redirected to the article show page
    And I should see the new title

  Scenario: Changing the body
    And I change the body to 'Lorem ipsum dolor sit amet.'
    And I write a valid commit message
    When I click on 'Update'
    Then I should be redirected to the article show page
    And I should see the new body

  Scenario: Empty title
    And I change the title to ''
    And I write a valid commit message
    When I click on 'Update'
    Then I should stay on the edit article page
    And I should see the error message "can't be blank"

  Scenario: Empty Body
    And I change the body to ''
    And I write a valid commit message
    When I click on 'Update'
    Then I should be redirected to the article show page
    And I should see the article with an empty string

  Scenario: Empty Commit Message
    And I change the title to 'New Title'
    And I change the body to 'Lorem ipsum dolor sit amet.'
    And I do not write the commit message
    When I click on 'Update'
    Then I should stay on the edit article page
    And I should see the error message "can't be blank"
