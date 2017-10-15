Feature: Hosts can upload images
  As a Host
  So that I can attract Guests
  I want to upload images of my space.

Scenario: host uploads images
  Given I am logged in as a Host
  And I am on the New Posting page
  When I upload images of my rental place
  Then images should be added to the post