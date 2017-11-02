# Pivotal Tracker ID: 151973833
Feature: Users can see pictures in search
    As a user who wants to rent a space
    So that I can decide which places interest me
    I want to see pictures of my options

Scenario: user can see pictures in the search results
    Given I am on the home page
    When I execute a search
    Then I should see pictures of different houses
