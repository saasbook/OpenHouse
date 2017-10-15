Feature: Host profile calendar

  As a Host
  So that I can see when my spaces are available
  I want to see a calendar of when my spaces are available
  also I want to see a calendar of when my spaces have been reserved

Background: houses have been added to database

  Given the following homes exist:
  | address                 | available |
  | 1 home drive            | W  |
  | 2 home drive            | M  |

Scenario: View when spaces are available
  When I follow "Calendar"
  Then since toal is "Monday" I should see "1 home drive"