# TransfersApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createStockTransfer**](TransfersApi.md#createstocktransfer) | **POST** /v1/inventory/transfers | Create warehouse transfer |
| [**listStockTransfers**](TransfersApi.md#liststocktransfers) | **GET** /v1/inventory/transfers | List warehouse transfers |
| [**postStockTransfer**](TransfersApi.md#poststocktransfer) | **POST** /v1/inventory/transfers/{id}/confirm | Post transfer |



## createStockTransfer

> StockTransferResponse createStockTransfer(stockTransferInput, idempotencyKey)

Create warehouse transfer

Creates a transfer in &#x60;draft&#x60; to move stock between two warehouses. Send the &#x60;from_warehouse_id&#x60;, the &#x60;to_warehouse_id&#x60;, the &#x60;date&#x60; and the lines, each with an &#x60;item_id&#x60; and the &#x60;quantity&#x60; to move. The two warehouses must be different. Stock does not move until the transfer is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take both warehouse ids from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses) and the stocked &#x60;item_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items). Check that the source warehouse holds enough with [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock). When the goods are ready, post the transfer with [&#x60;POST /v1/inventory/transfers/{id}/confirm&#x60;](#tag/transfers/POST/v1/inventory/transfers/{id}/confirm).  Error codes: &#x60;unknown_warehouse&#x60;, &#x60;warehouse_archived&#x60;, &#x60;same_warehouse&#x60;, &#x60;unknown_item&#x60;, &#x60;item_not_stocked&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TransfersApi,
} from '@zerpto/sdk';
import type { CreateStockTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TransfersApi(config);

  const body = {
    // StockTransferInput
    stockTransferInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateStockTransferRequest;

  try {
    const data = await api.createStockTransfer(body);
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
| **stockTransferInput** | [StockTransferInput](StockTransferInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockTransferResponse**](StockTransferResponse.md)

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


## listStockTransfers

> StockTransferListResponse listStockTransfers(perPage, page, sort, createdAfter, createdBefore, status)

List warehouse transfers

Lists the transfers that move stock from one warehouse to another, with date, status and the quantity of each item. Use it to follow stock that is on its way to be posted, to find drafts that still need posting, or to review what was moved between two places. Filter by &#x60;status&#x60; and narrow by creation date.  Get warehouse ids from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). New transfers are made with [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers) and posted with [&#x60;POST /v1/inventory/transfers/{id}/confirm&#x60;](#tag/transfers/POST/v1/inventory/transfers/{id}/confirm). The stock in each warehouse after a transfer is shown by [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  TransfersApi,
} from '@zerpto/sdk';
import type { ListStockTransfersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TransfersApi(config);

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
  } satisfies ListStockTransfersRequest;

  try {
    const data = await api.listStockTransfers(body);
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

### Return type

[**StockTransferListResponse**](StockTransferListResponse.md)

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


## postStockTransfer

> StockTransferResponse postStockTransfer(id, idempotencyKey)

Post transfer

Posts a draft transfer. The quantities leave the source warehouse and arrive in the destination warehouse at the current average cost, so the total value of your stock does not change and no ledger entry is made. The status becomes &#x60;posted&#x60; and the transfer can no longer change. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the draft with [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers) first. The source warehouse must hold enough of every item. After posting, each line is a pair of movements in [&#x60;GET /v1/inventory/movements&#x60;](#tag/inventory/GET/v1/inventory/movements), one going out and one coming in, and the new quantities show in [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock).  Error codes: &#x60;transfer_not_postable&#x60;, &#x60;insufficient_stock&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  TransfersApi,
} from '@zerpto/sdk';
import type { PostStockTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new TransfersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostStockTransferRequest;

  try {
    const data = await api.postStockTransfer(body);
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

[**StockTransferResponse**](StockTransferResponse.md)

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

