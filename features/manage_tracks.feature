Feature: Manage tracks
  In order to manage tracks for albums
  Authenticated user
  wants to add tracks to albums
  
  Scenario Outline: Add new track to existing album
    Given An existing album with "title" "One"
    And I am logged in as "mjohann@web.de" with password "123456"
    And I am on the new album track page
    Then I should see "New track"
    And I fill in "Title" with "<title>"
    And I fill in "Duration" with "<duration>"
    And I press "Save"
    Then I should see "Track was successfully created."
  Examples:
    | title | duration |
    | One   | 360      |
    | Two   | 132      |
    | Three | 544      |
    | Four  | 243      |

  Scenario: Try adding a new track to existing album without authentication
    Given An existing album with "title" "One"
    And I am not authenticated
    And I am on the new album track page
    Then I should not see "New track"
    And I should see "Sign in"
    Then I should not see "Track was successfully created."
@wip
  Scenario Outline: Try adding a new track without album
    And I am logged in as "mjohann@web.de" with password "123456"
    And I am on the new album track page
    Then I should see "New track"
    And I fill in "Title" with "<title>"
    And I fill in "Duration" with "<duration>"
    And I press "Save"
    Then I should see "Track was successfully created."
  Examples:
    | title | duration |
    | One   | 360      |
    | Two   | 132      |
    | Three | 544      |
    | Four  | 243      |
