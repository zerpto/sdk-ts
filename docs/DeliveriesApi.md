# DeliveriesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createDelivery**](DeliveriesApi.md#createdelivery) | **POST** /v1/sales/deliveries | Create delivery note |
| [**listDeliveries**](DeliveriesApi.md#listdeliveries) | **GET** /v1/sales/deliveries | List delivery notes |
| [**postDelivery**](DeliveriesApi.md#postdelivery) | **POST** /v1/sales/deliveries/{id}/confirm | Post delivery |



## createDelivery

> DeliveryResponse createDelivery(deliveryInput, idempotencyKey)

Create delivery note

Creates a delivery note in &#x60;draft&#x60; against a confirmed sales order. Send the &#x60;sales_order_id&#x60;, the &#x60;warehouse_id&#x60; the goods leave from, the &#x60;delivery_date&#x60; and the lines, each with the &#x60;so_line_id&#x60; and the quantity sent now. You can deliver in parts, but you cannot deliver more than was ordered. Stock does not move until the note is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Confirm the order first with [&#x60;POST /v1/sales/orders/{id}/confirm&#x60;](#tag/sales-orders/POST/v1/sales/orders/{id}/confirm), and take the &#x60;so_line_id&#x60; of each line from [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}). Take the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). When the goods are on their way, post the note with [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/deliveries/POST/v1/sales/deliveries/{id}/confirm).  Error codes: &#x60;unknown_sales_order&#x60;, &#x60;order_not_confirmed&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;unknown_order_line&#x60;, &#x60;over_delivery&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  DeliveriesApi,
} from '@zerpto/sdk';
import type { CreateDeliveryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DeliveriesApi(config);

  const body = {
    // DeliveryInput
    deliveryInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateDeliveryRequest;

  try {
    const data = await api.createDelivery(body);
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
| **deliveryInput** | [DeliveryInput](DeliveryInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**DeliveryResponse**](DeliveryResponse.md)

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


## listDeliveries

> DeliveryListResponse listDeliveries(perPage, page, sort, createdAfter, createdBefore, salesOrderId, status)

List delivery notes

Lists the delivery notes you have made for customers, with the sales order, warehouse, date, status and the quantity on each line. Use it to see what has left the warehouse, to find drafts that still need posting, or to follow the deliveries of one order. Filter by &#x60;sales_order_id&#x60; or &#x60;status&#x60; and narrow by creation date.  Get a &#x60;sales_order_id&#x60; for the filter from [&#x60;GET /v1/sales/orders&#x60;](#tag/sales-orders/GET/v1/sales/orders). New delivery notes are made with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/deliveries/POST/v1/sales/deliveries) and posted with [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/deliveries/POST/v1/sales/deliveries/{id}/confirm). What has been delivered can then be billed with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  DeliveriesApi,
} from '@zerpto/sdk';
import type { ListDeliveriesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DeliveriesApi(config);

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
    // string | Filter by sales order. (optional)
    salesOrderId: salesOrderId_example,
    // 'draft' | 'posted' | Filter by status. (optional)
    status: status_example,
  } satisfies ListDeliveriesRequest;

  try {
    const data = await api.listDeliveries(body);
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
| **salesOrderId** | `string` | Filter by sales order. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted] |

### Return type

[**DeliveryListResponse**](DeliveryListResponse.md)

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


## postDelivery

> DeliveryResponse postDelivery(id, idempotencyKey)

Post delivery

Posts a draft delivery note. The stock leaves the warehouse and the cost of goods sold is booked (debit COGS, credit inventory). Until inventory valuation is enabled, only quantities are updated. The order moves to &#x60;partially_delivered&#x60; or &#x60;delivered&#x60;, and the event &#x60;delivery.posted&#x60; is emitted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the note with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/deliveries/POST/v1/sales/deliveries) first, and check the stock with [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock) if you are unsure there is enough. After posting, bill what was delivered with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice). The delivery is listed in [&#x60;GET /v1/sales/deliveries&#x60;](#tag/deliveries/GET/v1/sales/deliveries).  Error codes: &#x60;delivery_not_postable&#x60;, &#x60;insufficient_stock&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  DeliveriesApi,
} from '@zerpto/sdk';
import type { PostDeliveryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new DeliveriesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostDeliveryRequest;

  try {
    const data = await api.postDelivery(body);
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

[**DeliveryResponse**](DeliveryResponse.md)

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

