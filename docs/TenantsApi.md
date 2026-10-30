# TenantsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createTenant**](TenantsApi.md#createtenant) | **POST** /v1/tenants | Create a tenant |
| [**getTenant**](TenantsApi.md#gettenant) | **GET** /v1/tenant | Get current tenant |
| [**updateTenant**](TenantsApi.md#updatetenant) | **PATCH** /v1/tenant | Update tenant settings |



## createTenant

> TenantCreateResponse createTenant(tenantInput, idempotencyKey)

Create a tenant

Creates a new tenant, which is a company with its own books, and makes the caller its owner. The web app uses it during onboarding, right after the person has confirmed their email and signed in with [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in). Omitted &#x60;base_currency&#x60;, &#x60;timezone&#x60;, &#x60;fiscal_year_start_month&#x60; and &#x60;completeness&#x60; default to &#x60;IDR&#x60;, &#x60;Asia/Jakarta&#x60;, &#x60;1&#x60; and &#x60;complex&#x60;. The &#x60;address&#x60; is built from a region picked with [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions), down to the sub-district where the country has region data.  Call it with a user session token from [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in). The response carries a new token pair scoped to the new tenant, as [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant) does, and the previous refresh token is revoked, so replace both tokens you hold. Send an &#x60;Idempotency-Key&#x60; header so a retry does not create two tenants. Adjust settings later with [&#x60;PATCH /v1/tenant&#x60;](#tag/tenants/PATCH/v1/tenant).  Error codes: &#x60;invalid_timezone&#x60;, &#x60;tax_id_taken&#x60;, &#x60;unknown_region&#x60;, &#x60;region_required&#x60;, &#x60;region_too_shallow&#x60;, &#x60;country_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TenantsApi,
} from '@zerpto/sdk';
import type { CreateTenantRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TenantsApi(config);

  const body = {
    // TenantInput
    tenantInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateTenantRequest;

  try {
    const data = await api.createTenant(body);
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
| **tenantInput** | [TenantInput](TenantInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**TenantCreateResponse**](TenantCreateResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Tenant created, tokens scoped to it |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getTenant

> TenantResponse getTenant()

Get current tenant

Returns the profile and settings of the tenant your credential belongs to: its name, legal name, tax ID (NPWP), address, base currency, timezone, the month the fiscal year starts and its &#x60;completeness&#x60;. Use it to show company details in your own app, to read the currency and timezone before you format amounts and dates, or to decide which modules to show based on &#x60;completeness&#x60;.  The tenant comes from the credential, so there is no id to send. For a user session it is the tenant chosen with [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant) or created with [&#x60;POST /v1/tenants&#x60;](#tag/tenants/POST/v1/tenants). To change these settings, call [&#x60;PATCH /v1/tenant&#x60;](#tag/tenants/PATCH/v1/tenant).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TenantsApi,
} from '@zerpto/sdk';
import type { GetTenantRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TenantsApi(config);

  try {
    const data = await api.getTenant();
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

[**TenantResponse**](TenantResponse.md)

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


## updateTenant

> TenantResponse updateTenant(tenantUpdate)

Update tenant settings

Changes the profile and settings of the current tenant. Send only the fields you want to change and the rest stay as they are. For the &#x60;address&#x60;, pick a region with [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions) down to the sub-district where the country has region data. Use it when the company\&#39;s name, tax ID, address, timezone or fiscal year start changes, or when it grows out of &#x60;completeness: simple&#x60; and needs &#x60;complex&#x60;. The base currency is set when the tenant is created and is not accepted here.  Read the current values first with [&#x60;GET /v1/tenant&#x60;](#tag/tenants/GET/v1/tenant); this call returns the updated tenant. Users without permission to manage tenant settings get 403. A new tenant is created with [&#x60;POST /v1/tenants&#x60;](#tag/tenants/POST/v1/tenants), not with this call.  Error codes: &#x60;invalid_timezone&#x60;, &#x60;tax_id_taken&#x60;, &#x60;unknown_region&#x60;, &#x60;region_required&#x60;, &#x60;region_too_shallow&#x60;, &#x60;country_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TenantsApi,
} from '@zerpto/sdk';
import type { UpdateTenantRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TenantsApi(config);

  const body = {
    // TenantUpdate
    tenantUpdate: ...,
  } satisfies UpdateTenantRequest;

  try {
    const data = await api.updateTenant(body);
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
| **tenantUpdate** | [TenantUpdate](TenantUpdate.md) |  | |

### Return type

[**TenantResponse**](TenantResponse.md)

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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

