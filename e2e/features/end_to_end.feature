@e2e
Feature: Create end to end scenarios to test budgeting app located at
  https://github.com/ModusCreateOrg/budgeting

  Background:
    Given I am adding the following records
      | category      | value     |
      | Income        | 10,000.25 |
      | Income        | 5,500.00  |
      | Groceries     | 100.00    |
      | School        | 149.54    |
      | Entertainment | 200.54    |
      | Utensils      | 299.54    |
      | Kids          | 300.54    |
      | Travel        | 305.54    |
      | Commute       | 325.54    |
      | Insurance     | 400.54    |
      | Clothing      | 450.54    |
      | Car           | 500.54    |
      | Taxes         | 650.54    |
      | Health        | 700.54    |
      | Home          | 750.54    |
      | Beauty        | 800.54    |
      | Misc          | 900.00    |
      | Gifting       | 50.00     |
    And I collect total "Inflow" amounts
    And I collect total "Outflow" amounts
    When calculate Working Balance equation
    Then the calculation should be correct


  Scenario: Check that total Inflow/Outflow of used categories in Budget is displayed correctly in Inflow vs Outflow charts
    Given I click on "Reports" link
    When I click on "Inflow vs Outflow" link
    Then Inflow and Outflow values should be correct


  Scenario Outline: Check that all Categories and Values are displayed correctly in all Reports' charts
    Given I click on "Reports" link
    When I click on "<chart>" link
    Then all Outflow categories should have correct amounts
    Examples:
      | chart                |
      | Inflow vs Outflow    |
      | Spending by Category |
