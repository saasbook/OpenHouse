Feature: view reservation requests as a Guest user
  As a Guest user
  So that I can manage my requests
  I want to be able to view my pending requests
  
  Given that I have a Guest user account 
  And I am logged in as a Guest user
  
Scenario: viewing a request list with content
  When I click "View Pending Reservations"
  And the "Requests List" has content
  Then I should see a list of my pending reservation requests
  
Scenario: viewing an empty request list 
  When I click "View Pending Reservations"
  And the "Requests List" is empty
  Then I should see a notice "You have no pending requests"