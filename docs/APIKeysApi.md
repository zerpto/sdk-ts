# APIKeysApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createApiKey**](APIKeysApi.md#createapikey) | **POST** /v1/api-keys | Create API key |
| [**getUsage**](APIKeysApi.md#getusage) | **GET** /v1/usage | Usage and rate-limit status |
| [**listApiKeys**](APIKeysApi.md#listapikeys) | **GET** /v1/api-keys | List API keys (masked) |
| [**revokeApiKey**](APIKeysApi.md#revokeapikey) | **DELETE** /v1/api-keys/{id} | Revoke API key |
| [**rotateApiKey**](APIKeysApi.md#rotateapikey) | **POST** /v1/api-keys/{id}/rotate | Rotate API key |



## createApiKey

> ApiKeyWithSecretResponse createApiKey(apiKeyInput)

Create API key

Creates an API key so that another system can call the API for this tenant. Choose a name and a mode: &#x60;live&#x60; for real data, &#x60;test&#x60; for trying things out. The full &#x60;secret&#x60; is shown once, in this response, and cannot be retrieved later, so store it safely straight away.  If the secret is lost, call [&#x60;POST /v1/api-keys/{id}/rotate&#x60;](#tag/api-keys/POST/v1/api-keys/{id}/rotate) to get a new one. The secret is never shown again, and [&#x60;GET /v1/api-keys&#x60;](#tag/api-keys/GET/v1/api-keys) lists the key with only its prefix and last four characters.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { CreateApiKeyRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  const body = {
    // ApiKeyInput
    apiKeyInput: ...,
  } satisfies CreateApiKeyRequest;

  try {
    const data = await api.createApiKey(body);
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
| **apiKeyInput** | [ApiKeyInput](ApiKeyInput.md) |  | |

### Return type

[**ApiKeyWithSecretResponse**](ApiKeyWithSecretResponse.md)

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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getUsage

> UsageResponse getUsage()

Usage and rate-limit status

Returns how much the API has been used in the current period and where you stand against the rate limit: the period start and end, the number of requests made, and the limit, remaining requests and reset time of the current window. Use it to monitor an integration or to slow down before you get throttled.  The numbers are for the tenant your credential belongs to. When the limit is exceeded, calls fail with 429 and a &#x60;Retry-After&#x60; header that says how long to wait. The keys behind the traffic are listed by [&#x60;GET /v1/api-keys&#x60;](#tag/api-keys/GET/v1/api-keys).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { GetUsageRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  try {
    const data = await api.getUsage();
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

[**UsageResponse**](UsageResponse.md)

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


## listApiKeys

> ApiKeyListResponse listApiKeys(perPage, page)

List API keys (masked)

Lists the API keys of the current tenant. Secrets are never returned: each key shows its name, mode (&#x60;live&#x60; or &#x60;test&#x60;), prefix, last four characters, and when it was created, last used or revoked. Use it to review which systems are connected and to find keys that are no longer used.  Keys are made with [&#x60;POST /v1/api-keys&#x60;](#tag/api-keys/POST/v1/api-keys), rotated with [&#x60;POST /v1/api-keys/{id}/rotate&#x60;](#tag/api-keys/POST/v1/api-keys/{id}/rotate) and revoked with [&#x60;DELETE /v1/api-keys/{id}&#x60;](#tag/api-keys/DELETE/v1/api-keys/{id}). To see how many requests are being made, call [&#x60;GET /v1/usage&#x60;](#tag/api-keys/GET/v1/usage).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { ListApiKeysRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
  } satisfies ListApiKeysRequest;

  try {
    const data = await api.listApiKeys(body);
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

### Return type

[**ApiKeyListResponse**](ApiKeyListResponse.md)

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


## revokeApiKey

> revokeApiKey(id)

Revoke API key

Revokes an API key so that it stops working at once. Use it when a key leaks, when a connected system is retired, or after you have moved a system to a new key. The key stays in the list with a &#x60;revoked_at&#x60; time, but it cannot be restored.  Find the id with [&#x60;GET /v1/api-keys&#x60;](#tag/api-keys/GET/v1/api-keys). If a system still needs access, create a replacement with [&#x60;POST /v1/api-keys&#x60;](#tag/api-keys/POST/v1/api-keys) first, or swap the secret in one step with [&#x60;POST /v1/api-keys/{id}/rotate&#x60;](#tag/api-keys/POST/v1/api-keys/{id}/rotate).  Error codes: none specific.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { RevokeApiKeyRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies RevokeApiKeyRequest;

  try {
    const data = await api.revokeApiKey(body);
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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## rotateApiKey

> ApiKeyWithSecretResponse rotateApiKey(id)

Rotate API key

Issues a new secret for an API key and revokes the old one. Use it on a regular schedule, or when a secret may have been exposed. The new &#x60;secret&#x60; is shown once, in this response, and cannot be retrieved later. The old secret stops working at once, so update the connected system right away.  The id comes from [&#x60;GET /v1/api-keys&#x60;](#tag/api-keys/GET/v1/api-keys). If you want to remove access instead of replacing the secret, call [&#x60;DELETE /v1/api-keys/{id}&#x60;](#tag/api-keys/DELETE/v1/api-keys/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { RotateApiKeyRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies RotateApiKeyRequest;

  try {
    const data = await api.rotateApiKey(body);
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

[**ApiKeyWithSecretResponse**](ApiKeyWithSecretResponse.md)

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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

