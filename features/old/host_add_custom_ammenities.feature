Feature: Custom Ammenities
    As a Host
    So that I can make my rental space more attractive
    I want to be able to add custom ammenities to a post

Scenario: Host can add custom ammenities while composing a post
    GIVEN I am logged in
    AND I am on the "Compose New Post" page
    WHEN I click "Add Ammennity"
    THEN I should see that ammenity in the list of ammennities

Scenario: Host can add custom ammennities while editing a post
    GIVEN I am logged in
    AND I am on the "Edit Post" page
    WHEN I click "Add Ammennity"
    THEN I should see that ammenity in the list of ammennities
