Feature: Guest can filter the search results

  As a user
  So that I can better search for what I am looking for
  I want to be able to filter the search results

Background: houses have been added to database

  Given the following homes exist:
  | address                 | post_date |
  | 1 home drive            | 25-Nov-1992  |
  | 2 home drive            | 26-Oct-1984  |

Scenario: Filter search results
  When I follow "Filter Search Results"
  And I select "Filter by oldest"
  Then I should see "Property 1" first