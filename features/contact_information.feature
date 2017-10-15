Feature: contact information
  
  As a user,
  So that I can directly contact other hosts and/or guests
  I want to know their contact information.

Background: user accounts have been added to database, and Aladdin has contact information

  Given the user accounts exist:
  | name        | password  | credit card   |
  | Aladdin     | password  | 11111111      |
  | Terminator  | 12345     | 00010001      |
  | Pepsiman    | pepsi     | 12341234      |
  And "Aladdin" updates his "contact information" as "(+1)111-1111"
  Then "Terminator" makes a post "p1" with "(+1)234-5678" as "contact information"
  
Scenario: finding contact information on a post
  Given I log in as "Aladdin"
  And I go to the information page of "p1"
  Then I should see "(+1)234-5678"

Scenario: seeing others profile contact information
  Given I log in as "Pepsiman"
  And I go to the profile page of "Aladdin"
  Then I should see "(+1)111-1111"
