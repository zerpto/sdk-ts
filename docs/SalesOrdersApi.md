# SalesOrdersApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelSalesOrder**](SalesOrdersApi.md#cancelsalesorder) | **POST** /v1/sales/orders/{id}/cancel | Cancel sales order |
| [**confirmSalesOrder**](SalesOrdersApi.md#confirmsalesorder) | **POST** /v1/sales/orders/{id}/confirm | Confirm sales order |
| [**convertQuotation**](SalesOrdersApi.md#convertquotation) | **POST** /v1/sales/quotations/{id}/convert | Convert quotation to order |
| [**createSalesOrder**](SalesOrdersApi.md#createsalesorder) | **POST** /v1/sales/orders | Create sales order |
| [**getSalesOrder**](SalesOrdersApi.md#getsalesorder) | **GET** /v1/sales/orders/{id} | Get sales order |
| [**listSalesOrders**](SalesOrdersApi.md#listsalesorders) | **GET** /v1/sales/orders | List sales orders |
| [**updateSalesOrder**](SalesOrdersApi.md#updatesalesorder) | **PATCH** /v1/sales/orders/{id} | Update sales order |



## cancelSalesOrder

> SalesOrderResponse cancelSalesOrder(id, idempotencyKey)

Cancel sales order

Cancels a sales order that you will not fulfil, and its status becomes &#x60;cancelled&#x60;. Use it to drop a draft you no longer need, or to stop a confirmed order before any goods have left. Once a delivery is posted, the order can no longer be cancelled. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the order with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}) to see its status and how much has been delivered. If goods were already sent, post the rest with [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/sales/POST/v1/sales/deliveries/{id}/confirm) and invoice what was delivered with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice) instead of cancelling. A cancelled order cannot be confirmed again, so create a new one with [&#x60;POST /v1/sales/orders&#x60;](#tag/sales-orders/POST/v1/sales/orders).  Error codes: &#x60;has_deliveries&#x60;, &#x60;order_already_cancelled&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { CancelSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelSalesOrderRequest;

  try {
    const data = await api.cancelSalesOrder(body);
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

[**SalesOrderResponse**](SalesOrderResponse.md)

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


## confirmSalesOrder

> SalesOrderResponse confirmSalesOrder(id, idempotencyKey)

Confirm sales order

Confirms a draft sales order, which commits it to the customer and lets goods be delivered against it. Stocked items need enough stock on hand unless backorders are allowed. The order moves to &#x60;confirmed&#x60; and the event &#x60;sales_order.confirmed&#x60; is emitted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the order with [&#x60;POST /v1/sales/orders&#x60;](#tag/sales-orders/POST/v1/sales/orders) and [&#x60;PATCH /v1/sales/orders/{id}&#x60;](#tag/sales-orders/PATCH/v1/sales/orders/{id}) before you confirm it. After that, record what you send with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/sales/POST/v1/sales/deliveries) and post it with [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/sales/POST/v1/sales/deliveries/{id}/confirm); the order then shows as delivered in parts or in full. If you confirm by mistake, [&#x60;POST /v1/sales/orders/{id}/cancel&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/cancel) stops the order while nothing has been delivered.  Error codes: &#x60;order_not_confirmable&#x60;, &#x60;order_has_no_lines&#x60;, &#x60;insufficient_stock&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { ConfirmSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies ConfirmSalesOrderRequest;

  try {
    const data = await api.confirmSalesOrder(body);
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

[**SalesOrderResponse**](SalesOrderResponse.md)

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


## convertQuotation

> SalesOrderResponse convertQuotation(id, idempotencyKey)

Convert quotation to order

Converts a quotation into a sales order. The lines, prices, currency and customer are copied into a new order in &#x60;draft&#x60;, and the quotation becomes &#x60;converted&#x60; with its &#x60;sales_order_id&#x60; set. Use it once the customer has accepted the offer. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and agree the quotation with [&#x60;POST /v1/sales/quotations&#x60;](#tag/quotations/POST/v1/sales/quotations) and [&#x60;PATCH /v1/sales/quotations/{id}&#x60;](#tag/quotations/PATCH/v1/sales/quotations/{id}) before you convert it. The response is the new order, which you can still adjust with [&#x60;PATCH /v1/sales/orders/{id}&#x60;](#tag/sales-orders/PATCH/v1/sales/orders/{id}) and then commit with [&#x60;POST /v1/sales/orders/{id}/confirm&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/confirm). Find it later with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}) or [&#x60;GET /v1/sales/orders&#x60;](#tag/sales-orders/GET/v1/sales/orders).  Error codes: &#x60;quotation_expired&#x60;, &#x60;already_converted&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { ConvertQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies ConvertQuotationRequest;

  try {
    const data = await api.convertQuotation(body);
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

[**SalesOrderResponse**](SalesOrderResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createSalesOrder

> SalesOrderResponse createSalesOrder(salesOrderInput, idempotencyKey)

Create sales order

Creates a sales order in &#x60;draft&#x60; for one customer. Send the &#x60;customer_id&#x60;, the &#x60;order_date&#x60;, the &#x60;currency&#x60; and at least one line with a description, quantity and unit price; the &#x60;delivery_date&#x60; and &#x60;notes&#x60; are optional. The server numbers the order and works out each line\&#39;s subtotal and tax, and the order\&#39;s &#x60;subtotal&#x60;, &#x60;tax_total&#x60; and &#x60;total&#x60;. Stock is not reserved until the order is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;customer_id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers), and the &#x60;item_id&#x60;, &#x60;tax_rate_id&#x60; and &#x60;account_id&#x60; of each line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), the tax rates and the chart of accounts. Edit the draft with [&#x60;PATCH /v1/sales/orders/{id}&#x60;](#tag/sales-orders/PATCH/v1/sales/orders/{id}), then confirm it with [&#x60;POST /v1/sales/orders/{id}/confirm&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/confirm). A draft you no longer need can be dropped with [&#x60;POST /v1/sales/orders/{id}/cancel&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/cancel).  Error codes: &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { CreateSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // SalesOrderInput
    salesOrderInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateSalesOrderRequest;

  try {
    const data = await api.createSalesOrder(body);
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
| **salesOrderInput** | [SalesOrderInput](SalesOrderInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**SalesOrderResponse**](SalesOrderResponse.md)

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


## getSalesOrder

> SalesOrderResponse getSalesOrder(id)

Get sales order

Returns one sales order by its &#x60;id&#x60;, with its customer, status, dates, currency, notes, every line and the totals. Each line shows how much has been delivered and invoiced. Use it to show the order, to prefill an edit form, or to check progress before you deliver goods or create an invoice.  Take the &#x60;id&#x60; from [&#x60;GET /v1/sales/orders&#x60;](#tag/sales-orders/GET/v1/sales/orders) or from the response of [&#x60;POST /v1/sales/orders&#x60;](#tag/sales-orders/POST/v1/sales/orders). While the order is a &#x60;draft&#x60;, change it with [&#x60;PATCH /v1/sales/orders/{id}&#x60;](#tag/sales-orders/PATCH/v1/sales/orders/{id}); move it on with [&#x60;POST /v1/sales/orders/{id}/confirm&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/confirm) or [&#x60;POST /v1/sales/orders/{id}/cancel&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/cancel). Goods that leave are recorded with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/sales/POST/v1/sales/deliveries), and the invoice for them is created with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { GetSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetSalesOrderRequest;

  try {
    const data = await api.getSalesOrder(body);
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

[**SalesOrderResponse**](SalesOrderResponse.md)

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


## listSalesOrders

> SalesOrderListResponse listSalesOrders(perPage, page, sort, createdAfter, createdBefore, status, customerId)

List sales orders

Lists the sales orders you have taken from customers, with status, dates, currency and totals. Use it to follow what is still open, to find orders waiting to be delivered or invoiced, or to review a customer\&#39;s history. Filter by &#x60;status&#x60; or &#x60;customer_id&#x60; and narrow by creation date. Each order carries its lines with the quantity delivered and invoiced so far.  Get a &#x60;customer_id&#x60; for the filter from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). New orders are made with [&#x60;POST /v1/sales/orders&#x60;](#tag/sales-orders/POST/v1/sales/orders), or by converting a quotation with [&#x60;POST /v1/sales/quotations/{id}/convert&#x60;](#tag/sales-orders/POST/v1/sales/quotations/{id}/convert), and one order is read with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}). Goods are sent against an order with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/sales/POST/v1/sales/deliveries), and what was delivered is billed with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { ListSalesOrdersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

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
    // 'draft' | 'confirmed' | 'partially_delivered' | 'delivered' | 'invoiced' | 'cancelled' | Filter by status. (optional)
    status: status_example,
    // string | Filter by customer. (optional)
    customerId: customerId_example,
  } satisfies ListSalesOrdersRequest;

  try {
    const data = await api.listSalesOrders(body);
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
| **status** | `draft`, `confirmed`, `partially_delivered`, `delivered`, `invoiced`, `cancelled` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, confirmed, partially_delivered, delivered, invoiced, cancelled] |
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |

### Return type

[**SalesOrderListResponse**](SalesOrderListResponse.md)

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


## updateSalesOrder

> SalesOrderResponse updateSalesOrder(id, salesOrderUpdate)

Update sales order

Changes a sales order that is still a &#x60;draft&#x60;. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep. Totals are worked out again from the new lines. An order that was confirmed can no longer be edited, and the call returns 409.  Read the current order with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}) first, and take new &#x60;item_id&#x60; or &#x60;customer_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) or [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). When the draft is ready, confirm it with [&#x60;POST /v1/sales/orders/{id}/confirm&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/confirm). To stop an order that has left draft, use [&#x60;POST /v1/sales/orders/{id}/cancel&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/cancel) before any delivery is posted.  Error codes: &#x60;order_not_editable&#x60;, &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesOrdersApi,
} from '@zerpto/sdk';
import type { UpdateSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesOrdersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // SalesOrderUpdate
    salesOrderUpdate: ...,
  } satisfies UpdateSalesOrderRequest;

  try {
    const data = await api.updateSalesOrder(body);
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
| **salesOrderUpdate** | [SalesOrderUpdate](SalesOrderUpdate.md) |  | |

### Return type

[**SalesOrderResponse**](SalesOrderResponse.md)

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

