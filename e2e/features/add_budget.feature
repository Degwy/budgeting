@add_budget
Feature: As a user, I should be able to add new records

# Last two examples should fail because the user should not be able to add zero amount
  Scenario Outline: Check the functionality of adding records
    Given I fill "<category>" category with value "<value>$"
    When I click on "Add" button
    Then "<category>" category "<vision>" be added and having the value "<value>$"
    Examples:
      | category      | value     | vision     |
      | Groceries     | 100.00    | should     |
      | School        | 149.54    | should     |
      | Entertainment | 200.54    | should     |
      | Utensils      | 299.54    | should     |
      | Kids          | 300.54    | should     |
      | Travel        | 305.54    | should     |
      | Commute       | 325.54    | should     |
      | Insurance     | 400.54    | should     |
      | Clothing      | 450.54    | should     |
      | Car           | 500.54    | should     |
      | Taxes         | 650.54    | should     |
      | Health        | 700.54    | should     |
      | Home          | 750.54    | should     |
      | Beauty        | 800.54    | should     |
      | Income        | 10,000.00 | should     |
      | Misc          | 900.00    | should     |
      | Gifting       | 50.00     | should     |
      | Income        | 0.00      | should not |
      | Gifting       | 0.00      | should not |


    # Second example should fail because Working Balance should be displayed in
    # negative if outflow is bigger than inflow
  Scenario Outline: Check the functionality of Working Balance equation
    Given I am adding the following records
      | category      | value     |
      | <v_category>  | <v_value> |
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
    Examples:
      | v_category | v_value   |
      | Income     | 10,000.25 |
      | Income     | 1,000.25  |
      | Income     | 1385.02   |

