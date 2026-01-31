# QA Engineering Framework Assessment - MCQ

## Test Automation Frameworks

### 1. Which design pattern is most commonly used in Selenium test automation?
- A) Singleton Pattern
- B) Factory Pattern
- C) Page Object Model (POM)
- D) Observer Pattern

**Answer: C) Page Object Model (POM)**

### 2. What is the primary purpose of the Page Object Model?
- A) To reduce code duplication and improve test maintenance
- B) To speed up test execution
- C) To generate test reports
- D) To handle database connections

**Answer: A) To reduce code duplication and improve test maintenance**

### 3. Which framework is NOT a JavaScript-based E2E testing framework?
- A) Cypress
- B) Playwright
- C) WebDriverIO
- D) TestNG

**Answer: D) TestNG**

### 4. In TestNG, what annotation is used to execute a method before each test method?
- A) @BeforeClass
- B) @BeforeMethod
- C) @BeforeTest
- D) @BeforeSuite

**Answer: B) @BeforeMethod**

### 5. Which assertion library is commonly used with Jest?
- A) Chai
- B) Expect (built-in)
- C) AssertJ
- D) Hamcrest

**Answer: B) Expect (built-in)**

## Selenium WebDriver

### 6. Which WebDriver method is used to find multiple elements?
- A) findElement()
- B) findElements()
- C) getElements()
- D) selectElements()

**Answer: B) findElements()**

### 7. What is the default implicit wait time in Selenium?
- A) 0 seconds
- B) 10 seconds
- C) 30 seconds
- D) 60 seconds

**Answer: A) 0 seconds**

### 8. Which wait strategy is more efficient and recommended in Selenium?
- A) Thread.sleep()
- B) Implicit Wait
- C) Explicit Wait
- D) Fixed Wait

**Answer: C) Explicit Wait**

### 9. What does the FluentWait provide that WebDriverWait doesn't?
- A) Custom polling interval and ignore specific exceptions
- B) Faster execution
- C) Better locators
- D) Parallel execution

**Answer: A) Custom polling interval and ignore specific exceptions**

### 10. Which locator strategy is generally the most reliable in Selenium?
- A) By.id()
- B) By.xpath()
- C) By.className()
- D) By.linkText()

**Answer: A) By.id()**

## Cypress

### 11. What is a key difference between Cypress and Selenium?
- A) Cypress runs inside the browser
- B) Cypress supports multiple browsers
- C) Cypress uses WebDriver protocol
- D) Cypress is faster than Selenium

**Answer: A) Cypress runs inside the browser**

### 12. Which command in Cypress is used to wait for an element to be visible?
- A) cy.wait()
- B) cy.should('be.visible')
- C) cy.waitFor()
- D) cy.visible()

**Answer: B) cy.should('be.visible')**

### 13. What is the default timeout for Cypress commands?
- A) 2000ms
- B) 4000ms
- C) 5000ms
- D) 10000ms

**Answer: B) 4000ms**

### 14. Which Cypress command is used to stub network requests?
- A) cy.stub()
- B) cy.intercept()
- C) cy.mock()
- D) cy.route()

**Answer: B) cy.intercept()**

### 15. Can Cypress test multiple browser tabs simultaneously?
- A) Yes, using cy.switchTab()
- B) Yes, using cy.window()
- C) No, it's a limitation of Cypress
- D) Yes, using cy.multiTab()

**Answer: C) No, it's a limitation of Cypress**

## Playwright

### 16. Which of the following is a key advantage of Playwright?
- A) Auto-waiting for elements
- B) Only supports Chrome
- C) Requires WebDriver
- D) Java-only framework

**Answer: A) Auto-waiting for elements**

### 17. How does Playwright handle multiple browser contexts?
- A) Requires separate WebDriver instances
- B) Uses isolated browser contexts within a single browser instance
- C) Not supported
- D) Requires multiple physical browsers

**Answer: B) Uses isolated browser contexts within a single browser instance**

### 18. Which programming languages does Playwright support?
- A) Only JavaScript
- B) JavaScript, TypeScript, Python, C#, Java
- C) Only Python
- D) JavaScript and Java only

**Answer: B) JavaScript, TypeScript, Python, C#, Java**

### 19. What is the Playwright Test Runner called?
- A) @playwright/runner
- B) @playwright/test
- C) playwright-runner
- D) pw-test

**Answer: B) @playwright/test**

### 20. Which Playwright method is used to handle file uploads?
- A) page.upload()
- B) page.setInputFiles()
- C) page.fileUpload()
- D) page.attachFile()

**Answer: B) page.setInputFiles()**

## API Testing Frameworks

### 21. Which library is commonly used for API testing in Java?
- A) RestAssured
- B) HttpClient
- C) OkHttp
- D) All of the above

**Answer: D) All of the above**

### 22. In RestAssured, which method is used to extract a JSON path value?
- A) extract().jsonPath()
- B) get().jsonPath()
- C) response().jsonPath()
- D) extract().path()

**Answer: D) extract().path()**

### 23. Which HTTP status code indicates successful resource creation?
- A) 200
- B) 201
- C) 204
- D) 301

**Answer: B) 201**

### 24. What does the 'given()' method represent in RestAssured?
- A) Assertions
- B) Request specification
- C) Response validation
- D) API endpoint

**Answer: B) Request specification**

### 25. Which tool is NOT used for API testing?
- A) Postman
- B) SoapUI
- C) Selenium
- D) Insomnia

**Answer: C) Selenium**

## Test Framework Architecture

### 26. What is the primary purpose of a Data-Driven Framework?
- A) To separate test logic from test data
- B) To run tests in parallel
- C) To generate reports
- D) To handle page objects

**Answer: A) To separate test logic from test data**

### 27. Which framework approach uses keywords to represent actions?
- A) Data-Driven Framework
- B) Keyword-Driven Framework
- C) Hybrid Framework
- D) Modular Framework

**Answer: B) Keyword-Driven Framework**

### 28. What is BDD (Behavior Driven Development)?
- A) A programming language
- B) A testing approach that uses natural language specifications
- C) A database framework
- D) A deployment tool

**Answer: B) A testing approach that uses natural language specifications**

### 29. Which BDD framework is used with Java?
- A) Cucumber
- B) SpecFlow
- C) Behave
- D) Jasmine

**Answer: A) Cucumber**

### 30. What language does Cucumber use for writing test scenarios?
- A) Java
- B) Python
- C) Gherkin
- D) Ruby

**Answer: C) Gherkin**

## CI/CD Integration

### 31. Which file is used to configure Jenkins Pipeline?
- A) jenkins.yml
- B) Jenkinsfile
- C) pipeline.xml
- D) config.jenkins

**Answer: B) Jenkinsfile**

### 32. What is the purpose of integrating tests with CI/CD?
- A) To run tests automatically on code changes
- B) To deploy to production
- C) To write better code
- D) To create documentation

**Answer: A) To run tests automatically on code changes**

### 33. Which GitHub Actions syntax is used to define a workflow?
- A) JSON
- B) XML
- C) YAML
- D) TOML

**Answer: C) YAML**

### 34. What is a Docker container's primary benefit in test automation?
- A) Faster test execution
- B) Consistent test environment across different machines
- C) Better test reports
- D) Automatic bug fixing

**Answer: B) Consistent test environment across different machines**

### 35. Which tool is used for container orchestration?
- A) Docker
- B) Kubernetes
- C) Jenkins
- D) Git

**Answer: B) Kubernetes**

## Test Reporting

### 36. Which library generates detailed HTML reports for TestNG?
- A) ExtentReports
- B) Allure
- C) ReportNG
- D) All of the above

**Answer: D) All of the above**

### 37. What information should a good test report include?
- A) Pass/Fail status
- B) Execution time
- C) Screenshots for failures
- D) All of the above

**Answer: D) All of the above**

### 38. Which Maven plugin is used to generate Allure reports?
- A) allure-maven-plugin
- B) maven-allure-plugin
- C) allure-reporter
- D) maven-report-plugin

**Answer: A) allure-maven-plugin**

### 39. What is the purpose of test metrics?
- A) To measure test effectiveness and coverage
- B) To write more tests
- C) To deploy applications
- D) To debug code

**Answer: A) To measure test effectiveness and coverage**

### 40. Which metric indicates the percentage of code executed by tests?
- A) Test Coverage
- B) Pass Rate
- C) Defect Density
- D) Test Velocity

**Answer: A) Test Coverage**

## Mobile Testing Frameworks

### 41. Which framework is used for mobile app automation?
- A) Appium
- B) Espresso
- C) XCUITest
- D) All of the above

**Answer: D) All of the above**

### 42. What protocol does Appium use?
- A) HTTP
- B) WebDriver Protocol
- C) FTP
- D) SMTP

**Answer: B) WebDriver Protocol**

### 43. Which framework is specific to Android testing?
- A) XCUITest
- B) Espresso
- C) Calabash
- D) EarlGrey

**Answer: B) Espresso**

### 44. Which framework is specific to iOS testing?
- A) Espresso
- B) XCUITest
- C) UIAutomator
- D) Robotium

**Answer: B) XCUITest**

### 45. What is the purpose of desired capabilities in Appium?
- A) To define test scenarios
- B) To configure the test environment and device settings
- C) To generate reports
- D) To write test data

**Answer: B) To configure the test environment and device settings**

## Performance Testing

### 46. Which tool is used for performance and load testing?
- A) JMeter
- B) Gatling
- C) LoadRunner
- D) All of the above

**Answer: D) All of the above**

### 47. What does TPS stand for in performance testing?
- A) Tests Per Second
- B) Transactions Per Second
- C) Time Per Session
- D) Total Performance Score

**Answer: B) Transactions Per Second**

### 48. What is the purpose of stress testing?
- A) To find the breaking point of the system
- B) To test normal load
- C) To test UI elements
- D) To test database queries

**Answer: A) To find the breaking point of the system**

### 49. Which metric measures the time taken to receive the first byte of response?
- A) Response Time
- B) TTFB (Time To First Byte)
- C) Latency
- D) Throughput

**Answer: B) TTFB (Time To First Byte)**

### 50. What is a Ramp-up period in load testing?
- A) Time to add all virtual users gradually
- B) Time to complete the test
- C) Time for system recovery
- D) Time to generate reports

**Answer: A) Time to add all virtual users gradually**

## Test Design Patterns

### 51. What is the Factory Pattern used for in test automation?
- A) To create objects without specifying their exact class
- B) To wait for elements
- C) To generate test data
- D) To execute tests in parallel

**Answer: A) To create objects without specifying their exact class**

### 52. What does the Singleton Pattern ensure?
- A) Multiple instances of a class
- B) Only one instance of a class exists
- C) Fast test execution
- D) Better error handling

**Answer: B) Only one instance of a class exists**

### 53. What is the purpose of the Builder Pattern?
- A) To construct complex objects step by step
- B) To destroy objects
- C) To run tests faster
- D) To generate reports

**Answer: A) To construct complex objects step by step**

### 54. Which pattern is useful for managing WebDriver instances?
- A) Factory Pattern
- B) Singleton Pattern
- C) ThreadLocal Pattern
- D) All of the above

**Answer: D) All of the above**

### 55. What is Fluent Interface Pattern?
- A) Method chaining for readable code
- B) A type of wait strategy
- C) A reporting mechanism
- D) A locator strategy

**Answer: A) Method chaining for readable code**

## Python Testing Frameworks

### 56. Which is the most popular testing framework in Python?
- A) unittest
- B) pytest
- C) nose2
- D) doctest

**Answer: B) pytest**

### 57. What decorator is used in pytest to mark a test as a fixture?
- A) @fixture
- B) @pytest.fixture
- C) @setup
- D) @before

**Answer: B) @pytest.fixture**

### 58. Which command runs all tests in pytest?
- A) python test
- B) pytest
- C) python -m pytest
- D) Both B and C

**Answer: D) Both B and C**

### 59. What is the purpose of conftest.py in pytest?
- A) Configuration and shared fixtures
- B) Test execution
- C) Report generation
- D) Database connection

**Answer: A) Configuration and shared fixtures**

### 60. Which assertion style does pytest recommend?
- A) self.assertEqual()
- B) assert keyword
- C) expect()
- D) should()

**Answer: B) assert keyword**

## Testing Best Practices

### 61. What is the testing pyramid concept?
- A) More unit tests, fewer integration tests, even fewer E2E tests
- B) More E2E tests, fewer unit tests
- C) Equal distribution of all test types
- D) Only E2E tests

**Answer: A) More unit tests, fewer integration tests, even fewer E2E tests**

### 62. What is test flakiness?
- A) Tests that pass consistently
- B) Tests that fail intermittently without code changes
- C) Tests that run slowly
- D) Tests with poor assertions

**Answer: B) Tests that fail intermittently without code changes**

### 63. Which practice helps reduce test maintenance?
- A) Hard-coding values
- B) Using dynamic locators and data-driven approach
- C) Writing longer tests
- D) Avoiding comments

**Answer: B) Using dynamic locators and data-driven approach**

### 64. What is the AAA pattern in unit testing?
- A) Act, Arrange, Assert
- B) Arrange, Act, Assert
- C) Assert, Act, Arrange
- D) All, Any, Assert

**Answer: B) Arrange, Act, Assert**

### 65. Why should tests be independent?
- A) To run tests in any order without dependencies
- B) To make tests slower
- C) To increase complexity
- D) To reduce code coverage

**Answer: A) To run tests in any order without dependencies**

## Mock and Stub

### 66. What is the difference between Mock and Stub?
- A) No difference
- B) Mocks verify interactions, Stubs provide predetermined responses
- C) Stubs verify interactions, Mocks provide responses
- D) Both are the same as Spy

**Answer: B) Mocks verify interactions, Stubs provide predetermined responses**

### 67. Which library is commonly used for mocking in Java?
- A) Mockito
- B) PowerMock
- C) EasyMock
- D) All of the above

**Answer: D) All of the above**

### 68. What is a Spy in testing?
- A) A tool to monitor application logs
- B) A partial mock that calls real methods unless stubbed
- C) A type of locator
- D) A test reporter

**Answer: B) A partial mock that calls real methods unless stubbed**

### 69. When should you use mocking?
- A) When testing in isolation and avoiding external dependencies
- B) When you want to test everything together
- C) Only in production
- D) Never

**Answer: A) When testing in isolation and avoiding external dependencies**

### 70. Which Python library is used for mocking?
- A) unittest.mock
- B) pytest-mock
- C) mock
- D) All of the above

**Answer: D) All of the above**

## Parallel Execution

### 71. What is the benefit of parallel test execution?
- A) Reduced test execution time
- B) Better test quality
- C) Easier to debug
- D) Simpler test code

**Answer: A) Reduced test execution time**

### 72. Which TestNG attribute enables parallel execution?
- A) parallel="methods"
- B) parallel="true"
- C) parallel="tests"
- D) Both A and C

**Answer: D) Both A and C**

### 73. What is a challenge with parallel test execution?
- A) Test data conflicts and race conditions
- B) Slower execution
- C) Better reporting
- D) Easier maintenance

**Answer: A) Test data conflicts and race conditions**

### 74. Which tool helps run Selenium tests in parallel across different browsers?
- A) Selenium Grid
- B) TestNG
- C) Both A and B
- D) Neither

**Answer: C) Both A and B**

### 75. What is thread-safety in test automation?
- A) Tests can run concurrently without interfering with each other
- B) Tests run one at a time
- C) Tests share the same data
- D) Tests run faster

**Answer: A) Tests can run concurrently without interfering with each other**

## Advanced Concepts

### 76. What is headless browser testing?
- A) Testing without a visible browser UI
- B) Testing without internet
- C) Testing without code
- D) Testing without assertions

**Answer: A) Testing without a visible browser UI**

### 77. What is cross-browser testing?
- A) Testing the same application across different browsers
- B) Testing different applications
- C) Testing one browser only
- D) Testing mobile apps

**Answer: A) Testing the same application across different browsers**

### 78. What is visual regression testing?
- A) Testing for performance issues
- B) Testing for visual differences in UI
- C) Testing APIs
- D) Testing databases

**Answer: B) Testing for visual differences in UI**

### 79. Which tool is used for visual regression testing?
- A) Percy
- B) Applitools
- C) BackstopJS
- D) All of the above

**Answer: D) All of the above**

### 80. What is contract testing?
- A) Verifying agreements between service consumers and providers
- B) Testing legal documents
- C) Testing UI contracts
- D) Testing performance

**Answer: A) Verifying agreements between service consumers and providers**

## Code Quality

### 81. What is static code analysis?
- A) Analyzing code without executing it
- B) Testing running applications
- C) Measuring test coverage
- D) Debugging failures

**Answer: A) Analyzing code without executing it**

### 82. Which tool is used for static code analysis in Java?
- A) SonarQube
- B) FindBugs
- C) PMD
- D) All of the above

**Answer: D) All of the above**

### 83. What is code smell?
- A) Code that works but indicates potential problems
- B) Code that doesn't compile
- C) Code with syntax errors
- D) Well-written code

**Answer: A) Code that works but indicates potential problems**

### 84. What is technical debt?
- A) Financial debt from software licenses
- B) The cost of additional rework caused by choosing quick solutions
- C) Hardware costs
- D) Testing costs

**Answer: B) The cost of additional rework caused by choosing quick solutions**

### 85. What is the DRY principle?
- A) Don't Run Yet
- B) Don't Repeat Yourself
- C) Do Run Yesterday
- D) Debug Right Yesterday

**Answer: B) Don't Repeat Yourself**

## Test Data Management

### 86. What is test data management?
- A) Managing test data creation, storage, and maintenance
- B) Deleting all test data
- C) Using production data only
- D) Ignoring test data

**Answer: A) Managing test data creation, storage, and maintenance**

### 87. Which approach is recommended for test data?
- A) Using production data directly
- B) Creating synthetic or anonymized test data
- C) Sharing test data across all tests
- D) Never cleaning up test data

**Answer: B) Creating synthetic or anonymized test data**

### 88. What is data seeding?
- A) Preparing initial data before test execution
- B) Deleting data
- C) Backing up production data
- D) Encrypting data

**Answer: A) Preparing initial data before test execution**

### 89. Which library can generate fake test data?
- A) Faker
- B) Bogus
- C) Chance.js
- D) All of the above

**Answer: D) All of the above**

### 90. What is database rollback in testing?
- A) Reverting database to previous state after tests
- B) Permanently deleting data
- C) Backing up database
- D) Creating new database

**Answer: A) Reverting database to previous state after tests**

## Debugging and Troubleshooting

### 91. What is a screenshot useful for in test automation?
- A) Documentation and debugging failures
- B) Making tests slower
- C) Increasing code complexity
- D) No real use

**Answer: A) Documentation and debugging failures**

### 92. What is logging in test automation?
- A) Recording test execution details for analysis
- B) Slowing down tests
- C) Replacing assertions
- D) Disabling tests

**Answer: A) Recording test execution details for analysis**

### 93. Which logging framework is popular in Java?
- A) Log4j
- B) SLF4J
- C) Logback
- D) All of the above

**Answer: D) All of the above**

### 94. What is the purpose of breakpoints in debugging?
- A) To pause execution and inspect state
- B) To delete code
- C) To run tests faster
- D) To generate reports

**Answer: A) To pause execution and inspect state**

### 95. What information should be logged when a test fails?
- A) Test name and failure reason
- B) Timestamp
- C) Screenshots and stack trace
- D) All of the above

**Answer: D) All of the above**

## Cloud Testing

### 96. What is BrowserStack?
- A) A cloud-based testing platform
- B) A local browser
- C) A programming language
- D) A test framework

**Answer: A) A cloud-based testing platform**

### 97. What is the benefit of cloud-based testing platforms?
- A) Access to multiple browsers and devices without local setup
- B) Slower test execution
- C) More expensive than local setup
- D) Less reliable

**Answer: A) Access to multiple browsers and devices without local setup**

### 98. Which is NOT a cloud testing platform?
- A) Sauce Labs
- B) LambdaTest
- C) Eclipse IDE
- D) BrowserStack

**Answer: C) Eclipse IDE**

### 99. What is a key advantage of using Selenium Grid in the cloud?
- A) Parallel execution across multiple environments
- B) No need for Selenium
- C) Automatic bug fixing
- D) Free forever

**Answer: A) Parallel execution across multiple environments**

### 100. What is AWS Device Farm used for?
- A) Testing mobile apps on real devices in the cloud
- B) Data storage
- C) Web hosting
- D) Email services

**Answer: A) Testing mobile apps on real devices in the cloud**

---

## Scoring Guide:
- 90-100: Excellent - Senior QA Automation Engineer
- 75-89: Very Good - Mid-Level QA Automation Engineer
- 60-74: Good - Junior QA Automation Engineer
- Below 60: Needs Improvement - Focus on fundamentals

---

**Note:** These questions cover various aspects of QA automation frameworks and practices. Regular practice and hands-on experience with these frameworks is essential for mastery.
