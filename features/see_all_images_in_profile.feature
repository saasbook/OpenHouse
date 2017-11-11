# Pivotal Tracker ID: 152366073
Feature: Users can see more pictures by going to the user's profile
    As a user who wants to rent a house
    So that I can better decide if I like an option
    I want to be able to see more photos of it

Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 101 Agrabah Dessert | Agrabah       | ME          | 10101         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |

Scenario: user clicks on a picture and is taken to see more images
    Given I am on the home page
    When I press "Search"
    And I click on an image
    Then I should see more pictures of the rental space of "Ali"

Scenario: user clicks on the profile and should see more images
    Given I am on the home page
    When I press "Search"
    And I follow "See More"
    Then I should see more pictures of the rental space of "Ali"