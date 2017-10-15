Feature: User can contact information
  As a User
  So that I can communicate with others
  I want to be able to provide my contact information
  
Scenario: user add his/her contact information
  Given I am logged in as a User
  When I add my contact information
  And I press save button
  Then my contact information should be added to my user profile