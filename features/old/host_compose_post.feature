Feature: Host Post Composition
    As an OpenHouse Host
    So that I can make my space available to other users
    I want to be able to compose a Post

Scenario: Host can start composing a new post
    GIVEN I am logged in
    AND I am on the "Host" page
    WHEN I click "Compose New Post"
    THEN I should be on the "Compose New Post" page
