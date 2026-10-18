# SalesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelSalesOrder**](SalesApi.md#cancelsalesorder) | **POST** /v1/sales/orders/{id}/cancel | Cancel sales order |
| [**confirmSalesOrder**](SalesApi.md#confirmsalesorder) | **POST** /v1/sales/orders/{id}/confirm | Confirm sales order |
| [**convertQuotation**](SalesApi.md#convertquotation) | **POST** /v1/sales/quotations/{id}/convert | Convert quotation to order |
| [**createDelivery**](SalesApi.md#createdelivery) | **POST** /v1/sales/deliveries | Create delivery note |
| [**createInvoiceFromSalesOrder**](SalesApi.md#createinvoicefromsalesorder) | **POST** /v1/sales/orders/{id}/invoice | Create invoice from an order |
| [**createQuotation**](SalesApi.md#createquotation) | **POST** /v1/sales/quotations | Create quotation |
| [**createSalesOrder**](SalesApi.md#createsalesorder) | **POST** /v1/sales/orders | Create sales order |
| [**getQuotation**](SalesApi.md#getquotation) | **GET** /v1/sales/quotations/{id} | Get quotation |
| [**getSalesOrder**](SalesApi.md#getsalesorder) | **GET** /v1/sales/orders/{id} | Get sales order |
| [**listDeliveries**](SalesApi.md#listdeliveries) | **GET** /v1/sales/deliveries | List delivery notes |
| [**listQuotations**](SalesApi.md#listquotations) | **GET** /v1/sales/quotations | List quotations |
| [**listSalesOrders**](SalesApi.md#listsalesorders) | **GET** /v1/sales/orders | List sales orders |
| [**postDelivery**](SalesApi.md#postdelivery) | **POST** /v1/sales/deliveries/{id}/confirm | Post delivery |
| [**updateQuotation**](SalesApi.md#updatequotation) | **PATCH** /v1/sales/quotations/{id} | Update quotation |
| [**updateSalesOrder**](SalesApi.md#updatesalesorder) | **PATCH** /v1/sales/orders/{id} | Update sales order |



## cancelSalesOrder

> SalesOrderResponse cancelSalesOrder(id, idempotencyKey)

Cancel sales order

Not allowed once any delivery is posted (&#x60;has_deliveries&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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

Emits &#x60;sales_order.confirmed&#x60;. Stocked items need enough stock on hand unless backorders are allowed (&#x60;insufficient_stock&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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

Copies lines and prices; the quotation becomes &#x60;converted&#x60;. Error codes: &#x60;quotation_expired&#x60;, &#x60;already_converted&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## createDelivery

> DeliveryResponse createDelivery(deliveryInput, idempotencyKey)

Create delivery note

Against a confirmed order. Partial delivery is allowed; cannot deliver more than ordered (&#x60;over_delivery&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## createInvoiceFromSalesOrder

> ArInvoiceResponse createInvoiceFromSalesOrder(id, invoiceFromSalesOrderInput, idempotencyKey)

Create invoice from an order

Creates a draft AR invoice for delivered, uninvoiced quantities (all posted deliveries, or the listed ones). Post it with &#x60;POST /v1/ar/invoices/{id}/confirm&#x60;. Error code: &#x60;nothing_to_invoice&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
} from '@zerpto/sdk';
import type { CreateInvoiceFromSalesOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // InvoiceFromSalesOrderInput
    invoiceFromSalesOrderInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateInvoiceFromSalesOrderRequest;

  try {
    const data = await api.createInvoiceFromSalesOrder(body);
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
| **invoiceFromSalesOrderInput** | [InvoiceFromSalesOrderInput](InvoiceFromSalesOrderInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createQuotation

> QuotationResponse createQuotation(quotationInput, idempotencyKey)

Create quotation

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
} from '@zerpto/sdk';
import type { CreateQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesApi(config);

  const body = {
    // QuotationInput
    quotationInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateQuotationRequest;

  try {
    const data = await api.createQuotation(body);
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
| **quotationInput** | [QuotationInput](QuotationInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**QuotationResponse**](QuotationResponse.md)

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


## createSalesOrder

> SalesOrderResponse createSalesOrder(salesOrderInput, idempotencyKey)

Create sales order

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## getQuotation

> QuotationResponse getQuotation(id)

Get quotation

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
} from '@zerpto/sdk';
import type { GetQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetQuotationRequest;

  try {
    const data = await api.getQuotation(body);
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

[**QuotationResponse**](QuotationResponse.md)

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


## getSalesOrder

> SalesOrderResponse getSalesOrder(id)

Get sales order

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## listDeliveries

> DeliveryListResponse listDeliveries(perPage, page, sort, createdAfter, createdBefore, salesOrderId, status)

List delivery notes

**Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## listQuotations

> QuotationListResponse listQuotations(perPage, page, sort, createdAfter, createdBefore, status, customerId)

List quotations

**Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  SalesApi,
} from '@zerpto/sdk';
import type { ListQuotationsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesApi(config);

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
    // 'draft' | 'sent' | 'accepted' | 'expired' | 'converted' | Filter by status. (optional)
    status: status_example,
    // string | Filter by customer. (optional)
    customerId: customerId_example,
  } satisfies ListQuotationsRequest;

  try {
    const data = await api.listQuotations(body);
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
| **status** | `draft`, `sent`, `accepted`, `expired`, `converted` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, sent, accepted, expired, converted] |
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |

### Return type

[**QuotationListResponse**](QuotationListResponse.md)

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


## listSalesOrders

> SalesOrderListResponse listSalesOrders(perPage, page, sort, createdAfter, createdBefore, status, customerId)

List sales orders

**Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## postDelivery

> DeliveryResponse postDelivery(id, idempotencyKey)

Post delivery

Moves stock out and posts COGS (debit COGS, credit inventory). Until Inventory valuation is enabled, only quantities are updated. Emits &#x60;delivery.posted&#x60;. Fails with 422 if the period is closed.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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


## updateQuotation

> QuotationResponse updateQuotation(id, quotationUpdate)

Update quotation

Not editable once converted.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
} from '@zerpto/sdk';
import type { UpdateQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new SalesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // QuotationUpdate
    quotationUpdate: ...,
  } satisfies UpdateQuotationRequest;

  try {
    const data = await api.updateQuotation(body);
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
| **quotationUpdate** | [QuotationUpdate](QuotationUpdate.md) |  | |

### Return type

[**QuotationResponse**](QuotationResponse.md)

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


## updateSalesOrder

> SalesOrderResponse updateSalesOrder(id, salesOrderUpdate)

Update sales order

Only draft orders can be edited. Others return 409.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  SalesApi,
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
  const api = new SalesApi(config);

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

