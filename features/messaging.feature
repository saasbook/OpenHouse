Feature: messaging to others
  
  As a user,
  So that I can communicate directly to hosts and guests alike
  I want to be able to send messages to other users.

Background: user accounts have been added to database

  Given the user accounts exist:
  | name        | password  | credit card   |
  | Aladdin     | password  | 11111111      |
  | Terminator  | 12345     | 00010001      |

Scenario: message other users
  Given I log in as "Aladdin"
  And "Aladdin" sends "wazzzup" to "Terminator"
  And "Terminator" should have received "wazzzup"

Scenario: checking for messages
  Given I log in as "Aladdin"
  And I click the "View Messages" button
  Then I should be on the messaging page

Scenario: seeing others message
  Given I log in as "Terminator"
  And "Aladdin" sends "wazzzup" to "Terminator"
  And I click the "View Messages" button
  Then I should see "wazzzup"
