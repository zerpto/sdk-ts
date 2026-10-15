# TenantApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**listMyTenants**](TenantApi.md#listmytenants) | **GET** /v1/auth/tenants | List tenants you belong to |
| [**switchTenant**](TenantApi.md#switchtenant) | **POST** /v1/auth/switch-tenant | Switch the active tenant |



## listMyTenants

> MembershipListResponse listMyTenants()

List tenants you belong to

Lists every tenant the signed-in person belongs to, with the user\&#39;s roles in each one. Use it to build the tenant switcher in the web app, for people who work for more than one company. Each entry has a &#x60;tenant&#x60; whose &#x60;id&#x60; you pass to the switch call when the person picks a different company to work in.  Pick one and pass it to [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant). A tenant created with [&#x60;POST /v1/tenants&#x60;](#tag/tenants/POST/v1/tenants) shows up here right away.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TenantApi,
} from '@zerpto/sdk';
import type { ListMyTenantsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TenantApi(config);

  try {
    const data = await api.listMyTenants();
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

[**MembershipListResponse**](MembershipListResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

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


## switchTenant

> SwitchTenantResponse switchTenant(switchTenantInput)

Switch the active tenant

Moves the current session to another tenant that the person belongs to. Use it when someone picks a different company in the tenant switcher. It checks that the person is an active member of that tenant, then returns a new pair of tokens scoped to it, and revokes the refresh token of the old tenant.  The old access token stays valid until it expires (at most &#x60;expires_in&#x60; seconds). Get the list of tenants to choose from with [&#x60;GET /v1/auth/tenants&#x60;](#tag/tenant/GET/v1/auth/tenants).  Error codes: &#x60;not_a_member&#x60;, &#x60;tenant_suspended&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TenantApi,
} from '@zerpto/sdk';
import type { SwitchTenantRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TenantApi(config);

  const body = {
    // SwitchTenantInput
    switchTenantInput: ...,
  } satisfies SwitchTenantRequest;

  try {
    const data = await api.switchTenant(body);
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
| **switchTenantInput** | [SwitchTenantInput](SwitchTenantInput.md) |  | |

### Return type

[**SwitchTenantResponse**](SwitchTenantResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | New tokens scoped to the target tenant |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

