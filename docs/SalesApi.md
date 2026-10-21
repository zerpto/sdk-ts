# SalesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createInvoiceFromSalesOrder**](SalesApi.md#createinvoicefromsalesorder) | **POST** /v1/sales/orders/{id}/invoice | Create invoice from an order |



## createInvoiceFromSalesOrder

> ArInvoiceResponse createInvoiceFromSalesOrder(id, invoiceFromSalesOrderInput, idempotencyKey)

Create invoice from an order

Creates a draft receivables invoice for the goods you have delivered on a sales order and not yet invoiced. By default it covers every posted delivery of the order that has not been billed; send &#x60;delivery_ids&#x60; to invoice only some of them. The &#x60;invoice_date&#x60; defaults to today and the &#x60;due_date&#x60; to the customer\&#39;s payment terms. The lines and prices are copied from the order. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Deliver the goods first with [&#x60;POST /v1/sales/deliveries&#x60;](#tag/deliveries/POST/v1/sales/deliveries) and post them with [&#x60;POST /v1/sales/deliveries/{id}/confirm&#x60;](#tag/deliveries/POST/v1/sales/deliveries/{id}/confirm), and list them with [&#x60;GET /v1/sales/deliveries&#x60;](#tag/deliveries/GET/v1/sales/deliveries). Read the order and how much is invoiced with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}). The result is an ordinary customer invoice: adjust it with [&#x60;PATCH /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/PATCH/v1/ar/invoices/{id}), then post it with [&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm). If it was posted by mistake, [&#x60;POST /v1/ar/invoices/{id}/void&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/void) reverses it, and its deliveries can then be invoiced again.  Error codes: &#x60;nothing_to_invoice&#x60;, &#x60;unknown_delivery&#x60;, &#x60;delivery_not_posted&#x60;, &#x60;delivery_already_invoiced&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

