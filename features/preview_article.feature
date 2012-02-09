@editor
Feature: Preview article
  In order to see the article I'm writing
  As a editor
  I want to preview its content

  Background:
    Given an article exists
    And I visit its show page
    And I click on 'Edit'
    And I change the body to 'Lorem ipsum dolor sit amet.'

  @javascript
  Scenario: Previewing the body
    When I click on 'Preview'
    Then I should see a preview of new body

  @javascript
  Scenario: Back to Edit
    And I click on 'Preview'
    And I see a preview of new body
    When I click on 'Back to Edit'
    Then the preview should be hidden
    And I should see the edit form again