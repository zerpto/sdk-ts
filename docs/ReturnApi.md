# ReturnApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelPurchaseReturn**](ReturnApi.md#cancelpurchasereturn) | **POST** /v1/purchasing/returns/{id}/cancel | Cancel purchase return |
| [**createPurchaseReturn**](ReturnApi.md#createpurchasereturn) | **POST** /v1/purchasing/returns | Create purchase return |
| [**getPurchaseReturn**](ReturnApi.md#getpurchasereturn) | **GET** /v1/purchasing/returns/{id} | Get purchase return |
| [**listPurchaseReturns**](ReturnApi.md#listpurchasereturns) | **GET** /v1/purchasing/returns | List purchase returns |
| [**postPurchaseReturn**](ReturnApi.md#postpurchasereturn) | **POST** /v1/purchasing/returns/{id}/confirm | Post purchase return |
| [**updatePurchaseReturn**](ReturnApi.md#updatepurchasereturn) | **PATCH** /v1/purchasing/returns/{id} | Update purchase return |



## cancelPurchaseReturn

> PurchaseReturnResponse cancelPurchaseReturn(id, idempotencyKey)

Cancel purchase return

Cancels a draft return that you no longer want to send. The return becomes &#x60;cancelled&#x60;, nothing moves in stock and no entry is booked. Only drafts can be cancelled. A posted return cannot be cancelled; if the goods come back, correct it with a new goods receipt. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns) or [&#x60;PATCH /v1/purchasing/returns/{id}&#x60;](#tag/return/PATCH/v1/purchasing/returns/{id}). Once you have called [&#x60;POST /v1/purchasing/returns/{id}/confirm&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/confirm), the return is final and a new receipt from [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts) is the way to fix it. A cancelled return stays in [&#x60;GET /v1/purchasing/returns&#x60;](#tag/return/GET/v1/purchasing/returns) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;return_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { CancelPurchaseReturnRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelPurchaseReturnRequest;

  try {
    const data = await api.cancelPurchaseReturn(body);
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

[**PurchaseReturnResponse**](PurchaseReturnResponse.md)

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


## createPurchaseReturn

> PurchaseReturnResponse createPurchaseReturn(purchaseReturnInput, idempotencyKey)

Create purchase return

Creates a draft return of goods from a posted goods receipt back to the vendor, for example defective goods, goods delivered in excess or the wrong item. Send the &#x60;goods_receipt_id&#x60;, the &#x60;return_date&#x60; and, for each line, the &#x60;receipt_line_id&#x60;, the quantity and a &#x60;reason&#x60; (&#x60;defect&#x60;, &#x60;excess&#x60;, &#x60;wrong_item&#x60; or &#x60;other&#x60;). The quantity of a line cannot exceed what was received minus what was already returned. Nothing leaves the warehouse until the return is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;goods_receipt_id&#x60; and the &#x60;receipt_line_id&#x60; of each line from [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}). Edit the draft with [&#x60;PATCH /v1/purchasing/returns/{id}&#x60;](#tag/return/PATCH/v1/purchasing/returns/{id}), then call [&#x60;POST /v1/purchasing/returns/{id}/confirm&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/confirm) to take the stock out, or [&#x60;POST /v1/purchasing/returns/{id}/cancel&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/cancel) to drop it. A replacement delivery is recorded as a new receipt with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts).  Error codes: &#x60;receipt_not_posted&#x60;, &#x60;unknown_receipt_line&#x60;, &#x60;over_return&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { CreatePurchaseReturnRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

  const body = {
    // PurchaseReturnInput
    purchaseReturnInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreatePurchaseReturnRequest;

  try {
    const data = await api.createPurchaseReturn(body);
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
| **purchaseReturnInput** | [PurchaseReturnInput](PurchaseReturnInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**PurchaseReturnResponse**](PurchaseReturnResponse.md)

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


## getPurchaseReturn

> PurchaseReturnResponse getPurchaseReturn(id)

Get purchase return

Returns one purchase return by its &#x60;id&#x60;, with the goods receipt and order it belongs to, vendor, warehouse, date, status, notes, every line with quantity, reason and cost, and the credit note or journal entry it created once posted. Use it to review a draft before you post it, or to follow up a return that was billed.  Take the &#x60;id&#x60; from [&#x60;GET /v1/purchasing/returns&#x60;](#tag/return/GET/v1/purchasing/returns) or from the response of [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns). A draft is changed with [&#x60;PATCH /v1/purchasing/returns/{id}&#x60;](#tag/return/PATCH/v1/purchasing/returns/{id}), posted with [&#x60;POST /v1/purchasing/returns/{id}/confirm&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/confirm) or cancelled with [&#x60;POST /v1/purchasing/returns/{id}/cancel&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/cancel). The receipt it returns goods from is read with [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { GetPurchaseReturnRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetPurchaseReturnRequest;

  try {
    const data = await api.getPurchaseReturn(body);
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

[**PurchaseReturnResponse**](PurchaseReturnResponse.md)

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


## listPurchaseReturns

> PurchaseReturnListResponse listPurchaseReturns(perPage, page, sort, createdAfter, createdBefore, goodsReceiptId, purchaseOrderId, vendorId, status)

List purchase returns

Lists the returns of goods to vendors, with their goods receipt, purchase order, warehouse, date and status. Use it to see which returns are still drafts, which have been posted and moved stock out, and which credit notes they created. Filter by &#x60;goods_receipt_id&#x60;, &#x60;purchase_order_id&#x60;, &#x60;vendor_id&#x60; or &#x60;status&#x60;, and narrow by creation date.  Take the ids for the filters from [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts) and [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New returns are made with [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns), and one return is read with [&#x60;GET /v1/purchasing/returns/{id}&#x60;](#tag/return/GET/v1/purchasing/returns/{id}). A posted return that was already billed shows a &#x60;credit_note_id&#x60;, which you review with [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { ListPurchaseReturnsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

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
    // string | Filter by goods receipt. (optional)
    goodsReceiptId: goodsReceiptId_example,
    // string | Filter by purchase order. (optional)
    purchaseOrderId: purchaseOrderId_example,
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
    // 'draft' | 'posted' | 'cancelled' | Filter by status. (optional)
    status: status_example,
  } satisfies ListPurchaseReturnsRequest;

  try {
    const data = await api.listPurchaseReturns(body);
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
| **goodsReceiptId** | `string` | Filter by goods receipt. | [Optional] [Defaults to `undefined`] |
| **purchaseOrderId** | `string` | Filter by purchase order. | [Optional] [Defaults to `undefined`] |
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted`, `cancelled` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, cancelled] |

### Return type

[**PurchaseReturnListResponse**](PurchaseReturnListResponse.md)

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


## postPurchaseReturn

> PurchaseReturnResponse postPurchaseReturn(id, idempotencyKey)

Post purchase return

Posts a draft return. The stock is taken out of the warehouse at the cost it came in at, not the current average, and the entry debits GRNI and credits inventory. The received quantity on the order is reduced by the returned quantity, so a replacement delivery is a new goods receipt on the same order. The call fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  If the receipt is already billed, a draft AP credit note is created and its id is returned as &#x60;credit_note_id&#x60;; review it and post it with [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm). If the receipt is not billed yet, the open GRNI for the receipt is reduced and no credit note is needed. Create the draft first with [&#x60;POST /v1/purchasing/returns&#x60;](#tag/return/POST/v1/purchasing/returns), and record a replacement delivery with [&#x60;POST /v1/purchasing/receipts&#x60;](#tag/goods-receipt/POST/v1/purchasing/receipts).  Error codes: &#x60;return_not_draft&#x60;, &#x60;insufficient_stock&#x60; (the goods were already sold or moved), &#x60;over_return&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { PostPurchaseReturnRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostPurchaseReturnRequest;

  try {
    const data = await api.postPurchaseReturn(body);
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

[**PurchaseReturnResponse**](PurchaseReturnResponse.md)

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


## updatePurchaseReturn

> PurchaseReturnResponse updatePurchaseReturn(id, purchaseReturnUpdate)

Update purchase return

Changes a purchase return that is still a draft. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep. Once the return is posted or cancelled it can no longer be edited, and the call returns 409.  Read the current return with [&#x60;GET /v1/purchasing/returns/{id}&#x60;](#tag/return/GET/v1/purchasing/returns/{id}) first, and take the &#x60;receipt_line_id&#x60; of a new line from [&#x60;GET /v1/purchasing/receipts/{id}&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts/{id}). When the draft is right, call [&#x60;POST /v1/purchasing/returns/{id}/confirm&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/confirm). To drop it, call [&#x60;POST /v1/purchasing/returns/{id}/cancel&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/cancel).  Error codes: &#x60;return_not_editable&#x60;, &#x60;unknown_receipt_line&#x60;, &#x60;over_return&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReturnApi,
} from '@zerpto/sdk';
import type { UpdatePurchaseReturnRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // PurchaseReturnUpdate
    purchaseReturnUpdate: ...,
  } satisfies UpdatePurchaseReturnRequest;

  try {
    const data = await api.updatePurchaseReturn(body);
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
| **purchaseReturnUpdate** | [PurchaseReturnUpdate](PurchaseReturnUpdate.md) |  | |

### Return type

[**PurchaseReturnResponse**](PurchaseReturnResponse.md)

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

