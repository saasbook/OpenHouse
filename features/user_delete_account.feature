Feature: User deletes account
  As a OpenHouse User
  So that I can stop using OpenHouse
  I want to delete my account

Scenario: delete account
  Given I pressed on delete account button
  And I want to delete my account
  When I delete my account
  Then I expect my account to be deleted from the database