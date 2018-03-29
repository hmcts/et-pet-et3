@wip @javascript

Feature: Response to claim landing page

Background: ET3 landing page
  Given I am on the ET3 landing page

Scenario: Displays what you need for this form
  Then I should see a list for what you need for this form

Scenario: Displays how to fill in the form
  Then I should see a list for how to fill in the form

Scenario: Displays data Protection Act 1998
  Then I should see information about data Protection Act 1998

Scenario: Begin this form
  When I click on the begin this form button
  Then I should be taken to the respondents details page
