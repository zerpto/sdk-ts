# UsersApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createUser**](UsersApi.md#createuser) | **POST** /v1/users | Create user |
| [**deactivateUser**](UsersApi.md#deactivateuser) | **DELETE** /v1/users/{id} | Deactivate User |
| [**getUser**](UsersApi.md#getuser) | **GET** /v1/users/{id} | Get User |
| [**listUsers**](UsersApi.md#listusers) | **GET** /v1/users | List users |
| [**updateUser**](UsersApi.md#updateuser) | **PATCH** /v1/users/{id} | Update User |



## createUser

> UserResponse createUser(userInput, idempotencyKey)

Create user

Adds a person to the current tenant by email and name, and gives them one or more roles. The user starts as &#x60;invited&#x60; and becomes &#x60;active&#x60; once they accept the invitation. Use it when someone joins the company and needs to work in Zerpto.  Get the role ids from [&#x60;GET /v1/roles&#x60;](#tag/roles-and-permissions/GET/v1/roles) first. The person then follows the invitation email, which ends with [&#x60;POST /v1/auth/accept-invite&#x60;](#tag/authentication/POST/v1/auth/accept-invite) to set a password. Send an &#x60;Idempotency-Key&#x60; header so a retry does not create the user twice. Roles can be changed later with [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}).  Error codes: &#x60;email_taken&#x60;, &#x60;unknown_role&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  UsersApi,
} from '@zerpto/sdk';
import type { CreateUserRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new UsersApi(config);

  const body = {
    // UserInput
    userInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateUserRequest;

  try {
    const data = await api.createUser(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **userInput** | [UserInput](UserInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## deactivateUser

> deactivateUser(id)

Deactivate User

Deactivates a user so they can no longer sign in or act on the tenant. The record stays, with status &#x60;deactivated&#x60;, because the documents they created or approved still point to it. Use it when someone leaves the company.  Find the id with [&#x60;GET /v1/users&#x60;](#tag/users/GET/v1/users). A deactivated user still appears in that list and can still be read with [&#x60;GET /v1/users/{id}&#x60;](#tag/users/GET/v1/users/{id}). The last owner of a tenant cannot be deactivated, so hand the owner role to someone else with [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}) first.  Error codes: &#x60;last_owner&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  UsersApi,
} from '@zerpto/sdk';
import type { DeactivateUserRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new UsersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies DeactivateUserRequest;

  try {
    const data = await api.deactivateUser(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

`void` (Empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | No content |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getUser

> UserResponse getUser(id)

Get User

Returns one user of the current tenant by id: email, name, role ids, status and creation time. Use it to refresh a single record after a change, or to open a user\&#39;s detail page.  The id comes from [&#x60;GET /v1/users&#x60;](#tag/users/GET/v1/users) or from the response of [&#x60;POST /v1/users&#x60;](#tag/users/POST/v1/users). To see what the user is allowed to do, call [&#x60;GET /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/GET/v1/users/{id}/permissions).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  UsersApi,
} from '@zerpto/sdk';
import type { GetUserRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new UsersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetUserRequest;

  try {
    const data = await api.getUser(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listUsers

> UserListResponse listUsers(perPage, page, sort, createdAfter, createdBefore)

List users

Lists the users of the current tenant, with their email, name, roles and status (&#x60;invited&#x60;, &#x60;active&#x60; or &#x60;deactivated&#x60;). Use it to build a team page, to find a user\&#39;s id before changing them, or to check who still has access. Results come in pages and can be sorted and filtered by creation date.  Users are added with [&#x60;POST /v1/users&#x60;](#tag/users/POST/v1/users), and each one can be opened with [&#x60;GET /v1/users/{id}&#x60;](#tag/users/GET/v1/users/{id}). The role ids shown on every user come from [&#x60;GET /v1/roles&#x60;](#tag/roles-and-permissions/GET/v1/roles).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  UsersApi,
} from '@zerpto/sdk';
import type { ListUsersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new UsersApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Field to sort by. Prefix with `-` for descending. (optional)
    sort: -created_at,
    // Date | Only records created after this time. (optional)
    createdAfter: 2013-10-20T19:20:30+01:00,
    // Date | Only records created before this time. (optional)
    createdBefore: 2013-10-20T19:20:30+01:00,
  } satisfies ListUsersRequest;

  try {
    const data = await api.listUsers(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **perPage** | `number` | Page size. | [Optional] [Defaults to `25`] |
| **page** | `number` | Page number, starting at 1. | [Optional] [Defaults to `1`] |
| **sort** | `string` | Field to sort by. Prefix with &#x60;-&#x60; for descending. | [Optional] [Defaults to `undefined`] |
| **createdAfter** | `Date` | Only records created after this time. | [Optional] [Defaults to `undefined`] |
| **createdBefore** | `Date` | Only records created before this time. | [Optional] [Defaults to `undefined`] |

### Return type

[**UserListResponse**](UserListResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateUser

> UserResponse updateUser(id, userUpdate)

Update User

Changes a user\&#39;s name or roles. Send only the fields to change; &#x60;role_ids&#x60;, when sent, replaces the whole list of roles, so include every role the user should keep. Use it to promote someone, move them to another team, or fix a typo in their name. The email address cannot be changed here.  Role ids come from [&#x60;GET /v1/roles&#x60;](#tag/roles-and-permissions/GET/v1/roles). Permissions follow the roles, so check the result with [&#x60;GET /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/GET/v1/users/{id}/permissions). To remove a person\&#39;s access altogether, use [&#x60;DELETE /v1/users/{id}&#x60;](#tag/users/DELETE/v1/users/{id}) instead.  Error codes: &#x60;unknown_role&#x60;, &#x60;last_owner&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  UsersApi,
} from '@zerpto/sdk';
import type { UpdateUserRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new UsersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // UserUpdate
    userUpdate: ...,
  } satisfies UpdateUserRequest;

  try {
    const data = await api.updateUser(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |
| **userUpdate** | [UserUpdate](UserUpdate.md) |  | |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

