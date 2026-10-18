# GoodsReceiptApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createGoodsReceipt**](GoodsReceiptApi.md#creategoodsreceipt) | **POST** /v1/purchasing/receipts | Create goods receipt |
| [**getGoodsReceipt**](GoodsReceiptApi.md#getgoodsreceipt) | **GET** /v1/purchasing/receipts/{id} | Get goods receipt |
| [**listGoodsReceipts**](GoodsReceiptApi.md#listgoodsreceipts) | **GET** /v1/purchasing/receipts | List goods receipts |
| [**postGoodsReceipt**](GoodsReceiptApi.md#postgoodsreceipt) | **POST** /v1/purchasing/receipts/{id}/confirm | Post goods receipt |



## createGoodsReceipt

> GoodsReceiptResponse createGoodsReceipt(goodsReceiptInput, idempotencyKey)

Create goods receipt

Records a delivery against an approved purchase order, as a draft. Send the &#x60;purchase_order_id&#x60;, the &#x60;warehouse_id&#x60; where the goods arrived, the &#x60;received_date&#x60;, and for each line the &#x60;po_line_id&#x60; and the quantity received now. One order can have many receipts for partial deliveries, but the total received on a line cannot exceed the quantity ordered. Nothing moves in stock until the receipt is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;purchase_order_id&#x60; and the &#x60;po_line_id&#x60; of each line from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}), and the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). Check the draft with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}), then call [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm) to move the stock in. Once the vendor\&#39;s invoice arrives, bill the receipt with [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills) or [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill).  Error codes: &#x60;order_not_receivable&#x60;, &#x60;unknown_po_line&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;over_receipt&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { CreateGoodsReceiptRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GoodsReceiptApi(config);

  const body = {
    // GoodsReceiptInput
    goodsReceiptInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateGoodsReceiptRequest;

  try {
    const data = await api.createGoodsReceipt(body);
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
| **goodsReceiptInput** | [GoodsReceiptInput](GoodsReceiptInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**GoodsReceiptResponse**](GoodsReceiptResponse.md)

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


## getGoodsReceipt

> GoodsReceiptResponse getGoodsReceipt(id)

Get goods receipt

Returns one goods receipt by its &#x60;id&#x60;, with the purchase order, vendor, warehouse, received date, status, billing status, the bill that covers it, and every line with the quantity received and the quantity returned since. Use it to review a draft before you post it, or to see whether a delivery has been billed.  Take the &#x60;id&#x60; from [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts) or from the response of [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). A draft is posted with [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm). If a posted delivery has to go back to the vendor, record that with [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns). The order the receipt belongs to is read with [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { GetGoodsReceiptRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GoodsReceiptApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetGoodsReceiptRequest;

  try {
    const data = await api.getGoodsReceipt(body);
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

[**GoodsReceiptResponse**](GoodsReceiptResponse.md)

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


## listGoodsReceipts

> GoodsReceiptListResponse listGoodsReceipts(perPage, page, sort, createdAfter, createdBefore, purchaseOrderId, status, billingStatus, vendorId)

List goods receipts

Lists the goods receipts that record what vendors delivered, with their purchase order, warehouse, date, status and billing status. Use it to see which deliveries are still drafts waiting to be posted, which posted ones have not been billed yet, or the delivery history of one order. Filter by &#x60;purchase_order_id&#x60; or &#x60;status&#x60;, and narrow by creation date.  Take the &#x60;purchase_order_id&#x60; for the filter from [&#x60;GET /v1/purchasing/orders&#x60;](#tag/orders/GET/v1/purchasing/orders). New receipts are made with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts), and one receipt is read with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}). Receipts that show &#x60;billing_status&#x60; of &#x60;unbilled&#x60; are the ones you pick for [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { ListGoodsReceiptsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GoodsReceiptApi(config);

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
    // string | Filter by purchase order. (optional)
    purchaseOrderId: purchaseOrderId_example,
    // 'draft' | 'posted' | Filter by status. (optional)
    status: status_example,
    // 'unbilled' | 'billed' | Filter by whether a bill covers the receipt. (optional)
    billingStatus: billingStatus_example,
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
  } satisfies ListGoodsReceiptsRequest;

  try {
    const data = await api.listGoodsReceipts(body);
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
| **purchaseOrderId** | `string` | Filter by purchase order. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted] |
| **billingStatus** | `unbilled`, `billed` | Filter by whether a bill covers the receipt. | [Optional] [Defaults to `undefined`] [Enum: unbilled, billed] |
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |

### Return type

[**GoodsReceiptListResponse**](GoodsReceiptListResponse.md)

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


## postGoodsReceipt

> GoodsReceiptResponse postGoodsReceipt(id, idempotencyKey)

Post goods receipt

Posts a draft goods receipt. The quantities move into the warehouse and the receipt is booked to the GL as goods received not yet invoiced: it debits inventory and credits the goods-received-not-invoiced account. Until inventory valuation is enabled, only quantities are updated. The call fails with 422 if the period is closed. A posted receipt cannot be edited, so correct it with a purchase return. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the draft first with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). After posting, the new stock shows in [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock), the order moves to &#x60;partially_received&#x60; or &#x60;received&#x60; in [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}), and the receipt can be billed with [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills). If the vendor will not deliver the rest, end the order with [&#x60;POST /v1/purchasing/orders/{id}/close&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/close).  Error codes: &#x60;receipt_not_draft&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { PostGoodsReceiptRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GoodsReceiptApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostGoodsReceiptRequest;

  try {
    const data = await api.postGoodsReceipt(body);
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

[**GoodsReceiptResponse**](GoodsReceiptResponse.md)

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

