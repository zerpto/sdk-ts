# InventoryApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**listStock**](InventoryApi.md#liststock) | **GET** /v1/inventory/stock | Stock on hand |
| [**listStockMovements**](InventoryApi.md#liststockmovements) | **GET** /v1/inventory/movements | Stock movement ledger |



## listStock

> StockLevelListResponse listStock(perPage, page, itemId, warehouseId)

Stock on hand

Returns the quantity you hold of each item in each warehouse, with the average cost and the value when valuation is enabled. Use it to show stock on hand, to check availability before you deliver or transfer, or to compare with a physical count. Filter by &#x60;item_id&#x60; or &#x60;warehouse_id&#x60;. Items with no stock in a warehouse are not listed.  Take an &#x60;item_id&#x60; from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) and a &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). Stock goes up through [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts) and down through [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/deliveries/POST/v1/sales/deliveries/{id}/confirm), and it is moved or corrected with [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers) and [&#x60;POST /v1/inventory/adjustments&#x60;](#tag/adjustments/POST/v1/inventory/adjustments). The movements behind a quantity are listed in [&#x60;GET /v1/inventory/movements&#x60;](#tag/inventory/GET/v1/inventory/movements).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  InventoryApi,
} from '@zerpto/sdk';
import type { ListStockRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Filter by item. (optional)
    itemId: itemId_example,
    // string | Filter by warehouse. (optional)
    warehouseId: warehouseId_example,
  } satisfies ListStockRequest;

  try {
    const data = await api.listStock(body);
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
| **itemId** | `string` | Filter by item. | [Optional] [Defaults to `undefined`] |
| **warehouseId** | `string` | Filter by warehouse. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockLevelListResponse**](StockLevelListResponse.md)

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


## listStockMovements

> StockMovementListResponse listStockMovements(limit, cursor, itemId, warehouseId, type, dateFrom, dateTo)

Stock movement ledger

Returns the ledger of every change to your stock, one row per item and warehouse, with the signed quantity, the cost, the value and the running quantity after the movement. It is read-only and only grows: every movement comes from a posted document, such as a goods receipt, a delivery, an adjustment or a transfer. Use it to explain a quantity, to audit one item, or to export movements. Filter by &#x60;item_id&#x60;, &#x60;warehouse_id&#x60;, &#x60;type&#x60; or a date range.  Take an &#x60;item_id&#x60; from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) and a &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). The current totals are in [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock). A row names its document in &#x60;source_type&#x60; and &#x60;source_id&#x60;, for example the one posted by [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/deliveries/POST/v1/sales/deliveries/{id}/confirm), [&#x60;POST /v1/inventory/adjustments/{id}/confirm&#x60;](#tag/adjustments/POST/v1/inventory/adjustments/{id}/confirm) or [&#x60;POST /v1/inventory/transfers/{id}/confirm&#x60;](#tag/transfers/POST/v1/inventory/transfers/{id}/confirm). This list pages with a cursor: pass the &#x60;next_cursor&#x60; of one response as &#x60;cursor&#x60; in the next call.  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;next_cursor&#x60;, &#x60;has_more&#x60;, &#x60;limit&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;next&#x60; (&#x60;next&#x60; is null on the last page). Use &#x60;?cursor&#x3D;&#x60; and &#x60;?limit&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  InventoryApi,
} from '@zerpto/sdk';
import type { ListStockMovementsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryApi(config);

  const body = {
    // number | Page size. (optional)
    limit: 56,
    // string | `next_cursor` from the previous page. (optional)
    cursor: cursor_example,
    // string | Filter by item. (optional)
    itemId: itemId_example,
    // string | Filter by warehouse. (optional)
    warehouseId: warehouseId_example,
    // 'receipt' | 'delivery' | 'adjustment' | 'transfer_in' | 'transfer_out' | Filter by movement type. (optional)
    type: type_example,
    // Date | On or after this date. (optional)
    dateFrom: 2013-10-20,
    // Date | On or before this date. (optional)
    dateTo: 2013-10-20,
  } satisfies ListStockMovementsRequest;

  try {
    const data = await api.listStockMovements(body);
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
| **limit** | `number` | Page size. | [Optional] [Defaults to `50`] |
| **cursor** | `string` | &#x60;next_cursor&#x60; from the previous page. | [Optional] [Defaults to `undefined`] |
| **itemId** | `string` | Filter by item. | [Optional] [Defaults to `undefined`] |
| **warehouseId** | `string` | Filter by warehouse. | [Optional] [Defaults to `undefined`] |
| **type** | `receipt`, `delivery`, `adjustment`, `transfer_in`, `transfer_out` | Filter by movement type. | [Optional] [Defaults to `undefined`] [Enum: receipt, delivery, adjustment, transfer_in, transfer_out] |
| **dateFrom** | `Date` | On or after this date. | [Optional] [Defaults to `undefined`] |
| **dateTo** | `Date` | On or before this date. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockMovementListResponse**](StockMovementListResponse.md)

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

