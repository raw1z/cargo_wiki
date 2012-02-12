@editor
Feature: Article tags
  In order to organize the information
  As an editor
  I want to tag the articles

  Scenario: Assign tags to an article
    Given I visit the articles index page
    And I click on 'New Article'
    And I fill the new article form with valid data
    And I tag the article with "foo, bar"
    When I click on 'Create'
    Then I should be redirected to the new article show page
    And I should see the newly created article
    And I should see the tags