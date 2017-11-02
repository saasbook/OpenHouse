# Pivotal Tracker ID: 152366073
Feature: Users can see more pictures by clicking on a search result picture
    As a user who wants to rent a house
    So that I can better decide if I like an option
    I want to be able to see more photos of it

Scenario: user clicks on a picture
    Given I am on the search results page
    And I click on a picture
    Then I should be taken to the house information page
    Then I should see more pictures
