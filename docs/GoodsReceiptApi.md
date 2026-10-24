# GoodsReceiptApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelGoodsReceipt**](GoodsReceiptApi.md#cancelgoodsreceipt) | **POST** /v1/purchasing/receipts/{id}/cancel | Cancel goods receipt |
| [**createGoodsReceipt**](GoodsReceiptApi.md#creategoodsreceipt) | **POST** /v1/purchasing/receipts | Create goods receipt |
| [**getGoodsReceipt**](GoodsReceiptApi.md#getgoodsreceipt) | **GET** /v1/purchasing/receipts/{id} | Get goods receipt |
| [**listGoodsReceipts**](GoodsReceiptApi.md#listgoodsreceipts) | **GET** /v1/purchasing/receipts | List goods receipts |
| [**postGoodsReceipt**](GoodsReceiptApi.md#postgoodsreceipt) | **POST** /v1/purchasing/receipts/{id}/confirm | Post goods receipt |
| [**updateGoodsReceipt**](GoodsReceiptApi.md#updategoodsreceipt) | **PATCH** /v1/purchasing/receipts/{id} | Update goods receipt |
| [**uploadGoodsReceiptDeliveryNote**](GoodsReceiptApi.md#uploadgoodsreceiptdeliverynote) | **POST** /v1/purchasing/receipts/{id}/delivery-note | Upload delivery note |
| [**uploadGoodsReceiptEvidences**](GoodsReceiptApi.md#uploadgoodsreceiptevidences) | **POST** /v1/purchasing/receipts/{id}/evidences | Add goods receipt evidences |



## cancelGoodsReceipt

> GoodsReceiptResponse cancelGoodsReceipt(id, idempotencyKey)

Cancel goods receipt

Cancels a draft goods receipt that you no longer want to post. The receipt becomes &#x60;cancelled&#x60;, nothing moves in stock and no entry is booked. Only drafts can be cancelled. A posted receipt cannot be cancelled; if the goods go back to the vendor, correct it with a purchase return instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts) or [&#x60;PATCH /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/PATCH/v1/purchasing/receipts/{id}). Once you have called [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm), the receipt is final and a purchase return from [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns) is the way to send goods back. A cancelled receipt stays in [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;receipt_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { CancelGoodsReceiptRequest } from '@zerpto/sdk';

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
  } satisfies CancelGoodsReceiptRequest;

  try {
    const data = await api.cancelGoodsReceipt(body);
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


## createGoodsReceipt

> GoodsReceiptResponse createGoodsReceipt(goodsReceiptInput, idempotencyKey)

Create goods receipt

Records a delivery against one or more approved purchase orders of the same vendor, as a draft. Send the &#x60;vendor_id&#x60;, the &#x60;warehouse_id&#x60; where the goods arrived, the &#x60;received_date&#x60;, and for each line the &#x60;po_line_id&#x60; and the quantity received now; lines can mix &#x60;po_line_id&#x60; values from different orders as long as every order belongs to &#x60;vendor_id&#x60;. One order can have many receipts for partial deliveries, but the total received on a line cannot exceed the quantity ordered, and the quantity received now cannot exceed what remains to receive on that line. Nothing moves in stock until the receipt is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;vendor_id&#x60; from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the &#x60;po_line_id&#x60; of each line from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}) for every order of that vendor you are receiving against, and the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). Check the draft with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}), fix it with [&#x60;PATCH /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/PATCH/v1/purchasing/receipts/{id}) or drop it with [&#x60;POST /v1/purchasing/receipts/{id}/cancel&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/cancel), then call [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm) to move the stock in. Once the vendor\&#39;s invoice arrives, bill the receipt with [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills) or [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill).  Error codes: &#x60;order_not_receivable&#x60;, &#x60;unknown_po_line&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;over_receipt&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

> GoodsReceiptResponse getGoodsReceipt(id, include)

Get goods receipt

Returns one goods receipt by its &#x60;id&#x60;, with the purchase orders it covers, vendor, warehouse, received date, status, billing status, the bill that covers it, every line with the quantity received and the quantity returned since, the delivery note, and any evidence files. Use &#x60;include&#x60; to embed the vendor, warehouse and covered purchase orders as full objects instead of just their ids, for a detail screen that would otherwise need a separate call for each. Use it to review a draft before you post it, or to see whether a delivery has been billed.  Take the &#x60;id&#x60; from [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts) or from the response of [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). While it is a draft, change it with [&#x60;PATCH /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/PATCH/v1/purchasing/receipts/{id}) or drop it with [&#x60;POST /v1/purchasing/receipts/{id}/cancel&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/cancel); otherwise post it with [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm). If a posted delivery has to go back to the vendor, record that with [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns). The order the receipt belongs to is read with [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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
    // string | Comma-separated relations to embed as full objects: `vendor`, `warehouse`, `purchase_orders`, `purchase_orders.items`. `purchase_orders.items` also embeds `purchase_orders` even if not listed on its own. Without it, only the plain `vendor_id`, `warehouse_id` and `purchase_order_ids` are returned.  (optional)
    include: vendor,warehouse,purchase_orders,purchase_orders.items,
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
| **include** | `string` | Comma-separated relations to embed as full objects: &#x60;vendor&#x60;, &#x60;warehouse&#x60;, &#x60;purchase_orders&#x60;, &#x60;purchase_orders.items&#x60;. &#x60;purchase_orders.items&#x60; also embeds &#x60;purchase_orders&#x60; even if not listed on its own. Without it, only the plain &#x60;vendor_id&#x60;, &#x60;warehouse_id&#x60; and &#x60;purchase_order_ids&#x60; are returned.  | [Optional] [Defaults to `undefined`] |

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

Lists the goods receipts that record what vendors delivered, with the purchase orders they cover, warehouse, date, status and billing status. Use it to see which deliveries are still drafts waiting to be posted, which posted ones have not been billed yet, or the delivery history of one order. Filter by &#x60;purchase_order_id&#x60; or &#x60;status&#x60;, and narrow by creation date.  Take the &#x60;purchase_order_id&#x60; for the filter from [&#x60;GET /v1/purchasing/orders&#x60;](#tag/orders/GET/v1/purchasing/orders). New receipts are made with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts), and one receipt is read with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}). Receipts that show &#x60;billing_status&#x60; of &#x60;unbilled&#x60; are the ones you pick for [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

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
    // string | Filter by a purchase order among the receipt\'s `purchase_order_ids`. (optional)
    purchaseOrderId: purchaseOrderId_example,
    // 'draft' | 'posted' | 'cancelled' | Filter by status. (optional)
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
| **purchaseOrderId** | `string` | Filter by a purchase order among the receipt\&#39;s &#x60;purchase_order_ids&#x60;. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted`, `cancelled` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, cancelled] |
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


## updateGoodsReceipt

> GoodsReceiptResponse updateGoodsReceipt(id, goodsReceiptUpdate)

Update goods receipt

Changes a goods receipt that is still a &#x60;draft&#x60;. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep, and it can still mix &#x60;po_line_id&#x60; values from more than one purchase order of the same vendor. A receipt that was posted or cancelled can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}) first, and take a new &#x60;po_line_id&#x60; from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}). When the draft is right, post it with [&#x60;POST /v1/purchasing/receipts/{id}/confirm&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/confirm). To drop it, call [&#x60;POST /v1/purchasing/receipts/{id}/cancel&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/cancel).  Error codes: &#x60;receipt_not_editable&#x60;, &#x60;unknown_po_line&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;over_receipt&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { UpdateGoodsReceiptRequest } from '@zerpto/sdk';

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
    // GoodsReceiptUpdate
    goodsReceiptUpdate: ...,
  } satisfies UpdateGoodsReceiptRequest;

  try {
    const data = await api.updateGoodsReceipt(body);
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
| **goodsReceiptUpdate** | [GoodsReceiptUpdate](GoodsReceiptUpdate.md) |  | |

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
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## uploadGoodsReceiptDeliveryNote

> GoodsReceiptResponse uploadGoodsReceiptDeliveryNote(id, file, idempotencyKey)

Upload delivery note

Attaches the delivery note for this receipt, as proof of delivery. Send the scanned or photographed file. A repeated call replaces the receipt\&#39;s delivery note with the new file. Can be called whether the receipt is a draft or posted.  Create the receipt first with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). The uploaded file is read back with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}) as &#x60;delivery_note&#x60;. Attach supporting photos or video separately with [&#x60;POST /v1/purchasing/receipts/{id}/evidences&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/evidences).  Error codes: &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { UploadGoodsReceiptDeliveryNoteRequest } from '@zerpto/sdk';

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
    // Blob | PDF, JPEG or PNG, up to 10 MB.
    file: BINARY_DATA_HERE,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies UploadGoodsReceiptDeliveryNoteRequest;

  try {
    const data = await api.uploadGoodsReceiptDeliveryNote(body);
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
| **file** | `Blob` | PDF, JPEG or PNG, up to 10 MB. | [Defaults to `undefined`] |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**GoodsReceiptResponse**](GoodsReceiptResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## uploadGoodsReceiptEvidences

> GoodsReceiptResponse uploadGoodsReceiptEvidences(id, files, idempotencyKey)

Add goods receipt evidences

Adds supporting evidence to this receipt, such as an unboxing video, photos of the goods on arrival, or scans of accompanying paperwork. Send one or more files in a single call; each one appends a new item to the receipt\&#39;s &#x60;evidences&#x60; list rather than replacing anything. Can be called whether the receipt is a draft or posted.  Create the receipt first with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). The full list is read back with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}) as &#x60;evidences&#x60;. The delivery note itself is attached separately with [&#x60;POST /v1/purchasing/receipts/{id}/delivery-note&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts/{id}/delivery-note).  Error codes: &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GoodsReceiptApi,
} from '@zerpto/sdk';
import type { UploadGoodsReceiptEvidencesRequest } from '@zerpto/sdk';

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
    id: 'id_example',
    // Array<Blob> | Image, video or PDF, up to 50 MB each.
    files: [new Blob(['example file content'], { type: 'application/octet-stream' })],
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: 'idempotencyKey_example',
  } satisfies UploadGoodsReceiptEvidencesRequest;

  try {
    const data = await api.uploadGoodsReceiptEvidences(body);
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
| **files** | `Array<Blob>` | Image, video or PDF, up to 50 MB each. | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**GoodsReceiptResponse**](GoodsReceiptResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

