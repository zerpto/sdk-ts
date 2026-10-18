# OrdersApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelPurchaseOrder**](OrdersApi.md#cancelpurchaseorder) | **POST** /v1/purchasing/orders/{id}/cancel | Cancel purchase order |
| [**closePurchaseOrder**](OrdersApi.md#closepurchaseorder) | **POST** /v1/purchasing/orders/{id}/close | Close purchase order |
| [**createPurchaseOrder**](OrdersApi.md#createpurchaseorder) | **POST** /v1/purchasing/orders | Create purchase order |
| [**getPurchaseOrder**](OrdersApi.md#getpurchaseorder) | **GET** /v1/purchasing/orders/{id} | Get purchase order |
| [**listPurchaseOrders**](OrdersApi.md#listpurchaseorders) | **GET** /v1/purchasing/orders | List purchase orders |
| [**submitPurchaseOrder**](OrdersApi.md#submitpurchaseorder) | **POST** /v1/purchasing/orders/{id}/submit | Submit for approval |
| [**updatePurchaseOrder**](OrdersApi.md#updatepurchaseorder) | **PATCH** /v1/purchasing/orders/{id} | Update purchase order |



## cancelPurchaseOrder

> PurchaseOrderResponse cancelPurchaseOrder(id, idempotencyKey)

Cancel purchase order

Cancels a purchase order so the vendor is not expected to deliver. The order becomes &#x60;cancelled&#x60; and can no longer be edited, received or billed. This is only possible while no goods receipt has been posted against it, which the order shows as &#x60;has_receipts&#x60;. Once goods have arrived, close the order instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/purchasing/orders&#x60;](#tag/orders/POST/v1/purchasing/orders), or on an order from [&#x60;POST /v1/purchasing/orders/{id}/submit&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/submit) that is pending or approved. When goods have already been received with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts), call [&#x60;POST /v1/purchasing/orders/{id}/close&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/close) instead. A cancelled order stays in [&#x60;GET /v1/purchasing/orders&#x60;](#tag/orders/GET/v1/purchasing/orders) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;order_has_receipts&#x60;, &#x60;order_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { CancelPurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelPurchaseOrderRequest;

  try {
    const data = await api.cancelPurchaseOrder(body);
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

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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


## closePurchaseOrder

> PurchaseOrderResponse closePurchaseOrder(id, idempotencyKey)

Close purchase order

Closes a purchase order that you do not expect to be completed. No further receipts can be made, and the quantity that has not been received is released, so the order stops counting as open. Use it when a vendor delivers less than ordered and will not send the rest. The order keeps its receipts and bills for the record. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Close an order that is &#x60;approved&#x60; or &#x60;partially_received&#x60; after the last delivery was posted with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). If nothing was received, [&#x60;POST /v1/purchasing/orders/{id}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/cancel) is the right call. Bills for what did arrive are made with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill), and they stay valid after the order is closed.  Error codes: &#x60;order_not_closable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { ClosePurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies ClosePurchaseOrderRequest;

  try {
    const data = await api.closePurchaseOrder(body);
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

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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


## createPurchaseOrder

> PurchaseOrderResponse createPurchaseOrder(purchaseOrderInput, idempotencyKey)

Create purchase order

Creates a purchase order in &#x60;draft&#x60; for one vendor. Send the &#x60;vendor_id&#x60;, the &#x60;order_date&#x60;, the &#x60;currency&#x60; and at least one line with a description, quantity and unit price; the &#x60;expected_date&#x60; and &#x60;notes&#x60; are optional. The server numbers the order and works out each line\&#39;s subtotal and tax, and the order\&#39;s &#x60;subtotal&#x60;, &#x60;tax_total&#x60; and &#x60;total&#x60;. Nothing is sent to the vendor and no commitment is booked until the order is submitted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;vendor_id&#x60; from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), and the &#x60;item_id&#x60;, &#x60;tax_rate_id&#x60; and &#x60;account_id&#x60; of each line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), the tax rates and the chart of accounts. Edit the draft with [&#x60;PATCH /v1/purchasing/orders/{id}&#x60;](#tag/orders/PATCH/v1/purchasing/orders/{id}), then send it on with [&#x60;POST /v1/purchasing/orders/{id}/submit&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/submit). A draft you no longer need can be dropped with [&#x60;POST /v1/purchasing/orders/{id}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/cancel).  Error codes: &#x60;unknown_vendor&#x60;, &#x60;vendor_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { CreatePurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // PurchaseOrderInput
    purchaseOrderInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreatePurchaseOrderRequest;

  try {
    const data = await api.createPurchaseOrder(body);
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
| **purchaseOrderInput** | [PurchaseOrderInput](PurchaseOrderInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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


## getPurchaseOrder

> PurchaseOrderResponse getPurchaseOrder(id)

Get purchase order

Returns one purchase order by its &#x60;id&#x60;, with its vendor, status, dates, currency, notes, every line and the totals. Each line shows how much has been received and billed, and the order shows the down payments paid and what is still unapplied. Use it to show the order, to prefill an edit form, or to check progress before you receive goods or create a bill.  Take the &#x60;id&#x60; from [&#x60;GET /v1/purchasing/orders&#x60;](#tag/orders/GET/v1/purchasing/orders) or from the response of [&#x60;POST /v1/purchasing/orders&#x60;](#tag/orders/POST/v1/purchasing/orders). While the order is a &#x60;draft&#x60;, change it with [&#x60;PATCH /v1/purchasing/orders/{id}&#x60;](#tag/orders/PATCH/v1/purchasing/orders/{id}); move it on with [&#x60;POST /v1/purchasing/orders/{id}/submit&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/submit), [&#x60;POST /v1/purchasing/orders/{id}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/cancel) or [&#x60;POST /v1/purchasing/orders/{id}/close&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/close). Goods that arrive are recorded with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts), and the vendor\&#39;s invoice with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { GetPurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetPurchaseOrderRequest;

  try {
    const data = await api.getPurchaseOrder(body);
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

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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


## listPurchaseOrders

> PurchaseOrderListResponse listPurchaseOrders(perPage, page, sort, createdAfter, createdBefore, status, vendorId)

List purchase orders

Lists the purchase orders you have sent or planned to send to vendors, with status, dates, currency and totals. Use it to follow what is still open, to find orders waiting for approval or goods, or to review a vendor\&#39;s history. Filter by &#x60;status&#x60; or &#x60;vendor_id&#x60; and narrow by creation date. Each order carries its lines with the quantity received and billed so far.  Get a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New orders are made with [&#x60;POST /v1/purchasing/orders&#x60;](#tag/orders/POST/v1/purchasing/orders) and one order is read with [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}). The &#x60;id&#x60; of an order is the &#x60;purchase_order_id&#x60; on the goods receipts of [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts), and the order is billed with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { ListPurchaseOrdersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

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
    // 'draft' | 'pending_approval' | 'approved' | 'partially_received' | 'received' | 'closed' | 'cancelled' | Filter by status. (optional)
    status: status_example,
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
  } satisfies ListPurchaseOrdersRequest;

  try {
    const data = await api.listPurchaseOrders(body);
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
| **status** | `draft`, `pending_approval`, `approved`, `partially_received`, `received`, `closed`, `cancelled` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, pending_approval, approved, partially_received, received, closed, cancelled] |
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |

### Return type

[**PurchaseOrderListResponse**](PurchaseOrderListResponse.md)

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


## submitPurchaseOrder

> PurchaseOrderResponse submitPurchaseOrder(id, idempotencyKey)

Submit for approval

Submits a draft purchase order. If an active approval rule covers the total, the order moves to &#x60;pending_approval&#x60; and an approval request is created; otherwise it goes straight to &#x60;approved&#x60;. Once approved, goods can be received against it, and the event &#x60;purchase_order.approved&#x60; is emitted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the order with [&#x60;POST /v1/purchasing/orders&#x60;](#tag/orders/POST/v1/purchasing/orders) and [&#x60;PATCH /v1/purchasing/orders/{id}&#x60;](#tag/orders/PATCH/v1/purchasing/orders/{id}) before you submit it. An approver releases a pending order with [&#x60;POST /v1/approvals/{id}/approve&#x60;](#tag/approvals/POST/v1/approvals/{id}/approve), and then the order is &#x60;approved&#x60;. After that, record the goods with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts). If you submit by mistake, [&#x60;POST /v1/purchasing/orders/{id}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/cancel) stops the order while nothing has been received.  Error codes: &#x60;order_not_submittable&#x60;, &#x60;order_has_no_lines&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { SubmitPurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies SubmitPurchaseOrderRequest;

  try {
    const data = await api.submitPurchaseOrder(body);
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

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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


## updatePurchaseOrder

> PurchaseOrderResponse updatePurchaseOrder(id, purchaseOrderUpdate)

Update purchase order

Changes a purchase order that is still a &#x60;draft&#x60;. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep. Totals are worked out again from the new lines. An order that was submitted can no longer be edited, and the call returns 409.  Read the current order with [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}) first, and take new &#x60;item_id&#x60; or &#x60;vendor_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) or [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). When the draft is ready, send it for approval with [&#x60;POST /v1/purchasing/orders/{id}/submit&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/submit). To stop an order that has left draft, use [&#x60;POST /v1/purchasing/orders/{id}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/cancel) before goods arrive, or [&#x60;POST /v1/purchasing/orders/{id}/close&#x60;](#tag/orders/POST/v1/purchasing/orders/{id}/close) after.  Error codes: &#x60;order_not_editable&#x60;, &#x60;unknown_vendor&#x60;, &#x60;vendor_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@zerpto/sdk';
import type { UpdatePurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // PurchaseOrderUpdate
    purchaseOrderUpdate: ...,
  } satisfies UpdatePurchaseOrderRequest;

  try {
    const data = await api.updatePurchaseOrder(body);
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
| **purchaseOrderUpdate** | [PurchaseOrderUpdate](PurchaseOrderUpdate.md) |  | |

### Return type

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

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

