Feature: Guest can search for available spaces by location

  As a guest
  So that I can rent an available space
  I want to be able to search available spaces by location

Background: houses have been added to database
  
  Given the following homes exist:
  | address                 | post_date |
  | 1 home drive, CA        | 25-Nov-1992  |
  | 2 home drive, VA        | 26-Oct-1984  |
Scenario: Search for a space
  When I follow "search"
  And my lcoation is "CA"
  Then I should see "1 home drive, CA"