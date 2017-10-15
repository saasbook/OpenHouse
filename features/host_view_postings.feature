Feature: Hosts can view their postings
  As a host
  So that I can see what postings I have
  I want to be able to view list of my postings

Scenario: host views active postings
  Given I am logged in as a Host
  When I click the "View My Active Postings" button
  Then I should see a list of all my active postings
  
Scenario: host views old postings
  Given I am logged in as a Host
  When I click the "View My Old Postings" button
  Then I should see a list of all my old postings