@shows
Feature: Shows
  In order to have shows on my website
  As an administrator
  I want to manage shows

  Background:
    Given I am a logged in refinery user
    And I have no shows

  @shows-list @list
  Scenario: Shows List
   Given I have shows titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of shows
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @shows-valid @valid
  Scenario: Create Valid Show
    When I go to the list of shows
    And I follow "Add New Show"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 show

  @shows-invalid @invalid
  Scenario: Create Invalid Show (without Title)
    When I go to the list of shows
    And I follow "Add New Show"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 shows

  @shows-edit @edit
  Scenario: Edit Existing Show
    Given I have shows titled "A Title"
    When I go to the list of shows
    And I follow "Edit this show" within ".actions"
    Then I fill in "Title" with "A different Title"
    And I press "Save"
    Then I should see "'A different Title' was successfully updated."
    And I should be on the list of shows
    And I should not see "A Title"

  @shows-duplicate @duplicate
  Scenario: Create Duplicate Show
    Given I only have shows titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of shows
    And I follow "Add New Show"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 shows

  @shows-delete @delete
  Scenario: Delete Show
    Given I only have shows titled UniqueTitleOne
    When I go to the list of shows
    And I follow "Remove this show forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 shows
 