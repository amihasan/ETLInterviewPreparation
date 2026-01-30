# API Interview MCQ Questions

## Table of Contents
1. [API Fundamentals](#api-fundamentals)
2. [REST API Concepts](#rest-api-concepts)
3. [HTTP Methods & Status Codes](#http-methods--status-codes)
4. [API Design & Architecture](#api-design--architecture)
5. [Authentication & Security](#authentication--security)
6. [API Testing & Performance](#api-testing--performance)
7. [Advanced API Concepts](#advanced-api-concepts)
8. [Real-World Scenarios](#real-world-scenarios)

---

## API Fundamentals

### Q1: What does API stand for, and what is its primary purpose?
**Options:**
- A) Application Programming Interface - allows software to communicate with each other
- B) Advanced Program Integration - integrates multiple programs together
- C) Application Process Interface - processes applications in order
- D) Automated Programming Interface - automatically programs interfaces

**Correct Answer:** A) Application Programming Interface - allows software to communicate with each other

**Explanation:** An API (Application Programming Interface) is a set of rules and protocols that allows different software applications to communicate with each other. It defines the methods and data structures that developers can use to interact with services, libraries, or microservices.

---

### Q2: Which of the following is NOT a characteristic of REST APIs?
**Options:**
- A) Uses HTTP methods (GET, POST, PUT, DELETE)
- B) Requires stateful connections between client and server
- C) Uses JSON or XML for data representation
- D) Resource-oriented architecture

**Correct Answer:** B) Requires stateful connections between client and server

**Explanation:** REST (Representational State Transfer) APIs are stateless, meaning each request contains all the information needed to process it. The server doesn't store information about the client's context between requests. This is a key principle of REST architecture.

---

### Q3: What is the main difference between SOAP and REST APIs?
**Options:**
- A) SOAP uses HTTP while REST uses TCP/IP
- B) SOAP is XML-based and follows strict protocols; REST is simpler and uses JSON
- C) SOAP is faster than REST
- D) REST requires authentication while SOAP doesn't

**Correct Answer:** B) SOAP is XML-based and follows strict protocols; REST is simpler and uses JSON

**Explanation:** 
- **SOAP:** Complex, uses XML, follows strict WSDL contract, slower, better for enterprise applications
- **REST:** Lightweight, uses JSON/XML, flexible, faster, better for web/mobile applications

---

### Q4: What does idempotent mean in the context of APIs?
**Options:**
- A) The API response is always identical
- B) Multiple identical requests produce the same result as a single request
- C) The API never fails
- D) The API doesn't require authentication

**Correct Answer:** B) Multiple identical requests produce the same result as a single request

**Explanation:** An idempotent operation returns the same state regardless of how many times it's called. For example, calling DELETE multiple times on the same resource should have the same effect as calling it once (the resource is deleted, and subsequent calls also result in the resource being deleted).

---

### Q5: Which HTTP method is NOT idempotent?
**Options:**
- A) GET
- B) PUT
- C) DELETE
- D) POST

**Correct Answer:** D) POST

**Explanation:** 
- **Idempotent methods:** GET, PUT, DELETE (calling them multiple times has the same effect)
- **Non-idempotent:** POST (calling it multiple times creates multiple resources)

---

## REST API Concepts

### Q6: In REST, what does a resource represent?
**Options:**
- A) The data transferred between client and server
- B) A computational operation performed by the server
- C) An entity or collection of data that can be accessed via a URI
- D) The code that handles API requests

**Correct Answer:** C) An entity or collection of data that can be accessed via a URI

**Explanation:** In REST, resources are entities identified by URIs. Examples include `/users`, `/products`, `/orders`. Each resource can have multiple representations (JSON, XML) and can be manipulated using standard HTTP methods.

---

### Q7: What is the correct URI structure for a RESTful API?
**Options:**
- A) `/users/delete?id=123`
- B) `/deleteUser/123`
- C) `/users/123`
- D) `/users-delete-123`

**Correct Answer:** C) `/users/123`

**Explanation:** RESTful URIs should be resource-oriented, not action-oriented. Use nouns (resources) and let HTTP methods define actions:
- GET `/users/123` - retrieve user
- DELETE `/users/123` - delete user
- PUT `/users/123` - update user

---

### Q8: What is content negotiation in APIs?
**Options:**
- A) Negotiating the price of API usage
- B) The client specifying the format it wants the response in (JSON, XML, etc.)
- C) Negotiating security permissions
- D) The process of establishing a secure connection

**Correct Answer:** B) The client specifying the format it wants the response in (JSON, XML, etc.)

**Explanation:** Content negotiation uses HTTP headers like `Accept` and `Content-Type` to determine the format of the request/response:
```
Accept: application/json
Content-Type: application/json
```

---

### Q9: What does HATEOAS stand for?
**Options:**
- A) HTTP Authentication Transfer Over Application Server
- B) Hypertext As The Engine Of Application State
- C) Hierarchical Architecture Through End-to-End Object State
- D) HTTP API Transfer Operations And Security

**Correct Answer:** B) Hypertext As The Engine Of Application State

**Explanation:** HATEOAS is a REST constraint that allows API clients to discover available actions dynamically through links in responses. The response includes hypermedia links to navigate the API.

```json
{
  "id": 1,
  "name": "John",
  "links": {
    "self": "/users/1",
    "all_users": "/users",
    "delete": "/users/1"
  }
}
```

---

### Q10: What is the purpose of API versioning?
**Options:**
- A) To track how many versions of the API have been created
- B) To allow backward compatibility while introducing breaking changes
- C) To keep track of API bugs
- D) To reduce API performance

**Correct Answer:** B) To allow backward compatibility while introducing breaking changes

**Explanation:** API versioning allows you to introduce new features or changes without breaking existing clients:
- `/api/v1/users` - old version
- `/api/v2/users` - new version with changes

---

## HTTP Methods & Status Codes

### Q11: Which HTTP status code indicates a successful request with data returned?
**Options:**
- A) 201
- B) 204
- C) 200
- D) 202

**Correct Answer:** C) 200

**Explanation:**
- **200 OK:** Request successful, data returned (most common success response)
- **201 Created:** Resource created successfully
- **204 No Content:** Request successful, no data returned
- **202 Accepted:** Request accepted for processing

---

### Q12: What does HTTP status code 400 indicate?
**Options:**
- A) Unauthorized access
- B) Resource not found
- C) Bad request - client sent invalid data
- D) Internal server error

**Correct Answer:** C) Bad request - client sent invalid data

**Explanation:** 4xx status codes indicate client errors:
- **400:** Bad Request - malformed syntax, invalid parameters
- **401:** Unauthorized - authentication required
- **403:** Forbidden - authenticated but not authorized
- **404:** Not Found - resource doesn't exist
- **409:** Conflict - request conflicts with current state

---

### Q13: When should you use PUT vs PATCH?
**Options:**
- A) PUT and PATCH are identical
- B) PUT replaces entire resource; PATCH partially updates resource
- C) PATCH is faster than PUT
- D) PUT is for creating; PATCH is for reading

**Correct Answer:** B) PUT replaces entire resource; PATCH partially updates resource

**Explanation:**
```
PUT /users/123
{
  "name": "John",
  "email": "john@example.com",
  "age": 30
}
// Replaces entire user record

PATCH /users/123
{
  "age": 31
}
// Only updates age field
```

---

### Q14: What is the correct HTTP status code when creating a new resource?
**Options:**
- A) 200 OK
- B) 201 Created
- C) 202 Accepted
- D) 204 No Content

**Correct Answer:** B) 201 Created

**Explanation:** When a POST request successfully creates a new resource, return 201 Created with the Location header pointing to the newly created resource:
```
HTTP/1.1 201 Created
Location: /users/123
Content-Type: application/json

{
  "id": 123,
  "name": "John"
}
```

---

### Q15: Which HTTP status code indicates the resource has moved permanently?
**Options:**
- A) 301 Moved Permanently
- B) 302 Found
- C) 307 Temporary Redirect
- D) 304 Not Modified

**Correct Answer:** A) 301 Moved Permanently

**Explanation:**
- **301:** Permanent redirect - update bookmarks
- **302/307:** Temporary redirect - don't update bookmarks
- **304:** Not Modified - cached version is still valid

---

## API Design & Architecture

### Q16: What is the purpose of pagination in APIs?
**Options:**
- A) To encrypt data during transmission
- B) To limit the amount of data returned and improve performance
- C) To authenticate users
- D) To compress API responses

**Correct Answer:** B) To limit the amount of data returned and improve performance

**Explanation:** Pagination breaks large result sets into smaller chunks:
```
GET /users?page=1&limit=10
// Returns users 1-10

GET /users?page=2&limit=10
// Returns users 11-20
```

Benefits:
- Reduces memory usage
- Improves response time
- Better user experience

---

### Q17: What is API rate limiting?
**Options:**
- A) The maximum speed at which APIs operate
- B) Limiting the number of requests a client can make in a time period
- C) The cost of using an API
- D) Limiting the size of API responses

**Correct Answer:** B) Limiting the number of requests a client can make in a time period

**Explanation:** Rate limiting prevents abuse and ensures fair usage:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1234567890
```

Common rate limit: 100 requests per minute per user

---

### Q18: What is API caching?
**Options:**
- A) Deleting old API responses
- B) Storing API responses temporarily to improve performance
- C) Encrypting API requests
- D) Logging API calls

**Correct Answer:** B) Storing API responses temporarily to improve performance

**Explanation:** Caching stores frequently accessed data to reduce server load:
```
Cache-Control: max-age=3600
// Cache response for 1 hour

ETag: "abc123"
// Use ETag to validate cache freshness
```

---

### Q19: What does a 503 Service Unavailable status code mean?
**Options:**
- A) The user is not authorized
- B) The requested resource doesn't exist
- C) The server is temporarily unable to handle requests
- D) There's a bad request from the client

**Correct Answer:** C) The server is temporarily unable to handle requests

**Explanation:** 5xx status codes indicate server errors:
- **500:** Internal Server Error
- **502:** Bad Gateway
- **503:** Service Unavailable (maintenance, overload)
- **504:** Gateway Timeout

---

### Q20: What is the difference between synchronous and asynchronous API calls?
**Options:**
- A) Asynchronous calls are faster
- B) Synchronous calls wait for response; asynchronous calls don't
- C) They produce identical results
- D) Synchronous calls don't require internet

**Correct Answer:** B) Synchronous calls wait for response; asynchronous calls don't

**Explanation:**
```javascript
// Synchronous - waits for response
const response = await fetch('/api/users');
const data = response.json();

// Asynchronous - doesn't wait
fetch('/api/users').then(response => response.json());
```

---

## Authentication & Security

### Q21: Which is the most secure method for transmitting credentials over HTTP?
**Options:**
- A) Basic Authentication (username:password in header)
- B) API Keys in query parameters
- C) Bearer Tokens over HTTPS
- D) Credentials in request body

**Correct Answer:** C) Bearer Tokens over HTTPS

**Explanation:** Bearer tokens (JWT) over HTTPS is secure because:
- HTTPS encrypts data in transit
- Tokens don't expose actual credentials
- Tokens are time-limited
- Example: `Authorization: Bearer eyJhbGciOiJIUzI1NiIs...`

---

### Q22: What is JWT (JSON Web Token)?
**Options:**
- A) A method to encrypt JSON data
- B) A stateless authentication token containing encoded information
- C) A type of HTTP protocol
- D) A database format for storing tokens

**Correct Answer:** B) A stateless authentication token containing encoded information

**Explanation:** JWT structure:
```
header.payload.signature
```
- **Header:** Algorithm type
- **Payload:** User claims/data
- **Signature:** Verification key

Benefits:
- Stateless (no server storage needed)
- Can be used across services
- Self-contained information

---

### Q23: What is OAuth 2.0?
**Options:**
- A) A method to encrypt passwords
- B) An authentication protocol allowing third-party access
- C) A type of API gateway
- D) A database security standard

**Correct Answer:** B) An authentication protocol allowing third-party access

**Explanation:** OAuth 2.0 allows users to grant third-party applications access without sharing passwords:
```
User -> Service -> "Login with Google" -> Google
Google -> Service -> Access Token
Service -> Access resources on behalf of user
```

Common flows: Authorization Code, Implicit, Client Credentials

---

### Q24: What is the difference between authentication and authorization?
**Options:**
- A) They mean the same thing
- B) Authentication verifies identity; authorization checks permissions
- C) Authorization is done first, then authentication
- D) Authorization is only for APIs, authentication for websites

**Correct Answer:** B) Authentication verifies identity; authorization checks permissions

**Explanation:**
```
Authentication: Who are you? (Login with username/password)
Authorization: What can you do? (Access /admin endpoint?)
```

---

### Q25: What is API key authentication vulnerability?
**Options:**
- A) API keys are too long
- B) API keys sent in plaintext or URLs can be intercepted
- C) API keys can't be revoked
- D) API keys require passwords

**Correct Answer:** B) API keys sent in plaintext or URLs can be intercepted

**Explanation:** Security best practices for API keys:
- Use HTTPS only
- Pass in Authorization header, not URL: `Authorization: ApiKey abc123`
- Rotate keys regularly
- Store securely (environment variables, not hardcoded)

---

## API Testing & Performance

### Q26: What is the purpose of API mocking?
**Options:**
- A) To laugh at API developers
- B) To simulate API responses without actual server
- C) To reduce API performance
- D) To hide real API endpoints

**Correct Answer:** B) To simulate API responses without actual server

**Explanation:** Mocking is useful for:
- Testing before API is ready
- Offline development
- Reducing external API calls
- Testing error scenarios

Example tools: Postman, Mockoon, WireMock

---

### Q27: What should be included in API documentation?
**Options:**
- A) Only endpoint URLs
- B) Authentication methods, request/response examples, error codes, rate limits
- C) Just the database schema
- D) Nothing, APIs should be self-documenting

**Correct Answer:** B) Authentication methods, request/response examples, error codes, rate limits

**Explanation:** Good documentation includes:
- Base URL and versioning
- Authentication/authorization details
- Endpoint descriptions with methods
- Request/response examples
- Error codes and messages
- Rate limits
- Code samples

Tools: Swagger/OpenAPI, Postman, Readme.io

---

### Q28: What is the difference between load testing and stress testing APIs?
**Options:**
- A) They're the same thing
- B) Load testing checks normal load; stress testing checks beyond capacity
- C) Load testing is for databases, stress testing for APIs
- D) Stress testing is not important

**Correct Answer:** B) Load testing checks normal load; stress testing checks beyond capacity

**Explanation:**
```
Load Testing: 100 concurrent users - does it handle normal load?
Stress Testing: 1000 concurrent users - at what point does it fail?
```

Tools: Apache JMeter, Locust, LoadRunner

---

### Q29: What is API latency?
**Options:**
- A) The time it takes for a response to reach the client
- B) The number of API calls per second
- C) The security level of an API
- D) The cost of API usage

**Correct Answer:** A) The time it takes for a response to reach the client

**Explanation:** Latency includes:
- Network latency
- Server processing time
- Database query time

Acceptable latencies: < 100ms for web, < 500ms for mobile

---

### Q30: What is an SLA (Service Level Agreement) in APIs?
**Options:**
- A) Software License Agreement
- B) Guaranteed uptime and performance commitments
- C) Security compliance standard
- D) API documentation format

**Correct Answer:** B) Guaranteed uptime and performance commitments

**Explanation:** SLA defines:
- Uptime percentage (e.g., 99.9%)
- Response time guarantees
- Support commitments
- Compensation for failures

Example: "99.9% uptime = max 43 minutes downtime per month"

---

## Advanced API Concepts

### Q31: What is API versioning through URL vs headers?
**Options:**
- A) Both are equally bad approaches
- B) URL versioning (/v1/) is simpler for clients; header versioning is cleaner
- C) Header versioning is always better
- D) URL versioning is always better

**Correct Answer:** B) URL versioning (/v1/) is simpler for clients; header versioning is cleaner

**Explanation:**
```
URL versioning: /api/v1/users (explicit, trackable)
Header versioning: Accept: application/vnd.api+json;version=1 (cleaner, less URL pollution)
```

Trade-offs:
- URL: easier to debug, clear separation, but pollutes namespace
- Headers: cleaner URLs, less obvious, harder to cache

---

### Q32: What is GraphQL?
**Options:**
- A) A type of graph database
- B) A query language and API architecture for flexible data fetching
- C) A graphing tool for APIs
- D) An alternative to HTTP

**Correct Answer:** B) A query language and API architecture for flexible data fetching

**Explanation:** GraphQL advantages over REST:
- Request only needed fields (no overfetching)
- Get related data in one query (no underfetching)
- Strong typing
- Introspection capabilities

```graphql
query {
  user(id: 1) {
    name
    email
    posts {
      title
    }
  }
}
```

---

### Q33: What is the N+1 query problem in APIs?
**Options:**
- A) A mathematical formula
- B) Making N+1 queries instead of 1, causing performance issues
- C) A security vulnerability
- D) A type of authentication method

**Correct Answer:** B) Making N+1 queries instead of 1, causing performance issues

**Explanation:** 
```
Problem:
GET /users -> returns 100 users
For each user, GET /user/1/posts -> 100 additional queries
Total: 101 queries (1 + 100)

Solution:
- Use JOIN in single query
- Use batch endpoint
- Use GraphQL
- Implement eager loading
```

---

### Q34: What is webhook?
**Options:**
- A) A type of HTTP request
- B) A callback mechanism where API sends data to client URL when events occur
- C) A security feature
- D) A method to compress API responses

**Correct Answer:** B) A callback mechanism where API sends data to client URL when events occur

**Explanation:** Webhooks enable push notifications:
```
Traditional: Client polls API regularly (inefficient)
Webhook: API sends data to client when event occurs (efficient)

Example: Payment processed -> API sends webhook to /webhook/payment
```

---

### Q35: What is CORS (Cross-Origin Resource Sharing)?
**Options:**
- A) A security feature allowing cross-origin requests
- B) Corrupted Origin Request Sharing
- C) A type of database
- D) An encryption method

**Correct Answer:** A) A security feature allowing cross-origin requests

**Explanation:** CORS allows browsers to make requests to different domains:
```
// Without CORS, browser blocks this:
fetch('https://api.example.com/data')

Headers sent:
Origin: https://mysite.com
Access-Control-Allow-Origin: * // Server response
```

---

## Real-World Scenarios

### Q36: A client receives 429 (Too Many Requests). What should they do?
**Options:**
- A) Keep retrying immediately
- B) Stop using the API
- C) Implement exponential backoff retry logic
- D) Change the API endpoint

**Correct Answer:** C) Implement exponential backoff retry logic

**Explanation:** Exponential backoff:
```
Attempt 1: Retry after 1 second
Attempt 2: Retry after 2 seconds
Attempt 3: Retry after 4 seconds
Attempt 4: Retry after 8 seconds
```

This respects rate limits and prevents overwhelming the server.

---

### Q37: Your API returns inconsistent response formats. What's the best solution?
**Options:**
- A) Document the inconsistency
- B) Use error handling middleware
- C) Implement a consistent response wrapper
- D) Leave it as is; clients should adapt

**Correct Answer:** C) Implement a consistent response wrapper

**Explanation:** Standardize all responses:
```json
{
  "success": true/false,
  "data": { },
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message"
  },
  "timestamp": "2024-01-29T10:00:00Z"
}
```

---

### Q38: How should you handle sensitive data in API responses?
**Options:**
- A) Include all data; let clients filter
- B) Encrypt all responses
- C) Only return necessary fields; mask/exclude sensitive data like passwords
- D) Never return any potentially sensitive data

**Correct Answer:** C) Only return necessary fields; mask/exclude sensitive data like passwords

**Explanation:** Best practices:
- Never return passwords, API keys, credit card details
- Mask partial data: `4111****1111`
- Use field-level permissions
- Implement role-based filtering

---

### Q39: What should happen when an API dependency fails?
**Options:**
- A) Immediately return error to client
- B) Implement fallback responses or circuit breaker pattern
- C) Retry indefinitely
- D) Hide the error from client

**Correct Answer:** B) Implement fallback responses or circuit breaker pattern

**Explanation:** Resilience patterns:
```
Circuit Breaker: Stop calling failing service, return cached/default response
Fallback: Return alternate data when service is unavailable
Retry: Exponential backoff with max attempts
Timeout: Stop waiting after X seconds
```

---

### Q40: A third-party API you depend on is down. How should your API respond?
**Options:**
- A) Return 500 error immediately
- B) Return 503 with Retry-After header, cache previous response
- C) Keep retrying until it's back
- D) Return 200 with partial data

**Correct Answer:** B) Return 503 with Retry-After header, cache previous response

**Explanation:** Best approach:
```
HTTP/1.1 503 Service Unavailable
Retry-After: 60

{
  "error": "Service temporarily unavailable",
  "message": "Dependent service is down, try again in 60 seconds"
}
```

Or use cached data if available with appropriate headers.

---

## Answer Key Summary

| Question | Answer |
|----------|--------|
| Q1 | A |
| Q2 | B |
| Q3 | B |
| Q4 | B |
| Q5 | D |
| Q6 | C |
| Q7 | C |
| Q8 | B |
| Q9 | B |
| Q10 | B |
| Q11 | C |
| Q12 | C |
| Q13 | B |
| Q14 | B |
| Q15 | A |
| Q16 | B |
| Q17 | B |
| Q18 | B |
| Q19 | C |
| Q20 | B |
| Q21 | C |
| Q22 | B |
| Q23 | B |
| Q24 | B |
| Q25 | B |
| Q26 | B |
| Q27 | B |
| Q28 | B |
| Q29 | A |
| Q30 | B |
| Q31 | B |
| Q32 | B |
| Q33 | B |
| Q34 | B |
| Q35 | A |
| Q36 | C |
| Q37 | C |
| Q38 | C |
| Q39 | B |
| Q40 | B |

---

## Key Concepts to Review

### HTTP Methods
- **GET:** Retrieve data (safe, idempotent)
- **POST:** Create data (unsafe, non-idempotent)
- **PUT:** Replace entire resource (idempotent)
- **PATCH:** Partial update (non-idempotent)
- **DELETE:** Remove data (idempotent)
- **HEAD:** Like GET but no response body
- **OPTIONS:** Describe communication options

### HTTP Status Code Ranges
- **1xx:** Informational (100-199)
- **2xx:** Success (200-299)
- **3xx:** Redirection (300-399)
- **4xx:** Client Error (400-499)
- **5xx:** Server Error (500-599)

### REST Principles
1. Client-Server architecture
2. Stateless communication
3. Resource-based URIs
4. Uniform Interface (standard methods)
5. Cacheability
6. Layered System

### Security Best Practices
- Use HTTPS always
- Implement proper authentication (OAuth 2.0, JWT)
- Use strong API keys with rotation
- Implement rate limiting
- Validate and sanitize inputs
- Use CORS properly
- Never log sensitive data
- Implement proper error handling

### Performance Tips
- Implement pagination
- Use caching (HTTP cache headers, Redis)
- Compress responses (gzip)
- Optimize database queries
- Use CDN for static content
- Monitor and track metrics
- Implement rate limiting
- Use asynchronous operations

---

**Good luck with your interview preparation!**
