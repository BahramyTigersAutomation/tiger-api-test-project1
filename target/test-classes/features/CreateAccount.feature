Feature: Create Account

  Background: generate token for all scenarios.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Create new Account happy path
  Given path "/api/accounts/add-primary-account"
  And request {"email": "bahramymatin2603@gmail.com","firstName": "matin","lastName": "bahramy","title": "Qa Engineer","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "employed","dateOfBirth": "1987-01-01",}
  And header Authorization = "Bearer" + generatedToken
  When method post 
  Then status 201
  And print response
  

