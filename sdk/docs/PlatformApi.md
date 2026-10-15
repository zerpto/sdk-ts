# PlatformApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getHealth**](PlatformApi.md#gethealth) | **GET** /v1/health | Health check |



## getHealth

> HealthResponse getHealth()

Health check

Reports whether the API is up and able to answer requests. Use it from an uptime monitor or a load balancer, or to confirm that a base URL is correct before you build on it. It needs no credential and does not read any tenant data, so it is safe to call as often as you like.  It is the only call in the API that works without a key or a token. If it fails, nothing else will work either; if it succeeds and another call fails, the problem is in that call. To check your own credential and tenant, call [&#x60;GET /v1/tenant&#x60;](#tag/tenants/GET/v1/tenant) next.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PlatformApi,
} from '@zerpto/sdk';
import type { GetHealthRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new PlatformApi();

  try {
    const data = await api.getHealth();
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

[**HealthResponse**](HealthResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

