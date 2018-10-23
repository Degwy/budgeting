# 1. Introduction
This is a simple budget management application. It tracks inflow and outflow, shows remaining budget, and interesting reports with charts. As such, it offers more features than the usual Todo App.
Budgeting app is a showcase project that demonstrates important decisions in architecture and development of a modern React application.

# 2. Plan Components
## 2.1. Objectives 
The general goal of this test effort will be to test budgeting app functionality across its two modules: Budgeting and Reports. Also, the integration between these modules. 

## 2.2. Testing Components
This app functionality will be tested at three levels:
The functionality of Budget module and testing the function of adding amounts with different categories and validating summation and subtraction operations.
The functionality of Reports module and the relation between charts and charts’s map guide in these components:  
- Inflow vs Outflow
- Spending by Category.

The integration between Budget module and Reports module will be tested to make sure that the charts in Reports module are a mirror to what being added to Budget module.

## 2.3. Training Required
Sinc we are going to create data on the fly, there is a need to know how to reset defaultTransactions to have the upper hand on test data. 
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
Only three test must be automated and this number may be increased based on allowed time and resource availability. Also, these automated tests should cover end to end testing. 

### 4.2.3. Manual Testing
Manual testing will be performed to verify the functionality of individual components and highlighting parts and colors match between charts and charts’ guide.

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
