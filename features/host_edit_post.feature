Feature: edit Post as a Host user
  As a Host user
  So that I can manage my Posts
  I want to be able to edit my Posts
  
  Given I am logged in as a Host
  And I am on the "My Active Listings" page
  
Scenario:
  When I click the "Edit Post" button
  Then I should be on the "Edit Posting" page
  And I make my changes
  When I click "Save"
  Then my post should be updated