This is a test plan for a simple budgeting app https://github.com/ModusCreateOrg/budgeting. Please read test plan carefully. Execution steps at the end of this file.

The framework with built using several tools: Ruby-2.3.1, Cucumber, Rspec, Capybara, etc.

# 1. Introduction
This is a simple budget management application. It tracks inflow and outflow, shows the remaining budget, and interesting reports with charts. As such, it offers more features than the usual Todo App.
Budgeting app is a showcase project that demonstrates important decisions in architecture and development of a modern React application.

# 2. Plan Components
## 2.1. Objectives 
The general goal of this test effort will be to test budgeting app functionality across its two modules: Budgeting and Reports. Also, the integration between these modules. 

## 2.2. Testing Components
This app functionality will be tested at three levels:
The functionality of the Budget module and testing the function of adding amounts with different categories and validating summation and subtraction operations.
The functionality of the Reports module and the relation between charts and charts' map guide in these components:  
- Inflow vs Outflow
- Spending by Category.

The integration between Budget module and Reports module will be tested to make sure that the charts in Reports module are a mirror to what being added to Budget module.

## 2.3. Training Required
Since we are going to create data on the fly, there is a need to know how to reset defaultTransactions to have the upper hand on test data. Also,  search is needed to know how to run automated test using npm. 
Except that, no new training should be required to achieve the testing goals enumerated in this plan. 

# 3. Scope
## 3.1. Features to Be Tested
All features of Budgeting app should be tested:
- Adding saving/expenses amount in Budget module
- Calculating Working Balance in Budget module
- View charts to represent Inflow vs Outflow
- View charts to represent Spending by Category

## 3.2. Features Not to Be Tested
No features should be excluded from the testing of this app. 

# 4. Testing Strategy 
Describe the overall approach to testing. For each major group of features or feature combinations, specify the approach which will ensure that these feature groups are
adequately tested. Specify the major activities, techniques, and tools which are used to test the designated groups of features.
The approach should be described in sufficient detail to permit identification of the major testing tasks.

## 4.1. Expected Unit Testing (By Developers)
### 4.1.1. Participants
The Development group will be handling unit testing. Several developers will be working on this effort. 

### 4.1.2. Methodology:
Unit testing will be performed using Jest. Unit tests will be run as part of an existing continuous integration process which is handled by developer resources. SQA will not be involved in this process. 

## 4.2. New Feature Functionality Testing
### 4.2.2. Automated Testing
Only three test cases must be automated and this number may be increased based on allowed time and resource availability. Also, these automated tests should cover end to end testing.
Automated tests are highlighted in bold. 

### 4.2.3. Manual Testing
Manual testing will be performed to verify the functionality of individual components and highlighting parts and colors match between charts and charts’ guide.

#### Budget Screen Tests:
- *Navigating between Budget and Reports screens*
- *Check Budget screen while there are no data in the screen*
- *Check Reports screen while there are no data in the screen*
- *Compare Category dropdown list with what configured in the system*
- *Validate the headers with the spec in Budget screen*
- *Check the functionality of each Category item*
- *Check the style of each added Category item*
- *Check that ADD button is enabled when filling Value field*
- ***Check the functionality of adding records***
- *Check the sorting of added records*
- ***Check the functionality of Working Balance equation***
- *Check the style of Working Balance equation*

#### Reports Screen - Inflow vs Outflow
- *Check the mapping between charts and charts' guide*
- *Check that there are no duplicate colors in the charts*
- *Check that the total under each chart*

#### Reports Screen - Spending by Category
- *Check that the number of colors blocks equal number of colors in charts' guide*

#### Integration and End to End:
- ***Check that all Categories and Values are displayed correctly in Inflow vs Outflow charts***
- ***Check that total Inflow/Outflow of used categories in Budget is displayed correctly in Inflow vs Outflow charts***
- ***Check that all Categories and Values will be displayed correctly in Sending by Category's chart***


### 4.2.4. System & Integration Testing
Integration testing should be done between Budget and Reports modules.

### 4.2.5. Performance and Load Testing 
Performance and load testing will not be done, as the scope of the changes implemented for this change does not warrant it.

### 4.3. Regression Testing
Regression testing will not be performed in this round since this is the first round of testing for this app.

# 5. Dependencies
## 5.1. Hardware Requirements
There are no new hardware requirements introduced by implementing Mandatory Fields functionality.

## 5.2. Data 
Tests will create necessary data on the fly, only if we succeeded to know how we can reset defaultTransactions in the UI.

## 5.3. Software
There is no new software needed to complete testing.

## 5.4. Services
There are no new services needed to complete testing.

# 6. Test Schedule
Testing activities should be done in two days. Testing may start on 23 October 2018 and should end 25 October 2018.

# 7. Risks/Assumptions
There are no security concerns since the app and the code are public for all users.


#Run the Tests

Before running the tests, please be informed that I removed the default data (which were exist in ./app/modules/defaults.js), so, I can control test data and make each scenario isolated.

## Before Running the Tests
We need to clone and build the application under test before executing our automation tests:
1.  Run `git clone https://github.com/Degwy/budgeting.git` to download the app on your machine 
2.  Navigate to project directory and run `npm install` to install app dependencies
3.  Run `npm start` to serve the app on [localhost:8000](http://localhost:8000)
4.  Run `npm run install-gems` to build automation test dependencies

## Running the Tests
To Run the tests, you need to make sure that you are downloaded and updated chrome driver to version 69. Also, you need to make sure that you are using Ruby version  2.31
You have the following options:
1.  Run `npm run automated-tests` to run all automated tests and a HTML report will be produced in the project directory (automated_test_result.html) 
2.  To run a specific the tests of specific tag, run `TAG=@e2e npm run automated-tests-tags`. Two tags are defined for now: @e2e and @add_budget    
