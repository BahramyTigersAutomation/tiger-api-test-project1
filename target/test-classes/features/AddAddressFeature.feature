 #@Reggression
 Feature: Create an Account and Add Address to the account
  
  Background: Create new Account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def AddingAnAccountToDataBase = callonce read("CreateAccountFeature.feature")
    And print AddingAnAccountToDataBase
    * def primaryPersonId = AddingAnAccountToDataBase.response.id
    * def token = AddingAnAccountToDataBase.result.response.token
  
  
  Scenario: Add address to an account
    Given path "/api/accounts/add-account-address"
    Given param primaryPersonId = primaryPersonId
    Given header Authorization = "Bearer " + token
    Given request
      """
      {
      
       "addressType": "Apartment",
       "addressLine1": "9314 Cherry Hill Rd",
       "city": "College Park",
       "state": "MD",
       "postalCode": "22740",
       "countryCode": "001",
       "current": true
      }
      """
    When method post
    Then status 201
    And print response