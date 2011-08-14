@bios
Feature: Bios
  In order to have bios on my website
  As an administrator
  I want to manage bios

  Background:
    Given I am a logged in refinery user
    And I have no bios

  @bios-list @list
  Scenario: Bios List
   Given I have bios titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of bios
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @bios-valid @valid
  Scenario: Create Valid Bio
    When I go to the list of bios
    And I follow "Add New Bio"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 bio

  @bios-invalid @invalid
  Scenario: Create Invalid Bio (without Name)
    When I go to the list of bios
    And I follow "Add New Bio"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 bios

  @bios-edit @edit
  Scenario: Edit Existing Bio
    Given I have bios titled "A Name"
    When I go to the list of bios
    And I follow "Edit this bio" within ".actions"
    Then I fill in "Name" with "A different Name"
    And I press "Save"
    Then I should see "'A different Name' was successfully updated."
    And I should be on the list of bios
    And I should not see "A Name"

  @bios-duplicate @duplicate
  Scenario: Create Duplicate Bio
    Given I only have bios titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of bios
    And I follow "Add New Bio"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 bios

  @bios-delete @delete
  Scenario: Delete Bio
    Given I only have bios titled UniqueTitleOne
    When I go to the list of bios
    And I follow "Remove this bio forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 bios
 