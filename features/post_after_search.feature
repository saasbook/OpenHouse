Feature: post details page
  
  As a user,
  So that I can see the details of a post that I found in search
  I want to go to their details page.

Background: user accounts have been added to database, and posts are made

  Given the user accounts exist:
  | name        | password  | credit card   |
  | Aladdin     | password  | 11111111      |
  | Terminator  | 12345     | 00010001      |
  | Pepsiman    | pepsi     | 12341234      |
  Then "Terminator" makes a post "p1"
  
Scenario: directly go to a post information page
  Given I log in as "Aladdin"
  And I go to the information page of "p1"
  And I should be in the information page of "p1"

Scenario: clicking through search
  Given I log in as "Pepsiman"
  And I search for post
  Then I click "p1"
  Then I should be in the information page of "p1"
