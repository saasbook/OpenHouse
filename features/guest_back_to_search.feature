Feature: Guest can go back from post page to search results page

  As a guest
  after I press the go back button from the post page
  I want to go back to search results page
  
Scenario: Press the go back button
  When I select "go back"
  Then I should see "search results"
  