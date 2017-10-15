Feature: archived requests
  
  As a user,
  So that I can know when redo a request
  I want to know when my requests are declined.

Background: user accounts have been added to database, and some requests and declines

  Given the user accounts exist:
  | name        | password  | credit card   |
  | Aladdin     | password  | 11111111      |
  | Terminator  | 12345     | 00010001      |
  | Pepsiman    | pepsi     | 12341234      |
  
  And "Terminator" makes a post "p1"
  And "Terminator" makes a post "p2"
  And "Pepsiman" makes a post "p3"
  And "Aladdin" make a request for "p1" to "Terminator"
  And "Aladdin" make a request for "p2" to "Terminator"
  And "Aladdin" make a request for "p3" to "Pepsiman"
  
Scenario: receiving declined requests
  Given "Terminator" declines "Aladdin" request for "p1"
  
  And I log in as "Aladdin"
  And I click "View Archived Requests"
  Then I should see "p1"

Scenario: multiple declined requests
  Given "Pepsiman" declines "Aladdin" request for "p3"
  Then "Terminator" declines "Aladdin" request for "p2"
  Then "Terminator" declines "Aladdin" request for "p1"
  
  Then I log in as "Aladdin"
  And I click "View Archived Requests"
  Then I should see "p1"
  Then I should see "p2"
  Then I should see "p3"
 