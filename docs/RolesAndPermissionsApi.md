# RolesAndPermissionsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createRole**](RolesAndPermissionsApi.md#createrole) | **POST** /v1/roles | Create a custom role |
| [**deleteRole**](RolesAndPermissionsApi.md#deleterole) | **DELETE** /v1/roles/{id} | Delete a custom role |
| [**getRole**](RolesAndPermissionsApi.md#getrole) | **GET** /v1/roles/{id} | Get role |
| [**getUserPermissions**](RolesAndPermissionsApi.md#getuserpermissions) | **GET** /v1/users/{id}/permissions | Get a user\&#39;s permissions |
| [**listPermissions**](RolesAndPermissionsApi.md#listpermissions) | **GET** /v1/permissions | List the permission catalogue |
| [**listRoles**](RolesAndPermissionsApi.md#listroles) | **GET** /v1/roles | List roles and permissions |
| [**setUserPermissions**](RolesAndPermissionsApi.md#setuserpermissions) | **PUT** /v1/users/{id}/permissions | Set direct user permissions |
| [**updateRole**](RolesAndPermissionsApi.md#updaterole) | **PATCH** /v1/roles/{id} | Update a custom role |



## createRole

> RoleResponse createRole(roleInput)

Create a custom role

Creates a custom role for the current tenant: a named set of permissions that you can give to users. Use it when no system role fits, for example for an AP clerk who may enter bills but not pay them. Pass &#x60;clone_from_role_id&#x60; to start from an existing role; system roles cannot be edited, but they can be cloned.  Pick the permission keys from [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions). The caller can only include permissions they hold themselves. Once the role exists, give it to people with [&#x60;POST /v1/users&#x60;](#tag/users/POST/v1/users) or [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}), and refine it later with [&#x60;PATCH /v1/roles/{id}&#x60;](#tag/roles-and-permissions/PATCH/v1/roles/{id}).  Error codes: &#x60;role_name_taken&#x60;, &#x60;unknown_permission&#x60;, &#x60;cannot_grant&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { CreateRoleRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // RoleInput
    roleInput: ...,
  } satisfies CreateRoleRequest;

  try {
    const data = await api.createRole(body);
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
| **roleInput** | [RoleInput](RoleInput.md) |  | |

### Return type

[**RoleResponse**](RoleResponse.md)

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


## deleteRole

> deleteRole(id)

Delete a custom role

Deletes a custom role that is no longer needed. It is refused while any user still holds the role, or while an approval rule uses it as an approver role, so move those first. System roles can never be deleted.  The &#x60;user_count&#x60; from [&#x60;GET /v1/roles/{id}&#x60;](#tag/roles-and-permissions/GET/v1/roles/{id}) tells you whether anyone still holds the role. Move those people to another role with [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}), then call this again.  Error codes: &#x60;role_in_use&#x60;, &#x60;role_is_system&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { DeleteRoleRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies DeleteRoleRequest;

  try {
    const data = await api.deleteRole(body);
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


## getRole

> RoleResponse getRole(id)

Get role

Returns one role by id, with its name, type (&#x60;system&#x60; or &#x60;custom&#x60;), description, permission keys and the number of users who hold it. Use it to open a role\&#39;s detail page, or to check what a role allows before you assign it.  The id comes from [&#x60;GET /v1/roles&#x60;](#tag/roles-and-permissions/GET/v1/roles) or from the response of [&#x60;POST /v1/roles&#x60;](#tag/roles-and-permissions/POST/v1/roles). The meaning of each permission key is explained by [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { GetRoleRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetRoleRequest;

  try {
    const data = await api.getRole(body);
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

[**RoleResponse**](RoleResponse.md)

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


## getUserPermissions

> UserPermissionsResponse getUserPermissions(id)

Get a user\&#39;s permissions

Returns what one user is allowed to do, in two lists. &#x60;direct&#x60; holds the grants made to this user alone, with who gave them and when they expire. &#x60;effective&#x60; is the final answer: the union of the permissions of all the user\&#39;s roles and their unexpired direct grants. Use it to explain why someone can or cannot do something.  The id comes from [&#x60;GET /v1/users&#x60;](#tag/users/GET/v1/users). Roles are changed with [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}), and direct grants with [&#x60;PUT /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/PUT/v1/users/{id}/permissions).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { GetUserPermissionsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetUserPermissionsRequest;

  try {
    const data = await api.getUserPermissions(body);
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

[**UserPermissionsResponse**](UserPermissionsResponse.md)

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


## listPermissions

> PermissionListResponse listPermissions()

List the permission catalogue

Lists every permission the system enforces, each with its key (such as &#x60;ar.invoices.post&#x60;), the module it belongs to and a short description. Use it to build a role editor or a permission picker. The list is fixed, custom permission names are not supported, and the result is not paginated.  These keys are what you send in &#x60;permissions&#x60; to [&#x60;POST /v1/roles&#x60;](#tag/roles-and-permissions/POST/v1/roles) and [&#x60;PATCH /v1/roles/{id}&#x60;](#tag/roles-and-permissions/PATCH/v1/roles/{id}), and in &#x60;grants&#x60; to [&#x60;PUT /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/PUT/v1/users/{id}/permissions). To see what a user ends up with, call [&#x60;GET /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/GET/v1/users/{id}/permissions).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { ListPermissionsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  try {
    const data = await api.listPermissions();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**PermissionListResponse**](PermissionListResponse.md)

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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listRoles

> RoleListResponse listRoles(perPage, page, type)

List roles and permissions

Lists the roles available in the current tenant: the built-in system roles and the custom roles the tenant has created. Each role shows its permission keys and how many users hold it. Use it to fill a role picker or to review who can do what. Filter with &#x60;type&#x3D;system&#x60; or &#x60;type&#x3D;custom&#x60;.  The ids in this list are what [&#x60;POST /v1/users&#x60;](#tag/users/POST/v1/users) and [&#x60;PATCH /v1/users/{id}&#x60;](#tag/users/PATCH/v1/users/{id}) take in &#x60;role_ids&#x60;. To make your own role, call [&#x60;POST /v1/roles&#x60;](#tag/roles-and-permissions/POST/v1/roles); the permission keys it accepts are listed by [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { ListRolesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'system' | 'custom' | Filter by role type. (optional)
    type: type_example,
  } satisfies ListRolesRequest;

  try {
    const data = await api.listRoles(body);
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
| **type** | `system`, `custom` | Filter by role type. | [Optional] [Defaults to `undefined`] [Enum: system, custom] |

### Return type

[**RoleListResponse**](RoleListResponse.md)

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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## setUserPermissions

> UserPermissionsResponse setUserPermissions(id, userPermissionsInput)

Set direct user permissions

Replaces the direct permission grants of one user. Direct grants add to what the user\&#39;s roles give and cannot remove anything. Use it for a one-off need, such as letting one person approve payments for a month. Send an empty &#x60;grants&#x60; list to clear them all, and set &#x60;expires_at&#x60; on a grant to make it temporary.  Permission keys come from [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions), and the caller can only grant permissions they hold themselves. Check the outcome in the &#x60;effective&#x60; list of [&#x60;GET /v1/users/{id}/permissions&#x60;](#tag/roles-and-permissions/GET/v1/users/{id}/permissions). For a lasting need, create a role with [&#x60;POST /v1/roles&#x60;](#tag/roles-and-permissions/POST/v1/roles) instead.  Error codes: &#x60;unknown_permission&#x60;, &#x60;cannot_grant&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { SetUserPermissionsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // UserPermissionsInput
    userPermissionsInput: ...,
  } satisfies SetUserPermissionsRequest;

  try {
    const data = await api.setUserPermissions(body);
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
| **userPermissionsInput** | [UserPermissionsInput](UserPermissionsInput.md) |  | |

### Return type

[**UserPermissionsResponse**](UserPermissionsResponse.md)

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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateRole

> RoleResponse updateRole(id, roleUpdate)

Update a custom role

Changes the name, description or permissions of a custom role. Send only the fields to change; &#x60;permissions&#x60;, when sent, replaces the whole set. Use it to widen or narrow what a role allows. System roles cannot be edited and return 409 &#x60;role_is_system&#x60;.  Changes take effect for users holding the role on their next request; access tokens already issued stay valid until they expire. Permission keys come from [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions), and [&#x60;GET /v1/roles/{id}&#x60;](#tag/roles-and-permissions/GET/v1/roles/{id}) shows the result. To adjust a system role, clone it with [&#x60;POST /v1/roles&#x60;](#tag/roles-and-permissions/POST/v1/roles) and edit the copy.  Error codes: &#x60;role_name_taken&#x60;, &#x60;unknown_permission&#x60;, &#x60;cannot_grant&#x60;, &#x60;role_is_system&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RolesAndPermissionsApi,
} from '@zerpto/sdk';
import type { UpdateRoleRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RolesAndPermissionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // RoleUpdate
    roleUpdate: ...,
  } satisfies UpdateRoleRequest;

  try {
    const data = await api.updateRole(body);
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
| **roleUpdate** | [RoleUpdate](RoleUpdate.md) |  | |

### Return type

[**RoleResponse**](RoleResponse.md)

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

