Feature: view reservations as a Guest user
  As a Guest user
  So that I can manage my reservations
  I want to be able to view my reservations
  
  Given that I have a Guest user account 
  And I am logged in as a Guest user
  
Scenario: viewing the reservation list with content
  When I click "View Reservations"
  And the "Reservations List" has content
  Then I should see a list of my current reservations
  
Scenario: viewing an empty reservation list 
  When I click "View Pending Reservations"
  And the "Reservations List" is empty
  Then I should see a notice "You have no reservations"