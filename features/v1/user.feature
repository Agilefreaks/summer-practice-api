Feature: V1 User
  As a api client
  I want to manage users

  @focus
  Scenario: Create user
    When I create a user
    Then it should respond with created
    And the user should be returned

    @focus
  Scenario: Update user
    Given a user exists
    When I update 'first_name' to 'Gigi' for that user
    Then it should respond with ok
    And the user 'first_name' should be updated to 'Gigi'

  Scenario: Delete user
    Given a user exists
    When I remove that user
    Then it should respond with no content
    And I get that user
    Then it should respond with not found

  Scenario: Get a user
    Given a user exists
    When I get that user
    Then the user should be returned

  Scenario: Get all users
    Given a user exists
    When I retrieve the list of users
    Then I will get a response containing the list of users

  Scenario: Filter users
    Given a user exists, with 'first_name' being 'Ion'
    When I filter by 'first_name', all the users with value 'Ion'
    Then I will get a response containing the list of users
