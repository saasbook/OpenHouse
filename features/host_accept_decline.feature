Feature: Accept/Decline Reservations
    As a Host
    So that I can decide who gets to use my space
    I want to be able to accept or decline individual reservation requests

Scenario: Host can accept requests
    GIVEN I am logged in
    AND I am on the "Reservation Requests" page
    AND I click "Accept" for a reservation
    THEN that reservation request should be accepted
    THEN I should see a confirmation message
    THEN that request should appear as accepted
    (possibly then the other requests should get cancelled? We haven't dealt with pooling yet.)

Scenario: Host can decline requests
    GIVEN I am logged in
    AND I am on the "Reservation Requests" page
    AND I click "Decline" for a reservation
    THEN that reservation request should be declined
    THEN I should see a confirmation message
    THEN that request should appear as declined

Scenario: Host cannot accept too many people
    GIVEN I am logged in
    AND I am on the "Reservation Requests" page
    (AND the number of accepted requests is already at the maximum
    THEN I should not see the "Accept" button next to any of the requests
    THEN I should not see any unaccepted requests

Scenario: Host cannot decline a request that has already been accepted
    GIVEN I am logged in
    AND I am on the "Reservation Requests" page
    AND I click "Decline" for an accepted reservaion
    THEN I should see an error message
    THEN that request should remain accepted
