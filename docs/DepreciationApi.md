# DepreciationApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createDepreciationRun**](DepreciationApi.md#createdepreciationrun) | **POST** /v1/assets/depreciation-runs | Run monthly depreciation |
| [**getAssetSchedule**](DepreciationApi.md#getassetschedule) | **GET** /v1/assets/{id}/schedule | Depreciation schedule |
| [**getDepreciationRun**](DepreciationApi.md#getdepreciationrun) | **GET** /v1/assets/depreciation-runs/{id} | Get a depreciation run |



## createDepreciationRun

> DepreciationRunResponse createDepreciationRun(depreciationRunInput, idempotencyKey)

Run monthly depreciation

Runs depreciation for one accounting period. Send the &#x60;period_id&#x60;. One journal entry is posted for all active assets, and the run lists the depreciation of each asset. Disposed assets, fully depreciated assets and assets not yet in service for that month are skipped. There can be only one run per period; to run a period again, reverse its journal entry first. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;period_id&#x60; from [&#x60;GET /v1/gl/periods&#x60;](#tag/general-ledger/GET/v1/gl/periods). Run the periods in order, once a month, before you close the period with [&#x60;POST /v1/gl/periods/{id}/close&#x60;](#tag/general-ledger/POST/v1/gl/periods/{id}/close). Read the run later with [&#x60;GET /v1/assets/depreciation-runs/{id}&#x60;](#tag/depreciation/GET/v1/assets/depreciation-runs/{id}), and see the effect on one asset with [&#x60;GET /v1/assets/{id}/schedule&#x60;](#tag/depreciation/GET/v1/assets/{id}/schedule). The totals by asset are in the report [&#x60;GET /v1/reports/asset-register&#x60;](#tag/reports/GET/v1/reports/asset-register).  Error codes: &#x60;run_exists&#x60;, &#x60;unknown_period&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  DepreciationApi,
} from '@zerpto/sdk';
import type { CreateDepreciationRunRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DepreciationApi(config);

  const body = {
    // DepreciationRunInput
    depreciationRunInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateDepreciationRunRequest;

  try {
    const data = await api.createDepreciationRun(body);
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
| **depreciationRunInput** | [DepreciationRunInput](DepreciationRunInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**DepreciationRunResponse**](DepreciationRunResponse.md)

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


## getAssetSchedule

> DepreciationScheduleResponse getAssetSchedule(id)

Depreciation schedule

Returns the depreciation schedule of one asset: one line for each month from the start of depreciation to the end of its useful life. A line is &#x60;posted&#x60; when depreciation for that month has been run, and &#x60;projected&#x60; when it is still to come. Each line shows the depreciation of the month, the accumulated depreciation and the net book value after it. Use it to show the asset\&#39;s depreciation page or to plan its book value.  Take the asset &#x60;id&#x60; from [&#x60;GET /v1/assets&#x60;](#tag/assets/GET/v1/assets), and read the asset itself with [&#x60;GET /v1/assets/{id}&#x60;](#tag/assets/GET/v1/assets/{id}). Posted lines come from the monthly [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs), and name the journal entry in &#x60;journal_entry_id&#x60;, which you can read with [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}). The projection changes if the asset\&#39;s life or salvage value is changed, or when it is disposed of with [&#x60;POST /v1/assets/{id}/dispose&#x60;](#tag/assets/POST/v1/assets/{id}/dispose).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  DepreciationApi,
} from '@zerpto/sdk';
import type { GetAssetScheduleRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DepreciationApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetAssetScheduleRequest;

  try {
    const data = await api.getAssetSchedule(body);
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

[**DepreciationScheduleResponse**](DepreciationScheduleResponse.md)

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


## getDepreciationRun

> DepreciationRunResponse getDepreciationRun(id)

Get a depreciation run

Returns one depreciation run by its &#x60;id&#x60;, with its period, its status, the number of assets, the total depreciation and the depreciation of each asset. Use it to show the result of a run, to explain a monthly journal entry, or to find out why a run failed from its &#x60;error&#x60;.  Take the &#x60;id&#x60; from the response of [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs). The journal entry it posted, named in &#x60;journal_entry_id&#x60;, is read with [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}), and can be undone with [&#x60;POST /v1/gl/journal-entries/{id}/reverse&#x60;](#tag/journal/POST/v1/gl/journal-entries/{id}/reverse). After that the period can be run again.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  DepreciationApi,
} from '@zerpto/sdk';
import type { GetDepreciationRunRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DepreciationApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetDepreciationRunRequest;

  try {
    const data = await api.getDepreciationRun(body);
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

[**DepreciationRunResponse**](DepreciationRunResponse.md)

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

