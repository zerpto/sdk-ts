# AdjustmentsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createStockAdjustment**](AdjustmentsApi.md#createstockadjustment) | **POST** /v1/inventory/adjustments | Create a stock adjustment |
| [**listStockAdjustments**](AdjustmentsApi.md#liststockadjustments) | **GET** /v1/inventory/adjustments | List stock adjustments |
| [**postStockAdjustment**](AdjustmentsApi.md#poststockadjustment) | **POST** /v1/inventory/adjustments/{id}/confirm | Post a stock adjustment |



## createStockAdjustment

> StockAdjustmentResponse createStockAdjustment(stockAdjustmentInput, idempotencyKey)

Create a stock adjustment

Creates a stock adjustment in &#x60;draft&#x60; to correct quantities after a physical count. Send the &#x60;warehouse_id&#x60;, the &#x60;date&#x60; and the lines, each with an &#x60;item_id&#x60; and the &#x60;counted_quantity&#x60; you found on the shelf; &#x60;reason&#x60; and &#x60;adjustment_account_id&#x60; are optional, and the account defaults from the tenant settings. You enter what you counted, not the difference: the system quantity, the difference and the unit cost are set when the adjustment is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses), the stocked &#x60;item_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), and the account for the difference from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). You can compare against the current quantities with [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock). Nothing changes until you post the draft with [&#x60;POST /v1/inventory/adjustments/{id}/confirm&#x60;](#tag/adjustments/POST/v1/inventory/adjustments/{id}/confirm).  Error codes: &#x60;unknown_warehouse&#x60;, &#x60;warehouse_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;item_not_stocked&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AdjustmentsApi,
} from '@zerpto/sdk';
import type { CreateStockAdjustmentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AdjustmentsApi(config);

  const body = {
    // StockAdjustmentInput
    stockAdjustmentInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateStockAdjustmentRequest;

  try {
    const data = await api.createStockAdjustment(body);
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
| **stockAdjustmentInput** | [StockAdjustmentInput](StockAdjustmentInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockAdjustmentResponse**](StockAdjustmentResponse.md)

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


## listStockAdjustments

> StockAdjustmentListResponse listStockAdjustments(perPage, page, sort, createdAfter, createdBefore, status, warehouseId)

List stock adjustments

Lists the stock adjustments you have made to correct the quantities in your warehouses, with date, reason, status and the counted and system quantity of each line. Use it to review past stock counts, to find drafts that still need posting, or to see what was written off in one warehouse. Filter by &#x60;status&#x60; or &#x60;warehouse_id&#x60; and narrow by creation date.  Get a &#x60;warehouse_id&#x60; for the filter from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). New adjustments are made with [&#x60;POST /v1/inventory/adjustments&#x60;](#tag/adjustments/POST/v1/inventory/adjustments) and posted with [&#x60;POST /v1/inventory/adjustments/{id}/confirm&#x60;](#tag/adjustments/POST/v1/inventory/adjustments/{id}/confirm). The movements that a posted adjustment leaves behind are listed in [&#x60;GET /v1/inventory/movements&#x60;](#tag/inventory/GET/v1/inventory/movements).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  AdjustmentsApi,
} from '@zerpto/sdk';
import type { ListStockAdjustmentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AdjustmentsApi(config);

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
    // 'draft' | 'posted' | Filter by status. (optional)
    status: status_example,
    // string | Filter by warehouse. (optional)
    warehouseId: warehouseId_example,
  } satisfies ListStockAdjustmentsRequest;

  try {
    const data = await api.listStockAdjustments(body);
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
| **status** | `draft`, `posted` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted] |
| **warehouseId** | `string` | Filter by warehouse. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockAdjustmentListResponse**](StockAdjustmentListResponse.md)

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


## postStockAdjustment

> StockAdjustmentResponse postStockAdjustment(id, idempotencyKey)

Post a stock adjustment

Posts a draft stock adjustment. The system quantity of each line is read at this moment, the difference to the counted quantity is applied to the warehouse, and the value of the difference is booked between the inventory account and the adjustment account. The status becomes &#x60;posted&#x60; and the adjustment can no longer change. It fails with 422 if the accounting period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the draft with [&#x60;POST /v1/inventory/adjustments&#x60;](#tag/adjustments/POST/v1/inventory/adjustments) first. After posting, the new quantities show in [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock) and each difference is a movement in [&#x60;GET /v1/inventory/movements&#x60;](#tag/inventory/GET/v1/inventory/movements). The journal entry is named in &#x60;journal_entry_id&#x60;, and a mistaken adjustment is corrected by making a new one.  Error codes: &#x60;adjustment_not_postable&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AdjustmentsApi,
} from '@zerpto/sdk';
import type { PostStockAdjustmentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AdjustmentsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostStockAdjustmentRequest;

  try {
    const data = await api.postStockAdjustment(body);
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
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockAdjustmentResponse**](StockAdjustmentResponse.md)

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
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

